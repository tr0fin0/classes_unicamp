import numpy as np
import matplotlib


def main():

    r    = np.linspace(0, 5, 10000)

    zetaRef     = np.sqrt(2)/2
    zetaValues  = [0, 0.15, 0.2, 0.5, zetaRef, 1]
    # zetaValues  = np.linspace(0, 1, 8)

    if True:
    # if False:
        MFvalues(r, zetaRef, zetaValues)

    # if True:
    if False:
        thetaValues(r, zetaValues)

    return



main()