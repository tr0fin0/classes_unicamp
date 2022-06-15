import os
import numpy as np
import matplotlib.pyplot as plt


class graph:

    def plot(
            x: int, y: int, 

            dataLabel: str = "", 
            xlabel:    str = "",
            ylabel:    str = "", 

            plotLabel: str = "plotGraph", 
            axis:      int = [0, 0, 0, 0],
            showPlot: bool = True,
            savePlot: bool = True,
            pathPlot:  str = "\images\\"
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


        if axis is [0, 0, 0, 0]:
            axis = [min(x),max(x), min(y),max(y)]

        plt.axis(axis)


        plt.grid(which = "major", color='#666666', linestyle='-',  linewidth=0.5)
        plt.minorticks_on()
        plt.grid(which = "minor", color='#999999', linestyle='--', linewidth=0.25)


        if showPlot is True:
            plt.show()

        if savePlot is True:
            mypath = os.path.dirname(__file__) + pathPlot
            plotName = plotLabel + ".png"
            print(plotName)
            print(os.path.join(mypath, plotName))
            plt.savefig(os.path.join(mypath, plotName))


        return None


class oneDOF:
    class forced:


        def harmonic_excitement(r: float, zeta: float) -> list:
            """
            1DOF Forced Vibration System with Viscous Damping and Harmonic excitement.


            Parameters
            ----------
            r : float, Frequency Ratio    : r = omega / omega_n

            zeta : float, Damping Factor  : zeta = c / (2 m omega_n)


            Returns
            -------
            rPico : float, Peak Frequency Ratio

            MF    : float, Amplification Factor

            MFmax : float, Maximum Amplification Factor


            Reference
            ---------
                [1] https://stackoverflow.com/questions/22725421/typeerror-with-ufunc-bitwise-xor
            """

            zetaRef = np.sqrt(2)/2

            MF = 1 / np.sqrt( (1 - r**2)**2 + (2*zeta*r)**2 )

            rPico = 0
            if zeta < zetaRef:
                rPico = np.sqrt(1-2*zeta**2)

            MFmax = 1
            if zeta < zetaRef:
                MFmax = 1 / (2*zeta * np.sqrt(1 - zeta**2))

            return  rPico, MF, MFmax


        def rotary_unbalance(r: float, zeta: float) -> list:
            """
            1DOF Forced Vibration System with Viscosity Damping and Harmonic excitement by a Rotary Unbalance.


            Parameters
            ----------
            r : float, Frequency Ratio    : r = omega / omega_n

            zeta : float, Damping Factor  : zeta = c / (2 m omega_n)


            Returns
            -------
            rPico : float, Peak Frequency Ratio

            X     : float, Range of Motion: X = (X M) / (m l)

            Xmax  : float, Maximum Range of Motion


            Reference
            ---------
                [1] 
            """
            zetaRef = np.sqrt(2)/2

            X = r**2 / np.sqrt( (1 - r**2)**2 + (2*zeta*r)**2 )

            rPico = np.infty
            if zeta < zetaRef:
                rPico = 1 / np.sqrt(1-2*zeta**2)

            Xmax = 1
            if zeta < zetaRef:
                Xmax = rPico**2 / np.sqrt( (1 - rPico**2)**2 + (2*zeta*rPico)**2 )

            return rPico, X, Xmax

        def transmissibility(r: float, zeta: float) -> list:
            """
            Transmissibility of a 1DOF Forced Vibration System with Viscosity Damping and Harmonic excitement.


            Parameters
            ----------
            r : float, Frequency Ratio    : r = omega / omega_n

            zeta : float, Damping Factor  : zeta = c / (2 m omega_n)


            Returns
            -------
            rPico : float, Peak Frequency Ratio

            TR    : float, Transmissibility Relation  : TR = FT / F0

            TRmax : float, Maximum Transmissibility Relation


            Reference
            ---------
                [1] 
            """

            rPico = np.sqrt(-1 + np.sqrt(1 + 8*zeta**2)) / (2*zeta)
            TR    = (np.sqrt(1 + (2*zeta*r)**2)) / np.sqrt( (1 - r**2)**2 + (2*zeta*r)**2 )
            TRmax = (np.sqrt(1 + (2*zeta*rPico)**2)) / np.sqrt( (1 - rPico**2)**2 + (2*zeta*rPico)**2 )

            return rPico, TR, TRmax


class twoDOF:
    class forced:

        def a(): ...




def figure17(r :float, zetaRef: float, zetaValues: float) -> None:

    plt.close()
    for zeta in zetaValues:
        rPico, MF, MFmax  = oneDOF.forced.harmonic_excitement(r, zeta)

        zetaUnicode = "\u03B6"
        zetaStr     = str(round(zeta,3))

        graph.plot(r, MF, "$\zeta$ = "+zetaStr, "r", "MF","figure17:"+zetaStr, axis=[0,5, 0,5], showPlot=False)

        if  zeta  < zetaRef:
            print(f"r = 0 é Mínimo, pois {zetaUnicode} = {zeta:.3f}  < {zetaRef:.3f}\t   rPico = {rPico:.3f} e MFmax = {MFmax:.3f}")

        else:
            print(f"r = 0 é Máximo, pois {zetaUnicode} = {zeta:.3f} >= {zetaRef:.3f}\t   rPico = 0.000 e MFmax = 1.000")

    return



def figure20(r :float, zetaRef: float, zetaValues: float) -> None:

    plt.close()
    for zeta in zetaValues:
        rPico, X, Xmax  = oneDOF.forced.rotary_unbalance(r, zeta)

        infinityUnicode = "\u221e"
        zetaUnicode     = "\u03B6"
        zetaStr         = str(round(zeta,3))

        graph.plot(r, X, "$\zeta$ = "+zetaStr, "r", "$\\frac{X}{ml/M}$","figure20:"+zetaStr, axis=[0,5, 0,5], showPlot=False)

        if  zeta  < zetaRef:
            print(f"r = 0 é Mínimo, Xmax = {Xmax:.3f} em rPico = {rPico:.3f}, pois {zetaUnicode} = {zeta:.3f}  < {zetaRef:.3f}")

        else:
            print(f"r = 0 é Mínimo, Xmax = 1.000 em r = {infinityUnicode}, pois {zetaUnicode} = {zeta:.3f} >= {zetaRef:.3f}")

    return

def figure22(r :float, zetaRef: float, zetaValues: float) -> None:

    plt.close()
    for zeta in zetaValues:
        rPico, TR, TRmax  = oneDOF.forced.transmissibility(r, zeta)

        infinityUnicode = "\u221e"
        zetaUnicode     = "\u03B6"
        zetaStr         = str(round(zeta,3))

        graph.plot(r, TR, "$\zeta$ = "+zetaStr, "r", "$\\frac{F_T}{F_0}$","figure22:"+zetaStr, axis=[0,5, 0,5], showPlot=False)

        if zeta == 0:
            print(f"r = 0 é Mínimo Local, TRmax = {infinityUnicode} em rPico = {1.000}, pois {zetaUnicode} = {zeta:.3f} = {zetaRef:.3f}")

        else:
            print(f"r = 0 é Mínimo Local, TRmax = {TRmax:.3f} em rPico = {rPico:.3f}, pois {zetaUnicode} = {zeta:.3f} > {zetaRef:.3f}")

    return





def main():
    r    = np.linspace(0, 5, 10000)

    zetaRef     = np.sqrt(2)/2
    zetaValues  = [0, 0.15, 0.2, 0.5, zetaRef, 1]

    print("="*80+"\n\n")
    figure17(r, zetaRef, zetaValues)
    print("="*80+"\n\n")
    figure20(r, zetaRef, zetaValues)
    print("="*80+"\n\n")
    figure22(r, zetaRef, zetaValues)

#%%
if __name__ == '__main__':
    main()