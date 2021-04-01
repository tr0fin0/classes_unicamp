N = 100;
tic(); 
for i = 1:1000
  A = randn(N); xs = ones(N,1);
  b = A*xs; xt = A\b;
  E_r(i) = norm(xs-xt,inf);
  R_r(i) = norm(b-A*xt,inf)/norm(b,inf);
endfor
[mean(E_r),mean(R_r)];
toc();
ans