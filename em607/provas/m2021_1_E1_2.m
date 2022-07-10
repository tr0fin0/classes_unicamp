clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q1________________________________________________________
if false
    k1 = 1; k2 = 2;
    J1 = 1; J2 = 6; m = 2;
    r1 = 2; r2 = 1;
    c1 = 0.01; g = 10;
    
    M = [m 0; 0 (J1 + 2*J2*r1^2/r2^2)]
    C = [0 0; 0 c1*r1^2]
    K = [k2, -k2*r1; -k2*r1, (k2+k1)*r1^2]
    
    [phi, wn2] = eig(K, M)
    wn = sqrt(wn2)
end


% Q2________________________________________________________
if true
    % identificação gráfico
    magdbp = -92.8; % magnitude  pico (gráfico magnitude)
    wp = 28.1;      % frequência pico (gráfico magnitude)
    
    magdbz = -99.1; % magnitude  zero (gráfico magnitude)
    wz = 1.01;      % frequência zero (gráfico magnitude)
    
    wn = 30;                    % frequência natural (gráfico phase)         
    rp  = wp/wn;                % r de pico
    qsi = sqrt((1 - rp^2)/2);   % fator de amortecimento
    
    
    k = db2mag(magdbz)^(-1) % constante elástica
    m = k / wn^2            % massa
    c = 2 * qsi * wn * m    % constante amortecimento
    
    
    % modelagem de estados
    A = [0, 1; -k/m, -c/m]
    B = [0; 1/m]
    C = [1, 0; 0, 1; -k/m, -c/m]
    D = [0; 0; 1/m]
    
    sys = ss(A, B, C, D);
    tff = tf(sys);
    
    figure
    bode(sys);

    figure
    bode(tff);
end