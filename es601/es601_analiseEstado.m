%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;


%%  Análise de Estados Primeira Ordem
%%============================================================================

%   Sistema de Primeira Ordem descrito pela seguinte Equação:
%   t*dy(t) + y(t) = g*u(t) [1]

%   Forma Padrão em Estados
%   | dx(t) = a*x(t) + b*u(t) [2]
%   |  y(y) = c*x(t) + d*u(t) [3]

%   Toma-se a relação x(t) = y(t) [4], logo as equações se simplificam
%   para:
%   [4] em [1]: a = -(1/t); b = (g/t);
%   [4] em [3]: c = 1;      d = 0;



%%  Análise de Estados Segunda Ordem
%%============================================================================

%   Sistema de Segunda Ordem descrito pela seguinte Equação:
%   m*ddy(t) + c*dy(t) + k*y(t) = a*u(t) [1]

%   Observação: Considera-se que as variáveis maiúsculas serão vetores.

%   Forma Padrão em Estados
%   | dX(t) = A*X(t) + B*u(t) [2]
%   |  Y(y) = C*X(t) + D*u(t) [3]



%   Exemplo de Aplicaçào considerando um Sistema Massa-Mola-Amortecedor:

m   = 1;    % Massa
k   = 100;  % Constante Elástica
c   = 10;   % Constante de Amortecimento

X0  = [1; 0];   % Valores Iniciais de X(t)
U   = 0;        % Entrada do Sistema (0 = Homogênea)

A   = [0 1; (-k/m) (-c/m)]; % Matriz de Transição de Estado
B   = [ ];                  % ([] = Homogênea)
C   = [1 0];                %
D   = [ ];                  % ([] = Homogênea)

