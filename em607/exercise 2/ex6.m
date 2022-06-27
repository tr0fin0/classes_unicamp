function ex6(sys, m, c, k)

    inputName = inputname(1);

    t    = 0 : 0.01 : 20;
    a    = 1;
    ramp = a*t; % unitary ramp

    figure; lsim(sys, ramp, t);
    savePlot('Ramp Response', sysDescription(m, c, k), append(sysCode(m, c, k), inputName, '_ramp'), '', '');
end