x0 = [0 0.5]';

f = @(x, y) (x + 0.5*(exp(y) + exp(-y)) - 1);
dfx = 1;
dfy = @(y) 0.5*(exp(y)-exp(-y));

g = @(x, y) (x + 0.5*(exp(y+1) + exp(-y-1)) - 2);
dgx = 1;
dgy = @(y) 0.5*(exp(y+1)-exp(-y-1));

e = 10^(-3); itmax = 10^(3); it = 0;

A = [dfx dfy(x0(2)); dgx dgy(x0(2))];
b = [f(x0(1), x0(2)) g(x0(1), x0(2))]';
r = A\-b;
x0 = r.+x0;
it = it + 1;

while( (norm(b, inf) >= e) || ((norm(b, inf) >= e) && (it < itmax) ))
  A = [dfx dfy(x0(2)); dgx dgy(x0(2))];
  b = [f(x0(1), x0(2)) g(x0(1), x0(2))]';
  r = A\-b;
  x0 = r.+x0;
  it = it + 1;
endwhile


x0