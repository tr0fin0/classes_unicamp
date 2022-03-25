%%============================================================================
%%                    Main Code
%%============================================================================
clc
% clear all
close all

RA = 217276;


%%============================================================================
%%  Exercício de Representação de Estados Discretos
%%============================================================================

%   Considera-se um sistema de Segunda Ordem com a seguinte equação
%   característica:

%    ddy + (2*qsi*wn)dy + (wn**2)y = (wn**2)*u(t)

%   Forma Padrão em Estados Contínuo
%   | dx(t) = A*x(t) + B*u(t) [2]
%   |  y(t) = C*x(t) + D*u(t) [3]

%   Nota-se que um sistema de estados será representado por matrizes e
%   vetores com as seguinte dimensões:
%       x: n x 1  A: n x n  B: n x r    onde:   r: Número de Entradas
%       y: p x 1  C: p x n  D: p x r            p: Número de Saídas
%       u: r x 1

%   Considera-se que o sistema de estados deverá apresentar as seguintes
%   dimensões neste caso:
%       x: 2 x 1  A: 2 x 2  B: 2 x 1    visto que   n = 2
%       y: 1 x 1  C: 1 x 2  D: 1 x 1                p = 1
%       u: 1 x 1                                    r = 1

%   Descretiza-se o sistema aplicando a seguinte aproximação:
%     dx(T) = x(KT+T) - x(KT)   quando T->0
%             ---------------
%                     T
%   Obtendo:
%   | x(k+1) = Ab*x(k) + Bb*u(k) [4]     Ab = (I + TA)   Bb = TB
%   | y(k)   = Cb*x(k) + Db*u(k) [5]     Cb = C          Db = D
%   Onde:
%       T: Período de Amostragem


%   Na sequência calcula-se a princípio a Solução Homogênea (u(t) = 0)
%   como:
%       x(k+1) = a*x(k) obtendo x(k) = A^k x(0)

%   Desta forma, define-se as seguintes variáveis:

wn  = 100;  % Frequência Natural do Sistema
qsi = 0.05; % Amortecimento      do Sistema

X0  = [10;  % Valores  = [1;  Espaço
        0]; % Iniciais    0]  Velocidade
    
%   Realizando as substituições adequadas, considerando que as variáveis
%   auxiliares foram o Espaço e a Velocidade, obtém-se as seguintes
%   matrizes:

A0  = [0 1; (-wn^2) (-2*qsi*wn)];
B0  = [0; (wn^2)];
C0  = [1 0];                        % Visualizando Espaço
D0  = 0;

%   Além disso, considera-se que o intervalo de análise será definido pelas
%   seguintes variáveis:

tint = 1;       %   Início da Análise
tstp = 0.001;   %   Passo  da Análise

%   Considera-se também que a entrada será definida pelas seguintes
%   variáveis:

u    = 1;       % Amplitude    da Entrada (u(t) = 0, Homogêneo)
t0   = 0;       % Deslocamento da Entrada 


%%  Método 0: Exponencial (Método de Controle)
%%============================================================================

%   Considera-se que a "A^k" será o Benchmark dessa análise.

[XCL, YCL]  = ssCFree_expm(t0,X0,A0,C0);
[XCF, YCF]  = ssCForced_expm(t0,A0,B0,C0,D0, u);



%%  Método 1: Autovalores e Autovetores
%%============================================================================

[XAL, YAL]  = ssCFree_eig(t0,X0,A0,C0);
[XAF, YAF]  = ssCForced_eig(t0,A0,B0,C0,D0, u);



%%  Método 2: Inversa de Laplace
%%============================================================================

[XLL, YLL]  = ssCFree_laplace(t0,X0,A0,C0);
[XLF, YLF]  = ssCForced_laplace(t0,A0,B0,C0,D0, u);



%%  Método 3: Polinomial (Cayley-Hamilton)
%%============================================================================

[XPL, YPL]  = ssCFree_poly(t0,X0,A0,C0);
[XPF, YPF]  = ssCForced_poly(t0,A0,B0,C0,D0, u);

