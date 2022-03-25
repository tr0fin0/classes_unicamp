%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;

%   Configurações para Images
fpath = 'C:\Users\Admin-PC\OneDrive\UNICAMP\classes\es601\p2\images';
fsize = [0 0 18 18];


%%  Q1A
%   Nota-se que um sistema de estados será representado por matrizes e
%   vetores com as seguinte dimensões:
%       x: n x 1  A: n x n  B: n x r    onde:   r:(1) Número de Entradas
%       y: p x 1  C: p x n  D: p x r            p:(1) Número de Saídas
%       u: r x 1                                n:(4) Ordem do Sistema

%   Desta forma, define-se as seguintes variáveis:
m   = 1;    % Massa                     [Kg]
k   = 100;  % Constante Elástica        [N/m]
c   = 10;   % Constante Amortecimento   [Ns/m]

%   Realizando as substituições adequadas, considerando que as variáveis
%   auxiliares foram o Espaço, a Velocidade e suas derivadas, obtém-se as
%   seguintes matrizes:
fprintf('\n\nQ1A___________________________________________________________\n');
Ac  = [0       0    1    0;
       0       0    0    1;
       -k/m   +k/m -c/m +c/m;
       +k/m -2*k/m +c/m -c/m]       % Matriz de Transição de Estado
Bc  = [0; 0; 1/m; 0]                % Matriz de Controlabilidade
Cc  = [1  0  0    0]                % Matriz de Observabilidade
Dc  = 0





%%  Q1B
fprintf('\n\nQ1B___________________________________________________________\n');
%   Condições iniciais do Sistema
X0  = [+0.1;    %  y1
       -0.001;  %  y2
        0;      % dy1
        0]      % dy2

%   Além disso, considera-se que o intervalo de análise será definido pelas
%   seguintes variáveis:
tint = 10;                  %    Intervalo da Análise
tstp = 0.01;                %        Passo da Análise
t0   = 0;                   % Deslocamento da Entrada

tmin =    0 + t0;           % Tempo Inicial
tmax = tmin + tint;         % Tempo Final
t    = tmin : tstp : tmax;  % Vetor de Tempo

%   Resposta Numérica Manual
[XCL, YCL]  = ssCFree(t0, X0, Ac, Cc, 'eig');
YCFt        = real(subs(YCL, t));               % Y Controle Livre em t

%   Funções anteriores realizam cálculos simbólicos que exigem demasiado
%   processamento computacional, alternativa:
YCLt = 0;
for i=1:length(t)
    YCLt(i) = Cc * expm(Ac*t(i)-t0) *X0;
end

%   Criação de Sistema de Estados para solução através das funções defaults
%   do Matlab
ssC     = ss(Ac,Bc,Cc,Dc);                  % Continues State System
% nullIn  = zeros(size(t));                   % Entrada Livre (Nula)
% YLLt    = real(lsim(ssC, nullIn, t, X0));   % Y Lsim Livre
%   Simplificação dos comandos acima
YLLt    = initial(ssC, X0, t);


figure; plot(t, YCLt, t, YLLt, 'o', t, YCFt, 's')
title('Q1B'); xlabel('t [s]'); ylabel('y1(t)');
legend("Controle", "lsim", "ssCFree", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2simuladoQ1B'), 'png');




%%  Q1C
fprintf('\n\nQ1C___________________________________________________________\n');
a   = 1;

%   Comparação dos resultados:
eAeigen  = vpa(real(subs(eAFree_eig(t0, Ac), a)),5)
eAexpm   = expm(Ac*a)




%%  Q1D
%   Condições do Problema
fprintf('\n\nQ1D___________________________________________________________\n');
N   = 1024  % Número de Pontos
dt  = 0.01  % Variação de Tempo
ti  = 0     % Tempo Inicial
tf  = 0.1   % Tempo Final

%   Criação de Função de Entrada Arbitrária
tt          = 0;
userImpulse = 0;
areaImpulse = 0;
for n=1:N
   tt(n) = (n-1)*dt;
   
   userImpulse(n) = 0;
   if (ti < tt(n)) && (tt(n) <= tf)
       userImpulse(n) = (sin(10*pi*tt(n)))^2;   % Função Arbitrária
   end
   
   areaImpulse = areaImpulse + userImpulse(n)*dt;
end
%   TODO: Otimização
YLSUI   = lsim(ssC, userImpulse, tt)/areaImpulse;
%   Nota-se que impulse considera um sinal com área 1, desta forma o
%   resultado Arbitrário precisará ser normalizado.

%   Nota-se que trata-se de um sinal Discreto e portanto a integral pode
%   ser substituida por um somatório.

%   Nota-se que trata-se de um sistema Linear Invariante no Tempo, logo a
%   normalização da área pode ser realizada depois da aplicação de lsim.

figure; plot(tt, userImpulse)
title('userImpulse'); xlabel('t [s]'); ylabel('userImpulse(t)');
legend("userImpulse", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2simuladoQ1DuserImpulse'), 'png');


%   Resultado de Controle
YLS0I   = impulse(ssC, tt);
hcc     = ssCImpulse(t0, tt, Ac, Bc, Cc, Dc, 'eig');

figure; plot(tt, YLS0I, tt, YLSUI, 'o', tt, hcc, 's')
title('Q1D'); xlabel('t [s]'); ylabel('y1(t)');
legend("impulse", "userImpulse", "ssCImpulse", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2simuladoQ1D'), 'png');




%%  Q2A
fprintf('\n\nQ2A___________________________________________________________\n');
Ad = [0   1;
      0.3 0]                        % Matriz de Transição de Estado
Bd = [0;  1]                        % Matriz de Controlabilidade
Cd = [1   0]                        % Matriz de Observabilidade
Dd = 0




%% Q2B
fprintf('\n\nQ2B___________________________________________________________\n');

%   Criação de Sistema de Estados para solução através das funções defaults
%   do Matlab
ssD     = ss(Ad,Bd,Cd,Dd, 1);       % Discrete State System Matrix
[h,k]   = impulse(ssD);             % Y LSim em sys0 (Livre)

figure; stairs(k, h)
title('Q2B'); xlabel('k [s]'); ylabel('y(k)')

%   Análise analítica do problema
ha = 0;
for n=2:length(k)
   ha(n) = Cd*Ad^(k(n)-1)*Bd; % Parametros de Markov
end

%   Análise Analítica do Problema
hkk     = ssDImpulse(0, k, Ad, Bd, Cd, Dd, 'poly');

hold on
stairs(k, ha,  'o')
stairs(k, hkk, 's')
legend("Impulse", "Analitica", "ssDImpulse", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2simuladoQ1DQ2B'), 'png');
hold off



%% Q2C

%   Recursive Solution
alpha   = 0.3;          % Constant          (!=1)
n       = 20;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
yr(1)   = 1;
yr(2)   = 0;            % Initial Conditions

sysOrder= 2;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+2) = alpha * yr(k);
end
figure; stairs(kr,yr)
title('Q2C'); xlabel('k [s]'); ylabel('y(k)')


%   Analytic Solution
ka      = kr;                                                                % Analytic Interval
ya      = ((+1/2) * (-sqrt(alpha)).^(ka) + (+1/2) * (+sqrt(alpha)).^(ka));   % Analytic Solution
ya(1)   = yr(1);
ya(2)   = yr(2);

hold on
stairs(ka,ya,'o');  % Adding the Analytic Solution
hold off


%   Function Solution
XF = [1; 0];
kf = kr;

[x, y]  = ssDFree(XF, Ad, Cd, 'poly');

yf  = subs(y,kf);

hold on
stairs(kf,yf,'s');  % Adding the Function Solution
hold off
legend("Recursiva", "Analitica", "ssDFree", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2simuladoQ2C'), 'png');


