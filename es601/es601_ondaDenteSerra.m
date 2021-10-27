%%============================================================================
%%                    Main Code
%%============================================================================
% clear all
close all

RA = 217276;


%%  Função Dente de Serra
%%============================================================================
%%  Considerações
%   Define-se a Onda Dente de Serra como x(0) = 0 e x(T) = A, onde T é o
%   período e A a amplitude.
%
%     /|  /|  /|  /|  /|  
%    / | / | / | / | / | 
%   /  |/  |/  |/  |/  |
%
%   Desta forma, define-se as seguintes variáveis:

T   = 0.1;  % Período Total da Onda
F   = 1/T;  % Frequência    da Onda
A   = 100;  % Amplitude     da Onda

%   Pela definição de Série de Fourier à análise seria realizada de -inf
%   até +inf, entretanto considera-se que um intervalo simétrico definido
%   a partir da seguinte constante será suficiente:

N   = 50;   % Extremo de Análise


%%  Série de Fourier da Entrada
%   Realizando o cálculo analítico obtêm-se a equação apresentada no for,
%   representando os coeficientes de Fourier da expressão desejada.
%   
%   Note que como a função foi definida como par apenas estes coeficientes
%   precisaram ser calculados.

i   = 0;    % Contador
for k = -N:1:N
    % -N:   Limite Inferior
    %  1:   Passo
    % +N:   Limite Superior

    i = i+1;
    if k~=0
       X(i) = (1i*A)/(2*pi*k);
    else
       X(i) = A/2; 
    end
    % Note que a expressão obtida não será definida em k = 0, desta forma
    % utiliza-se o if.
end

figure
stem(abs(X))
title('Série de Fourier da Entrada')
xlabel('F [hz]')
ylabel('X(F)')

%   figure: create figure window
%   stem:   plots the data sequence Y
%   abs:    when X is complex, abs(X) is the complex modulus


%%  Função de Transferência do Sistema
%   Considera-se que a Onda Quadrada descrita anteriormente será aplicada
%   como entrada de um sistema Massa-Mola-Amortecedor, obtendo a solução 
%   em Regime Permanente. (Não há transiente)
%
%   Frequency Response Functions FRFs
%
%   Nota-se as seguintes propriedades da Série de Fourrier:
%   y(t) = h(t) * x(t) <-> Y(jw) = H(jw) . X(jw)

M = 1;      % Massa
K = 10000;  % Constante Elástica
C = 10;     % Constante de Amortecimento
w = 2*pi*F; % Frequência

i = 0;  % Contador
for k = -N:1:N
    % -N:   Limite Inferior
    %  1:   Passo
    % +N:   Limite Superior

    i = i+1;
    H(i) = 1/(M*(1i*w*k)^2 + (1i*w*k)*C + K);
    % Note que a apesar de 'i' ser um contador '1i' representa a unidade
    % complexa.
end

figure
stem(abs(H))
title('Série de Fourier da FRF')
xlabel('F [hz]')
ylabel('H(F)')


%%  Série de Fourier da Saída
%   

Y = H.*X;   % Multiplicação Termo a Termo

figure
stem(abs(Y))
title('Série de Fourier da Saída')
xlabel('F [hz]')
ylabel('Y(F)')


%%  Série de Fourier Inversa
%   Será necessário converter os valores da Série para valores temporais
%   realizando o somatório das exponenciais.

I = 10;             % Interval Length
t = 0:.001:I;       % Vetor de Tempo
y = zeros(size(t)); % Vetor de Saída

i = 0;  % Contador
for k = -N:1:N
    % -N:   Limite Inferior
    %  1:   Passo
    % +N:   Limite Superior
    
    i = i+1;
    y = y + Y(i)*exp(1i*w*k*t);
end

figure
plot(t, real(y), out.tout, out.simout, '+')
title('Resposta Temporal da Saída')
xlabel('t [s]')
ylabel('y(t)')
legend("Analítica", "Simulink", "location", "southeast")

%%  Referência
%   https://en.wikipedia.org/wiki/Fourier_series
%   https://en.wikipedia.org/wiki/Poisson_summation_formula