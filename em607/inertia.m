function i = inertia(m, c, k)
    %inertia - This function computes the mobility of 1DOF Forced 
    % Vibration Vibration System with Viscous Damping
    %
    % Syntax: i = Inertia(m, c, k)
    %
    % Long description
    % Inertia is the ratio of the Acceleration over the Force Module

    syms omega
    i = 1i * omega * mobility(m, c, k);
    % i = (-omega^2) / (k - omega^2 * m + 1i*omega*c);
end