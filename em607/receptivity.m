function r = receptivity(m, c, k)
    % receptivity - This function computes the receptivity of 1DOF Forced 
    % Vibration Vibration System with Viscous Damping
    %
    % Syntax: r = receptivity(m, c, k)
    %
    % Long description
    % Receptivity is the ratio of the Displacement over the Force Module

    syms omega
    r = 1 / (k - omega^2 * m + 1i*omega*c);

end