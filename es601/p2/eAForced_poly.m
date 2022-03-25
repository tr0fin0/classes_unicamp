function eA = eAForced_poly(A)
    %% eAForced_poly:
    %  Exponential Matrix with Polynomial Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   | dx(t) = A*x(t) + B*u(t) [1]
    %   |  y(t) = C*x(t) + D*u(t) [2]

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

end