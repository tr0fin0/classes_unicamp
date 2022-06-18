function plotAbs(X, Y, line)

    if not(isempty(line))
        plot(X, abs(Y), line)
    else
        plot(X, abs(Y))
    end

    set(gca, 'XScale', 'log', 'YScale', 'log');
end