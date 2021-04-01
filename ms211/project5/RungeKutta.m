function [X,Y] = RungeKutta(f,h,XRANGE,YINIT)

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
  k2 = f(X(k)+h/2,Y(k)+k1*h/2);
  k3 = f(X(k)+h/2,Y(k)+k2*h/2);
  k4 = f(X(k)+h  ,Y(k)+k3*h);
  Y(k+1) = Y(k)+h*(k1+2*k2+2*k3+k4)/6;
  k=k+1;
end
endfunction