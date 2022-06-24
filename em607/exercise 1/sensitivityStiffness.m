function sensitivityStiffness(func, step, m, c, k)

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
    for ki = k : k : k*5
        [w, wL, wH, undef, asymL, asymH] = func(step, m, c, ki);
        plotAbs([wL, wH], [asymL, asymH], '--')
    
        sysLeg = [sysLeg; sysDescription(m, c, ki)];
    end
    hold off
    
    savePlot(...
        [append('Assíntota ', titleName)],...
        sysLeg,...
        append(sysCode(m, c, k), '_', inputName, 'Ass_stiffness'),...
        '\omega [rad/s]', append(yName, '(\omega) [dB]'));
end