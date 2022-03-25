%%============================================================================
%%                    Main Code
%%============================================================================
clc
% clear all
close all

RA = 217276;

%   Configurações para Images
fpath = 'C:\Users\Admin-PC\OneDrive\UNICAMP\classes\es601\activity7\images';
fsize = [0 0 18 18];


    
%%  Descrição de Modelo
%   Sistema desconhecido será submetido a uma aproximação do Impulso
%   teórico através da utilização de 2 step's defasados de tau:

tau = 0.001;    % Intervalo do Pulso
amp = 1/tau;    % Amplitude do Pulso

%   Declara-se a Amplitude dos step's como o inverso de tau para que a área
%   1 do pulso gerado.


%%   Variáveis da Simulação
tstep = 0.001;
t0    = 0;
tf    = 10;
t     = t0 : tstep : tf;

%%  Identificação
%   Declaração de variáveis nulas para que o Simulink possa executar.
Aera = 0; Bera = 0; Cera = 0; Dera = 0;
A = 0;    B = 0;    C = 0;    D = 0;

%   eraSISO:
%       recebe vetor de dados da resposta ao impulso.
[Aera,Bera,Cera,Dera] = eraSISO(YU')

%   Conversão das Matrizes de Estados Discretos para Contínuos
A = 1/tau*(Aera - eye(size(Aera)))
B = 1/tau*Bera
C = Cera
D = Dera



%   Gráficos
figure; plot(t, YU, t, YC*tau, 'o')
title('ERAcontinuos'); xlabel('t [s]'); ylabel('y(t)');
legend("YU", "YC", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'ERAcontinuos'), 'png');



figure; stairs(t, YU)
title('ERAdiscrete'); xlabel('k [s]'); ylabel('y(k)')
hold on
stairs(t, YD*tau,  'o')
legend("YU", "YD", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'ERAdiscrete'), 'png');
hold off



figure; plot(t, YUS, t, YCS*tau, 'o')
title('ERAcontinuosStep'); xlabel('t [s]'); ylabel('y(t)');
legend("YUS", "YCS", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'ERAcontinuosStep'), 'png');