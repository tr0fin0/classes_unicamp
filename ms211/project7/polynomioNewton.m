function [z] = polynomioNewton(t,x,a)
  n = length(t);
  m = length(x);
  T = repmat( reshape(t,n,1), [1 (m-1)]);
  X = repmat( reshape(x(1:m-1),1,m-1), [n 1]);
  W = (T-X);
  Z = a(m)*ones(n,1);
  
  for i=m:-1:2
    Z = a(i-1) + W(:,i-1).*Z;
  end
  z = reshape(Z,1,n);
endfunction