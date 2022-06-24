function ex5(sys, m, c, k)

    inputName = inputname(1);


    figure; impulse(sys);
    savePlot('Impulse Response', sysDescription(m, c, k), append(sysCode(m, c, k), inputName, '_impl'), '', '');

    figure; step(sys);
    savePlot('Step Response', sysDescription(m, c, k), append(sysCode(m, c, k), inputName, '_step'), '', '');
end