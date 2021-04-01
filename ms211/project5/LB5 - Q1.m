f = @(t, y) (1 + 0.5*cos(2*pi*t))*(1 - y/(1 + 0.5*sin(3*pi*t/2)));

[X1,Y1] = RungeKutta(f, 0.125, [0 10], 0);
[X2,Y2] = Heun(f, 0.03125, [0 10], 0);

plot(X1,Y1,'linewidth',2,
     X2,Y2,'linewidth',2);
grid;
legend("RungeKutta","Heun")
axis([0 10 0 1])

format long
Y1(81)
Y2(81)