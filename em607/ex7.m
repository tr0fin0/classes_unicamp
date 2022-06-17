function ex7(step, m, c, k)
    sysVar = append("m",num2str(m),"c",num2str(c),"k",num2str(k));



    sysLeg = [];
    figure; hold on
    for mi = m : m : 5*m
        [w, wL, wH, rcp, asymL, asymH] = receptivity(step, mi, c, k);
        loglog([wL, wH], abs([asymL, asymH]), '--')

        sysDes = append("m = ",num2str(mi), ", c = ",num2str(c), " e k = ",num2str(k));
        sysLeg = [sysLeg; sysDes];
    end
    hold off

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Assíntota Receptância \alpha(\omega)'],...
        sysLeg,...
        append(sysVar, '_rcpAss_massa'),...
        '\omega [rad/s]', '\alpha(\omega)');



    sysLeg = [];
    figure; hold on
    for mi = m : m : 5*m
        [w, wL, wH, rcp, asymL, asymH] = mobility(step, mi, c, k);
        loglog([wL, wH], abs([asymL, asymH]), '--')

        sysDes = append("m = ",num2str(mi), ", c = ",num2str(c), " e k = ",num2str(k));
        sysLeg = [sysLeg; sysDes];
    end
    hold off

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Assíntota Mobilidade y(\omega)'],...
        sysLeg,...
        append(sysVar, '_mblAss_massa'),...
        '\omega [rad/s]', 'y(\omega)');



    sysLeg = [];
    figure; hold on
    for mi = m : m : 5*m
        [w, wL, wH, rcp, asymL, asymH] = inertia(step, mi, c, k);
        loglog([wL, wH], abs([asymL, asymH]), '--')

        sysDes = append("m = ",num2str(mi), ", c = ",num2str(c), " e k = ",num2str(k));
        sysLeg = [sysLeg; sysDes];
    end
    hold off

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Assíntota Inertância A(\omega)'],...
        sysLeg,...
        append(sysVar, '_inrAss_massa'),...
        '\omega [rad/s]', 'A(\omega)');





    sysLeg = [];
    figure; hold on
    for ki = k : k : 5*k
        [w, wL, wH, rcp, asymL, asymH] = receptivity(step, m, c, ki);
        loglog([wL, wH], abs([asymL, asymH]), '--')

        sysDes = append("m = ",num2str(m), ", c = ",num2str(c), " e k = ",num2str(ki));
        sysLeg = [sysLeg; sysDes];
    end
    hold off

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Assíntota Receptância \alpha(\omega)'],...
        sysLeg,...
        append(sysVar, '_rcpAss_rigidez'),...
        '\omega [rad/s]', '\alpha(\omega)');



    sysLeg = [];
    figure; hold on
    for ki = k : k : 5*k
        [w, wL, wH, rcp, asymL, asymH] = mobility(step, m, c, ki);
        loglog([wL, wH], abs([asymL, asymH]), '--')

        sysDes = append("m = ",num2str(m), ", c = ",num2str(c), " e k = ",num2str(ki));
        sysLeg = [sysLeg; sysDes];
    end
    hold off

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Assíntota Moblidade y(\omega)'],...
        sysLeg,...
        append(sysVar, '_mblAss_rigidez'),...
        '\omega [rad/s]', 'y(\omega)');



    sysLeg = [];
    figure; hold on
    for ki = k : k : 5*k
        [w, wL, wH, rcp, asymL, asymH] = inertia(step, m, c, ki);
        loglog([wL, wH], abs([asymL, asymH]), '--')
        % loglog(wL, abs(asymL), '--', wH, abs(asymH), '--')
        % loglog(w, abs(cat(2, asymL, asymH(2:size(asymH,2)))), '--')

        sysDes = append("m = ",num2str(m), ", c = ",num2str(c), " e k = ",num2str(ki));
        sysLeg = [sysLeg; sysDes];
    end
    hold off

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Assíntota Inerância A(\omega)'],...
        sysLeg,...
        append(sysVar, '_inrAss_rigidez'),...
        '\omega [rad/s]', 'A(\omega)');
end