function [x,a,b] = Bissecao(a,b,f,e1,e2,maxiter)
  aux = a;
  x = b;
  iter = 0;
  while ( ((abs(f(x))>=e1) || (abs(aux - x)>=e2)) && (iter < maxiter))
    aux = x;
    x = 0.5*(a+b);
    
    if (f(a)*f(x) < 0)
      b = x;
    else
      a = x;
    endif
    iter++;
  
endwhile
  printf("\n")
  display(sprintf('Bisseccao-> x: %2.8f - f(x): %2.8f - Erro em x: %2.8f - Numero de Interacoes: %2.8f', x, f(x), abs(aux-x), iter));
endfunction
