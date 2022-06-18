function ex6(step, m, c, k)

    rcp = @receptivity;
    sensitivityDamping(rcp, step, m, c, k)

    mbl = @mobility;
    sensitivityDamping(mbl, step, m, c, k)

    inr = @inertia;
    sensitivityDamping(inr, step, m, c, k)
end