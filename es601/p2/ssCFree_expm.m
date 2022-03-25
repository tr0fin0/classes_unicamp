function [x,y] = ssCFree_expm(t0, X0, A, C)
    %% ssCFree_expm:
    %  Continues State System Free response with expm() Method
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(y) = C*x(t) [2]
    
    % Where:
    %   X0: Initial values of x;
    %   t0: Initial value  of t;


    syms t
    eA  = expm(A*(t-t0));

    x   = eA * X0;
    y   =  C * x;
end