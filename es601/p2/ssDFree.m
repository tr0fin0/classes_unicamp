function [x,y] = ssDFree(X0, A, C, method)
    %% ssDFree:
    %  Discrete State System Free response
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   |  x(k+1) = A*x(k) [1]
    %   |  y(k)   = C*x(k) [2]
    
    % Where:
    %   X0:     Initial values of x;
    %   method: Method to Solve A^k;

   
    Ak  = 0;
    
    if     strcmpi(method, 'ztrans')
        Ak = AkFree_ztrans(A);

    elseif strcmpi(method, 'eig')
        Ak = AkFree_eig(A);

    elseif strcmpi(method, 'poly')
        Ak = AkFree_poly(A);

    else
        syms k
        Ak = A^k;

    end

    x   = Ak * X0;
    y   =  C * x;
    
    x   = vpa(x, 5);
    y   = vpa(y, 5);
end