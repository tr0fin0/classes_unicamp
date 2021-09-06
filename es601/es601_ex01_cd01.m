%%============================================================================
%%                    Configuration
%%============================================================================

clc
clear
close all

%%============================================================================
%%                    Main Code
%%============================================================================

Vin = 10            %% Inicial Coltage  
R   = 1*10^(3)      %% Resistence
C   = 2000*10^(-6)  %% Capacitance

t0 = linspace(0,10,10000);
y0 = Vin*(1 - e.^(-(1/(R*C)).*t0));


LW = 2;     %Line Width
FS = 20;    %Font Size

plot(t0, y0, 'linewidth', LW, 'b')
  
xlabel("X", "fontsize",FS); %Legend X
ylabel("Y", "fontsize",FS); %Legend Y

axis ([0 10 0 10]); grid; set(gca , "fontsize", FS); %Format

legend("VC", "location", "southeast") %Legend Data