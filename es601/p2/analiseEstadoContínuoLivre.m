%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;


%%  Análise de Estados Contínuo Homogêneo
%%============================================================================

%   Sistema de Primeira Ordem descrito pela seguinte Equação:
%   t*dy(t) + y(t) = g*u(t) [1]

%   Forma Padrão em Estados
%   | dx(t) = A*x(t) + B*u(t) [2]
%   |  y(y) = C*x(t) + D*u(t) [3]

%   Nota-se que um sistema de estados será representado por matrizes e
%   vetores com as seguinte dimensões:
%       x: n x 1  A: n x n  B: n x r    onde:   r: Número de Entradas
%       y: p x 1  C: p x n  D: p x r            p: Número de Saídas
%       u: r x 1                                n: Ordem do Sistema

%   Considera-se que o sistema de estados deverá apresentar as seguintes
%   dimensões neste caso:
%       x: 2 x 1  A: 2 x 2  B: 2 x 1    onde:   r: 1
%       y: 1 x 1  C: 1 x 2  D: 1 x 1            p: 1
%       u: 1 x 1                                n: 2

%   Toma-se a relação x(t) = y(t) [4], logo as equações se simplificam
%   para:
%   [4] em [1]: a = -(1/t); b = (g/t);
%   [4] em [3]: c = 1;      d = 0;

%   Na sequência calcula-se a princípio a Solução Homogênea (u(t) = 0)
%   como:
%   dx(t) = a*x(t) obtendo x(t) = x(0)*exp(a*t)


%%  Análise de Estados Segunda Ordem Homogênea
%%============================================================================

%   Sistema de Segunda Ordem descrito pela seguinte Equação:
%   m*ddy(t) + c*dy(t) + k*y(t) = a*u(t) [1]

%   Exemplo de Aplicaçào considerando um Sistema Massa-Mola-Amortecedor:

m   = 1;                    % Massa
k   = 100;                  % Constante Elástica
c   = 10;                   % Constante de Amortecimento

X0  = [1; 0];               % Valores Iniciais de X(t)
U   = 0;                    % Entrada do Sistema (0 = Homogênea)

A   = [0 1; (-k/m) (-c/m)]; % Matriz de Transição de Estado
B   = [0; 0];               % Matriz de Controlabilidade    ([] = Homogênea)
C   = [1 0];                % Matriz de Observabilidade
D   = 0;                    %                               ([] = Homogênea)



%%  Método 0: Função Matlab
%%============================================================================

syms t
eA  = expm(A*t);    % Exponencial de Matrizes (resultado de controle)

%   Note que o comando expm(A) é diferente de exp(A). 
%       exp(A)  realiza a exponencial natural de cada entrada da matriz;
%       expm(A) realiza a exponencial natural matricial da matriz;


XC  = eA * X0;    % Método Controle
YC  = C  * XC;



%%  Método 1: Autovalores e Autovetores
%%============================================================================

n   = length(A);           % Size of Matrix

% M = size(X,DIM) returns the length of the dimension specified
%   by the scalar DIM.  For example, size(X,1) returns the number
%   of rows. If DIM > NDIMS(X), M will be 1.

% length(X) returns the length of vector X.  It is equivalent
%   to MAX(SIZE(X)) for non-empty arrays and 0 for empty ones.

%   Note também que expm(A) poderá ser calculado através dos Autovalores e
%   Autovetores de A como ilustrado abaixo:


[V,D]= eig(A);

% [V,D] = eig(A) produces a diagonal matrix D of eigenvalues and 
%   a full matrix V whose columns are the corresponding eigenvectors  
%   so that A*V = V*D.


AA  = V*D*inv(V);   % Matriz de Coeficientes

% inv(X) is the inverse of the square matrix X.
%   A warning message is printed if X is badly scaled or
%   nearly singular.

%   Note que haverá uma parcela complexa aproximadamente nula gerada por
%   arredondamentos numéricos.


eAA = V*diag(exp(diag(D)))*inv(V);  % Exponencial Matricial

% diag(V,K) when V is a vector with N components is a square matrix
%   of order N+ABS(K) with the elements of V on the K-th diagonal. K = 0
%   is the main diagonal, K > 0 is above the main diagonal and K < 0
%   is below the main diagonal.


syms t
eAAt= V*diag(exp(diag(D*t)))*inv(V); % Função Exponencial Matricial

XA  = eAAt * X0;   % Método de Autovalores
YA  = C    * XA;

%   Solução analítica através da interpretação simbólica da equação.



%%  Método 2: Inversa de Laplace
%%============================================================================

%   Note também que expm(A) poderá ser calculado através da Inversa de 
%   Laplace como ilustrado abaixo:

syms s
I   = eye(n);                           % Matriz Identidade

% eye(N) is the N-by-N identity matrix.

eALt= ilaplace( inv( s*I - A ));        % Função Exponencial Matricial

% F = ilaplace(L) is the inverse Laplace transform of the sym L
%   with default independent variable s.  The default return is a
%   function of t.  If L = L(t), then ilaplace returns a function of x:
%   F = F(x).

XL  = eALt * X0;    % Método de Laplace
YL  = C    * XL;



%%  Método 3: Polinomial (Cayley-Hamilton)
%%============================================================================

%   syms x y
%   p   = x^3 - x*y^2 + 1;
%   d   = x + y;

% [R,Q] = polynomialReduce(P,D) also produces the vector Q of
%   polynomials satisfying P = sum(Q.*D) + R.

%   Note também que expm(A) poderá ser calculado através de expressões
%   Polinomiais como ilustrado abaixo:


[V,D]= eig(A);

L   = diag(D);              % Vetor de Autovalores
VM  = fliplr(vander(L));    % Matriz de Vandermonde
VMi = inv(VM);

% Y = fliplr(X) returns X with the order of elements flipped left to right
%   along the second dimension

% A = vander(V), for a vector of length n, returns the n-by-n
%   Vandermonde matrix A. The columns of A are powers of the vector V,
%   such that the j-th column is A(:,j) = V(:).^(n-j)


syms t
ED  = sym(zeros(length(A),1));

for i=1:n
    % 1: Start of Array
    % n: End   of Array as the Size of A

    ED(i) = exp(L(i)*t);    % Creates a Vector of Functions
end

AL  = VMi*ED;


eAPt= 0;
for i=1:n
    % 1: Start of Array
    % n: End   of Array as the Size of A

    eAPt = eAPt + AL(i)*A^(i-1);

    % A^a: Computes the matrix A to the power of a
end

XP  = eAPt * X0;    % Método Polinomial
YP  = C    * XP;



%%  Comparação Métodos
%%============================================================================

%   Compara-se os métodos para avaliar sua consistência.

t   = 0:0.01:2;
YCV = eval(YC);
YAV = eval(YA);
YLV = eval(YL);
YPV = eval(YP);

% eval(EXPRESSION) evaluates the MATLAB code in EXPRESSION. Specify
%   EXPRESSION as a character vector or string scalar.


figure
plot(t, YCV, t, YAV, 's', t, YLV, '+', t, YPV, 'o')
title('Comparação Métodos')
xlabel('t [s]')
ylabel('y(t)')
legend("Controle", "Autovalores", "Laplace", "Polinomial", "location", "southeast")


fprintf('Comparação com expm(At):\n');
disp(['Erro Método Autovalores: ' num2str(abs(mean(YAV-YCV)))]);
disp(['Erro Método Laplace:     ' num2str(abs(mean(YLV-YCV)))]);
disp(['Erro Método Polinomial:  ' num2str(abs(mean(YPV-YCV)))]);



%%  Referências
%   https://www.mathworks.com/help/matlab/math/matrix-exponentials.html
%   https://www.mathworks.com/matlabcentral/answers/116593-how-to-display-a-string-and-matrix-in-matlab
%   https://web.mit.edu/2.151/www/Handouts/CayleyHamilton.pdf
%   https://www.mathworks.com/help/matlab/ref/mpower.html
%   https://www.mathworks.com/help/matlab/creating_plots/specify-line-and-marker-appearance-in-plots.html
%   https://www.mathworks.com/help/matlab/ref/matlab.graphics.illustration.legend-properties.html