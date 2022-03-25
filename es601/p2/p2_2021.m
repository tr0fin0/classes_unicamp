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
nRA= 2.17
k   = nRA * 1e3;
c   = nRA * 1e1;

%   Função de Transferência
tfQ1A = tf([c k], [1 c k])

%   Canônica Controlável
Ac  = [ 0  1;
       -k -c]
Bc  = [0;
       1]
Cc  = [k c]
Dc  = 0

%   Canônica Observável
Ao  = [0 -k;
       1 -c]
Bo  = [k;
       c]
Co  = [0 1]
Do  = 0

%   Conferência
Ac == Ao';
Bc == Co';
Cc == Bo';
Dc == Do;



%%  Q1B
sc      = ss(Ac, Bc, Cc, Dc);   % Continuos System
[hI, t] = impulse(sc);          % h Impulse

t0 = 0;
hE = 0;                         % h Expm
for n=1:length(t)
    if     (t(n)) == t0
        hE(n) = real(Cc * expm(Ac*(t(n)-t0)) * Bc + Dc);

    elseif (t(n))  > t0
        hE(n) = real(Cc * expm(Ac*(t(n)-t0)) * Bc);

    end
end

figure; plot(t, hI, t, hE, 'o')
title('Q1B'); xlabel('t [s]'); ylabel('y(t)');
legend("impulse", "ssCImpulse", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2Q1B'), 'png');



%%  Q1C

[numQ1C, demQ1C] = ss2tf(Ac, Bc, Cc, Dc)

%   Função de Transferência
tfQ1C = tf(numQ1C, demQ1C)



%%  Q1D

%   Vetor de Tempo Reutilizado de Q1B
dt  = t(2)-t(1)    % Intervalo     de Tempo

u  = 0;         % Pulso Gaussiano       (RA par)
a  = 0.1;       % Constantes da Função
b  = 0.002;
tau= 0.005;
aU = 0; 

t

for i=1:length(t)
    u(i) = a * exp(-( (t(i) - tau)/b )^2);
    
    aU   = aU + u(i) * dt;
end

sc = ss(Ac, Bc, Cc, Dc);
hG = lsim(sc, u, t)/aU;


figure; plot(t, hI, t, hG, 'o')
title('Q1D'); xlabel('t [s]'); ylabel('y(t)');
legend("impulse", "lsim(Gauss)", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2Q1D'), 'png');


%%  Q1E

eigValues    = eig(Ac);                     % Obtenção dos Autovalores
vanderValues = fliplr(vander(eigValues));   % Criação da Matriz de Vandermonde
expValues    = sym(zeros(length(Ac),1));    % Criação do Vetor de Exponenciais

syms t
for i=1:length(Ac)
    expValues(i) = exp(eigValues(i)*(t));   
end
alphaValues = vanderValues\expValues;

eA = 0;
for i=1:length(Ac)
    eA = eA + alphaValues(i)*Ac^(i-1);
end
eA


%%  Q2A
a   = nRA/10;

Ad  = [ 0 1 0;
        0 0 1
       -a 0 0]
Bd  = [0;
       0;
       1]
Cd  = [1 0 0]
Dd  = 0



%%  Q2B
k0  = 0;
k   = 0:20;

yA  = 0;
Ak  = AkFree_poly(Ad)
for n=1:length(k)

    if     (k(n)) == k0
        yA(n) = real(Dd);

    elseif (k(n))  > k0
        yA(n) = real(Cd * subs(Ak,k(n)-1) * Bd);

    end
end


sd = ss(Ad, Bd, Cd, Dd, 1);
yI = impulse(sd, k);


figure;
stairs(k,yI)

hold on
stairs(k,yA,'o');  % Adding the Analytic Solution
hold off

title('Q2B'); xlabel('k [s]'); ylabel('y(k)')
legend("impulse", "Analitica", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2Q2B'), 'png');



%% Q2C
%   Recursive Solution
a   = nRA/10;           % Constant
n       = 20;           % Interval Size
kr      = 0:n-1;        % Desired Interval

yr      = 0;
yr(1)   = nRA;
yr(2)   = 0;
yr(3)   = 0;            % Initial Conditions

sysOrder= 3;            % System Order

for j=0:n-1-sysOrder

    k = j+1;

    yr(k+3) = -a * yr(k);
end

%   lsim Solution
XL = [nRA; 0; 0];
kl = kr;

ul = zeros(size(kl));
sd = ss(Ad, Bd, Cd, Dd, 1);
yl = lsim(sd, ul, kl, XL);


%   Function Solution
XF = [nRA; 0; 0];
kf = kr;

[x, y]  = ssDFree(XF, Ad, Cd, 'poly');
yf      = subs(y,kf);


figure;
stairs(kr,yr)

hold on
stairs(kl,yl,'o');  % Adding the lsim Solution
hold off

hold on
stairs(kf,yf,'s');  % Adding the Function Solution
hold off
title('Q2C'); xlabel('k [s]'); ylabel('y(k)')
legend("Recursiva", "lsim", "ssDFree", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2Q2C'), 'png');
