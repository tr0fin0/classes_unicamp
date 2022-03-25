function eA = eAForced_expm(A)
    %% eAForced_expm:
    %  Exponential Matrix with expm Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(t) = C*x(t) + D*u(t) [2]

    syms t tau
    A   = vpa(A);
    eA  = expm(A*(t-tau));

end