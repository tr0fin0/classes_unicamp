function [w, wL, wH, rcp, asymL, asymH] = receptivity(step, m, c, k)
    % receptivity - This function computes the receptivity of 1DOF Forced 
    % Vibration Vibration System with Viscous Damping


    wn = sqrt(k/m);                             % Natural Frequency
    w  = wn*10^(-2) : step : wn*10^(+2);        % Total Frequency Range
    wL = wn*10^(-2) : step : wn;                % Low   Frequency Range
    wH =         wn : step : wn*10^(+2);        % High  Frequency Range

    rcp   = 1 ./ (k - w.^2.* m + w.* (1i*c));   % Receptivity
    asymL = ( 1/k * ones(size(wL)) );           % Low  Frequency Asymptote
    asymH = ( 1./(wH.^2 .* m) );                % High Frequency Asymptote
end