%%============================================================================
%%                    Configuration
%%============================================================================

clc
clear
close all

%%============================================================================
%%                    Main Code
%%============================================================================

Vin = 10;           %% Inicial Coltage  
R   = 1*10^(3);     %% Resistence
C   = 2000*10^(-6); %% Capacitance

t0 = linspace(0,11,10000);
y0 = Vin*(1 - exp(-(1/(R*C)).*t0))


LW = 2;     %Line Width
FS = 16;    %Font Size

plot(t0, y0, '--')
  
xlabel("t [s]",     "fontsize",FS); %Legend X
ylabel("V_{C} [V]", "fontsize",FS); %Legend Y

axis ([0  11 0 11]); grid; set(gca , "fontsize", FS); %Format

legend("V_{C}", "location", "southeast") %Legend Data