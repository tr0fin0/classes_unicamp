function eA = eAFree_poly(t0, A)
    %% eAFree_poly:
    %  Exponential Matrix with Polynomial Method
    
    % Function computes the symbolic free solution with respect of t of the
    % following state system:
    %   | dx(t) = A*x(t) [1]
    %   |  y(t) = C*x(t) [2]
    
    % Where:
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

end