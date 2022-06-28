function GS = tm(M, C, K)

    syms s;
    GS = (M*s^2 + C*s + K)^(-1);
end