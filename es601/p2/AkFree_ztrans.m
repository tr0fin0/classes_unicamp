function Ak = AkFree_ztrans(A)
    %% AkFree_laplace:
    %  Exponential Matrix with Z Transform Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   |  x(k+1) = A*x(k) [1]
    %   |  y(k)   = C*x(k) [2]

    I   = eye(length(A));
    
    syms z
    Ak  = iztrans(inv(z*I - A)*z);

end