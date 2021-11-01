import numpy as np
import math as math
import matplotlib.pyplot as plt

from math import e
from numpy import pi as pi



def A3Q1():
    # variables
    K = 401  # W/m1C
    H = 100  # W/m2C

    T_B = 78  # C
    T_I = 25  # C

    L = 30e-3  # m
    W = 30e-3  # m
    T = 2e-3  # m

    p = 2 * W + 2 * T  # m
    a_c = W * T  # m2

    m = np.sqrt((H * p) / (K * a_c))  #

    theta_b = T_B - T_I  # C

    M = theta_b * np.sqrt(H * p * K * a_c)

    q_a = M * (
                np.sinh(m * L) + (H / (m * K)) * np.cosh(m * L)
            ) / (
                np.cosh(m * L) + (H / (m * K)) * np.sinh(m * L)
            )  # w

    e_a = q_a / (H * a_c * theta_b)  #

    a_s = 2*W*L + 2*L*T + W*T

    n = q_a / (H * a_s * theta_b)
    
    print(
        "\n======activity 3======"+
        "\n======question 1======"+
        "\n____initial values____")
    print(f"{p   = :.8f}")
    print(f"{a_c = :.8f}")
    print(f"{m   = :.8f}")
    print(f"{theta_b = :.8f}")
    print(f"{M       = :.8f}")
    print(f"{m*L     = :.8f}")
    print(f"{q_a     = :.8f}")
    print(f"{e_a     = :.8f}")
    print(f"{n       = :.8f}")



def A3Q2():
    L  = 30e-3   # m fin    radius
    r1 = 15e-3   # m inner  radius
    r2 = 35e-3   # m outter radius
    R1 = r2
    R2 = r2 + L
    T  = 7e-3    # m
    P  = 10e-3   # m
    N  = 7       # number of fins
    H  = 80e-3   # NOT GIVEN

    H1 = 300    # W/m2C
    H2 = 100    # W/m2C
    K  = 401    # W/m2C

    T1 = 54     # C
    T2 = 25     # C

    print(
        "\n======activity 3======"+
        "\n======question 2======"+
        "\n____initial values____")
    print(f"{R1 = :.8f}")
    print(f"{R2 = :.8f}")
    print(f"{L  = :.8f}")
    print(f"{T  = :.8f}")
    print(f"{P  = :.8f}")
    print(f"{N  = :.8f}")
    print(f"{H  = :.8f}")
    print(f"{H1  = :.8f}")
    print(f"{H2  = :.8f}")


    #figure 3.20 page 167 / 193
    r2c = R2 + T/2
    Lc  = L  + T/2
    Ap  = Lc * T

    A = r2c / R1
    B = Lc**(3/2)*(H2/(K  * Ap))**(1/2)

    print(
        "\n_____figure 3.20______")
    print(f"{r2c = :.8f}")
    print(f"{Lc  = :.8f}")
    print(f"{Ap  = :.8f}\n")
    print(f"{A = :.8f}")
    print(f"{B = :.8f}")
    nff = 0.95


    #equation 3.96 page 169 / 195
    m = (2*H2/(K*T))**(1/2)

    xI   = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0, 2.2, 2.4, 2.6, 2.8, 3.0, 3.2, 3.4, 3.6, 3.8, 4.0, 4.2, 4.4, 4.6, 4.8, 5.0, 5.2, 5.4, 5.6, 5.8, 6.0, 6.4, 6.8, 7.2, 7.6, 8.0, 8.4, 8.8, 9.2, 9.6, 10.0]
    exI0 = [1.0000, 0.8269, 0.6974, 0.5993, 0.5241, 0.4657, 0.4198, 0.3831, 0.3533, 0.3289, 0.3085, 0.2913, 0.2766, 0.2639, 0.2528, 0.2430, 0.2343, 0.2264, 0.2193, 0.2129, 0.2070, 0.2016, 0.1966, 0.1919, 0.1876, 0.1835, 0.1797, 0.1762, 0.1728, 0.1696, 0.1666, 0.1611, 0.1561, 0.1515, 0.1473, 0.1434, 0.1398, 0.1365, 0.1334, 0.1305, 0.1278]
    exI1 = [0.0000, 0.0823, 0.1368, 0.1722, 0.1945, 0.2079, 0.2152, 0.2185, 0.2190, 0.2177, 0.2153, 0.2121, 0.2085, 0.2046, 0.2007, 0.1968, 0.1930, 0.1892, 0.1856, 0.1821, 0.1787, 0.1755, 0.1724, 0.1695, 0.1667, 0.1640, 0.1614, 0.1589, 0.1565, 0.1542, 0.1520, 0.1479, 0.1441, 0.1405, 0.1372, 0.1341, 0.1312, 0.1285, 0.1260, 0.1235, 0.1213]


    xK   = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0 , 2.2, 2.4, 2.6, 2.8, 3.0, 3.2, 3.4, 3.6, 3.8, 4.0 , 4.2, 4.4, 4.6, 4.8, 5.0, 5.2, 5.4, 5.6, 5.8, 6.0 , 6.4, 6.8, 7.2, 7.6, 8.0, 8.4, 8.8, 9.2, 9.6, 10.0]
    exK0 = [math.inf, 2.1407, 1.6627, 1.4167, 1.2582, 1.1445, 1.0575, 0.9881, 0.9309, 0.8828, 0.8416, 0.8056, 0.7740, 0.7459, 0.7206, 0.6978, 0.6770, 0.6579, 0.6404, 0.6243, 0.6093, 0.5953, 0.5823, 0.5701, 0.5586, 0.5478, 0.5376, 0.5279, 0.5188, 0.5101, 0.5019, 0.4865, 0.4724, 0.4595, 0.4476, 0.4366, 0.4264, 0.4168, 0.4079, 0.3995, 0.3916]
    exK1 = [math.inf, 5.8334, 3.2587, 2.3739, 1.9179, 1.6361, 1.4429, 1.3010, 1.1919, 1.1048, 1.0335, 0.9738, 0.9229, 0.8790, 0.8405, 0.8066, 0.7763, 0.7491, 0.7245, 0.7021, 0.6816, 0.6627, 0.6453, 0.6292, 0.6142, 0.6003, 0.5872, 0.5749, 0.5633, 0.5525, 0.5422, 0.5232, 0.5060, 0.4905, 0.4762, 0.4631, 0.4511, 0.4399, 0.4295, 0.4198, 0.4108]

    K0 = e**(-m*R1) * np.interp(m*R1,  xK, exK0)
    K1 = e**(-m*R1) * np.interp(m*R1,  xK, exK1)
    K2 = e**(-m*r2c)* np.interp(m*r2c, xK, exK1)

    I0 = e**(+m*R1) * np.interp(m*R1,  xI, exI0)
    I1 = e**(+m*R1) * np.interp(m*R1,  xI, exI1)
    I2 = e**(+m*r2c)* np.interp(m*r2c, xI, exI1)

    nf = (2*R1/m)/(r2c**2 - R1**2)*(K1*I2 - I1*K2)/(I0*K2 + K0*I2)

    print(
        "\n_____equation 3.96______")
    print(f"{m  = :.8f}")
    print(f"{m*R2 = :.8f}")
    print(f"{I0 = :.8f}")
    print(f"{I1 = :.8f}")
    print(f"{I2 = :.8f}")
    print(f"{K0 = :.8f}")
    print(f"{K1 = :.8f}")
    print(f"{K2 = :.8f}")
    print(f"{nf = :.8f}")
    print("O(x) = I0({:.4f}x) {:.4f} + K0({:.4f}x) {:.4f}".format(m, I0/(I0*K2 + K0*I2), m, I1/(I0*K2 + K0*I2)))


    #equation 3.107 page 171 / 197
    Af = 2*pi*(r2c**2 - R2**2)
    Ab = 2*pi*R1*(H - N*T)
    At = N*Af + Ab

    n0  = 1 - N*Af/At*(1-nf)
    n00 = 1 - N*Af/At*(1-nff) # graphical solution
    print(
        "\n_____equation 3.107______")
    print(f"{nf  = :.8f}")
    print(f"{nff = :.8f}")
    print(f"{n0  = :.8f}")
    print(f"{n00 = :.8f}")

    #equation 3.96 page 168 / 194
    Ob = I0*K2 + K0*I2
    qf = 2*pi*K*R1*T*Ob*m*(K1 * I2 - I1 * K2)/(K0 * I2 + I0 * K2)
    qc = 2*pi*H*K*(T1 - T2)/(np.log(R2/R1))
    C  = N*qf/qc
    print(
        "\n_____equation 3.96______")
    print(f"{qf = :.8f}")
    print(f"{qc = :.8f}")
    print(f"{C  = :.8f}")


# plt.plot(xK, exK0, label = 'exK0')
# plt.plot(xK, exK1, label = 'exK1')
# plt.plot(xI, exI0, label = 'exI0')
# plt.plot(xI, exI1, label = 'exI1')
# plt.xlabel('x - axis')
# plt.ylabel('y - axis')
# plt.title('title')
# plt.legend()
# # plt.show()



def A4Q1():
    W = 20e-3   # m
    L = 30e-3   # m
    K = 148     # W/mC
    T1 = 52     # C
    T2 = 32     # C

    print(
        "\n========activity 4========"+
        "\n\n======question 1======"+
        "\n____initial values____")
    print(f"{W  = :.8f} m")
    print(f"{L  = :.8f} m")
    print(f"{K  = :.8f} W/mC")
    print(f"{T1 = :.8f} C")
    print(f"{T2 = :.8f} C")

    # equation 4.20 page 235/ 261
    # table 4.1 case 14
    qss = 0.932              # dimensionless conduction heat rate
    As  = 2*W*L              # active area
    Lc  = (As/4/pi)**(1/2)   # caracteristic length

    q = qss * K * As * (T1 - T2) / Lc # W

    print(
        "\nQuestão 1A")
    print(f"{qss = :.8f} ")
    print(f"{As  = :.8f} m2")
    print(f"{Lc  = :.8f} m")
    print(f"{q   = :.8f} W")

    # table 4.1 case 15
    d = 3e-3    # m
    D = 30e-3   # m
    dD  = [0.1, 1.0, 2.0, 10]           # 
    qSS = [0.943, 0.956, 0.961, 1.111]  # 

    qss = np.interp(d/D, dD, qSS)

    # qss = 0.943                 # dimensionless conduction heat rate
    As  = 2*D**2 + 4*D*d      # active area
    # As  = 2*W*L + 2*W*d + 2*L*d # active area
    Lc  = (As/4/pi)**(1/2)      # caracteristic length

    q = qss * K * As * (T1 - T2) / Lc # W

    print(
        "\nQuestão 1B")
    print(f"{d   = :.8f} m")
    print(f"{D   = :.8f} m")
    print(f"{qss = :.8f} ")
    print(f"{As  = :.8f} m2")
    print(f"{Lc  = :.8f} m")
    print(f"{q   = :.8f} W")




def A4Q2():
    di = 200e-3         # m
    de = 220e-3         # m
    K  = 80.2           #W/mC
    e  = (de - di)/2    # m
    Z  = 1              # m
    L  = 300            # m
    T2 = -5             # C

    print(
        "\n======activity 4======"+
        "\n======question 2======"+
        "\n____initial values____")
    print(f"{di = :.8f} m")
    print(f"{de = :.8f} m")
    print(f"{K  = :.8f} W/mC")
    print(f"{L  = :.8f} m")
    print(f"{T2 = :.8f} C")


    # equation 4.20 page 235/ 261
    S  = (2* pi * L) / np.log(4 * Z / de)
    R1 = 1 / (S * K)
    R2 = np.log(de/di) / (2 * pi * L * K)

    print(
        "\nquestão 2A")
    print(f"{S  = :.8f} m")
    print(f"{R1 = :.8f} C/W")
    print(f"{R2 = :.8f} C/W")


def A4Q3():
    T1 = 4      # C
    T2 = 25     # C
    H  = 25     # WC/m
    K  = 168    # W/mC
    A  = 100e-3 # m
    D  = 65e-3  # m
    E  = 0.5e-3 # m

    print(
        "\n======activity 4======"+
        "\n======question 3======"+
        "\n____initial values____")
    print(f"{T1 = :.8f} C")
    print(f"{H  = :.8f} WC/m")
    print(f"{K  = :.8f} W/mC")
    print(f"{A  = :.8f} m")
    print(f"{D  = :.8f} m")
    print(f"{E  = :.8f} m")

    # equation 5.10 page 284/310
    V  = (pi * D**2 )*A/4   # volume
    As = (2*pi*D*A)/2       # área superfície
    Lc = V/As               # length caracteristic
    Bi = (H*Lc)/K
    limite = 0.1

    print(
        "\nquestão 3A")
    print(f"{V  = :.8f} m3")
    print(f"{As = :.8f} m2")
    print(f"{Lc = :.8f} m")
    print(f"{Bi = :.8f}, método válido? "+str((Bi<limite)))


    # exemplo 5.1 page 285/311
    # table A1    page 983/1009
    TV = [200, 400]
    CV = [787, 925]
    rho = 2770
    c   = np.interp((T1+273.15), TV, CV)
    thetai = T1-T2
    thetaf = 0.99*T2-T2

    t = ((rho*Lc*c)/H)*np.log(thetai/thetaf)


    print(
        "\nquestão 3B")
    print(f"{rho    = :.8f} kg/m3")
    print(f"{c      = :.8f} J K/kg")
    print(f"{thetai = :.8f} K")
    print(f"{thetaf = :.8f} K")
    print(f"\n{t = :.4f} s ou {t/60 = :.4f} min ou {t/3600 = :.4f} h")



def main():

    # A3Q1()
    # A3Q2()
    # A4Q1()
    # A4Q2()
    A4Q3()

    return

main()