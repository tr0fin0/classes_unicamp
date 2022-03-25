function Ak = AkFree_eig(A)
    %% AkFree_eig:
    %  Exponential Matrix with Eigenvalues and Vectors Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   |  x(k+1) = A*x(k) [1]
    %   |  y(k)   = C*x(k) [2]

    % Where:
    %   t0: Initial value  of t;

    [eigVectors, eigValues]= eig(A);
    
    syms k
    Ak  = eigVectors * eigValues^(k) / eigVectors;

end