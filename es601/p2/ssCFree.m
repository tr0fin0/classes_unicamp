function [x,y] = ssCFree(t0, X0, A, C, method)
    %% ssCFree:
    %  Continues State System Free response
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(t) = C*x(t) [2]
    
    % Where:
    %   X0:     Initial values of x;
    %   t0:     Initial value  of t;
    %   method: Method to Solve e^A;

   
    eA  = 0;
    
    if     strcmpi(method, 'laplace')
        eA = eAFree_laplace(t0, A);

    elseif strcmpi(method, 'eig')
        eA = eAFree_eig(t0, A);

    elseif strcmpi(method, 'poly')
        eA = eAFree_poly(t0, A);

    else
        eA = eAFree_expm(t0, A);

    end
    
    x   = eA * X0;
    y   =  C * x;
    
    x   = vpa(x, 5);
    y   = vpa(y, 5);
end