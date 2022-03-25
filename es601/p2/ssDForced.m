function [x,y] = ssDForced(k0, A, B, C, D, u, method)
    %% ssDForced:
    %  Discrete State System Forced response
    
    % Function computes the symbolic forced solution with respect of k of
    % the following state system:
    %   |  x(k+1) = A*x(k) + B*u(k) [1]
    %   |  y(k)   = C*x(k) + D*u(k) [2]
    
    % Where:
    %   k0:     Initial value  of k;
    %   method: Method to Solve A^k;

   
    Aks = 0;
    Ak  = 0;
    syms n kf
    
    if     strcmpi(method, 'ztrans')
        Ak = AkFree_ztrans(A);

    elseif strcmpi(method, 'eig')
        Ak = AkFree_eig(A);

    elseif strcmpi(method, 'poly')
        Ak = AkFree_poly(A);

    else
        Ak = A^n;

    end

    %   Solução Simbólica
    Aks = symsum(Ak,n,k0,kf-1); %% ISSUE somatório deve considerar a integral de u(tau)
    
    %   Solução Analítica
%     for l=k0:kf
%         Aks = Aks + Ak^(kf-l-1);
% 
%     end


    x   = Aks * B*u;
    y   = C   * x + D*u;

    x   = vpa(x, 5);
    y   = vpa(y, 5);
end