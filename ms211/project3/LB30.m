%====================Q1A====================
load("1138_bus.mat"); %carregamento dos problemas fornecidos
A = Problem.A;        %atribuição da matriz A

n_A = length(A);           %obtendo tamanho de A
qtde = nnz(A);             %obtendo quantidade de elementos não vazios de A
p_esp = qtde/(n_A*n_A)*100 %porcentagem de elementos não nulos em A
printf("\n");

%====================Q1B====================
C = chol(A); %teste se A é simétrica e definida positiva

%====================Q1C====================
xsol = 0.5 + sin( 2*pi*(0:n_A-1)'/(n_A-1)); %atribuição de sistema auxiliar
b = A*xsol; %atribuição do vetor de resultados

condicao_A = cond(A)                     %obtendo a condição de A
tic; xn = A\b; tempo_controle = toc      %resolvendo o sistema de maneira exata
residuo_controle = norm(b-A*xn)/norm(b)  %calculando o resíduo das operações
erro_controle = norm(xsol-xn)/norm(xsol) %calculando o erro das operações

erro_controle <= condicao_A*residuo_controle %avaliando a relação entre os dados
printf("\n")

%====================Q1D====================
tic; y = C'\b; xn = C\y; tempo_cholesky = toc
residuo_cholesky = norm(b-A*xn)/norm(b)
erro_cholesky = norm(xsol-xn)/norm(xsol)
printf("\n")

relacao_tempo = tempo_controle/tempo_cholesky       %relação do tempo 
relacao_residuo = residuo_controle/residuo_cholesky %relação do residuo
relacao_erro = erro_controle/erro_cholesky          %relação do erro
printf("\n")

%====================Q2A====================
load("sherman1.mat")
A = Problem.A; b = Problem.b;
function []=MatrizEsparsa(A,b)
  n_A = size(A);
  qtde_A = nnz(A);
  padrao_esparso_A = qtde_A/(n_A*n_A)*100
  issparse(A1) %retorna 1 se a matriz é esparsa
endfunction

%====================Q2B====================
load("sherman5.mat")
A = Problem.A;

function []=MatrizSingularPositiva(A)
  det(A)
  D = diag(diag(A));
  det(D)
endfunction
  
%====================Q2C====================
load("sherman2.mat")
A = Problem.A; b = Problem.b;

function []=MetodoJacobi(A,b)
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
endfunction

function []=MetodoGaussSeidel(A,b)
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
endfunction

MetodoJacobi(A,b)
MetodoGaussSeidel(A,b)
tic; x = A\b; tempo = toc


%====================Q3A====================
load("Harvard500.mat");
h = Problem.A;
n = size(H,1);

s = zeros(1,n);
for i=1:n
   soma = 0;
   for j=1:n
     soma += h(j,i);
   endfor
   s(1,i) = soma;
endfor

p = zeros(size(h));

for i=1:n
  for j=1:n
    if s(1,j) == 0
      p(i,j) = 1/n;
    else 
      p(i,j) = h(i,j)/s(1,j);
    endif
  endfor
endfor

n = length(p);
x0 = zeros(n,1);
L = tril(p);
U = p-L;

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
max(x0)