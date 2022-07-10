clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q1________________________________________________________ 
if false
    F0 = 200    % amplitude senoide
    % nota-se algumas diferenças do resultado teórico visto a diferença nos
    % arredondamentos utilizados nas contas realizadas na teoria.
    
    % identificação gráfico receptância
    magp = 1.06;    % magnitude  pico (gráfico magnitude)
    wp   = 8.82;    % frequência pico (gráfico magnitude)
    
    magz = 0.667;   % magnitude  zero (gráfico magnitude)
    wz   = 0.001;   % frequência zero (gráfico magnitude)
    
    % identificação gráfico de phase
    wn = 10;

    
    Xmax = magp;
    X0   = magz;
    k    = F0 / X0;
    
    qsi = sqrt(1/2 * (1 - wp^2/wn^2))
   
    m   = k / wn^2
    c   = 2 * qsi * wn * m
    k


    w = 1e-3 : 0.1 : 1e3;
    rcp   = F0 ./ (k - w.^2.* m + w.* (1i*c));

    figure; plot(w, (abs(rcp)))
    grid on; set(gca, 'XScale', 'log');
    
    figure; plot(w, rad2deg(angle(rcp)))
    grid on; set(gca, 'XScale', 'log');
end


% Q3________________________________________________________ 
if true
    M = [10, 0; 0, 2]
    C = [2000, 0; 0, 0]
    K = [200000, -1000; -1000, 1000]
    
    [phi, wn2] = eig(K, M)
    wn = sqrt(wn2)
end