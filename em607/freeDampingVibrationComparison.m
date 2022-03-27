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

m   = 1;                     % Massa
cA  = 20;                   % Constante Amortecimento
k   = 100;                  % Constante Elástica

wn   = sqrt(k/m);           % Frequência Natural        (omega)
cc   = 2*m*wn;              % Amortecimento Crítico     
zetaA= cA/cc;               % Fator de Amortecimento    (zeta)

sh  = wn*zetaA;               % 
wd  = wn*sqrt(1 - zetaA^2);   % Frequência Natural



fprintf('data______________________________________________________________\n');
fprintf('  Input Information\n');
fprintf('    Massa,                      m = %2.2f\n',   m);
fprintf('    Constante Amortecimento,    c = %2.2f\n',   cA);
fprintf('    Constante Elastica,         k = %2.2f\n\n', k);

fprintf('    Frequencia Natural,        wn = %2.2f\n', wn);
fprintf('    Amortecimento Critico,     cc = %2.2f\n', cc);
fprintf('    Fator de Amortecimento,  zeta = %2.2f\n', zetaA);



t = linspace(0,1,10000);

%   via Polinômio Característico:
%       s^2  + 2 phi wn s + wn^2 = 0
s1A = -zetaA*wn + wn*sqrt( zetaA^2 - 1 );
s2A = -zetaA*wn - wn*sqrt( zetaA^2 - 1 );
c1A = 1;
c2A = 1;

eqA = c1A * exp(s1A*t) + c2A * exp(s2A*t);

cB   = cA/2;                  % Constante Amortecimento
zetaB= cB/cc;                 % Fator de Amortecimento    (phi)

s1B = -zetaB*wn + wn*sqrt( zetaB^2 - 1 );
s2B = -zetaB*wn - wn*sqrt( zetaB^2 - 1 );
c1B = 1;
c2B = 1;

eqB = c1B * exp(s1B*t) + c2B * exp(s2B*t);

cC   = 2*cA;                  % Constante Amortecimento
zetaC= cC/cc;                 % Fator de Amortecimento    (phi)

s1C = -zetaC*wn + wn*sqrt( zetaC^2 - 1 );
s2C = -zetaC*wn - wn*sqrt( zetaC^2 - 1 );
c1C = 1;
c2C = 1;

eqC = c1C * exp(s1C*t) + c2C * exp(s2C*t);



%   Representação Gráfica
figure; plot(t, eqA, t, eqB, t, eqC)
title('Comparacao Amortecimento');
xlabel('t [s]'); ylabel('x(t)');
legend("critico", "subcriico", "supercritico", "location", "southeast")
set(gcf, 'PaperPosition', pSize);
saveas(gca, fullfile(pPath, 'freeDampingVibrationComparison'), 'png');