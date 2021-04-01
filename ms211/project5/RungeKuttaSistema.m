function [X,Y,t] = RungeKuttaSistema(f,h,XRANGE,YINIT,N,DIST)

% f é a função.
% h é o tamanho do passo
% XRANGE = [x0 xFinal]
% YINIT é o valor y(x0)


X(1) = XRANGE(1);
Y(:,1) = YINIT;
t = 0;
k = 1; % Número de interações
FLAG = true;

while ( (X(k)<XRANGE(2)) && FLAG)
  X(k+1) = X(k)+h;
  k1 = f(X(k),Y(:,k));
  k2 = f(X(k)+h/2,Y(:,k)+k1*h/2);
  k3 = f(X(k)+h/2,Y(:,k)+k2*h/2);
  k4 = f(X(k)+h  ,Y(:,k)+k3*h);
  Y(:,k+1) = Y(:,k)+h/6*(k1+2*k2+2*k3+k4);
  
  if((Y(N,k+1) >= DIST) && FLAG) %interrompe o código quando o último carro chega 
    FLAG = false;
  endif
  
  k=k+1;
end
t = (k+1);
endfunction