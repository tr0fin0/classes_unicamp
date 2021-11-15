function [x,y] = ssForced_poly(t0, A, B, C, D, u)
    %% ssForced_poly:
    %  State System Forced response with Polynomial Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(y) = C*x(t) + D*u(t) [2]
    
    % Where:
    %   t0: Initial value  of t;
    
    eigValues    = eig(A);
    vanderValues = fliplr(vander(eigValues));
    expValues    = sym(zeros(length(A),1));

    syms t tau
    for i=1:length(A)
        expValues(i) = exp(eigValues(i)*(t-tau));
    end
    alphaValues = vanderValues\expValues;

    eA = 0;
    for i=1:length(A)
        eA = eA + alphaValues(i)*A^(i-1);
    end
    eA = eA * B*u;
    
    x   =   int(eA, tau, [t0 t]);
    y   = C*int(eA, tau, [t0 t]) + D*u;
end