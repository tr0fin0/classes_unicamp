%====================================================================================
function e = ErroInterpolacao(A, X, T)
    %================================================================================
    %Recebe Vetores: X e Y
    %Retorna um Vetor C com os Coeficientes de Newton do Conjunto
    %================================================================================
  e = 1; %Inicializa o Erro
    
  for(i = 1:length(X)) 
    e = abs(e*(A - X(i))); %Realiza o Produtorio
  endfor
  
  maxF = 0; %Inicializa o Maximo
  for(i = 1:(size(T)(1)))
    if(abs(T(i,(size(T)(2)))) > maxF)
      maxF = abs(T(i,(size(T)(2)))); %Modifica o Maximo
    endif
  endfor
  
  e = e*maxF; %Retorna o Erro da Interpolacao
endfunction