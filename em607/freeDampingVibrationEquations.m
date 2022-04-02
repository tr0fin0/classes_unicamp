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
%    transformar equações em funções
%    deduzir dependência em condiÇões inciais para A, B e C
%    implementar condiçoes iniciais
%    dúvida constante a no caso subcrítico


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


t = linspace(0,1,10000);


fprintf('data______________________________________________________________\n');
fprintf('  Input Information\n');
fprintf('    Massa,                      m = %2.2f\n',   m);
fprintf('    Constante Amortecimento,    c = %2.2f\n',   c);
fprintf('    Constante Elastica,         k = %2.2f\n\n', k);

fprintf('    Frequencia Natural,        wn = %2.2f\n', wn);
fprintf('    Amortecimento Critico,     cc = %2.2f\n', cc);
fprintf('    Fator de Amortecimento,  zeta = %2.2f\n', zeta);



%   via Polinômio Característico:
%       s^2  + c/m s + k/m = 0
s1A = -c/(2*m) + sqrt( (c/(2*m))^2 - k/m );
s2A = -c/(2*m) - sqrt( (c/(2*m))^2 - k/m );
c1A = 1;
c2A = 1;

eqA = c1A * exp(s1A*t) + c2A * exp(s2A*t);


%   via Polinômio Característico:
%       s^2  + 2 phi wn s + wn^2 = 0
s1B = -zeta*wn + wn*sqrt( zeta^2 - 1 );
s2B = -zeta*wn - wn*sqrt( zeta^2 - 1 );
c1B = 1;
c2B = 1;

eqB = c1B * exp(s1B*t) + c2B * exp(s2B*t);


%   Representação Gráfica
t = linspace(0,1,10000);


fprintf('\n\n  System Information\n');
if     zeta  < 1
    fprintf('    Amortecimento Subcritico, zeta = %2.2f\n', zeta);
    
    c1C = 2;        % variaveis corrigidas manualmente
    c2C = +pi/2;    % phi
    eqC = c1C * exp(-zeta*wn * t) .* sin(wd * t + c2C);
    eqD = +c1C * exp(-zeta*wn * t);
    eqE = -c1C * exp(-zeta*wn * t);
    
    figure; plot(t, eqA, t, eqB, 'o', t, eqC, '+', t, eqD, '--', t, eqE, '--')
    mytitleText = ['Amortecimento Subcritico, \zeta = ',num2str(zeta)];
    title(mytitleText,'Interpreter','tex');
    
    xlabel('t [s]'); ylabel('x(t)');
    legend("eqA", "eqB", "eqC", "location", "southeast")
    set(gcf, 'PaperPosition', pSize);
    saveas(gca, fullfile(pPath, 'freeDampingVibration'), 'png');

elseif zeta == 1
    fprintf('    Amortecimento Critico, zeta = %2.2f\n', zeta);

    c1C = 1;
    c2C = 1;
    eqC = c1C * exp(-wn * t) + c2C * t .* exp(-wn * t);
    
    figure; plot(t, eqA, t, eqB, 'o', t, eqC, '+')
    mytitleText = ['Amortecimento Critico, \zeta = ',num2str(zeta)];
    title(mytitleText,'Interpreter','tex');
    
    xlabel('t [s]'); ylabel('x(t)');
    legend("eqA", "eqB", "eqC", "location", "southeast")
    set(gcf, 'PaperPosition', pSize);
    saveas(gca, fullfile(pPath, 'freeDampingVibration'), 'png');

else
    fprintf('    Amortecimento Supercritico, zeta = %2.2f\n', zeta);

    c1C = 1;
    c2C = 1;
    
    s1 = wn* (-zeta + sqrt(zeta^2 - 1)); % -1/tal1
    s2 = wn* (-zeta - sqrt(zeta^2 - 1)); % -1/tal1
    
    eqC = c1C * exp(s1 * t) + c2C * exp(s2 * t);
    
    figure; plot(t, eqA, t, eqB, 'o', t, eqC, '+')
    mytitleText = ['Amortecimento Supercritico, \zeta = ',num2str(zeta)];
    title(mytitleText,'Interpreter','tex');
    
    xlabel('t [s]'); ylabel('x(t)');
    legend("eqA", "eqB", "eqC", "location", "southeast")
    set(gcf, 'PaperPosition', pSize);
    saveas(gca, fullfile(pPath, 'freeDampingVibrationEquations'), 'png');
end

