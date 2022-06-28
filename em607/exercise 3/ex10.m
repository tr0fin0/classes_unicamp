function ex10(M, C, K)

    A = [zeros(size(M)), eye(size(M)); -M^(-1)*K, -M^(-1)*C];
    % B = [zeros(size(M)); M^(-1)];
    B = [zeros(size(M)); [M(1,1)^(-1) 0; 0 0]];
    C = [1 0 0 0; 0 1 0 0];  D = [0 0; 0 0];
 
    sys = ss(...
        A, B, C, D,... 
        'StateName', {'x1' ; 'x2' ; 'dx1' ; 'dx2'},... 
        'InputName', {'f_1(\omega)' ; 'f_2(\omega)'},...
        'OutputName', {'x1' ; 'x2'})
        % 'OutputName', {'\alpha(\omega)' ; 'y(\omega)'; 'A(\omega)'})

    figure; bode(sys)
    savePlot('State System', '', append('rcpAbs_ss'), '', '');
end