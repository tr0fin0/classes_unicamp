function ex7(step, m, c, k)

    rcp = @receptivity;
    sensitivityMass(rcp, step, m, c, k)
    sensitivityStiffness(rcp, step, m, c, k)

    mbl = @mobility;
    sensitivityMass(mbl, step, m, c, k)
    sensitivityStiffness(mbl, step, m, c, k)

    inr = @inertia;
    sensitivityMass(inr, step, m, c, k)
    sensitivityStiffness(inr, step, m, c, k)

end