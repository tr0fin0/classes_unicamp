function [x,a] = NewtonRapshon(a,f,df,e1,maxiter)
  x = a; iter = 0;
  while ( (abs(f(x))>=e1) && (iter < maxiter) )
    x = (x - (f(x)/df(x)));
    iter++;
  
endwhile

  printf("\n")
  display(sprintf('Newton-Rapshon-> x: %2.8f - f(x): %2.8f - Numero de Interacoes: %2.8f', x, f(x), iter));
endfunction