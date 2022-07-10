clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q1________________________________________________________ 
if true
    Xinf = 0.12;    % amplitude infinito
    Xmax = 0.78;    % amplitude máxima

    
    syms qsi
    eqn = Xmax == Xinf * 1 / (2*qsi * sqrt(1-qsi^2));
    
    vQsi  = vpa(simplify(solve(eqn)), 8)   % all possible values
    vpQsi = vQsi( vQsi > 0);                % all real values
    qsi   = vpQsi( vpQsi < sqrt(2)/2)       % all positive values
    
    
    qsi = 1.3975*qsi;
    
    Xmax = Xinf * 1 / ( 2*qsi * sqrt(1-qsi^2))
end



% Q4________________________________________________________
if true
    M = [10 0; 0 2]
    K = [200000 -1000; -1000 1000]
    
    [phi, wn2] = eig(K, M)
    wn = sqrt(wn2)
    
    
    syms alpha beta gamma
    eqn1 = 201000 == alpha*+10 + beta*+200000;
    eqn2 =  -1000 == alpha*+0  + beta*-1000;
    eqn3 =  gamma == alpha*+2  + beta*+1000; 
    
    sol = solve([eqn1, eqn2, eqn3], [alpha, beta, gamma]);
    alpha = vpa(simplify(sol.alpha), 8)
    beta  = vpa(simplify(sol.beta),  8)
    gamma = vpa(simplify(sol.gamma), 8)
    
    C = [201000 -1000; -1000 gamma]
       
    
    syms qsi1 qsi2
    eqn1 = 2*qsi1*wn(1,1) == alpha*1 + beta*wn2(1,1);
    eqn2 = 2*qsi2*wn(2,2) == alpha*1 + beta*wn2(2,2);
    
    sol = solve([eqn1, eqn2], [qsi1, qsi2]);
    qsi1 = vpa(simplify(sol.qsi1), 8)
    qsi2 = vpa(simplify(sol.qsi2), 8)
end