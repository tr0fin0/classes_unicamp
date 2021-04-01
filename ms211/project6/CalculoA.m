function y = CalculoA(A, x, coeficientes)
  y = coeficientes(1);
  
  for(i = 2:length(coeficientes)) 
    produto = coeficientes(i);
    
    for(j = 1:i-1)
      produto = produto*(A - x(j));
    endfor
    
    y = y + produto;
  endfor
endfunction