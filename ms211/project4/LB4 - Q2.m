f = @(x) 8*(sqrt(400 - x^2)+sqrt(900 - x^2)) - sqrt((400 - x^2)*(900 - x^2));
fplot(f, [-20 20]);

a = 15; b = 20;
erro = 10^(-8); maxiter = 10^(8);
[x,a,b] = Bissecao(a,b,f,erro,erro,maxiter)

a = 15; b = 20;
erro = 10^(-8); maxiter = 10^(8);
[x,a,b] = Secante(a,b,f,erro,erro,maxiter)

df = @(x) (4*((2*x*(400 - x^2))/(900 - x^2)^2 - (2*x)/(900 - x^2)))/sqrt((400 - x^2)/(900 - x^2)) - x/sqrt(400 - x^2);
df = @(x) ((8*(sqrt(400 - x^2) + 1)*x)/(900 - x^2)^(3/2) - x/sqrt(400 - x^2) + (8*x)/(sqrt(400 - x^2)*sqrt(900 - x^2)));
a = 15;
erro = 10^(-8); maxiter = 10^(8);
[x,a] = NewtonRapshon(a,f,df,erro,maxiter)