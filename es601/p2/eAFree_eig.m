function eA = eAFree_eig(t0, A)
    %% eAFree_eig:
    %  Exponential Matrix with Eigenvalues and Vectors Method
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(t) = C*x(t) [2]
    
    % Where:
    %   t0: Initial value  of t;

    [eigVectors, eigValues]= eig(A);
    
    % Checking divergence
    for i=1:length(eigValues)
        if real(eigValues(i,i)) > 0
            warning('ssFree_eig: eigenvalues with positive real part');
        end
    end

    syms t
    eA  = eigVectors * diag(exp(diag(eigValues*(t-t0)))) / eigVectors;

end