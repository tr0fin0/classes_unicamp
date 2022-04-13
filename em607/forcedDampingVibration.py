import os
import math
import numpy as np
import matplotlib.pyplot as plt




def plotGraph(
        x: int, y: int, 

        dataLabel: str = "", 
        xlabel:    str = "",
        ylabel:    str = "", 

        plotLabel: str = "plotGraph", 
        axis:      int = [0,0, 0,0],
        showPlot: bool = True
    ) -> None:
    """
    Plot Graph based on given data and saves a PNG


    Parameters
    ----------
    x : vector of int
        Input Values

    y : vector of int
        Output Values

    dataLabel : string
        Label of data x and y

    xlabel : string
        Label of X axis

    ylabel : string
        Label of Y axis

    plotLabel : string
        Name of exported PNG file

    axis : vector of int
        Determines dimensions of Graph

    showPlot : bool
        Show Graph?




    Returns
    -------
    Plot of Data : None


    Reference
    ---------
        [1] https://matplotlib.org/3.5.0/tutorials/introductory/pyplot.html

        [2] https://matplotlib.org/3.5.1/gallery/widgets/slider_demo.html

        [3] https://stackoverflow.com/questions/14016217/how-do-i-write-a-latex-formula-in-the-legend-of-a-plot-using-matplotlib-inside-a

        [4] https://matplotlib.org/3.5.0/api/_as_gen/matplotlib.pyplot.legend.html

        [5] https://riptutorial.com/matplotlib/example/14063/plot-with-gridlines
    """

    plt.plot(x, y, label = dataLabel)
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.legend(loc = "upper right")


    if axis == [0,0, 0,0]:
        axis = [min(x),max(x), min(y),max(y)]

    plt.axis(axis)


    plt.grid(which = "major", color='#666666', linestyle='-',  linewidth=0.5)
    plt.minorticks_on()
    plt.grid(which = "minor", color='#999999', linestyle='--', linewidth=0.25)


    if showPlot == True:
        plt.show()

    if savePlot == True:
        mypath = os.path.dirname(__file__)
        plt.savefig(os.path.join(mypath, plotLabel+".png"))


    return None



def MF(r: float, zeta: float):
    """
    Magnification Factor of a 1DOF Forced Vibration System with Viscosity Damping and Harmonic excitation.


    Parameters
    ----------
    r : float
        Frequency Ratio
                  omega
            r = ---------
                 omega_n

    zeta : float
        Equation Constant
                          c
            zeta = ---------------
                    (2 m omega_n)


    Returns
    -------
    Function


    Reference
    ---------
        [1] https://stackoverflow.com/questions/22725421/typeerror-with-ufunc-bitwise-xor
    """

    return  1 / np.sqrt( (1 - r**2)**2 + (2*zeta*r)**2 )



def theta(r: float, zeta: float):
    """
    Theta Phase of a 1DOF Forced Vibration System with Viscosity Damping and Harmonic excitation.


    Parameters
    ----------
    r : float
        Frequency Ratio
                  omega
            r = ---------
                 omega_n

    zeta : float
        Equation Constant
                          c
            zeta = ---------------
                    (2 m omega_n)



    Returns
    -------
    Function


    Reference
    ---------
        [1] https://stackoverflow.com/questions/22725421/typeerror-with-ufunc-bitwise-xor
    """

    return np.arctan((2*zeta*r)/(1 - r**2)) 
    # return math.atan( (2*zeta*r)/(1 - r**2) ) 




def MFvalues(r :float, zetaRef: float, zetaValues: float) -> None:

    plt.close()
    for zeta in zetaValues:
        MFzeta  = MF(r, zeta)

        zetaUnicode = "\u03B6"
        zetaStr     = str(round(zeta,3))


        # plotGraph(r, MFzeta, "$\zeta$ = "+zetaStr, "r", "MF","MFzeta:"+zetaStr)
        plotGraph(r, MFzeta, "$\zeta$ = "+zetaStr, "r", "MF","MF:"+zetaStr, axis=[0,5, 0,5], showPlot=False)

        if  zeta  < zetaRef:
            rPico = np.sqrt(1-2*zeta**2)
            MFmax = 1 / (2*zeta * np.sqrt(1 - zeta**2))
            print(f"r = 0 é Mínimo, pois {zetaUnicode} = {zeta:.3f}  < {zetaRef:.3f}\t   rPico = {rPico:.3f} e MFmax = {MFmax:.3f}")

        else:
            print(f"r = 0 é Máximo, pois {zetaUnicode} = {zeta:.3f} >= {zetaRef:.3f}\t   rPico = 0.000 e MFmax = 1.000")

    plt.show()

    return 



def thetaValues(r: float, zetaValues: float) -> None:

    plt.close()

    for zeta in zetaValues:
        thetaZeta  = theta(r, zeta)
        zetaStr = str(round(zeta,3))


        # plotGraph(r, thetaZeta, "$\zeta$ = "+zetaStr, "r", "MF","MFzeta:"+zetaStr)
        plotGraph(r, thetaZeta, "$\zeta$ = "+zetaStr, "r", "$\\theta$","theta:"+zetaStr, axis=[0,5, 0,5], showPlot=False)

    plt.show()

    return




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