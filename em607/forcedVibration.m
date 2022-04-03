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
%   Considera-se um bloco fixado a uma mola capaz de deslocar-se sobre uma
%   superfície sem atrito sobre ação de uma força harmônica com as
%   seguintes constantes:
%       k:  Constante Elástica
%       F0: Intensidade da Força
%       w:  Frequência  da Força
%
%   Neste cenário a seguine equação descreve seu movimento:
%       ddx + k/m x = F0/m cos(w t)


m   = 1;                    % Massa
k   = 100;                  % Constante Elástica
F0  = 100;                  % Força Externa
w   = 09;                   % Frequência Forçada

x0  = 10;                   % Deslocamento Inicial
v0  = 00;                   % Velocidade Inicial

wn  = sqrt(k/m);            % Frequência Natural

f0  = F0/m;                 % Constante

delta   = (wn - w)/2;
omega   = (wn + w)/2;



fprintf('data______________________________________________________________\n');
fprintf('  Input Information\n');
fprintf('    Massa,                      m  = %2.2f\n',   m);
fprintf('    Constante Elastica,         k  = %2.2f\n',   k);
fprintf('    Força Externar,             F0 = %2.2f\n\n', F0);

fprintf('    Deslocamento Inicial,      x0 = %2.2f\n', x0);
fprintf('    Velocidade Inicial,        v0 = %2.2f\n', v0);
fprintf('    Frequencia Forçada,        w  = %2.2f\n', w);
fprintf('    Frequencia Natural,        wn = %2.2f\n', wn);



syms t
eqX= (v0/wn) * sin(wn*t) + (x0 - f0/(wn^2 - w^2)) * cos(wn*t) + (f0/(wn^2 - w^2)) * cos(w*t);


tt = linspace(0,10,100000);
t  = tt;
eqXt = eval(eqX);


%   Representação Gráfica
figure; plot(tt, eqXt)

mytitleText = ['Vibração Forçada Harmônica'];
title(mytitleText,'Interpreter','tex');

xlabel('t [s]'); ylabel('x(t)');
legend("Forced", "location", "southeast", 'Interpreter', 'tex')
set(gcf, 'PaperPosition', pSize);
saveas(gca, fullfile(pPath, 'forcedVibration'), 'png');