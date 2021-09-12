%%============================================================================
%%                    Main Code
%%============================================================================

m = 1;      %% Mass
k = 1000;   %% Elastic Constant
c = 1;      %% Damping Constant


A = c/m;
B = k/m;
C = B - 1/4;
D = sqrt(C);


t0 = linspace(0,10,10000);
x0 = 1/B - 1/B.*(exp(-t0./2).*cos(D.*t0)) - 1/(B*D).*exp(-t0./2).*sin(D.*t0);


plot(t0, x0, out.tout, out.xout,'.')


LW = 2;     %Line Width
FS = 16;    %Font Size
  
xlabel("t [s]", "fontsize",FS); %Legend X
ylabel("x [m]", "fontsize",FS); %Legend Y

axis ([0  10 0 0.002]); grid; set(gca , "fontsize", FS); %Format

legend("x_{0}","x_{out}", "location", "southeast") %Legend Data