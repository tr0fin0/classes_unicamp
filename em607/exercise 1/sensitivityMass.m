function sensitivityMass(func, step, m, c, k)

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
    for mi = m : m : m*5
        [w, wL, wH, undef, asymL, asymH] = func(step, mi, c, k);
        plotAbs([wL, wH], [asymL, asymH], '--')
    
        sysLeg = [sysLeg; sysDescription(mi, c, k)];
    end
    hold off

    savePlot(...
        [append('Assíntota ', titleName)],...
        sysLeg,...
        append(sysCode(m, c, k), '_', inputName, 'Ass_mass'),...
        '\omega [rad/s]', append(yName, '(\omega) [dB]'));
end