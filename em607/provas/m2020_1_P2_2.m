clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q1________________________________________________________
if true
    M = [1 0.7; 0.7 4]
    C = [0 0; 0 0]
    K = [1200000 -800000; -800000 1200000]
    
    [phi, wn2] = eig(K, M)
    wn = sqrt(wn2)
    
    qsi1 = 0.2;
    qsi2 = 0.1;
    
    
    syms alpha beta
    eqn1 = 2*qsi1*wn(1,1) == alpha*1 + beta*wn2(1,1);
    eqn2 = 2*qsi2*wn(2,2) == alpha*1 + beta*wn2(2,2);
    
    sol = solve([eqn1, eqn2], [alpha, beta]);
    alpha = vpa(simplify(sol.alpha), 8)
    beta  = vpa(simplify(sol.beta),  8)
    
    C = vpa(alpha*M + beta*K, 6)
end