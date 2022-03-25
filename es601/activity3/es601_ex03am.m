%%============================================================================
%%                    Main Code
%%============================================================================


%%    Question A
au0 = 1;        %% Step Function

ay0 = 10;        %% Initial Conditions

ta = linspace(0,10,10000);
ya = au0 + (ay0 - 1).*exp(-10.*ta);


%%    Graphy Plot


plot(ta, ya, out.tout, out.xout1, '.')


LW = 2;     %Line Width
FS = 16;    %Font Size
  
xlabel("t [s]", "fontsize",FS); %Legend X
ylabel("y [t]", "fontsize",FS); %Legend Y

axis ([0  1 0 10]); grid; set(gca , "fontsize", FS); %Format

legend("analitica", "simulink", "location", "northeast") %Legend Data