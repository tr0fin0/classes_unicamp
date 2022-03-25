function eA = eAForced_laplace(A)
    %% eAForced_laplace:
    %  Exponential Matrix with Laplace Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(t) = C*x(t) + D*u(t) [2]

    I   = eye(length(A));
    
    syms s t tau
    eA  = ilaplace(inv(s*I - A), (t-tau));

end