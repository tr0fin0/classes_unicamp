function plotAbs(X, Y, line)

    if not(isempty(line))
        plot(X, mag2db(abs(Y)), line)
    else
        plot(X, mag2db(abs(Y)))
    end

    set(gca, 'XScale', 'log');
end