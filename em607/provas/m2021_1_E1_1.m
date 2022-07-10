clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q3________________________________________________________ 
if true
    X0  = 1.0;
    Y0  = 1.8;
    qsi = 0.4;
    m0  = 800;
 
    syms r
    eqn = X0 == Y0 * sqrt(1+(2*qsi*r)^2) / sqrt((1-r^2)^2+(2*qsi*r)^2);
    
    vectorR = vpa(simplify(solve(eqn)), 8); % all possible values
    realVectorR = real(vectorR);            % all real values
    r = realVectorR( realVectorR > 0)       % all positive values
    
    
    m1   = 200;
    qsi1 = 2*qsi;
    r1   = r/2;
    
    X1 = Y0 * sqrt(1+(2*qsi1*r1)^2) / sqrt((1-r1^2)^2+(2*qsi1*r1)^2)
end