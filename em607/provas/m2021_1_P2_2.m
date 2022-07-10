clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q2________________________________________________________
%  A
if false
    m   = 10;
    c   = 10;
    k   = 10;

    y0  = 10;
    w   = 0 : 0.001 : 5;

    trn = @transmissibility;
    frequencyResponse1DOF(trn, y0, w, m, c, k)

    rtr = @rotaryUnbalance;
    frequencyResponse1DOF(rtr, y0, w, m, c, k)

    hrm = @harmonicExcitation;
    frequencyResponse1DOF(hrm, y0, w, m, c, k)
end


% Q3________________________________________________________
%  A
if false
    M = [4 0; 0 2]
    K = [200 -2; -2 10]

    alpha = 0.2;
    beta  = 0.1;
    C = alpha * M + beta * K

    gamma = C(1,1)
    
    
    [phi, wn2] = eig(K, M);
    phi
    wn = sqrt(wn2)
    
    CR0 = phi' * C * phi
    CR1 = alpha * eye(size(M)) + beta * wn2 
end