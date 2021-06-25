import numpy as np
from scipy import special
from scipy.integrate import quad

def ccxy(x, y):
    if(x.size != y.size):
        return 2

    n = x.size

    xm = x.mean()
    ym = y.mean()

    sx = np.std(x, ddof=1)
    sy = np.std(y, ddof=1)

    zx = (x - xm)/sx
    zy = (y - ym)/sy

    ccxy = np.sum(zx*zy)/(n-1)

    return ccxy

def Combination(n, k):
    #n: number of objects
    #k: number of groups

    if n<k:
        return 0

    fatorialN = np.math.factorial(n)
    fatorialK = np.math.factorial(k)
    fatorialNK = np.math.factorial(n-k)

    cnk = fatorialN/(fatorialK*fatorialNK)

    return cnk

def Bernoulli(x, n, p):
    #x: = 1, sucess
    #   = 0, fail
    #p: probability of sucess
    #n: number of trials

    px = (p**(x))*((1-p)**(n-x))

    return px

def Binomial(x, n, p):
    #x: number of sucesses
    #n: number of trials
    #p: probability of sucess
    cnx = Combination(n, x)

    px = cnx*Bernoulli(x, n, p)

    return px

def BinomialInfo(x, n, p):
    #x: number of sucesses
    #n: number of trials
    #p: probability of sucess

    pxl = 0
    px = Binomial(x, n, p)

    for i in range(x):
        pxl += Binomial(i, n, p)

    expectedValue = n*p
    varianceValue = n*p*(1-p)

    print("\nBinomial Distribution")
    print("p = {:.4f}".format(p))
    print("n = {:.4f}".format(n))
    print("x = {:.4f}".format(x))
    print("E(X) = {:.4f}".format(expectedValue))
    print("V(X) = {:.4f}".format(varianceValue))
    print("P(X ={}) = {:.4f}".format(x, px))
    print("P(X<={}) = {:.4f}".format(x, px+pxl))
    print("P(X>={}) = {:.4f}".format(x, 1-pxl))
    print("P(X< {}) = {:.4f}".format(x, pxl))
    print("P(X> {}) = {:.4f}".format(x, 1-pxl-px))

    return px

def Geometric(x, p):
    #x: number of trials to sucess
    #p: probability of sucess

    px = p*(1-p)**(x-1)

    return px

def GeometricInfo(x, p):
    #x: number of trials to sucess
    #p: probability of sucess

    px = Geometric(x, p)

    pxl = 0
    for i in range(1,x):
        pxl += Geometric(i, p)

    expectedValue = 1/p
    varianceValue = (1-p)/(p**2)

    print("\nGeometric Distribution")
    print("p = {:.4f}".format(p))
    print("x = {:.4f}".format(x))
    print("E(X) = {:.4f}".format(expectedValue))
    print("V(X) = {:.4f}".format(varianceValue))
    print("P(X ={}) = {:.4f}".format(x, px))
    print("P(X<={}) = {:.4f}".format(x, px+pxl))
    print("P(X>={}) = {:.4f}".format(x, 1-pxl))
    print("P(X< {}) = {:.4f}".format(x, pxl))
    print("P(X> {}) = {:.4f}".format(x, 1-px-pxl))

    return px

def HiperGeometric(x, n, X, N):
    #x: number of elements with A selected
    #n: number of elements selected
    #X: total number of elements with A
    #N: total number of elements

    Xx = Combination(X, x)
    Nn = Combination(N, n)
    nx = Combination(N-X,n-x)

    px = Xx*nx/Nn

    return px

def HiperGeometricInfo(x, n, X, N):
    #x: number of elements with A selected
    #n: number of elements selected
    #X: total number of elements with A
    #N: total number of elements

    px = HiperGeometric(x, n, X, N)

    pxl = 0
    for i in range(x):
        pxl += HiperGeometric(i, n, X, N)

    expectedValue = n*X/N
    varianceValue = expectedValue*(1 - X/N)*(N-n)/(N-1)

    print("\nHiper Geometric Distribution")
    print("x = {:.4f}".format(x))
    print("n = {:.4f}".format(n))
    print("X = {:.4f}".format(X))
    print("N = {:.4f}".format(N))
    print("E(X) = {:.4f}".format(expectedValue))
    print("V(X) = {:.4f}".format(varianceValue))
    print("P(X ={}) = {:.4f}".format(x, px))
    print("P(X<={}) = {:.4f}".format(x, px+pxl))
    print("P(X>={}) = {:.4f}".format(x, 1-pxl))
    print("P(X< {}) = {:.4f}".format(x, pxl))
    print("P(X> {}) = {:.4f}".format(x, 1-pxl-px))

    return px

def Poisson(x, n, p):
    #x: number of sucesses
    #n: number of trials
    #p: probability of sucess

    Lambda = n*p

    if( (Lambda <= 7) | ( (n >= 20) & (p <= 0.05) ) ):
        px = (np.exp(-Lambda)*(Lambda)**(x))/np.math.factorial(x)

    return px

def PoissonInfo(x: int, n: int, p: int):
    #x: number of sucesses
    #n: number of trials
    #p: probability of sucess

    Lambda = n*p

    px = Poisson(x, n, p)

    pxl = 0
    for i in range(x):
        pxl += Poisson(i, n, p)

    print("\nPoisson Distribution")
    print("x = {:.4f}".format(x))
    print("n = {:.4f}".format(n))
    print("p = {:.4f}".format(p))
    print("E(X) = {:.4f}".format(Lambda))
    print("V(X) = {:.4f}".format(Lambda))
    print("P(X ={}) = {:.4f}".format(x, px))
    print("P(X<={}) = {:.4f}".format(x, px+pxl))
    print("P(X>={}) = {:.4f}".format(x, 1-pxl))
    print("P(X< {}) = {:.4f}".format(x, pxl))
    print("P(X> {}) = {:.4f}".format(x, 1-pxl-px))


    return px

def Exponencial(Lambda: int, x: int):

    if (Lambda < 0):
        return 0

    return (1 - np.exp(-Lambda*x))

def ExponencialReverseL(x: int, p: float):

    if (p > 1):
        return 0

    Lambda = (-np.log(1-p))/x

    print("\nExponencial Reverse Lambda")
    print("x = {:.4f}".format(x))
    print("p = {:.4f}".format(p))
    print("l = {:.4f}".format(Lambda))

    return Lambda

def ExponencialReverseX(Lambda: float, p: float):

    if (p > 1):
        return 0

    x = (-np.log(1-p))/Lambda

    print("\nExponencial Reverse X")
    print("x = {:.4f}".format(x))
    print("p = {:.4f}".format(p))
    print("l = {:.4f}".format(Lambda))

    return x

def ExponencialInfo(Lambda: int, x: int):

    expectedValue = 1/Lambda
    varianceValue = 1/(Lambda**2)

    px = Exponencial(Lambda, x)

    print("\nExponencial Distribution")
    print("x      = {:.4f}".format(x))
    print("lambda = {:.4f}".format(Lambda))
    print("E(X) = {:.4f}".format(expectedValue))
    print("V(X) = {:.4f}".format(varianceValue))
    print("P(X<={}) = {:.4f}".format(x, px))
    print("P(X> {}) = {:.4f}".format(x, 1-px))

    return px

def nrmStdDst(x: float):
    """
    Normal Standard Distribution

    Returns the de value of P(X < x) within a normal standard distribution with expected value of 0  and variance of 1

    Parameters
    ----------
    x : float
        Desired value

    Returns
    -------
    px: float
        P(X < x)
    """

    return 1/2*(special.erf(x/(np.sqrt(2))) + 1)

def nrmStdDst_i(x: float, greater=False):
    """
    Normal Standard Distribution information

    Returns the de value of P(X < x) within a normal standard distribution with expected value of 0  and variance of 1 and informations of the requisted option.

    Parameters
    ----------
    x : float
        Desired value

    greater :   boolean
                Is the dessired value greater?

    Returns
    -------
    px: float

        if greatter:
            P(X>x)
        else:
            P(X<x)
    """

    px = nrmStdDst(x)

    if greater:
        print("P(X > {:.4}) = {:.4f}".format(x, 1-px))
        return 1-px

    else:
        print("P(X < {:.4}) = {:.4f}".format(x, px))
        return px



def INrmStdDst_i(a: float, b: float):

    pa = nrmStdDst(a)
    pb = nrmStdDst(b)

    px = pb - pa

    # print("\nNormal Standard Interval Distribution")
    # print("a = {:.4f} and b = {:.4f}".format(a,b))
    # print("E(X) = 0 and V(X) = 1")
    print("P({:.4f} < Z < {:.4f}) = {:.4f}".format(a, b, px))

    return px


def nrmDst(x: float, mu: float, sg: float):
    """
    Normal Distribution

    Returns the de value of P(X < x) within a normal distribution with 
    expected value of mu  and variance of sg. It computes the value passed in the normalization of the values [1]

    Parameters
    ----------
    x : float
        Desired value

    mu: float
        Expected value

    sg: float
        Variance value

    Returns
    -------
    px: float
        P(X < x)

    Reference
    ---------
        [1] 
            https://en.wikipedia.org/wiki/Normalization_(statistics)
    """

    return nrmStdDst((x - mu)/np.sqrt(sg))

def nrmDst_i(x: float, mu: float, sg: float, greater=False):
    """
    Normal Distribution information

    Returns the de value of P(X < x) within a normal distribution with expected value of mu  and variance of sg and informations of the requisted option. It computes the value passed in the normalization of the values [1]

    Parameters
    ----------
    x : float
        Desired value

    greater :   boolean
                Is the dessired value greater?

    Returns
    -------
    px: float

        if greatter:
            P(X>x)
        else:
            P(X<x)

    Reference
    ---------
        [1] 
            https://en.wikipedia.org/wiki/Normalization_(statistics)
    """

    px = nrmDst(x, mu, sg)

    if greater:
        return 1-px

    else:
        return px



def INrmDst_i(a: float, b: float, mu: float, sg: float):
    # P(a < X < b)
    # mu: expected value
    # sg: variance value

    pa = nrmDst(a, mu, sg)
    pb = nrmDst(b, mu, sg)

    px = pb - pa

    print("\nNormal Interval Distribution")
    print("a = {:.4f} and b = {:.4f}".format(a,b))
    print("E(X) = 0 and V(X) = 1")
    print("P({:.4f} < Z < {:.4f}) = {:.4f}".format(a, b, px))

    return px

def RNrmStdDst(px: float):
    """
    Reverse Normal Standard Distribution

    Returns the expected value of the desired probability 
    of a Normal Standard Distribution using the the 
    erfinv function from special

    Parameters
    ----------
    px: float

        P(X < x) = px, probability of distribution

    Returns
    -------
    x : float
        expected value
    """

    return np.sqrt(2)*special.erfinv(2*px - 1)

def RNrmStdDst_i(px: float, greater = False, module = False):
    """
    Reverse Normal Standard Distribution information

    Returns the expected value of the desired probability of 
    a Normal Standard Distribution using the erfinv function 
    from special package with computes the error function

    Parameters
    ----------
    px: float
        Probability of normal standard distribution

    greater : boolean
              Is the dessired value greater?

        if greatter:
            P(X>x)
        else:
            P(X<x)
    
    module : boolean
             Is the dessired value in modulus?

        if module:
            P(|X| > x) or P(|X| < x)
        else:
            P( X  > x) or P( X  < x)

    Notes
    -----

        |A| > a: A > a or A < -a
        |A| < a: A < a or A > -a, -a < A < a

        know: P(X < -x) = P(X > x) so:

        P(|X| < x) = 1 - P(X < x)
        P( X  > x) = 1 - P(X < x)

    """

    #P(|X| > x) = px
    if greater and module:
        x = RNrmStdDst(1-px/2)
        print("P(|X| > {:.4f}) = {:.4f}".format(x, px))

    #P(X > x) = px
    elif greater and not module:
        x = RNrmStdDst(1-px)
        print("P(X > {:.4f}) = {:.4f}".format(x, px))

    #P(|X| < x) = px
    elif not greater and module:
        x = RNrmStdDst((1+px)/2)
        print("P(|X| < {:.4f}) = {:.4f}".format(x, px))

    #P(X < x) = px
    elif not greater and not module:
        x = RNrmStdDst(px)
        print("P(X < {:.4f}) = {:.4f}".format(x, px))

    return x

def RNrmDst(px: float, mu: float, sg: float):
    # px: probability P(X < x)
    # mu: expected value
    # sg: variance value

    # print("\nNormal Reverse Distribution")
    # print("px = {:.4f}".format(x))

    return (mu + np.sqrt(sg)*RNrmStdDst(px))

def RNrmDst_i(px: float, mu: float, sg: float):
    # px: probability P(X < x)
    # mu: expected value
    # sg: variance value

    print("\nNormal Reverse Distribution")

    x = RNrmDst(px, mu, sg)

    print("P(X < {:.2f}) = {:.4f}: E(X) = {} and V(X) = {}".format(px, x, mu, sg))

    return x

def cnfIntPrp(p, z, n):
    """
    Confidence Interval Proportional

    Returns the minimum and maximum values 
    from the probability of p in an amostral distribution
    considering an interval constant of z with a sample of size n

    Parameters
    ----------
    p : float
        Probability of population

    z : float
        Interval Constant

    n : int
        Size of sample

    Returns
    -------
    cnfIntPrp : array
                cnfIntPrp[0] error of interval
                cnfIntPrp[1] minimum interval value
                cnfIntPrp[2] maximum interval value
    """

    err = z*np.sqrt(p*(1-p)/n)

    return err, p-err, p+err



def SCnfIntPrp(p, sc, n):
    """
    Statistical Confidence Interval Proportional

    Returns the minimum and maximum values 
    from the probability of p in an amostral distribution
    considering a statistical confidence of sc with a sample of size n

    Parameters
    ----------
    p : float
        Probability of population

    sc: float
        Statistical Confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    n : int
        Size of sample

    Returns
    -------
    SCnfIntPrp : array

                 SCnfIntPrp[0] error of interval
                 SCnfIntPrp[1] minimum interval value
                 SCnfIntPrp[2] maximum interval value
    """

    z = RNrmStdDst((1+sc)/2)

    return cnfIntPrp(p, z, n)



def CCnfIntPrp(p, z, n):
    """
    Conservative Confidence Interval Proportional

    Returns the minimum and maximum values 
    from the probability of p in an amostral distribution
    considering an interval constant of z with a sample of size n
    with the worst cenario when p = 1/2 and interval is maximum

    Parameters
    ----------
    p : float
        Probability of population

    z : float
        Interval Constant

    n : int
        Size of sample

    Returns
    -------
    CCnfIntPrp : array

                 CCnfIntPrp[0] error of interval
                 CCnfIntPrp[1] minimum interval value
                 CCnfIntPrp[2] maximum interval value
    """

    err = z*np.sqrt(1/n)/2

    return err, p-err, p+err



def SCCnfIntPrp(p, sc, n):
    """
    Statistical Conservative Confidence Interval Proportional

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering a 
    statistical confidence of sc with a probability p

    Parameters
    ----------
    p : float
        Probability of population

    sc: float
        Statistical Confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    n : int
        Size of sample

    Returns
    -------
    SCCnfIntPrp : array
                  Minimum in expInt[0] and maximum in expInt[1]
    """

    z = RNrmStdDst((1+sc)/2)

    return CCnfIntPrp(p, z, n)



def sCnfIntPrp(p, z, err):
    """
    size Confidence Interval Proportional

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering an 
    interval constant of z with a probability p

    Parameters
    ----------
    p : float
        Probability of population

    z : float
        Interval Constant

    err:float
        Margin of Error

    Returns
    -------
    sCnfIntPrp : float
                 Size of sample
    """

    return (z**2)*(p*(1-p))/(err**2)



def sCCnfIntPrp(p, z, err):
    """
    size Conservative Confidence Interval Proportional

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering an 
    interval constant of z with a probability p

    Parameters
    ----------
    p : float
        Probability of population

    z : float
        Interval Constant

    err:float
        Margin of Error

    Returns
    -------
    sCCnfIntPrp : float
                  Size of conservative sample
    """

    return (z**2)/(4*err**2)


def sSCnfIntPrp(p, sc, err):
    """
    size Statistical Confidence Interval Proportional

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering a 
    statistical confidence of sc with a probability p

    Parameters
    ----------
    p : float
        Probability of population

    sc: float
        Statistical Confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    err:float
        Margin of Error

    Returns
    -------
    sSCnfIntPrp : float
                  Minimum sample for specified error margin
    """

    z = RNrmStdDst((1+sc)/2)

    return sCnfIntPrp(p, z, err)



def sSCCnfIntPrp(p, sc, err):
    """
    size Statistical Conservative Confidence Interval Proportional

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering a 
    statistical confidence of sc with a probability p

    Parameters
    ----------
    p : float
        Probability of population

    sc: float
        Statistical Confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    err:float
        Margin of Error

    Returns
    -------
    sCsCnfIntPrp : float

                   sSCCnfIntPrp[0] error of interval
                   sSCCnfIntPrp[1] minimum interval value
                   sSCCnfIntPrp[2] maximum interval value
    """

    z = RNrmStdDst((1+sc)/2)

    return sCCnfIntPrp(p, z, err)



def cnfIntAbs(ex, sd, z, n):
    """
    Confidence Interval Absolute

    Returns the minimum and maximum values 
    from the absolute value of ex with a standart deviation of sd 
    in an amostral distribution considering an interval constant of z 
    with a sample of size n

    Parameters
    ----------
    ex: float
        Abusolute value

    sd: float
        Standard Deviation

    z : float
        Interval Constant

    n : int
        Size of sample

    Returns
    -------
    cnfIntAbs : array

                cnfIntAbs[0] error of interval
                cnfIntAbs[1] minimum interval value
                cnfIntAbs[2] maximum interval value
    """

    err = z*sd/np.sqrt(n)

    return err, ex-err, ex+err



def SCnfIntAbs(ex, sd, sc, n):
    """
    Statistical Confidence Interval Absolute

    Returns the minimum and maximum values 
    from the absolute value of ex with a standart deviation of sd 
    in an amostral distribution considering a statiscal confidence of sc 
    with a sample of size n

    Parameters
    ----------
    ex: float
        Abusolute value

    sd: float
        Standard Deviation

    sc: float
        Statistical Confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    n : int
        Size of sample

    Returns
    -------
    SCnfIntAbs: array

                SCnfIntAbs[0] error of interval
                SCnfIntAbs[1] minimum interval value
                SCnfIntAbs[2] maximum interval value
    """

    z = RNrmStdDst((1+sc)/2)

    return cnfIntAbs(ex, sd, z, n)



# def SCCnfIntAbs(ex, sd, sc, n):
#     """
#     Statistical Conservative Confidence Interval Absolute

#     Returns the minimum and maximum values 
#     from the absolute value of ex with an unknown variance of sigma2 
#     in an amostral distribution considering a statiscal confidence of sc 
#     with a sample of size n

#     Parameters
#     ----------
#     ex: float
#         Abusolute value

#     sd: float
#         Standard Deviation

#     sc: float
#         Statistical Confidence

#         if  sc == 0.68 then z = 1
#             sc == 0.90 then z = 1.64
#             sc == 0.95 then z = 1.96
#             sc == 0.99 then z = 2.58

#     n : int
#         Size of sample

#     Returns
#     -------
#     SCnfIntAbs: array

#                 SCnfIntAbs[0] error of interval
#                 SCnfIntAbs[1] minimum interval value
#                 SCnfIntAbs[2] maximum interval value

#     Notes
#     -----
#     Details can be find in the function definition [1] with an implementation in scipy package [2]

#     Reference
#     ---------
#         [1] 
#             https://pt.wikipedia.org/wiki/Distribui%C3%A7%C3%A3o_t_de_Student

#         [2] scipy.stats.t
#             https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.t.html  https://stackoverflow.com/questions/12412895/how-to-calculate-probability-in-a-normal-distribution-given-mean-standard-devi
#     """

#     z = RNrmStdDst((1+sc)/2)

#     return CCnfIntAbs(ex, sd, z, n)

def sCnfIntAbs(sd, z, err):
    """
    size Confidence Interval Absolute

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of err considering an 
    interval constant of z with a standard deviantion of sd

    Parameters
    ----------
    sd: float
        Standard Deviantion

    z : float
        Interval Constant

    err:float
        Margin of Error

    Returns
    -------
    sCnfIntAbs: float
                Size of sample
    """

    return (z*sd/err)**2

def sSCnfIntAbs(sd, sc, err):
    """
    size Statistical Confidence Interval Absolute

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of err considering a 
    statiscal confidence of sc with a standard deviantion of sd

    Parameters
    ----------
    sd: float
        Standard Deviantion

    sc: float
        Statiscal Confidence

    err:float
        Margin of Error

    Returns
    -------
    sSCnfIntAbs:float
                Size of sample
    """

    z = RNrmStdDst((1+sc)/2)

    return sCnfIntAbs(sd, z, err)