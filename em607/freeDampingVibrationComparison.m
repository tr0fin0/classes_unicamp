%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')

%   Configurações para Images
pPath = 'C:\Users\Admin-PC\Documents\gitRepos\classes\em607\images';
pSize = [0 0 18 18];


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

m   = 1;                    % Massa
c   = 20;                   % Constante Amortecimento
zeta= 1;                    % Fator de Amortecimento    (zeta)
x0  = 10;                   % Deslocamento Inicial
v0  = 10;                   % Velocidade Inicial

cc  = c/zeta;               % Amortecimento Crítico
wn  = cc/(2*m);             % Frequência Natural        (omega)
k   = (wn^2) * m;           % Constante Elástica

sh  = wn*zeta;             %
wd  = wn*sqrt(1 - zeta^2); % Frequência Natural



fprintf('data______________________________________________________________\n');
fprintf('  Input Information\n');
fprintf('    Massa,                      m = %2.2f\n',   m);
fprintf('    Constante Amortecimento,    c = %2.2f\n',   c);
fprintf('    Fator de Amortecimento,  zeta = %2.2f\n\n', zeta);

fprintf('    Amortecimento Critico,     cc = %2.2f\n', cc);
fprintf('    Frequencia Natural,        wn = %2.2f\n', wn);
fprintf('    Constante Elastica,         k = %2.2f\n', k);



%   via Polinômio Característico:
%       s^2  + 2 phi wn s + wn^2 = 0
c1C = x0;
c2C = v0 + x0*wn;

syms t
eqC = c1C * exp(-wn * t) + c2C * t .* exp(-wn * t);



zetaU   = zeta*0.25;
ccU     = c/zetaU;               % Amortecimento Crítico
wnU     = ccU/(2*m);             % Frequência Natural        (omega)
wdU     = wnU*sqrt(1 - zetaU^2); % Frequência Natural

c1U = sqrt( ((v0 + x0*zetaU*wnU)^2 + (x0*wdU)^2)/(wdU^2) );
c2U = atan((wdU*x0)/(v0 + x0*zetaU*wnU));

syms t
eqU =  c1U * exp(-zetaU*wnU * t) * sin(wdU * t + c2U);



zetaO   = zeta*1.5;
ccO     = c/zetaO;               % Amortecimento Crítico
wnO     = ccO/(2*m);             % Frequência Natural        (omega)
wdO     = wnO*sqrt(1 - zetaO^2); % Frequência Natural
kO      = (wnO^2) * m;           % Constante Elástica

s1A = -c/(2*m) + sqrt( (c/(2*m))^2 - kO/m );
s2A = -c/(2*m) - sqrt( (c/(2*m))^2 - kO/m );

c1O = x0 - (v0 - x0*s1A)/(s2A - s1A);
c2O =      (v0 - x0*s1A)/(s2A - s1A);

s1 = wnO* (-zetaO + sqrt(zetaO^2 - 1)); % -1/tal1
s2 = wnO* (-zetaO - sqrt(zetaO^2 - 1)); % -1/tal1

syms t
eqO = c1O * exp(s1 * t) + c2O * exp(s2 * t);


t = linspace(0,1,10000);
eqCt = eval(eqC);
eqUt = eval(eqU);
eqOt = eval(eqO);


%   Representação Gráfica
figure; plot(t, eqCt, t, eqUt, t, eqOt)

mytitleText = ['Comparação Amortecimento'];
title(mytitleText,'Interpreter','tex');

xlabel('t [s]'); ylabel('x(t)');
criticoStr      = ['\zeta = ', num2str(zeta),  ', critico'];
subcriticoStr   = ['\zeta = ', num2str(zetaU), ', subcritico'];
supercriticoStr = ['\zeta = ', num2str(zetaO), ', supercritico'];
legend(criticoStr, subcriticoStr, supercriticoStr, "location", "southeast", 'Interpreter', 'tex')
set(gcf, 'PaperPosition', pSize);
saveas(gca, fullfile(pPath, 'freeDampingVibrationComparison'), 'png');