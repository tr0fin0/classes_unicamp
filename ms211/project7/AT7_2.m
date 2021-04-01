%====================================================================================
X = [1, 2, 3, 4,  5]; %Coordenadas em X
Y = [1, 1, 2, 6, 24]; %Coordenadas em Y
x = 1:0.1:5; %Intervalo de Avaliacao


%INTERPOLACAO========================================================================
T = CoeficientesNewton(X, Y) %Coeficientes de Newton
p = @(t) T(1,1)+(t-X(1)).*(T(1,2)+(t-X(2)).*(T(1,3)+(t-X(3)).*(T(1,4)+(t-X(4)).*T(1,5))));


%SPLINE==============================================================================
y = spline(X, Y, x);
C = spline(X, Y).coefs %Imprimi os Coeficientes


%====================================================================================
LW = 3; FS = 32; %Largura das Linhas | Tamanho da Fonte
plot(X, Y,        'linewidth', LW, 'or', %Pontos
     x, p(x),     'linewidth', LW, 'b',  %Polinomio Interpolador
     x, y,        'linewidth', LW, 'g',  %Spline Cubica
     x, gamma(x), 'linewidth', LW, 'r'); %Funcao Gamma

axis("square"); grid; set(gca, "fontsize", FS);
legend("Pontos","Polinomio","Spline","Gamma","location", "west")