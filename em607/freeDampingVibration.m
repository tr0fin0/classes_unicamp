%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;

%%  TODO
%   title base on type of equation on figure
%   add diferent equations
%   add variables to print based on type of system

%   Configurações para Images
fpath = 'C:\Users\Admin-PC\Documents\gitRepos\classes\em607\images';
fSize = [0 0 18 18];


%%  1 Grau de Liberdade
%
%   Considera-se um carrinho fixado a uma mola e a um amortecedor capaz de
%   deslocar-se apenas na direção x sobre uma superfície sem atrito com as
%   seguintes constantes:
%       k: Constante Elástica
%       c: Constane de Amortecimento
%
%   Neste cenário a seguinte equação descreve seu movimento:
%       ddx + c/m dx + k/m x = 0

m   = 1;                        % Massa
c   = 10;                       % Constante de Amortecimento
k   = 1000;                     % Constante Elástica

wn  = sqrt(k/m);                % Frequência Natural        (omega)
cc  = 2*m*wn;                   % Amortecimento Crítico     
phi = c/cc;                     % Fator de Amortecimento    (phi)

sigma   = wn*phi;               % 
wd      = wn*sqrt(1 - phi^2);   % Frequência Natural


t = linspace(0,1,10000);

%   via Polinômio Característico:
%       s^2  + c/m s + k/m = 0
s1A = -c/(2*m) + sqrt( (c/(2*m))^2 - k/m );
s2A = -c/(2*m) - sqrt( (c/(2*m))^2 - k/m );

eqA = exp(s1A*t) + exp(s2A*t);  % Ignorando Condições Iniciais


%   via Polinômio Característico:
%       s^2  + 2 phi wn s + wn^2 = 0
s1B = -phi*wn + wn*sqrt( phi^2 - 1 );
s2B = -phi*wn - wn*sqrt( phi^2 - 1 );

eqB = exp(s1B*t) + exp(s2B*t);


t = linspace(0,10,10000);

figure; plot(t, eqA, t, eqB, 'o')
title('Comparação Solução'); xlabel('t [s]'); ylabel('x(t)');
legend("eqA", "eqB", "location", "southeast")
set(gcf, 'PaperPosition', fSize);
saveas(gca, fullfile(fpath, 'freeDampingVibration'), 'png');