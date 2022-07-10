clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q1________________________________________________________ 
if true
    F0 = 15.076     % 15.0XX, últimos digitos do RA
    % nota-se algumas diferenças do resultado teórico visto a diferença nos
    % arredondamentos utilizados nas contas realizadas na teoria.
    
    % identificação gráfico receptância
    magp = 0.00224; % magnitude  pico (gráfico magnitude)
    wp   = 22.3;    % frequência pico (gráfico magnitude)
    
    magz = 0.000301;% magnitude  zero (gráfico magnitude)
    wz   = 1.02;    % frequência zero (gráfico magnitude)

    
    Xmax = magp;
    X0   = magz;
    k = F0 / X0;
    cnst = Xmax * k / F0
    
    syms qsi
    eqn = cnst == 1 / (2*qsi*sqrt(1 - qsi^2));
    
    QSI = vpa(simplify(solve(eqn)), 4)
    
    qsi = QSI(2)      % fator de amortecimento <sqrt(2)/2
    rp  = sqrt(1 - 2*qsi)
    wn  = wp / rp
    m   = k / wn^2
    c   = 2 * qsi * wn * m
    k


    w = 1 : 0.1 : 1000;
    rcp   = F0 ./ (k - w.^2.* m + w.* (1i*c));
    figure;
    plot(w, (abs(rcp)))
    grid on
    set(gca, 'XScale', 'log');
    
    % identificação gráfico espaço
    x0 = 0.1    % espaço 1a oscilação
    t0 = 0      % tempo  1a osiclação
    
    x8 = 0.0036 % espaço após 8 oscilações
    t8 = 2.25   % tempo  após 8 oscilações
    n  = 8      % número de oscilações
    
    delta = 1/n * log(x0/x8)    % decremento logaritmico
    qsi   = delta/sqrt(4*pi^2 + delta^2)
    
    wd = 2*pi*n/(t8-t0)         % frequência de decaimento
    wn = wd / sqrt(1 - qsi^2)   
    
    k = F0 / x0;
    m = k / wn^2
    c = 2 * qsi * wn * m
    k


    t = 0 : 0.001 : 3;
    x = x0 .* exp(-qsi .* wn .* t) .* cos(wd.*t);
    figure;
    plot(t, x)
    grid on
end


% Q4________________________________________________________ 
if false
    M = [1, 0; 0, 2]
    C = [0, 0; 0, 0]
    K = [4, -1; -1, 12.076] % 12.0XX, últimos digitos do RA
    
    [phi, wn2] = eig(K, M)
    wn = sqrt(wn2)
end