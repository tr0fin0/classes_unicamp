function ex5(omega, M, C, K)

    rcp = @receptivity;
    frequencyResponseUncoupled(rcp, omega, M, C, K)

    mbl = @mobility;
    frequencyResponseUncoupled(mbl, omega, M, C, K)

    inr = @inertia;
    frequencyResponseUncoupled(inr, omega, M, C, K)
end