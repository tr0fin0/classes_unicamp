%%============================================================================
%%                    Main Code
%%============================================================================
% clear all
% close all

%%  Question 2
%%============================================================================

N = 10000;
T = 10;

t0 = linspace(0,T,N);
y1 = linspace(0,T,N);
y2 = linspace(0,T,N);

for i=1:N
    y1(i) = 1/4*t0(i)^2 + 1/400 - 1/400*cos(10*sqrt(2)*t0(i));
    y2(i) = 1/4*t0(i)^2 - 1/400 + 1/400*cos(10*sqrt(2)*t0(i));
end


%%    Graph Plot
%%============================================================================

plot(t0, y1, out.tout, out.yout , '.')

LW = 2; FS = 16;    %Line Width Font Size
  
xlabel("t [s]", "fontsize",FS); %Legend X
ylabel("y [t]", "fontsize",FS); %Legend Y

% axis ([0  10 0 10]); grid; set(gca , "fontsize", FS); %Format

legend("analitica", "simulink", "location", "southeast") %Legend Data
