%%============================================================================
%%                    Main Code
%%============================================================================
clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')

%   Configurações para Images
fileType = 'png';
legendLocation = "southeast";
pPath = 'C:\Users\Admin-PC\Documents\gitRepos\classes\em607\images';
pSize = [0 0 18 18];

%   1DOF Forced Vibration Vibration System with Viscous Damping
%   mddx + cdx + kx = f e^(iwt)
m = 1;  % mass
c = 1;  % dampclcing coeficient
k = 100;  % elastic coeficient
f = 1;  % force magnitude

wn          = sqrt(k/m);        % natural frequency
phi         = c / (2 * wn * m); % damping coeficient

freqMin     = wn*10^(-2);
freqInt     = 0.01;
freqMax     = wn*10^(+2);

freqRange   = [freqMin, freqInt, freqMax];
freqLower   = freqRange(1):freqRange(2):wn;
freqUpper   =           wn:freqRange(2):freqRange(3);



%%============================================================================
%%                    Exercice 2
%%============================================================================

exercice2(freqRange, freqLower, freqUpper, m, c, k, wn)



%%============================================================================
%%                    Exercice 3
%%============================================================================

omega = freqRange(1):freqRange(2):freqRange(3);
moblt = eval(mobility(m, c, k));

mobltLower  = abs( (1i .* freqLower) ./ k );
mobltUpper  = abs( (-1i) ./ (m .* freqUpper) );

figure;
loglog(omega, abs(moblt), freqLower, mobltLower, '--', freqUpper, mobltUpper, '--')


titleText  = ['Magnitude Mobilidade y(\omega)'];
legendText = [append("Mobilidade, wn = ", num2str(wn)), "Assíntota \omega \rightarrow 0", "Assíntota \omega \rightarrow \infty"];
saveName = append('mobilityAbs', num2str(wn));
xLabel = 'w [rad/s]'; yLabel = 'y(\omega)';

title(titleText,  'Interpreter','tex'); grid on; 
legend(legendText, "location", legendLocation, 'Interpreter', 'tex')
xlabel(xLabel); ylabel(yLabel); set(gcf, 'PaperPosition', pSize); 
saveas(gca, fullfile(pPath, saveName), fileType);

H = tf([(-1i) (0)],[(-1*m) (1i*c) (k)]);
figure; bode(H)
saveName = append('mobilityBode', num2str(wn)); grid on; 
legend(legendText, "location", legendLocation, 'Interpreter', 'tex');
set(gcf, 'PaperPosition', pSize); saveas(gca, fullfile(pPath, saveName), fileType);


figure; loglog(omega, angle(moblt))

titleText  = ['Ângulo Mobilidade \alpha(\omega)']; 
legendText = [append("Mobilidade, wn = ", num2str(wn))]; 
saveName = append('mobilityAngle', num2str(wn));
xLabel = 'w [rad/s]'; yLabel = 'y(\omega)';

title(titleText,  'Interpreter','tex'); grid on; 
legend(legendText, "location", legendLocation, 'Interpreter', 'tex')
xlabel(xLabel); ylabel(yLabel); set(gcf, 'PaperPosition', pSize); 
saveas(gca, fullfile(pPath, saveName), fileType);



%%============================================================================
%%                    Exercice 4
%%============================================================================

omega = freqRange(1):freqRange(2):freqRange(3);
inert = eval(inertia(m, c, k));

inertLower  = abs( (-freqLower.^2) ./ k );
inertUpper  = abs(  1/m * ones(size(freqUpper)) );

figure;
loglog(omega, abs(inert), freqLower, inertLower, '--', freqUpper, inertUpper, '--')


titleText  = ['Magnitude Inertância A(\omega)'];
legendText = [append("Inertância, wn = ", num2str(wn)), "Assíntota \omega \rightarrow 0", "Assíntota \omega \rightarrow \infty"];
saveName = append('inertiaAbs', num2str(wn));
xLabel = 'w [rad/s]'; yLabel = 'A(\omega)';

title(titleText,  'Interpreter','tex'); grid on; 
legend(legendText, "location", legendLocation, 'Interpreter', 'tex')
xlabel(xLabel); ylabel(yLabel); set(gcf, 'PaperPosition', pSize); 
saveas(gca, fullfile(pPath, saveName), fileType);

H = tf([(-1) (0) (0)],[(-1*m) (1i*c) (k)]);
figure; bode(H)
saveName = append('inertiaBode', num2str(wn)); grid on; 
legend(legendText, "location", legendLocation, 'Interpreter', 'tex');
set(gcf, 'PaperPosition', pSize); saveas(gca, fullfile(pPath, saveName), fileType);


figure; loglog(omega, angle(inert))

titleText  = ['Ângulo Inertância (\omega)']; 
legendText = [append("Inertância, wn = ", num2str(wn))]; saveName = append('inertiaAngle', num2str(wn));
xLabel = 'w [rad/s]'; yLabel = 'A(\omega)';

title(titleText,  'Interpreter','tex'); grid on; 
legend(legendText, "location", legendLocation, 'Interpreter', 'tex')
xlabel(xLabel); ylabel(yLabel); set(gcf, 'PaperPosition', pSize); 
saveas(gca, fullfile(pPath, saveName), fileType);   