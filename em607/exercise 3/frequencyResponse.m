function frequencyResponse(func, step, M, C, k)

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


    [w, wL, wH, undef, asymL, asymH] = func(step, m, c, k);
    
    figure; 
    hold on
    plotAbs(w, undef, '');
    plotAbs(wL, asymL, '--');
    plotAbs(wH, asymH, '--');
    hold off
    savePlot(...
        [append('Magnitude ', titleName)],...
        [sysDescription(m, c, k),...
         "Assíntota \omega \rightarrow 0",...
         "Assíntota \omega \rightarrow \infty"],...
        append(sysCode(m, c, k), '_', inputName, 'Abs'),...
        '\omega [rad/s]', append(yName, '(\omega) [dB]'));


    figure; plotAng(w, undef, '')
    savePlot(...
        [append('Ângulo ', titleName)],...
        sysDescription(m, c, k),...
        append(sysCode(m, c, k), '_', inputName, 'Ang'),...
        '\omega [rad/s]', append(yName, '(\omega) [deg]'));

end