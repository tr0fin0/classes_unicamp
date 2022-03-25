function h = ssDImpulse(k0, k, A, B, C, D, method)
    %% ssDImpulse:
    %  Discrete State System Impulse response
    
    % Function computes the symbolic forced solution with respect of k of
    % the following state system:
    %   |  x(k+1) = A*x(k) + B*u(k) [1]
    %   |  y(k)   = C*x(k) + D*u(k) [2]
    
    % Where:
    %   k0:     Initial value  of k;
    %   method: Method to Solve A^k;

    Ak  = 0;
    
    if     strcmpi(method, 'ztrans')
        Ak = AkFree_ztrans(A);

    elseif strcmpi(method, 'eig')
        Ak = AkFree_eig(A);

    elseif strcmpi(method, 'poly')
        Ak = AkFree_poly(A);

    else
        syms kk
        Ak = A^kk;

    end 
    
   
    h = 0;
    for n=1:length(k)

        if     (k(n)) == k0
            h(n) = real(D);

        elseif (k(n))  > k0
            h(n) = real(C * subs(Ak,k(n)-1) * B);

        end
    end

end