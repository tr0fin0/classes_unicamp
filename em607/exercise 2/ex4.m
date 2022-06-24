function [sys, wn, zeta, poles, eigen] = ex4(tff)

    sys = ss(tff);

    [wn, zeta, poles] = damp(sys);

    eigen = eig(sys);
end