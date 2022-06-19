function [x,y] = ssFree_laplace(t0, X0, A, C)
    %% ssFree_laplace:
    %  State System Free response with Laplace Method
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(y) = C*x(t) [2]
    
    % Where:
    %   X0: Initial values of x;
    %   t0: Initial value  of t;

    I   = eye(length(A));
    
    syms s t
    eA  = ilaplace( inv( s*I - A ), (t-t0));

    x   = eA * X0;
    y   =  C * x;
end