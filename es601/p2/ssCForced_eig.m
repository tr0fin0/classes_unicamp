function [x,y] = ssCForced_eig(t0, A, B, C, D, u)
    %% ssCForced_eig:
    %  Continues State System Forced response with Eigenvalues and Vectors
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(y) = C*x(t) + D*u(t) [2]
    
    % Where:
    %   t0: Initial value  of t;

    [eigVectors, eigValues]= eig(A);
    
    % Checking divergence
    for i=1:length(eigValues)
        if real(eigValues(i,i)) > 0
            warning('ssFree_eig: eigenvalues with positive real part');
        end
    end
    
    syms t tau
    eA  = eigVectors * diag(exp(diag(eigValues*(t-tau)))) / eigVectors*B*u;

    x   = int(  eA, tau, [t0 t]);
    y   = int(C*eA, tau, [t0 t]) + D*u;
end