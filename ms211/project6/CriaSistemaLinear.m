%====================================================================================
function [X, C] = CriaSistemaLinear(A, V, U, f, H, dx)
  %==================================================================================
    %Recebe Funcoes: A, V, U e f
    %Recebe Constantes: H e h
    %Retorna um Vetor X das Alturas e um Vetor C da Qntd. de Poluentes
  %==================================================================================  
  n = H/dx;              %Qtde Intervalos
  M = zeros(n, n);       %Inicializa a Matriz Base
  N = f*ones(n, 1)*dx^2; %Inicializa o Vetor Base

  X = linspace(dx, H, n); %Inicializa o Vetor de Intervalos

  for(i = 1: n)
    if(i != 1)
      M(i, i-1) = -A(X(i), H) -V(X(i), H)*dx/2; %Diagonal Inferior
    endif

    M(i, i) = 2*A(X(i), H) + U*dx^2; %Diagonal Principal
    
    if(i != n)
      M(i, i+1) = -A(X(i), H) +V(X(i), H)*dx/2; %Diagonal Superior
    endif 
  endfor
  
  M(n, n-1) = -2*A(X(n), H); %Modifica a Entrada (n, n-1)
  C = M\N;              %Soluciona o Sistema Linear
endfunction