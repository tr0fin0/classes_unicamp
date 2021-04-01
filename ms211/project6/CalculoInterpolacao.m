%====================================================================================
function y = CalculoInterpolacao(A, X, T)
    %================================================================================
    %Recebe o Valor A, o Vetor X e a Matrix T
    %Retorna um Valor y da Interpolacao
    %================================================================================
  C = T(1,:); %Obtem os Coeficientes de Interpolacao
  y = C(1);   %Valor Base da Interpolacao
  
  for(i = 2:length(C)) 
    produto = C(i); %Inicializa o Produto
    
    for(j = 1:i-1)
      produto = produto*(A - X(j)); %Realiza o Produtorio
    endfor
    
    y = y + produto; %Realiza o Somatorio
  endfor
endfunction