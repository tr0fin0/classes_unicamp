function [r, HR] = harmonicExcitation(w, m, c, k)

    wn  = sqrt(k/m);
    qsi = c/(2*m*wn);

    r   = w ./ wn;

    HR = (1) ./ (sqrt((1 - r.^2).^2 + (2 .* qsi .* r).^2));
end