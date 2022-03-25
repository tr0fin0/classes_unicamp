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
tf([10 1], [1 5 500 0])



%%  Q1B
Ac = [0 1     0;
      0 0     1;
      0 -500 -5]

Bc = [0;
      0;
      1]

Cc = [1 10 0]

Dc = 0

Ao = Ac'
Bo = Cc'
Co = Bc'
Do = Dc



%% Q1C
t  = 0;
t0 = 0;
dt = 0.002;
N  = 1024;

for i=1:N
    t(i) = (i-1)*dt;
end


hc = 0;
for n=1:length(t)
    if     (t(n)) == t0
        hc(n) = real(Cc * expm(Ac*(t(n)-t0)) * Bc + Dc);

    elseif (t(n))  > t0
        hc(n) = real(Cc * expm(Ac*(t(n)-t0)) * Bc);

    end
end


sc = ss(Ac, Bc, Cc, Dc);
hi = impulse(sc,t);


figure; plot(t, hi, t, hc, 'o')
title('Q1C'); xlabel('t [s]'); ylabel('y(t)');
legend("impulse", "ssCImpulse", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2simulado2Q1C'), 'png');



%% Q1D
t  = 0;
dt = 0.002;
N  = 1024;

u  = 0;
b  = 0.001;
tau= 0.01;
aU = 0;

for i=1:N
    t(i) = (i-1)*dt;
    
    u(i) = exp(-( (t(i) - tau)/b )^2);
    
    aU   = aU + u(i)*dt;
end

sg = ss(Ac, Bc, Cc, Dc);
hg = lsim(sg, u, t)/aU;

figure; plot(t, hi, t, hg, 'o')
title('Q1D'); xlabel('t [s]'); ylabel('y(t)');
legend("impulse", "gausiane", "location", "southeast")
set(gcf, 'PaperPosition', fsize);
saveas(gca, fullfile(fpath, 'p2simulado2Q1D'), 'png');



%% Q1H
Ad = [ 0    1;
      -0.2 -0.4]
Bd = [0;
      1]
Cd = [1 0]
Dd = 0

Ak = AkFree_poly(Ad)


