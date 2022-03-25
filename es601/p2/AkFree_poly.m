function Ak = AkFree_poly(A)
    %% AkFree_poly:
    %  Exponential Matrix with Polynomial Method
    
    % Function computes the symbolic forced solution with respect of t of
    % the following state system:
    %   |  x(k+1) = A*x(k) [1]
    %   |  y(k)   = C*x(k) [2]

    % Where:
    %   t0: Initial value  of t;

    eigValues    = eig(A);

    vanderValues = fliplr(vander(eigValues));
    expValues    = sym(zeros(length(A),1));

    syms k
    for i=1:length(A)
        expValues(i) = eigValues(i)^(k);
    end
    alphaValues = vanderValues\expValues;

    Ak = 0;
    for i=1:length(A)
        Ak = Ak + alphaValues(i)*A^(i-1);
    end

end