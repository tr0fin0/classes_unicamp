%====================================================================================
function [T] = CoeficientesNewton (X, Y)
    %================================================================================
    %Recebe Vetores: X e Y
    %Retorna um Vetor C com os Coeficientes de Newton do Conjunto
    %================================================================================
  nPontos = length(X);         %Qtde de Dados
  T = zeros(nPontos, nPontos); %Matriz das Diferencas Dividas
  T(:,1) = Y;                  %Inicializa a Primeira Coluna
  
  for(j = 2:nPontos)
    for(i = 1:(nPontos-j+1))
      
      T(i,j) = (T(i+1,j-1) - T(i,j-1))/(X(j+i-1) - X(i)); %Calculo das Entradas
      
    endfor
  endfor  
endfunction