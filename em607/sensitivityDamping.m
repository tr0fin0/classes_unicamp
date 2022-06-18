function sensitivityDamping(func, step, m, c, k)

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


    sysLeg = [];
    
    figure;
    hold on
    for ci = c : c : c*5
        [w, wL, wH, undef, asymL, asymH] = func(step, m, ci, k);
        plotAbs(w, undef, '')

        sysLeg = [sysLeg; sysDescription(m, ci, k)];
    end
    plotAbs(wL, asymL, '--')
    plotAbs(wH, asymH, '--')
    hold off

    savePlot(...
        [append('Magnitude ', titleName)],...
        sysLeg,...
        append(sysCode(m, c, k), '_', inputName, 'Abs_fatorAmortecimento'),...
        '\omega [rad/s]', append(yName, '(\omega)'));


    sysLeg = [];
    
    figure;
    hold on
    for ci = c : c : c*5
        [w, wL, wH, undef, asymL, asymH] = func(step, m, ci, k);
        plotAng(w, undef, '')

        sysLeg = [sysLeg; sysDescription(m, ci, k)];
    end
    hold off

    savePlot(...
        [append('Ângulo ', titleName)],...
        sysLeg,...
        append(sysCode(m, c, k), '_', inputName, 'Ang_fatorAmortecimento'),...
        '\omega [rad/s]', append(yName, '(\omega)'));
end