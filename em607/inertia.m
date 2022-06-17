function [w, wL, wH, inr, asymL, asymH] = inertia(step, m, c, k)
    % inertia - This function computes the mobility of 1DOF Forced 
    % Vibration Vibration System with Viscous Damping


    [w, wL, wH, mbl, asymL, asymH] = mobility(step, M, C, K);

    inr   = 1i .* w .* mbl;                 % Inertia
    asymL = ( (-wL.^2) ./ k );              % Low  Frequency Asymptote
    asymH = ( 1/m * ones(size(wH)) );       % High Frequency Asymptote
end