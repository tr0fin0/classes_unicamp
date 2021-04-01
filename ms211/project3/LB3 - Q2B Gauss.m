load("sherman2.mat")
A = Problem.A;
b = Problem.b;

n = length(A);
x0 = zeros(n,1);
L = tril(A);
U = A-L;

kmax = 100;
k = 0;
tau_max = 1.e-5;
tau_atual = tau_max+1;

tic
while (k<=kmax) && (tau_atual>tau_max)
  k++;
  x = L\(b-U*x0);
  tau_atual = norm(x-x0,inf)/norm(x,inf);
  x0 = x;
endwhile
tempo = toc
k
tau_atual

tic; x = A\b; tempo = toc