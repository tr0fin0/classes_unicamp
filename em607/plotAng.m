function plotAng(X, Y, line)

    if not(isempty(line))
        plot(X, rad2deg(angle(Y)), line); 
    else
        plot(X, rad2deg(angle(Y))); 
    end

    set(gca, 'XScale', 'log');
end