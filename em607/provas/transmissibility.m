function [r, TR] = transmissibility(w, m, c, k)

    wn  = sqrt(k/m);
    qsi = c/(2*m*wn);

    r   = w ./ wn;

    TR = (sqrt(1 + (2.*qsi.*r).^2)) ./ (sqrt((1 - r.^2).^2 + (2 .* qsi .* r).^2));
end