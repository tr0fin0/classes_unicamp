function frequencyResponseUncoupled(func, omega, M, C, K)


    inputName = inputname(1);

    if inputName == 'rcp'
        titleName = 'Receptância';
        yName     = '\alpha';

    elseif inputName == 'mbl'
        titleName = 'Mobilidade';
        yName     = 'y';

    elseif inputName == 'inr'
        titleName = 'Inertância';
        yName     = 'A';

    else
        error('undefined function name')
    end


    RCP = [];
    MBL = [];
    INR = [];
    figure;
    hold on
    for i = 1 : 1 : length(M)
        rcp =  1 ./ (K(i,i) - omega.^2.* M(i,i) + omega.* (1i*C(i,i)));

        RCP = [RCP; 1 ./ (K(i,i) - omega.^2.* M(i,i) + omega.* (1i*C(i,i)))];
        MBL = [MBL; 1i .* omega .* RCP(i,:)];
        INR = [INR; 1i .* omega .* MBL(i,:)];

        if inputName == 'rcp'
            plotAbs(omega, RCP(i,:), '')

        elseif inputName == 'mbl'
            plotAbs(omega, MBL(i,:), '')

        elseif inputName == 'inr'
            plotAbs(omega, INR(i,:), '')
        end
    end

    if inputName == 'rcp'
        plotAbs(omega, (-sqrt(2)/2) .* (RCP(1,:)+RCP(2,:)), '--')
        plotAbs(omega, (-sqrt(2)/2) .* (RCP(1,:)-RCP(2,:)), '--')

    elseif inputName == 'mbl'
        plotAbs(omega, (-sqrt(2)/2) .* (MBL(1,:)+MBL(2,:)), '--')
        plotAbs(omega, (-sqrt(2)/2) .* (MBL(1,:)-MBL(2,:)), '--')

    elseif inputName == 'inr'
        plotAbs(omega, (-sqrt(2)/2) .* (INR(1,:)+INR(2,:)), '--')
        plotAbs(omega, (-sqrt(2)/2) .* (INR(1,:)-INR(2,:)), '--')
    end
    hold off


    savePlot(...
        [append('Magnitude ', titleName)],...
        ['\alpha_{p1}'; '\alpha_{p2}'; '\alpha_{x1}'; '\alpha_{x2}'],...
        append('mkc_', inputName, 'Abs_unc'),...
        '\omega [rad/s]', append(yName, '(\omega) [dB]'));



    RCP = [];
    MBL = [];
    INR = [];
    figure;
    hold on
    for i = 1 : 1 : length(M)
        rcp =  1 ./ (K(i,i) - omega.^2.* M(i,i) + omega.* (1i*C(i,i)));

        RCP = [RCP; 1 ./ (K(i,i) - omega.^2.* M(i,i) + omega.* (1i*C(i,i)))];
        MBL = [MBL; 1i .* omega .* RCP(i,:)];
        INR = [INR; 1i .* omega .* MBL(i,:)];

        if inputName == 'rcp'
            plotAng(omega, RCP(i,:), '')

        elseif inputName == 'mbl'
            plotAng(omega, MBL(i,:), '')

        elseif inputName == 'inr'
            plotAng(omega, INR(i,:), '')
        end
    end

    if inputName == 'rcp'
        plotAng(omega, (-sqrt(2)/2) .* (RCP(1,:)+RCP(2,:)), '--')
        plotAng(omega, (-sqrt(2)/2) .* (RCP(1,:)-RCP(2,:)), '--')

    elseif inputName == 'mbl'
        plotAng(omega, (-sqrt(2)/2) .* (MBL(1,:)+MBL(2,:)), '--')
        plotAng(omega, (-sqrt(2)/2) .* (MBL(1,:)-MBL(2,:)), '--')

    elseif inputName == 'inr'
        plotAng(omega, (-sqrt(2)/2) .* (INR(1,:)+INR(2,:)), '--')
        plotAng(omega, (-sqrt(2)/2) .* (INR(1,:)-INR(2,:)), '--')
    end
    hold off


    savePlot(...
        [append('Ângulp ', titleName)],...
        ['\alpha_{p1}'; '\alpha_{p2}'; '\alpha_{x1}'; '\alpha_{x2}'],...
        append('mkc_', inputName, 'Ang_unc'),...
        '\omega [rad/s]', append(yName, '(\omega) [deg]'));
end