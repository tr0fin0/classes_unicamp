%%                    Main Code
%%============================================================================

clc
% clear all
close all

RA = 217276;


%%  Exercício de Representação de Estados
%%============================================================================

%   Considera-se um sistema de Segunda Ordem com a seguinte equação
%   característica:

%    ddy + (2*qsi*wn)dy + (wn**2)y = (wn**2)*u(t)

%   Forma Padrão em Estados
%   | dx(t) = A*x(t) + B*u(t) [2]
%   |  y(y) = C*x(t) + D*u(t) [3]

%   Nota-se que um sistema de estados será representado por matrizes e
%   vetores com as seguinte dimensões:
%       x: n x 1  A: n x n  B: n x r    onde:   r: Número de Entradas
%       y: p x 1  C: p x n  D: p x r            p: Número de Saídas
%       u: r x 1                                n: Ordem do Sistema

%   Considera-se que o sistema de estados deverá apresentar as seguintes
%   dimensões neste caso:
%       x: 2 x 1  A: 2 x 2  B: 2 x 1    onde:   r: 1
%       y: 1 x 1  C: 1 x 2  D: 1 x 1            p: 1
%       u: 1 x 1                                n: 2

%   Desta forma, define-se as seguintes variáveis:

wn  = 100;  % Frequência Natural do Sistema
qsi = 0.05; % Amortecimento      do Sistema

X0  = [10;  % Valores  = [1;  Espaço
        0]; % Iniciais    0]  Velocidade
    
%   Realizando as substituições adequadas, considerando que as variáveis
%   auxiliares foram o Espaço e a Velocidade, obtém-se as seguintes
%   matrizes:

A0  = [0 1; (-wn^2) (-2*qsi*wn)];   % Matriz de Transição de Estado
B0  = [0; (wn^2)];                  % Matriz de Controlabilidade
C0  = [1 0];                        % Matriz de Observabilidade
D0  = 0;

%   Além disso, considera-se que o intervalo de análise será definido pelas
%   seguintes variáveis:

tint = 1;       %   Início da Análise
tstp = 0.001;   %   Passo  da Análise

%   Considera-se também que a entrada será definida pelas seguintes
%   variáveis:

u    = 1;       % Amplitude    da Entrada (u(t) = 0, Homogêneo)
t0   = 0;       % Deslocamento da Entrada 


%%  Método 0: Função Matlab (Método de Controle)
%%============================================================================

%   Considera-se que a função "expm(A)" será o Benchmark dessa análise.

[XCL, YCL]  = ssCFree_expm(t0,X0,A0,C0);
[XCF, YCF]  = ssCForced_expm(t0,A0,B0,C0,D0, u);



%%  Método 1: Autovalores e Autovetores
%%============================================================================

[XAL, YAL]  = ssCFree_eig(t0,X0,A0,C0);
[XAF, YAF]  = ssCForced_eig(t0,A0,B0,C0,D0, u);



%%  Método 2: Inversa de Laplace
%%============================================================================

[XLL, YLL]  = ssCFree_laplace(t0,X0,A0,C0);
[XLF, YLF]  = ssCForced_laplace(t0,A0,B0,C0,D0, u);



%%  Método 3: Polinomial (Cayley-Hamilton)
%%============================================================================

[XPL, YPL]  = ssCFree_poly(t0,X0,A0,C0);
[XPF, YPF]  = ssCForced_poly(t0,A0,B0,C0,D0, u);



%%  Visualização dos Métodos
%%============================================================================

%   Cada método será graficamente comparado com base ao Método de Controle
%   estabelecido. Inicialmente define-se o intervalo de análise como:

tmin    = 0+t0;
tmax    = tmin+tint;
t       = tmin : tstp : tmax;

%   Na sequência será necessário avaliar cada expressão analítica obtida
%   através do comando "eval(f)".

YCLt    = real(eval(YCL));              % Y Controle    Livre   em t
YALt    = real(eval(YAL));              % Y Autovalores Livre   em t
YLLt    = real(eval(YLL));              % Y Laplace     Livre   em t
YPLt    = real(eval(YPL));              % Y Polinomial  Livre   em t

YCFt    = real(eval(YCF));              % Y Controle    Forçada em t
YAFt    = real(eval(YAF));              % Y Autovalores Forçada em t
YLFt    = real(eval(YLF));              % Y Laplace     Forçada em t
YPFt    = real(eval(YPF));              % Y Polinomial  Forçada em t

YCTt    = YCLt + YCFt;                  % Y Controle    Total   em t
YATt    = YALt + YAFt;                  % Y Autovalores Total   em t
YLTt    = YLLt + YLFt;                  % Y Laplace     Total   em t
YPTt    = YPLt + YPFt;                  % Y Polinomial  Total   em t

%   Note que apenas os valores reais serão considerados através do comando
%   "real(f)" para evitar warnings desnecessários.
%
%   Durante a solução numérica haverá algum lixo numérico complexo
%   indesejado na ordem de 10^(-15).

fpath = 'C:\Users\Admin-PC\OneDrive\UNICAMP\classes\es601\images';
fsize = [0 0 18 6];

%   Resposta Livre_________________________________________________________
figure; plot(t, YCLt, t, YALt, 's', t, YLLt, '+', t, YPLt, 'o')
title('Resultado Livre');       xlabel('t [s]'); ylabel('y(t)')
legend("Controle", "Autovalores", "Laplace", "Polinomial", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'es601_ex6_RLAnalitico'), 'png');

%   Resposta Forçada_______________________________________________________
figure; plot(t, YCFt, t, YAFt, 's', t, YLFt, '+', t, YPFt, 'o')
title('Resultado Forçado');     xlabel('t [s]'); ylabel('y(t)');
legend("Controle", "Autovalores", "Laplace", "Polinomial", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'es601_ex6_RFAnalitico'), 'png');

%   Resposta Total_________________________________________________________
figure; plot(t, YCTt, t, YATt, 's', t, YLTt, '+', t, YPTt, 'o')
title('Resultado Total');       xlabel('t [s]'); ylabel('y(t)');
legend("Controle", "Autovalores", "Laplace", "Polinomial", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'es601_ex6_RTAnalitico'), 'png');



%%  Visualização Simulink
%%============================================================================

%   Separou-se a análise do Simulink para que os gráficos não apresentassem
%   poluição visual.
%
%   Espera-se que tanto as solução analíticas quanto simuladas convirgam na
%   Método de Controle, por isso apenas este será incluido como referência.

%   Resposta Livre_________________________________________________________
figure; plot(t, YCLt, out.tout, out.simL, 'o')
title('Resultado Livre Simulink');    xlabel('t [s]'); ylabel('y(t)');
legend("Controle", "Simulink", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'es601_ex6_RLSimulink'), 'png');

%   Resposta Forçada_______________________________________________________
figure; plot(t, YCFt, out.tout, out.simF, 'o')
title('Resultado Forçado Simulink');    xlabel('t [s]'); ylabel('y(t)');
legend("Controle", "Simulink", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'es601_ex6_RFSimulink'), 'png');

%   Resposta Total_________________________________________________________
figure; plot(t, YCTt, out.tout, out.simT, 'o')
title('Resultado Total Simulink');      xlabel('t [s]'); ylabel('y(t)');
legend("Controle", "Simulink", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'es601_ex6_RTSimulink'), 'png');



%%  Comparação Métodos
%%============================================================================

%   Deseja-se avaliar se os métodos analíticos utilizados são confiáveis ou
%   não. Assim, além da ferramenta visual, determina-se o erro médio de
%   cada método em comparação ao Método de Controle.

fprintf('ANÁLISE SIMBÓLICA_____________________________________________\n');
const_test = 'Resultado Diverge';z
if qsi*wn>0
    const_test = 'Resultado Converge';
end
disp(['qsi*wn > 0: ' const_test]);


fprintf('\n\nANÁLISE NUMÉRICA______________________________________________\n');
fprintf('Resultado Homogeneo       (Livre):\n');
disp(['Erro Método Autovalores Livre:   ' num2str(abs(mean(YALt-YCLt)))]);
disp(['Erro Método Laplace     Livre:   ' num2str(abs(mean(YLLt-YCLt)))]);
disp(['Erro Método Polinomial  Livre:   ' num2str(abs(mean(YPLt-YCLt)))]);
disp(['Erro Método Simulink    Livre:   ' num2str(abs(mean(out.simL'-YCLt)))]);

fprintf('\nResultado Particular    (Forçado):\n');
disp(['Erro Método Autovalores Forçado: ' num2str(abs(mean(YAFt-YCFt)))]);
disp(['Erro Método Laplace     Forçado: ' num2str(abs(mean(YLFt-YCFt)))]);
disp(['Erro Método Polinomial  Forcado: ' num2str(abs(mean(YPFt-YCFt)))]);
disp(['Erro Método Simulink    Forçado: ' num2str(abs(mean(out.simF'-YCFt)))]);

fprintf('\nResultado Total (Livre + Forçado):\n');
disp(['Erro Método Autovalores Total:   ' num2str(abs(mean(YATt-YCTt)))]);
disp(['Erro Método Laplace     Total:   ' num2str(abs(mean(YLTt-YCTt)))]);
disp(['Erro Método Polinomial  Total:   ' num2str(abs(mean(YPTt-YCTt)))]);
disp(['Erro Método Simulink    Total:   ' num2str(abs(mean(out.simT'-YCTt)))]);