%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')

%   States Analysis
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

[sys20, A, B, C, D] = ex2(m, c, k)

[tf30, tf31] = ex3(sys20, A, B, C, D)

[sys40, wn40, zeta40, p40, e40] = ex4(tf30)

ex5(sys40, m, c, k)
% ex6(sys40, m, c, k)
% ex7(sys40, m, c, k)



% ex1 procedimento realizado correto?
% ex2
% ex3 não encontrei, modificações no código são a causa?
%       o que uma matriz de transferência representa?
% ex4 o que os poles significam?
% ex5 
% ex6 o que quer dizer com artificialmentee?
% ex7 existe um comando bodeang?
% ex8 (trabalhoso)


% explorar arquivo de pacote para matlab
% agrupar funções especiais personalizadas no matlab