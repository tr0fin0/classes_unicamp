function [w, wL, wH, mbl, asymL, asymH] = mobility(step, m, c, k)
    % mobility - This function computes the mobility of 1DOF Forced 
    % Vibration Vibration System with Viscous Damping


    [w, wL, wH, rcp, asymL, asymH] = receptivity(step, m, c, k);

    mbl   = 1i .* w .* rcp;                 % Mobility
    asymL = ( (1i .* wL) ./ k );            % Low  Frequency Asymptote
    asymH = ( (-1i) ./ (wH .* m) );         % High Frequency Asymptote
end