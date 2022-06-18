function asymptotes(func, step, m, c, k)

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
    hold on;
    plotAbs(wL, asymL, '--');
    plotAbs(wH, asymH, '--');
    hold off;

    savePlot(...
        [append('Assíntotas ', titleName)],...
        ["Assíntota \omega \rightarrow 0", "Assíntota \omega \rightarrow \infty"],...
        append(sysCode(m, c, k), '_', inputName, 'Ass'),...
        '\omega [rad/s]', append(yName, '(\omega)'));

end