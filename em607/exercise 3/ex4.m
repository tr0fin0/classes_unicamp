function ex4(step, m, c, k)

    rcp = @receptivity;
    frequencyResponse(rcp, step, m, c, k)

    mbl = @mobility;
    frequencyResponse(mbl, step, m, c, k)

    inr = @inertia;
    frequencyResponse(inr, step, m, c, k)
end