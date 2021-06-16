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

def nrmStd(x: float):
    """
    Normal Standard Distribution

    Returns the de value of P(X < x) within a normal distribution, 
    expected value = 0  and variance = 1

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

def nrmStd_i(x: float, s: int):
    #x: number expected
    #s: comparsion
    #   if (s == 1):
    #       P(X>x)
    #   if (s == -1):
    #       P(X<x)
    #   comparsion

    px = nrmStd(x)

    print("\nNormal Standard Distribution")
    print("x    = {:.4f}".format(x))

    #equals zero
    if(s == 0):
        return 0

    #P(X < x) where x is positive
    if ((s == -1) & (x > 0)):
        print("P(X<={}) = {:.4f}".format(x, px))

    #P(X < x) where x is negative
    elif((s == -1) & (x < 0)):
        print("P(X<={}) = {:.4f}".format(x, px))

    #P(X > x) where x is positive
    elif((s == 1) & (x > 0)):
        print("P(X>={}) = {:.4f}".format(x, 1-px))

    #P(X > x) where x is negative
    elif((s == 1) & (x < 0)):
        print("P(X>={}) = {:.4f}".format(x, 1-px))

    return px

def nrmStdIntervalInfo(a: float, b: float):

    pa = nrmStd(a)
    pb = nrmStd(b)

    px = pb - pa

    # print("\nNormal Standard Interval Distribution")
    # print("a = {:.4f} and b = {:.4f}".format(a,b))
    # print("E(X) = 0 and V(X) = 1")
    print("P({:.4f} < Z < {:.4f}) = {:.4f}".format(a, b, px))

    return px


def Normal(x: float, mu: float, sg: float):
    return nrmStd((x - mu)/np.sqrt(sg))

def NormalInfo(x: float, mu: float, sg: float, s: int):
    # x:  number expected
    # mu: expected value
    # sg: variance value
    # s:  comparsion
    #
    #   if (s == 1):
    #       P(X>x)
    #   if (s == -1):
    #       P(X<x)
    #   comparsion

    px = Normal(x, mu, sg)

    print("\nNormal Distribution")
    print("x    = {:.4f}".format(x))

    #equals zero
    if(s == 0):
        return 0

    #P(X < x) where x is positive
    if ((s == -1) & (x >= 0)):
        print("P(X<={}) = {:.4f}".format(x, px))

    #P(X < x) where x is negative
    elif((s == -1) & (x < 0)):
        print("P(X< {}) = {:.4f}".format(x, px))

    #P(X > x) where x is positive
    elif((s == 1) & (x >= 0)):
        print("P(X>={}) = {:.4f}".format(x, 1-px))

    #P(X > x) where x is negative
    elif((s == 1) & (x < 0)):
        print("P(X> {}) = {:.4f}".format(x, 1-px))

    return px

def NormalIntervalInfo(a: float, b: float, mu: float, sg: float):
    # P(a < X < b)
    # mu: expected value
    # sg: variance value

    pa = Normal(a, mu, sg)
    pb = Normal(b, mu, sg)

    px = pb - pa

    print("\nNormal Interval Distribution")
    print("a = {:.4f} and b = {:.4f}".format(a,b))
    print("E(X) = 0 and V(X) = 1")
    print("P({:.4f} < Z < {:.4f}) = {:.4f}".format(a, b, px))

    return px

def RNrmStd(px: float):
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

def RNrmStd_i(px: float, greater = False, module = False):
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
    """

    #P(|X| > x) = px
    if greater and module:
        x = RNrmStd(1-px/2)
        print("P(|X| > {:.4f}) = {:.4f}".format(x, px))

    #P(X > x) = px
    elif greater and not module:
        x = RNrmStd(1-px)
        print("P(X > {:.4f}) = {:.4f}".format(x, px))

    #P(|X| < x) = px
    elif not greater and module:
        x = RNrmStd((1+px)/2)
        print("P(|X| < {:.4f}) = {:.4f}".format(x, px))

    #P(X < x) = px
    elif not greater and not module:
        x = RNrmStd(px)
        print("P(X < {:.4f}) = {:.4f}".format(x, px))

    return x

def NormalReverse(px: float, mu: float, sg: float):
    # px: probability P(X < x)
    # mu: expected value
    # sg: variance value

    # print("\nNormal Reverse Distribution")
    # print("px = {:.4f}".format(x))

    return (mu + np.sqrt(sg)*RNrmStd(px))

def NormalReverseInfo(px: float, mu: float, sg: float):
    # px: probability P(X < x)
    # mu: expected value
    # sg: variance value

    print("\nNormal Reverse Distribution")

    x = NormalReverse(px, mu, sg)

    print("P(X < {:.2f}) = {:.4f}: E(X) = {} and V(X) = {}".format(px, x, mu, sg))

    return x

def cnfInt(p, z, n):
    """
    Confidence Interval

    Returns the minimum and maximum values 
    from the probability of p in an amostral distribution
    considering an interval constant of z with a sample of size n

    Parameters
    ----------
    p : float
        probability of population

    z : float
        interval constant

    n : int
        size of sample

    Returns
    -------
    cnfInt : array
             cnfInt[0] error of interval
             cnfInt[1] minimum interval value
             cnfInt[2] maximum interval value
    """

    err = z*np.sqrt(p*(1-p)/n)

    return err, p-err, p+err



def SCnfInt(p, sc, n):
    """
    Statistical Confidence Interval

    Returns the minimum and maximum values 
    from the probability of p in an amostral distribution
    considering an interval constant of z with a sample of size n

    Parameters
    ----------
    p : float
        probability of population

    sc: float
        statistical confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    n : int
        size of sample

    Returns
    -------
    SCnfInt : array
              SCnfInt[0] error of interval
              SCnfInt[1] minimum interval value
              SCnfInt[2] maximum interval value
    """

    z = RNrmStd((1+sc)/2)

    return cnfInt(p, z, n)



def CCnfInt(p, z, n):
    """
    Conservative Confidence Interval

    Returns the minimum and maximum values 
    from the probability of p in an amostral distribution
    considering an interval constant of z with a sample of size n
    with the worst cenario when p = 1/2 and interval is maximum

    Parameters
    ----------
    p : float
        probability of population

    z : float
        interval constant

    n : int
        size of sample

    Returns
    -------
    CCnfInt : array
              CCnfInt[0] error of interval
              CCnfInt[1] minimum interval value
              CCnfInt[2] maximum interval value
    """

    err = z*np.sqrt(1/n)/2

    return err, p-err, p+err



def SCCnfInt(p, sc, n):
    """
    Statistical Conservative Confidence Interval

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering an 
    statistical confidence of sc with a probability p

    Parameters
    ----------
    p : float
        probability of population

    sc: float
        statistical confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    n : int
        size of sample

    Returns
    -------
    SCCnfInt : array
               Minimum in expInt[0] and maximum in expInt[1]
    """

    z = RNrmStd((1+sc)/2)

    return CCnfInt(p, z, n)



def sCnfInt(p, z, e):
    """
    size Confidence Interval

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering an 
    interval constant of z with a probability p

    Parameters
    ----------
    p : float
        probability of population

    z : float
        interval constant

    e : float
        margin of error

    Returns
    -------
    sCnfInt : float
              size of sample
    """

    return (z**2)*(p*(1-p))/(e**2)



def sCCnfInt(p, z, e):
    """
    size Conservative Confidence Interval

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering an 
    interval constant of z with a probability p

    Parameters
    ----------
    p : float
        probability of population

    z : float
        interval constant

    e : float
        margin of error

    Returns
    -------
    sCCnfInt : float
               size of conservative sample
    """

    return (z**2)/(4*e**2)


def sSCnfInt(p, sc, e):
    """
    size Statistical Confidence Interval

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering an 
    statistical confidence of sc with a probability p

    Parameters
    ----------
    p : float
        probability of population

    sc: float
        statistical confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    e : float
        margin of error

    Returns
    -------
    sSCnfInt : float
               Minimum sample for specified error margin
    """

    z = RNrmStd((1+sc)/2)

    return sCnfInt(p, z, e)



def sSCCnfInt(p, sc, e):
    """
    size Statistical Conservative Confidence Interval

    Returns the minimum size n needed for the sample 
    to achieve an desired error margin of e considering an 
    statistical confidence of sc with a probability p

    Parameters
    ----------
    p : float
        probability of population

    sc: float
        statistical confidence

        if  sc == 0.68 then z = 1
            sc == 0.90 then z = 1.64
            sc == 0.95 then z = 1.96
            sc == 0.99 then z = 2.58

    e : float
        margin of error

    Returns
    -------
    sCsCnfInt : float

                sSCCnfInt[0] error of interval
                sSCCnfInt[1] minimum interval value
                sSCCnfInt[2] maximum interval value
    """

    z = RNrmStd((1+sc)/2)

    return sCCnfInt(p, z, e)