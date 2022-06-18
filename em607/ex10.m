function ex10(step, m, c, k)

    H = tf([(1) (0) (0)],[(m) (c) (k)]);

    figure; bode(H)
    savePlot('G(s): Aceleração', sysDescription(m, c, k), append(sysCode(m, c, k), '_tf_acceleration'), '', '');
end