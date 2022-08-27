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
m   = 1;    % mass
c   = 1;    % dampling coeficient
k   = 1;    % elastic coeficient
f   = 1;    % force magnitude
step= 0.01; % step of 

wn  = sqrt(k/m);        % natural frequency
phi = c / (2 * wn * m); % damping coeficient



% %%============================================================================
% %%                    Exercices
% %%============================================================================

% ex2(step, 100.17, 1488.39, 90157.11);
% ex2(step, m, c, k);
% ex3(step, m, c, k);
% ex4(step, m, c, k);
% ex5(step, m, c, k);
ex6(step, m, 5*c, 100*k);
ex7(step, 10*m, 5*c, 100*k);
% ex8(step, m, c, k);
% ex9(step, m, c, k);
% ex10(step, m, c, k);
% ex15(m, c, k);