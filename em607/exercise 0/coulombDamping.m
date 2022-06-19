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
%   Considera-se um bloco fixado a uma mola capaz de deslocar-se apenas na
%   direção x sobre uma superfície com atrito cinemático com as seguintes
%   constantes:
%       k:      Constante Elástica
%       mi_k:   Coeficiente de Atrito Cinemático
%
%   Neste cenário a seguine equação descreve seu movimento:
%       ddx + k/m x = mi_k g


m   = 1;                    % Massa
g   = 10;                   % Gravidade
k   = 100;                  % Constante Elástica
mi_k= 10;                   % Coeficiente de Atrito Cinemático

x0  = 10;                   % Deslocamento Inicial
v0  = 00;                    % Velocidade Inicial

wn  = sqrt(k/m);            % Frequência Natural
Fd  = (mi_k*m*g);           % Força de Atrito


fprintf('data______________________________________________________________\n');
fprintf('  Input Information\n');
fprintf('    Massa,                      m = %2.2f\n',   m);
fprintf('    Gravidade,                  g = %2.2f\n',   g);
fprintf('    Constante Elastica,         k = %2.2f\n',   k);
fprintf('    Coeficiente de Atrito,   mi_k = %2.2f\n\n', mi_k);

fprintf('    Deslocamento Inicial,      x0 = %2.2f\n', x0);
fprintf('    Velocidade Inicial,        v0 = %2.2f\n', v0);
fprintf('    Frequencia Natural,        wn = %2.2f\n', wn);




syms t
xn = v0 / wn * sin(wn*t) + (x0 - Fd/k) * cos(wn*t) + Fd/k;
xp = v0 / wn * sin(wn*t) + (x0 + Fd/k) * cos(wn*t) - Fd/k;

dxn= v0 * cos(wn*t) - (x0 - Fd/k) * wn* cos(wn*t);
dxp= v0 * cos(wn*t) - (x0 + Fd/k) * wn* cos(wn*t);

eqX = 0;

tt = linspace(0,5,10000);
for i=1:length(tt)
    % 1: Start of Array
    % n: End   of Array as the Size of A

    t = tt(i);

    if      (eval(dxp) > 0)
        eqX(i) = eval(xp);
    elseif  (eval(dxn) < 0)
        eqX(i) = eval(xn);
    end
end




%   Representação Gráfica
figure; plot(tt, eqX)

mytitleText = ['Amortecimento de Coulomb'];
title(mytitleText,'Interpreter','tex');

xlabel('t [s]'); ylabel('x(t)');
legend("Coulomb", "location", "southeast", 'Interpreter', 'tex')
set(gcf, 'PaperPosition', pSize);
saveas(gca, fullfile(pPath, 'coulombDamping'), 'png');