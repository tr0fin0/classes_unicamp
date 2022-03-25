function h = ssCImpulse(t0, t, A, B, C, D, method)
    %% ssCImpulse:
    %  Continues State System Impulse response
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(t) = C*x(t) + D*u(t) [2]
    
    % Where:
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
    
   
    h = 0;
    for n=1:length(t)
        eAt = subs(eA,t(n));

        if     (t(n)) == t0
            h(n) = real(C * eAt * B + D);

        elseif (t(n))  > t0
            h(n) = real(C * eAt * B);

        end
    end

end