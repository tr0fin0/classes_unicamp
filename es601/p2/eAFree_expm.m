function eA = eAFree_expm(t0, A)
    %% eAFree_expm:
    %  Exponential Matrix with expm Method
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(t) = C*x(t) [2]
    
    % Where:
    %   t0: Initial value  of t;

    syms t
    eA  = expm(A*(t-t0));

end