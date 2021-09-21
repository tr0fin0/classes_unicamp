%%============================================================================
%%                    Main Code
%%============================================================================


%%    Question B
%%============================================================================

N = 10000;
T = 10;

t0 = linspace(0,T,N);
yt = linspace(0,T,N);

for i=1:N
    if t0(i) <  3
        yt(i) = 10 - 10*exp(-1*t0(i));
    else
        yt(i) = 10*(1 - exp(-1*t0(i))) - 10*(1 - exp(-1*(t0(i)-3)));
    end
end


%%    Graphy Plot
%%============================================================================

plot(t0, yt, out.tout, out.yout , '.')
% plot(t0, yt)

LW = 2;     %Line Width
FS = 16;    %Font Size
  
xlabel("t [s]", "fontsize",FS); %Legend X
ylabel("y [t]", "fontsize",FS); %Legend Y

axis ([0  10 0 10]); grid; set(gca , "fontsize", FS); %Format


% legend("analitica", "location", "southeast") %Legend Data
legend("analitica", "simulink", "location", "southeast") %Legend Data