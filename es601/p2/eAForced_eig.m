function eA = eAForced_eig(A)
    %% eAForced_eig:
    %  Exponential Matrix with Eigenvalues and Vectors Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(t) = C*x(t) + D*u(t) [2]

    [eigVectors, eigValues]= eig(A);
    
    % Checking divergence
    for i=1:length(eigValues)
        if real(eigValues(i,i)) > 0
            error('ssFree_eig: eigenvalues with positive real part');
        end
    end
    
    syms t tau
    eA  = eigVectors * diag(exp(diag(eigValues*(t-tau)))) / eigVectors;

end