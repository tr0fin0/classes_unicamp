function ex7(omega, M, C, K)

    syms w;
    rcp = (M*(-w^2) + C*(1i*w) + K)^(-1)


    titleName = 'Receptância';
    yName     = '\alpha';


    for i = 1 : 1 : length(M)
        figure;
        w = omega;
        undef = eval(rcp(i,1));

        plotAbs(w, undef, '')

        sysLeg = [append(yName, '_{', num2str(i), '1}(\omega)')];

        savePlot(...
            [append('Magnitude ', titleName)],...
            sysLeg,...
            append('alpha', num2str(i), '1', '_rcpAbs_cpl'),...
            '\omega [rad/s]', append(yName, '(\omega) [dB]'));
    end


end