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

