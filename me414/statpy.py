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



def Combination(n: int, k: int):
    """
    Combination



    Parameters
    ----------
    n : int
        
    k : int

    Returns
    -------
    px: float
        P(X < x)
    """

    if n < k:
        return 0

    fN  = np.math.factorial(n)
    fK  = np.math.factorial(k)
    fNK = np.math.factorial(n-k)

    cnk = fN/(fK*fNK)

    return cnk



def Bernoulli(x: int, n: int, p: int):
    """
    Bernoulli



    Parameters
    ----------
    x : int
        Result of trial

        if sucess
            x = 1
        if fail
            x = 0

    n : int
        Number of trials

    p : int
        Probability of sucess

    Returns
    -------
    px: float
        P(X < x)
    """

    return (p**(x))*((1-p)**(n-x))



def Binomial(x: int, n: int, p: int):
    """
    Binomial



    Parameters
    ----------
    x : int
        Number of sucesses

    n : int
        Number of trials

    p : int
        Probability of sucess

    Returns
    -------
    px: float
        P(X < x)
    """

    return Combination(n, x)*Bernoulli(x, n, p)



def Binomial_i(x: int, n: int, p: int, greater=False, equal=False):
    """
    Binomial information



    Parameters
    ----------
    x : int
        Number of sucesses

    n : int
        Number of trials

    p : int
        Probability of sucess

    greater : boolean
              Is the dessired value greater?

        if greatter:
            P(X>x)
        else:
            P(X<x)

    equal : boolean
            Is the dessired value equal to x?

        if equal:
            P(X >= x) or P(X <= x)
        else:
            P(X >  x) or P(X <  x)

    Returns
    -------
    Binomial_i: array
                Binomial_i[0] ex: Expected Value
                Binomial_i[1] vr: Variance
                Binomial_i[2] px: P(X  = x)
                Binomial_i[3] px: P(X ?? x)
    """

    px = Binomial(x, n, p)

    pxLower = 0
    for i in range(x):
        pxLower += Binomial(i, n, p)

    # expected value
    ex = n*p
    # variance
    vr = n*p*(1-p)

    if greater and equal:
        # P(X >= x) = px
        return ex, vr, px, 1-pxLower

    elif greater and not equal:
        # P(X >  x) = px
        return ex, vr, px, 1-px-pxLower

    elif not greater and equal:
        # P(X <= x) = px
        return ex, vr, px, px+pxLower

    elif not greater and not equal:
        # P(X <  x) = px
        return ex, vr, px, pxLower



def Geometric(n: int, p: int):
    """
    Geometric



    Parameters
    ----------
    n : int
        Number of trials to sucess

    p : int
        Probability of sucess

    Returns
    -------
    px: float
        P(X = x)
    """

    return p*(1-p)**(n-1)



def Geometric_i(n: int, p: int, greater=False, equal=False):
    """
    Geometric information



    Parameters
    ----------
    n : int
        Number of trials to sucess

    p : int
        Probability of sucess

    greater : boolean
              Is the dessired value greater?

        if greatter:
            P(X>x)
        else:
            P(X<x)

    equal : boolean
            Is the dessired value equal to x?

        if equal:
            P(X >= x) or P(X <= x)
        else:
            P(X >  x) or P(X <  x)

    Returns
    -------
    Geometric_i:array
                Geometric_i[0] ex: Expected Value
                Geometric_i[1] vr: Variance
                Geometric_i[2] px: P(X  = x)
                Geometric_i[3] px: P(X ?? x)
    """
    px = Geometric(n, p)

    pxLower = 0
    for i in range(1,n):
        pxLower += Geometric(i, p)

    # expected value
    ex = 1/p
    # variance
    vr = (1-p)/(p**2)

    if greater and equal:
        # P(X >= x) = px
        return ex, vr, px, 1-pxLower

    elif greater and not equal:
        # P(X >  x) = px
        return ex, vr, px, 1-px-pxLower

    elif not greater and equal:
        # P(X <= x) = px
        return ex, vr, px, px+pxLower

    elif not greater and not equal:
        # P(X <  x) = px
        return ex, vr, px, pxLower



def HGeometric(x: int, n: int, X: int, N: int):
    """
    Hiper Geometric



    Parameters
    ----------
    x : int
        Number of elements selected with A

    n : int
        Number of elements selected

    X : int
        Total number of elements with A

    N : int
        Total number of elements

    Returns
    -------
    px: float
        P(X = x)
    """

    Xx = Combination(X, x)
    Nn = Combination(N, n)
    nx = Combination(N-X,n-x)

    return Xx*nx/Nn



def HGeometric_i(x: int, n: int, X: int, N: int, greater=False, equal=False):
    """
    Hiper Geometric



    Parameters
    ----------
    x : int
        Number of elements selected with A

    n : int
        Number of elements selected

    X : int
        Total number of elements with A

    N : int
        Total number of elements

    greater : boolean
              Is the dessired value greater?

        if greatter:
            P(X>x)
        else:
            P(X<x)

    equal : boolean
            Is the dessired value equal to x?

        if equal:
            P(X >= x) or P(X <= x)
        else:
            P(X >  x) or P(X <  x)

    Returns
    -------
    HGeometric_i:   array
                    HGeometric_i[0] ex: Expected Value
                    HGeometric_i[1] vr: Variance
                    HGeometric_i[2] px: P(X  = x)
                    HGeometric_i[3] px: P(X ?? x)
    """

    px = HGeometric(x, n, X, N)

    pxLower = 0
    for i in range(x):
        pxLower += HGeometric(i, n, X, N)

    # expected value
    ex = n*X/N
    # variance
    vr = ex*(1 - X/N)*(N-n)/(N-1)

    if greater and equal:
        # P(X >= x) = px
        return ex, vr, px, 1-pxLower

    elif greater and not equal:
        # P(X >  x) = px
        return ex, vr, px, 1-px-pxLower

    elif not greater and equal:
        # P(X <= x) = px
        return ex, vr, px, px+pxLower

    elif not greater and not equal:
        # P(X <  x) = px
        return ex, vr, px, pxLower



def Poisson(x: int, n: int, p: int):
    """
    Poisson



    Parameters
    ----------
    x : int
        Number of sucess

    n : int
        Number of trials

    p : int
        Probability of sucess

    Returns
    -------
    px: float
        P(X = x)
    """

    Lambda = n*p

    if (Lambda <= 7) or ((n >= 20) and (p <= 0.05)):
        return (np.exp(-Lambda)*(Lambda)**(x))/np.math.factorial(x)

    return 0



def Poisson_i(x: int, n: int, p: int, greater=False, equal=False):
    """
    Poisson information



    Parameters
    ----------
    x : float
        Number of sucess

    n : float
        Number of trials

    p : float
        Probability of sucess

    greater : boolean
              Is the dessired value greater?

        if greatter:
            P(X>x)
        else:
            P(X<x)

    equal : boolean
            Is the dessired value equal to x?

        if equal:
            P(X >= x) or P(X <= x)
        else:
            P(X >  x) or P(X <  x)

    Returns
    -------
    Poisson_i:  array
                Poisson_i[0] ex: Expected Value
                Poisson_i[1] vr: Variance
                Poisson_i[2] px: P(X  = x)
                Poisson_i[3] px: P(X ?? x)
    """

    Lambda = n*p

    px = Poisson(x, n, p)

    pxLower = 0
    for i in range(x):
        pxLower += Poisson(i, n, p)

    # expected value
    ex = Lambda
    # variance
    vr = Lambda

    if greater and equal:
        # P(X >= x) = px
        return ex, vr, px, 1-pxLower

    elif greater and not equal:
        # P(X >  x) = px
        return ex, vr, px, 1-px-pxLower

    elif not greater and equal:
        # P(X <= x) = px
        return ex, vr, px, px+pxLower

    elif not greater and not equal:
        # P(X <  x) = px
        return ex, vr, px, pxLower



def Exponencial(Lambda: int, x: int):
    """
    Exponencial



    Parameters
    ----------
    Lambda: int
            

    x : int
        

    Returns
    -------
    px: float
        P(X = x)
    """

    if (Lambda < 0):
        return 0

    return (1 - np.exp(-Lambda*x))



def RLExponencial(x: int, p: float):
    """
    Reverse Lambda Exponencial



    Parameters
    ----------
    x : int
        

    p : float
        

    Returns
    -------
    Lambda: float
            
    """

    if (p > 1):
        return 0

    return (-np.log(1-p))/x



def RXExponencial(Lambda: float, p: float):
    """
    Reverse X Exponencial



    Parameters
    ----------
    Lambda: int


    p : float
        

    Returns
    -------
    x : float
        
    """

    if (p > 1):
        return 0

    return (-np.log(1-p))/Lambda



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

    Returns the value of P(X < x) within a normal standard distribution with expected value of 0  and variance of 1

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



def nrmStdDst_i(x: float, greater=False, module=False):
    """
    Normal Standard Distribution information

    Returns the value of P(X < x) within a normal standard distribution with expected value of 0  and variance of 1 and informations of the requisted option.

    Parameters
    ----------
    x : float
        Desired value

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

    Returns
    -------
    px: float

        if greatter:
            P(X>x)
        else:
            P(X<x)
    """

    if module:
        # curve is symmetrical so independent of x signal
        px = nrmStdDst(abs(x))

        if greater:
            # P(|X| > |x|) = px
            return 2-2*px
        else:
            # P(|X| < |x|) = px
            return 2*px-1

    else:
        px = nrmStdDst(x)

        if greater:
            # P( X  >  x ) = px
            return 1-px
        else:
            # P( X  <  x ) = px
            return px



def INrmStdDst(a: float, b: float):
    """
    Interval Normal Standard Distribution

    Returns the value of P(a < X < b) = px and it's extremes within a normal standard distribution with expected value of 0  and variance of 1.

    Parameters
    ----------
    a : float
        Minimum value

    b : float
        Maximum value

    Returns
    -------
    INrmStdDst: array
                INrmStdDst[0] px
                INrmStdDst[1] pa
                INrmStdDst[2] pb
    """

    pa = nrmStdDst(a)
    pb = nrmStdDst(b)

    return pb - pa, pa, pb



def nrmDst(x: float, mu: float, sg: float):
    """
    Normal Distribution

    Returns the value of P(X < x) within a normal distribution with 
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



def nrmDst_i(x: float, mu: float, sg: float, greater=False, module=False):
    """
    Normal Distribution information

    Returns the value of P(X < x) within a normal distribution with expected value of mu  and variance of sg and informations of the requisted option. It computes the value passed in the normalization of the values [1]

    Parameters
    ----------
    x : float
        Desired value

    mu: float
        Expected value

    sg: float
        Variance value

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

    Returns
    -------
    px: float


    Reference
    ---------
        [1] 
            https://en.wikipedia.org/wiki/Normalization_(statistics)
    """

    if module:
        # curve is symmetrical so independent of x signal
        px = nrmDst(abs(x), mu, sg)

        if greater:
            # P(|X| > |x|) = px
            return 2-2*px
        else:
            # P(|X| < |x|) = px
            return 2*px-1

    else:
        px = nrmDst(x, mu, sg)

        if greater:
            # P( X  >  x ) = px
            return 1-px
        else:
            # P( X  <  x ) = px
            return px



def INrmDst(a: float, b: float, mu: float, sg: float):
    """
    Interval NormalDistribution

    Returns the value of P(a < X < b) = px and it's extremes within a normal distribution with expected value of mu and variance of sg.

    Parameters
    ----------
    a : float
        Minimum value

    b : float
        Maximum value

    mu: float
        Expected value

    sg: float
        Variance value

    Returns
    -------
    INrmStdDst: array
                INrmStdDst[0] px
                INrmStdDst[1] pa
                INrmStdDst[2] pb
    """

    pa = nrmDst(a, mu, sg)
    pb = nrmDst(b, mu, sg)

    return pb - pa, pa, pb



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
        return RNrmStdDst(1-px/2)

    #P(X > x) = px
    elif greater and not module:
        return RNrmStdDst(1-px)

    #P(|X| < x) = px
    elif not greater and module:
        return RNrmStdDst((1+px)/2)

    #P(X < x) = px
    elif not greater and not module:
        return RNrmStdDst(px)



def RNrmDst(px: float, mu: float, sg: float):
    """
    Reverse Normal Distribution

    Returns the expected value of the desired probability 
    of a Normal Distribution using the the erfinv function from special with expected value of mu and variance of sg.

    Parameters
    ----------
    px: float

        P(X < x) = px, probability of distribution

    mu: float
        Expected value

    sg: float
        Variance value

    Returns
    -------
    x : float
        expected value
    """

    return (mu + np.sqrt(sg)*RNrmStdDst(px))



def RNrmDst_i(px: float, mu: float, sg: float, greater = False, module = False):
    """
    Reverse Normal Standard Distribution information

    Returns the expected value of the desired probability of 
    a Normal Standard Distribution using the erfinv function 
    from special package with computes the error function

    Parameters
    ----------
    px: float
        Probability of normal standard distribution

    mu: float
        Expected value

    sg: float
        Variance value

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
        return RNrmDst(1-px/2, mu, sg)

    #P(X > x) = px
    elif greater and not module:
        return RNrmDst(1-px, mu, sg)

    #P(|X| < x) = px
    elif not greater and module:
        return RNrmDst((1+px)/2, mu, sg)

    #P(X < x) = px
    elif not greater and not module:
        return RNrmDst(px, mu, sg)



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