function [X,Y] = Heun(f,h,XRANGE,YINIT)

% f é a função.
% h é o tamanho do passo
% XRANGE = [x0 xFinal]
% YINIT é o valor y(x0)

X(1) = XRANGE(1);
Y(1)= YINIT;
k = 1; % Número de interações

while X(k)<XRANGE(2)
  X(k+1) = X(k)+h;
  k1 = f(X(k),Y(k));
  k2 = f(X(k+1),Y(k)+h*k1);
  Y(k+1) = Y(k)+h*(k1+k2)/2;
  k=k+1;
end
endfunction