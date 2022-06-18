function ex8(step, m, c, k)

    H = tf([(1)],[(m) (c) (k)]);

    figure; bode(H)
    savePlot('G(s): Espaço', sysDescription(m, c, k), append(sysCode(m, c, k), '_tf_space'), '', '');
end