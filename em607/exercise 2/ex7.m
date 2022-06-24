function ex7(sys, m, c, k)

    inputName = inputname(1);

    figure; bode(sys);
    savePlot('Bode Response', sysDescription(m, c, k), append(sysCode(m, c, k), inputName, '_bode'), '', '');

    figure; bodemag(sys);
    savePlot('Bodemag Response', sysDescription(m, c, k), append(sysCode(m, c, k), inputName, '_bodemag'), '', '');
end