%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;



%%  Descrição de Modelo
%   Construção dos formas canônicas dependerá da construção da Função de
%   Transferência do sistema.

%   Função Geral:
%         n       (n-1)                    n       (n-1)
%       1y  + a1 y      + ... + an y = b0 u  + b1 u      + ... + bn u
%
%   Função de Transferência:
%       H(s) = tf([b0 b1 ... bn], [1 a1 ... an])    Caso Contínuo
%       H(z) = tf([b0 b1 ... bn], [1 a1 ... an], T) Caso Discreto
%
%   Onde:
%       T: Período de Discretização
%   
%   Note:
%       a0 = 1 independente do Sistema

%   Q2A Simulado P2, 2021
a    = 0.3;
ssC  = tf([1], [1 0 -a]);       % Modelo Contínuo
ssD  = tf([1], [1 0 -a], 1);    % Modelo Discreto



fprintf('\n\nCanonica Observavel___________________________________________\n');
ssCo = canon(ssC, 'companion')                          % Observável
ssDo = canon(ssD, 'companion')                          % Observável
%   Note:
%       Contínua e Discreta são idênticas.

fprintf('\n\nCanonica Controlavel__________________________________________\n');
ssCc = ss((ssCo.A)', (ssCo.C)', (ssCo.B)', (ssCo.D))    % Controlável
ssDc = ss((ssDo.A)', (ssDo.C)', (ssDo.B)', (ssDo.D))    % Controlável
%   Note:
%       Contínua e Discreta são idênticas.

fprintf('\n\nCanonica Modal________________________________________________\n');
ssCm = canon(ssC, 'modal')                              % Modal
ssDm = canon(ssD, 'modal')                              % Modal
%   Note:
%       Contínua e Discreta são distintas.
%   
%       Diagonal de A será os Polos
%             Vetor C será os Resíduos


%   Referências
%       https://www.mathworks.com/help/control/ug/canonical-state-space-realizations.html