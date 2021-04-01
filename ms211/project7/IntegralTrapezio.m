%====================================================================================
function [I, E] = IntegralTrapezio(ddf, f, a, b, n)
  %==================================================================================
    %Recebe
      %Funcao: f
      %Intervalo de Integracao:
        %Inicio: a
        %Final:  b
      %Qtde. de Intervalos: n
      %Majorante da Segunda Derivada de f: ddf
    %Retorna
      %Aproximacao da Integral: I
      %Erro da Aproximacao: E
  %==================================================================================  
  h = (b-a)/n; %Largura do Intervalo

  X = linspace(a, b, n+1); %Divisao do Espaco na Qtde. de Intervalos
  Y = f(X, m, u, s);                %Vetor de Respostas
  
  I = (h/2)*(f(X(1),m,u,s) + 2*sum(f(X(2:n),m,u,s)) + f(X(n+1),m,u,s));
  E = (b-a)*h^2/12*ddf;
endfunction