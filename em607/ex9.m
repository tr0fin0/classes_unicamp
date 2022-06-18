function ex9(step, m, c, k)

    H = tf([(1) (0)],[(m) (c) (k)]);

    figure; bode(H)
    savePlot('G(s): Velocidade', sysDescription(m, c, k), append(sysCode(m, c, k), '_tf_speed'), '', '');
end