function [MR, KR, WR, PHI] = ex2(M, K)

    [PHI, WR] = eig(K, M);

    MR = PHI.' * M * PHI;
    KR = PHI.' * K * PHI;
end