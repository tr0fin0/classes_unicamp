load("sherman2.mat")
A = Problem.A;
b = Problem.b;

n = length(A);
x0 = zeros(n,1);
D = diag(diag(A));
M = A-D;

kmax = 100;
k = 0;
tau_max = 1.e-5;
tau_atual = tau_max + 1;

tic
while (k<=kmax) && (tau_atual>tau_max)
  k++;
  x = D\(b-M*x0);
  tau_atual = norm(x-x0,inf)/norm(x,inf);
  x0 = x;
endwhile
tempo = toc
k
tau_atual

tic; x = A\b; tempo = toc