function eA = eAFree_laplace(t0, A)
    %% eAFree_laplace:
    %  Exponential Matrix with Laplace Method
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(t) = C*x(t) [2]
    
    % Where:
    %   t0: Initial value  of t;

    I   = eye(length(A));
    
    syms s t
    eA  = ilaplace( inv( s*I - A ), (t-t0));

end