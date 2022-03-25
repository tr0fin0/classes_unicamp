function [x,y] = ssCForced_laplace(t0, A, B, C, D, u)
    %% ssCForced_laplace:
    %  Continues State System Forced response with Laplace Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(y) = C*x(t) + D*u(t) [2]
    
    % Where:
    %   t0: Initial value  of t;

    I   = eye(length(A));
    
    syms s t tau
    eA  = ilaplace(inv(s*I - A), (t-tau)) * B*u;

    x   = int(  eA, tau, [t0 t]);
    y   = int(C*eA, tau, [t0 t]) + D*u;
end