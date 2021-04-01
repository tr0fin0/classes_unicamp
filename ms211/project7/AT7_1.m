%====================================================================================
a = 1.8; %Altura Minima a ser Avaliada
b = 2;   %Altura Maxima a ser Avaliada

m = 300; %Quantidade de Guerreiros
u = 1.7; %Altura Media dos Guerreiros
s = 0.1; %Desvio Padrao das Alturas

%Declaracao da Funcao de Desvio Padrao
f = @(x, m, u, s) (m./(s*sqrt(2*pi)))*(e.^(-((x-u).^2)./(2*(s^2))));

[I, E] = IntegralTrapezioRepetido(119583, f, m, u, s, a, b, 100)