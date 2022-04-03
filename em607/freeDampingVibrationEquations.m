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

%   TODO



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
c   = 10;                   % Constante Amortecimento
k   = 100;                  % Constante Elástica

wn  = sqrt(k/m);            % Frequência Natural        (omega)
cc  = 2*m*wn;               % Amortecimento Crítico     
zeta= c/cc;                 % Fator de Amortecimento    (zeta)

sh  = wn*zeta;               % 
wd  = wn*sqrt(1 - zeta^2);   % Frequência Natural

x0  = 10;                    % Deslocamento Inicial
v0  = 10;                    % Velocidade Inicial



fprintf('data______________________________________________________________\n');
fprintf('  Input Information\n');
fprintf('    Massa,                      m = %2.2f\n',   m);
fprintf('    Constante Amortecimento,    c = %2.2f\n',   c);
fprintf('    Constante Elastica,         k = %2.2f\n\n', k);

fprintf('    Deslocamento Inicial,      x0 = %2.2f [m]\n', x0);
fprintf('    Velocidade Inicial,        v0 = %2.2f [m/s]\n\n', v0);

fprintf('    Frequencia Natural,        wn = %2.2f\n', wn);
fprintf('    Amortecimento Critico,     cc = %2.2f\n', cc);
fprintf('    Fator de Amortecimento,  zeta = %2.2f\n', zeta);



%   via Polinômio Característico:
%       s^2  + c/m s + k/m = 0
s1A = -c/(2*m) + sqrt( (c/(2*m))^2 - k/m );
s2A = -c/(2*m) - sqrt( (c/(2*m))^2 - k/m );
c1A = x0 - (v0 - x0*s1A)/(s2A - s1A);
c2A =      (v0 - x0*s1A)/(s2A - s1A);

syms t
eqA = c1A * exp(s1A*t) + c2A * exp(s2A*t);


%   via Polinômio Característico:
%       s^2  + 2 phi wn s + wn^2 = 0
s1B = -zeta*wn + wn*sqrt( zeta^2 - 1 );
s2B = -zeta*wn - wn*sqrt( zeta^2 - 1 );
c1B = x0 - (v0 - x0*s1A)/(s2A - s1A);
c2B =      (v0 - x0*s1A)/(s2A - s1A);

syms t
eqB = c1B * exp(s1B*t) + c2B * exp(s2B*t);


%   Representação Gráfica
tt = linspace(0,1,1000);

fprintf('\n\n  System Information\n');
if     zeta  < 1
    fprintf('    Amortecimento Subcritico, zeta = %2.2f\n', zeta);

    c1C = sqrt( ((v0 + x0*zeta*wn)^2 + (x0*wd)^2)/(wd^2) );
    c2C = atan((wd*x0)/(v0 + x0*zeta*wn));

    syms t
    eqC =  c1C * exp(-zeta*wn * t) * sin(wd * t + c2C);
    eqD = +c1C * exp(-zeta*wn * t);
    eqE = -c1C * exp(-zeta*wn * t);


    t = tt;
    eqAt = eval(eqA);
    eqBt = eval(eqB);
    eqCt = eval(eqC);
    eqDt = eval(eqD);
    eqEt = eval(eqE);

    figure; plot(t, eqAt, t, eqBt, 'o', t, eqCt, '+', t, eqDt, '--', t, eqEt, '--')

    mytitleText = ['Amortecimento Subcritico, \zeta = ',num2str(zeta)];
    title(mytitleText,'Interpreter','tex');

    xlabel('t [s]'); ylabel('x(t)');
    legend("eqA", "eqB", "eqC", "location", "southeast")
    set(gcf, 'PaperPosition', pSize);
    saveas(gca, fullfile(pPath, 'freeDampingVibration'), 'png');

elseif zeta == 1
    fprintf('    Amortecimento Critico, zeta = %2.2f\n', zeta);

    c1C = x0;
    c2C = v0 + x0*wn;

    syms t
    eqC = c1C * exp(-wn * t) + c2C * t .* exp(-wn * t);


    t = tt;
    eqCt = eval(eqC);

    figure; plot(t, eqCt)

    mytitleText = ['Amortecimento Critico, \zeta = ',num2str(zeta)];
    title(mytitleText,'Interpreter','tex');

    xlabel('t [s]'); ylabel('x(t)');
    legend("eqC", "location", "southeast")
    set(gcf, 'PaperPosition', pSize);
    saveas(gca, fullfile(pPath, 'freeDampingVibration'), 'png');

else
    fprintf('    Amortecimento Supercritico, zeta = %2.2f\n', zeta);

    c1C = x0 - (v0 - x0*s1A)/(s2A - s1A);
    c2C =      (v0 - x0*s1A)/(s2A - s1A);
    
    s1 = wn* (-zeta + sqrt(zeta^2 - 1)); % -1/tal1
    s2 = wn* (-zeta - sqrt(zeta^2 - 1)); % -1/tal1

    syms t
    eqC = c1C * exp(s1 * t) + c2C * exp(s2 * t);


    t = tt;
    eqAt = eval(eqA);
    eqBt = eval(eqB);
    eqCt = eval(eqC);

    figure; plot(t, eqAt, t, eqBt, 'o', t, eqCt, '+')

    mytitleText = ['Amortecimento Supercritico, \zeta = ',num2str(zeta)];
    title(mytitleText,'Interpreter','tex');
    
    xlabel('t [s]'); ylabel('x(t)');
    legend("eqA", "eqB", "eqC", "location", "southeast")
    set(gcf, 'PaperPosition', pSize);
    saveas(gca, fullfile(pPath, 'freeDampingVibrationEquations'), 'png');
end