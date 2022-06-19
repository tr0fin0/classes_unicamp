from scipy.integrate import odeint
import numpy as np
import matplotlib.pyplot as plt

m = 0.2
k = 2.0
c = 0.1
mus = 0.3
muk = 0.2
g = 9.8
vf = 0.01
v0 = 0.0
t1 = 10
sign = lambda x: np.tanh(100*x)

def Xi(t):
  if t < 1 :
    return 0
  else:
    return 1

vXi = np.vectorize(Xi)

def eq(X, t, Xi):
  Ff = k * (Xi(t) - X[0])
  
  if np.abs(X[1]) < vf and np.abs(Ff) < mus * m * g :
    Ff = k * (Xi(t) - X[0])
  else:
    Ff = sign(X[1]) * muk * m * g
  
  d2x = (k * (Xi(t) - X[0]) - Ff) / m
  return [X[1], d2x]

t = np.linspace(0, t1, 1000)
X0 = [v0, 0]
sol = odeint(func = eq, y0 = X0, t = t, args = (Xi, ), mxstep = 50000, atol = 1e-5)

plt.plot(t, sol[:, 0], 'r-', label = 'Output (x(t))')
plt.plot(t, vXi(t), 'b-', label = 'Input (xi(t))')
plt.ylabel('values')
plt.xlabel('time')
plt.legend(loc='best')
plt.show()

# https://stackoverflow.com/questions/64678603/python-different-function-depending-on-value-coulomb-damping-diagram