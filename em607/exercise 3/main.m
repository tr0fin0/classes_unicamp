%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')

%   Frequency Analysis
%   1DOF Forced Vibration Vibration System with Viscous Damping
%   mddx + cdx + kx = f e^(iwt)
m1  = 1;    % mass
m2  = 1;    % mass
k1  = 0.4 * 1e6;    % elastic coeficient
k2  = 0.8 * 1e6;    % elastic coeficient
k3  = 0.4 * 1e6;    % elastic coeficient
f1  = 1;    % force magnitude
f2  = 0;    % force magnitude
step= 0.1; % step of omega

w   = 1e0 : step : 1e5;


M   = [m1 0; 0 m2];
C   = [0 0; 0 0];
K   = [(k1 + k2) -k2; -k2 (k2 + k3)];

PSIt= [+1 +1; +1 -1];
WNt = [0.4*1e6 0; 0 2.0*1e6];

MRt = PSIt.' * M * PSIt;
KRt = PSIt.' * K * PSIt;

PHIt= PSIt * MRt^(-1/2);
WRt = MRt^(-1) * KRt;

% %%============================================================================
% %%                    Exercices
% %%============================================================================

[MR, KR, WR, PHI] = ex2(M, K)
% ex4(step, MRt(1,1), C(1,1), KRt(1,1))
% ex4(step, MRt(2,2), C(2,2), KRt(2,2))
ex5(w, MR, C, KR)
ex6(M, C, K)
ex7(w, M, C, K)
ex10(M, C, K)