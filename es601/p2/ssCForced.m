function [x,y] = ssCForced(t0, A, B, C, D, u, method)
    %% ssCForced:
    %  Continues State System Forced response
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(t) = C*x(t) + D*u(t) [2]
    
    % Where:
    %   t0:     Initial value  of t;
    %   method: Method to Solve e^A;

   
    eA  = 0;
    syms t tau
    
    if     strcmpi(method, 'laplace')
        eA = eAForced_laplace(A);

    elseif strcmpi(method, 'eig')
        eA = eAForced_eig(A);

    elseif strcmpi(method, 'poly')
        eA = eAForced_poly(A);

    else
        eA = eAForced_expm(A);

    end 
    eA = eA * B*u; %% ISSUE integral deve considerar a integral de u(tau)

    x   =   int(eA, tau, [t0 t]);
    y   = C*int(eA, tau, [t0 t]) + D*u;
    
    x   = vpa(x, 5);
    y   = vpa(y, 5);
end