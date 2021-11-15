function [x,y] = ssFree_poly(t0, X0, A, C)
    %% ssFree_poly:
    %  State System Free response with Polynomial Method
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(y) = C*x(t) [2]
    
    % Where:
    %   X0: Initial values of x;
    %   t0: Initial value  of t;

    eigValues    = eig(A);
    vanderValues = fliplr(vander(eigValues));
    expValues    = sym(zeros(length(A),1));

    syms t
    for i=1:length(A)
        expValues(i) = exp(eigValues(i)*(t-t0));
    end
    alphaValues = vanderValues\expValues;

    eA = 0;
    for i=1:length(A)
        eA = eA + alphaValues(i)*A^(i-1);
    end
    
    x   = eA * X0;
    y   = C  * x;
end