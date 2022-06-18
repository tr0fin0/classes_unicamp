function ex15(m, c, k)

    A = [0 1; -k/m -c/m];       B = [0; 1/m];
    C = [1 0; 0 1; -k/m -c/m];  D = [0; 0; 1/m];
 
    sys = ss(...
        A, B, C, D,... 
        'StateName', {'x' ; 'dx'},... 
        'InputName', {'f(\omega)'},...
        'OutputName', {'x' ; 'dx'; 'ddx'})
        % 'OutputName', {'\alpha(\omega)' ; 'y(\omega)'; 'A(\omega)'})

    figure; bode(sys)
    savePlot('State System', sysDescription(m, c, k), append(sysCode(m, c, k), '_ss'), '', '');
end