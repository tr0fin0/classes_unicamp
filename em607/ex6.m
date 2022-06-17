function ex6(step, m, c, k)
    sysVar = append("m",num2str(m),"c",num2str(c),"k",num2str(k));



    sysLeg = [];
    figure; hold on
    for ci = c : c : 5*c
        [w, wL, wH, rcp, asymL, asymH] = receptivity(step, m, ci, k);
        loglog(w, abs(rcp))

        sysDes = append("m = ",num2str(m), ", c = ",num2str(ci), " e k = ",num2str(k));
        sysLeg = [sysLeg; sysDes];
    end
    loglog(wL, abs(asymL), '--', wH, abs(asymH), '--')
    hold off

    sysLeg = [sysLeg; "Assíntota \omega \rightarrow 0"];
    sysLeg = [sysLeg; "Assíntota \omega \rightarrow \infty"];

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Magnitude Receptância \alpha(\omega)'],...
        sysLeg,...
        append(sysVar, '_rcpAbs_fatorAmortecimento'),...
        '\omega [rad/s]', '\alpha(\omega)');



    sysLeg = [];
    figure; hold on
    for ci = c : c : 5*c
        [w, wL, wH, rcp, asymL, asymH] = receptivity(step, m, ci, k);
        loglog(w, angle(rcp))

        sysDes = append("m = ",num2str(m), ", c = ",num2str(ci), " e k = ",num2str(k));
        sysLeg = [sysLeg; sysDes];
    end
    hold off

    set(gca, 'XScale', 'log', 'YScale', 'log');
    savePlot(...
        ['Ângulo Receptância \alpha(\omega)'],...
        sysLeg,...
        append(sysVar, '_rcpAng_fatorAmortecimento'),...
        '\omega [rad/s]', '\alpha(\omega)');
end