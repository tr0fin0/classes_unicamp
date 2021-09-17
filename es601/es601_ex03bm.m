%%============================================================================
%%                    Main Code
%%============================================================================


%%    Question B
bu0 = 1;        %% Step Function

ba = 1/10000;   %% Constants
bb = 30*sqrt(11);

by0  = 0;       %% Initial Conditions
bdy0 = 1;

tb = linspace(0,10,10000);
yb = ba*bu0 + (by0 - ba).*exp(-10.*tb).*cos(bb.*tb) + (10.*by0 + bdy0 - 10.*ba)./bb.*exp(-10.*tb).*sin(bb.*tb);


%%    Graphy Plot


plot(tb, yb, out.tout, out.xout1, '.')


LW = 2;     %Line Width
FS = 16;    %Font Size
  
xlabel("t [s]", "fontsize",FS); %Legend X
ylabel("y [t]", "fontsize",FS); %Legend Y

axis ([0  1 0 0.0002]); grid; set(gca , "fontsize", FS); %Format

legend("analitica", "simulink", "location", "southeast") %Legend Data