%====================================================================================
load("Guilherme Nunes Trofino - Atividade8Questao1.mat");
X = dim;
Y = tempo;


%====================================================================================
g0 = @(x) x.^0; %Coeficiente 0
g1 = @(x) x.^1; %Coeficiente 1
g2 = @(x) x.^2; %Coeficiente 2
g3 = @(x) x.^3; %Coeficiente 3
g4 = @(x) x.^4; %Coeficiente 4

M = [ g4(X') g3(X') g2(X') g1(X') g0(X') ]; %Matriz de Coeficients
A = (M'*M)\(M'*Y') %Coeficientes do Polinomio de Grau 4

size(A)

x = 10:1:1000; %Intervalo de Avaliacao da Funcao
y = @(x, A) A(1)*x.^4 + A(2)*x.^3 + A(3)*x.^2 + A(4)*x + A(5);

y(500,  A) %Tempo:  68.596 s
y(1000, A) %Tempo: 919.33  s


%====================================================================================
LW = 2; FS = 20; %Largura das Linhas | Tamanho da Fonte
plot(X, Y,       'linewidth', LW, 'or',  %Dimensao    | Tempo
     x, y(x, A), 'linewidth', LW, 'b' ); %Aproximacao | Tempo

xlabel("Dimensao", "fontsize",FS); %Legenda X
ylabel("Tempo [s]","fontsize",FS); %Legenda Y
axis([0 100 0 0.35]); grid; set(gca, "fontsize", FS); %Formato
legend("Pontos", "Polinomio", "location", "west") %Legenda Dados