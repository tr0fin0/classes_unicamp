f = @(x) 1000*exp(-log(10)*exp(-0.025*x))-500;
fplot(f, [0 100]);

a = 40; b = 60;
erro = 10^(-8); maxiter = 10^(6)
[x,a,b] = Bissecao(a,b,f,erro,erro,maxiter)