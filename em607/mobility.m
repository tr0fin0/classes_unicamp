function m = mobility(m, c, k)
    % mobility - This function computes the mobility of 1DOF Forced 
    % Vibration Vibration System with Viscous Damping
    %
    % Syntax: m = mobility(m, c, k)
    %
    % Long description
    % Mobility is the ratio of the Velocity over the Force Module

    syms omega
    m = 1i * omega * receptivity(m, c, k);
    % m = (1i * omega) / (k - omega^2 * m + 1i*omega*c);
end