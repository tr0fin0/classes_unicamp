%%==============================================================================
%%                    Octave Configuration
%%==============================================================================

clc
clear
close all

%%==============================================================================
%%                    Octave Code
%%==============================================================================

t0 = linspace(0,5,1000);
y0 = t0.^2;
y1 = t0.^3;
y2 = t0.^4;

LW = 2;     %Line Width
FS = 20;    %Font Size
plot(
    t0, y0, 'linewidth', LW, 'b',
    t0, y1, 'linewidth', LW, 'g',
    t0, y2, 'linewidth', LW, 'r')
  
xlabel("X", "fontsize",FS); %Legend X
ylabel("Y", "fontsize",FS); %Legend Y
axis ([0  5 0 25]); grid; set(gca , "fontsize", FS); %Format

legend("Quadrado", "Cubo", "Quarta", "location", "southeast") %Legend Data