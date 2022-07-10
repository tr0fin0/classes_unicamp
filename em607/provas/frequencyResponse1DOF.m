function frequencyResponse1DOF(func, y0, w, m, c, k)

    inputName = inputname(1);

    if inputName == 'hrm'
        titleName = 'Exitação Harmônica';

    elseif inputName == 'rtr'
        titleName = 'Desbalanceamento';

    elseif inputName == 'trn'
        titleName = 'Transmisibilidade';

    else
        error('undefined function name')
    end


    LGN = [];
    figure; hold on
    for i = 1 : 1 : 3
        [r, R]  = func(w, i*m, c, k);

        plot(r, y0 .* R)

        LGN = [...
            LGN;...
            append(...
                'm = ', num2str(i*m),...
                ' c = ', num2str(c),...
                ' k = ', num2str(k))];
    end
    hold off
    legend(LGN); title(titleName);
    grid on;

    LGN = [];
    figure; hold on
    for i = 1 : 1 : 3
        [r, R]  = func(w, m, i*c, k);

        plot(r, y0 .* R)

        LGN = [...
            LGN;...
            append(...
                'm = ', num2str(m),...
                ' c = ', num2str(i*c),...
                ' k = ', num2str(k))];
    end
    hold off
    legend(LGN); title(titleName);
    grid on;

    LGN = [];
    figure; hold on
    for i = 1 : 1 : 3
        [r, R]  = func(w, m, c, i*k);

        plot(r, y0 .* R)

        LGN = [...
            LGN;...
            append(...
                'm = ', num2str(m),...
                ' c = ', num2str(c),...
                ' k = ', num2str(i*k))];
    end
    hold off
    legend(LGN); title(titleName);
    grid on;
end