function ex5(step, m, c, k)

    rcp = @receptivity;
    asymptotes(rcp, step, m, c, k)

    mbl = @mobility;
    asymptotes(mbl, step, m, c, k)

    inr = @inertia;
    asymptotes(inr, step, m, c, k)
end