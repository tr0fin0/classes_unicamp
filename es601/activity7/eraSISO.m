function [Aera,Bera,Cera,Dera]=eraSISO(Y)
    %------------------------------------------------------------
    %   Eigensystem Realization Algorithm, Juang e Pappa
    %       Single Input Single Output
    %
    %
    %   Input:
    %       Y: Impulse Response of Discrete Uhknow System
    %
    %   Output:
    %       A, B, C, D: Discrete Model Realization 
    %------------------------------------------------------------

    
    %   Input Validation
    [ndof, nt]  = size(Y);
    
    fprintf('eraSISO_______________________________________________________\n');
    fprintf('  Input Information\n');
    fprintf('    Time samples   nt = %2.0f\n', nt);
    fprintf('    DOFs medidos ndof = %2.0f\n\n', ndof);
    
    fprintf('  Desired Hankel Matrix Dimensions\n');
    s=input('    Hankel Matrix Columns: ');
    r=input('    Hankel Matrix Rows:    ');
    
    if ndof ~= 1
        error('eraSISO: system is not SISO (Single Input Single Output)');
    end
    
    if ~(s+r+2 < nt)
        error('eraSISO: Hankel matrix dimensions not valide (s+r+2 < nt)');
    end
    

    %   Add Values to Hankel Matrixes from H(0:nt-1)
    H   = hankel(Y(2:(r+s+2)));     % Hankel Matriz

    H1  = H(1:r,1:s);               % Hankel Ordem 1
    H2  = H(1:r,2:s+1);             % Hankel Ordem 2

    
    %   Singular Values Decomposition of H1
    [U, S, V] = svd(H1);
    
    
    %   Visualize Singular Values (SVs):
    %       Choose the number of no null SVs based on the graphy
    figure; plot(diag(S))
    title('Singular Values of Hankel')
    ylabel('Singular Values'); xlabel('Number of Values')
    
    fprintf('\n  Look in the Singular Values of Hankel figure\n');
    nsvd= input('    Number of Singular Values: ');
    
    
    %   Reduced the U, S and V Matrix:
    %       After choosen the number of SVs the orignal matrixes need to be
    %       reconsidered within the system order.
    St  = S(1:nsvd, 1:nsvd);    % S tilde
    Ut  = U( :,     1:nsvd);    % U tilde
    Vt  = V( :,     1:nsvd);    % V tilde
    
    
    %   Compute system Matrixes: Aera, Bera, Cera, Dera:
    sSt = sqrt(St);
    isSt= inv(sSt);
    
    Ob  = Ut  * sSt;    % Observability  Matrix
    Co  = sSt * Vt';    % Controlability Matrix

    Aera= (sSt\Ut') * H2 * (Vt/sSt);    % (isSt*Ut') * H2 * (Vt*isSt)
    Bera= Co( :,     1);                % (nsvd x 1) one input
    Cera= Ob(1:ndof, :);                % (ndof x nsvd)
    Dera= Y(1);
end