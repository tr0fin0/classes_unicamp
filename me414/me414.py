import numpy as np

# parte 1 e 2
if(False):
    aux = [25,13,25,26,27,10,23,16,15,2,8] #base de dados inicial
    end = [] #base de dados final
    mul = 1 #multiplicador para os valores

    #multiplica valores do aux, usado para calcular os valores quando a base é modificada por uma multiplicação
    for i in range(len(aux)):
        end.append(aux[i]*mul)

    #caso hajam valores estes deve ser incluidos na tabela de frequência, do contrário será necessário modificar a variável
    val = np.array(end)
    freq = np.array([1,1,1,1,1,1,1,1,1,1,1])
    data = np.repeat(val, freq)

    print(data)
    print("soma", np.sum(data))
    print("média", data.mean())
    print("mediana",np.median(data))
    print("desvio padrão ",np.std(data, ddof=1))


# parte 3 e 4
if(False):
    val = np.array([20.35, 26.75, 23.2, 20.3])
    freq = np.array([16, 9, 6, 8])
    data = np.repeat(val, freq)

    # data = np.array([5, 14, 23, 27, 27, 19, 12, 18, 8, 11, 30, 10, 15])
    data = np.array(
        [
            2.26, 1.8, 2.5, 1.12, 2.76, 2.64, 1.47,
            1.25, 2.11, 1.94, 1.25, 1.83, 2.89, 1.66
        ]
    )
    data.sort()

    # Q1, Q2, Q3 = np.quantile(data, [0.25, 0.5, 0.75]) # Método diferente do implementado pela professora? o que está acontecendo aqui?


    #quartis
    meio = int(data.size/2)
    l1 = data[:meio]
    l2 = data[-meio:]
    # l1, l2 = np.split(data, 2)
    print(l1)
    print(l2)
    Q1 = np.median(l1)
    Q2 = np.median(data)
    Q3 = np.median(l2)
    IQ = Q3-Q1
    Lim_inf = Q1 - 1.5*IQ
    Lim_sup = Q3 + 1.5*IQ
    t = data[np.where(data > Lim_inf)]
    lim_inf_box = t[0]
    t = data[np.where(data < Lim_sup)]
    lim_sup_box = t[-1]


    print(data)
    print("soma", np.sum(data))
    print("média", data.mean())
    print("mediana", np.median(data))
    print("desvio padrão ", np.std(data, ddof=1))
    print("Q1: {:.2f}".format(Q1))
    print("Q2: {:.2f}".format(Q2))
    print("Q3: {:.2f}".format(Q3))
    print("IQ: {:.2f}".format(IQ))
    print("Limite inferior teorico: {:.2f}".format(Lim_inf))
    print("Limite superior teorico: {:.2f}".format(Lim_sup))
    print("Limite inferior real: {:.2f}".format(lim_inf_box))
    print("Limite superior real: {:.2f}".format(lim_sup_box))

    #dados
    x = np.array([0.63,1.83,0.13,0.21,-1.30,-0.26,0.77,2.79,-1.13,0.60,-0.63,-0.03,0.43 ,0.12,0.03,-1.39,-0.68,0.20])
    y = np.array([0.78,1.97,0.34,0.30,-0.12,-0.04,0.49,1.43,-1.63,0.33,-0.63,0.01 ,-0.47,0.03,1.17,-2.44,-1.08,0.77])

    #coeficiente de correlação
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


    print("média x: {:.2f}".format(x.mean()))
    print("média y: {:.2f}".format(y.mean()))
    print("desvio padrão x: {:.2f}".format(np.std(x, ddof=1)))
    print("desvio padrão y: {:.2f}".format(np.std(y, ddof=1)))
    print("coeficiente de correlação: {:.2f}".format(ccxy(x,y)))

#parte 5 a 8
if(False):
    # 6: 1 2 3 4 5 6, 6
    # 5: 2 3 4 5 6,   5
    # 4: 3 4 5 6,     4
    # 3: 4 5 6,       3
    # 2: 5 6          2
    # 1: 6            1 -> 21/36

    # soma <= 11
    # 6: 1 2 3 4 5
    # 5: 1 2 3 4 5 6
    # 4: 1 2 3 4 5 6
    # 3: 1 2 3 4 5 6
    # 2: 1 2 3 4 5 6
    # 1: 1 2 3 4 5 6

    aIb   = 0.4958
    acIb  = 0.2442
    aIbc  = 0.1742
    acIbc = 0.0858

    a = aIb + aIbc
    b = aIb + acIb
    aUb = aIbc + aIb + acIb
    
    acUb = 1 - a + aIb
    aUbc = 1 - b + aIb
    acUbc = 1 - aIb

    ba = aIb/a
    acbc = acIbc/(1-b)
 
    acb = acIb/b
    bca = aIbc/a
    bac = acIb/(1-a)

    print("P(A):       {:.2f}".format(a))
    print("P(B):       {:.2f}".format(b))
    print("P(A  U B):  {:.4f}".format(aUb))
    print("P(Ac U B):  {:.4f}".format(acUb))
    print("P(A  U Bc): {:.4f}".format(aUbc))
    print("P(Ac U Bc): {:.4f}".format(acUbc))
    print("P(B  | A):  {:.2f}".format(ba))
    print("P(Ac | Bc): {:.2f}".format(acbc))
    print("P(Ac | B):  {:.2f}".format(acb))
    print("P(Bc | A):  {:.2f}".format(bca))
    print("P(B  | Ac): {:.2f}".format(bac))

#partes 9 à 11
if(False):
    #==========================
    #expectedValue and variance
    print("="*35)
    values = np.array([0, 49, 62])
    weight = np.array([0.48, 0.45, 0.07])

    expectedValue = np.sum(values*weight)
    varianceValue = np.sum((values*values)*weight) - expectedValue**2

    #function: Y = aX + b, when necessary
    a = 1
    b = 0
    expectedValueY    = a*expectedValue + b
    varianceValueY    = (a**2)*varianceValue
    standardDeviation = varianceValueY**(1/2)

    print("esperança: {:.4f}".format(expectedValueY))
    print("variância: {:.4f}".format(varianceValueY))
    print("desvio padrão: {:.4f}".format(standardDeviation))
# %%
    #======================
    #combine expected value
    print("\n"+"="*35)
    x1 = 2.38
    x2 = 17.3
    a1 = -6
    a2 = -18

    expectedValueR = a1*x1 + a2*x2
    varianceValueR = (a1**2)*x1 + (a2**2)*x2

    print("esperança resultante: {:.4f}".format(expectedValueR))
    print("variância resultante: {:.4f}".format(varianceValueR))
# %%
    #===============
    #square variable
    print("\n"+"="*35)
    expectedValue = -20
    varianceValue = 13.2

    #V(X) = E(X^2) - (E(X))^2
    expectedValue2 = varianceValue + expectedValue**2
    expectedValue2 = 417.3 #comment this line when variance is given
    varianceValue = expectedValue2 - expectedValue**2

    print("esperança quadrado: {:.4f}".format(expectedValue2))
    print("variância: {:.4f}".format(varianceValue))

    #===========
    #air company
    print("\n"+"="*35)
    passageiros = 104
    mala1 = 44
    mala2 = mala1 + 55

    X = np.array([0, 1, 2])
    values = np.array([0, mala1, mala2])
    weight = np.array([0.35, 0.33, 0.32])

    expectedX = np.sum(X*weight)
    expectedValue = np.sum(values*weight)
    varianceValue = np.sum((values*values)*weight) - expectedValue**2
    standardDeviation = varianceValue**(1/2)

    print("esperança mala passageiro: {:.4f}".format(expectedX))
    print("esperança mala total: {:.4f}".format(expectedX*passageiros))
    print("esperança ganho passageiro: {:.4f}".format(expectedValue))
    print("esperança ganho total: {:.4f}".format(expectedValue*passageiros))
    print("desvio padrão ganho passageiro: {:.4f}".format(standardDeviation))
    print("desvio padrão ganho total: {:.4f}".format(standardDeviation*(passageiros)**(1/2)))

    #===================
    #distribution models
    print("\n"+"="*35)

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


    b = BinomialInfo(1, 8, 0.08)
    g = GeometricInfo(2, 0.61)
    h = HiperGeometricInfo(4, 6, 10, 18)
    p = PoissonInfo(3, 3/12, 12)

#%%
# partes 12 e 13
if(True):
    # from scipy.integrate import quad
    import numpy as np

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

    #exercice 67
    n1 = 18
    n2 = 20
    lb = 1/10
    e1 = ExponencialInfo(lb, n1)
    e2 = Exponencial(lb, n2)
    print("P({}<X<{}) = {:.4f}".format(n1, n2, e2-e1))

    #exercice 68
    e = ExponencialReverseL(17, 0.47)
    e = ExponencialReverseX(0.0373, 0.15)

    #exercice 69
    n = 2
    e = 0.5
    c = (n+2)*e/(n+1)
    b = (n+1)/(c**(n+1))
    pc3 = 1/(3**(n+1))
    vx = (b*c**(n+3))/(n+3) - e**2

    print("\nb = {:.4f}\nc = {:.4f}\npc3 = {:.4f}\nvx = {:.4f}".format(b, c, pc3, vx))

    #exercice 70
    from  scipy import special
    from  scipy.integrate import quad

    def NormalStandard(x: float):
        # x: number expected
        #
        # px: P(X < x)

        return 1/2*(special.erf(x/(np.sqrt(2))) + 1)

    def NormalStandardInfo(x: float, s: int):
        #x: number expected
        #s: comparsion
        #   if (s == 1):
        #       P(X>x)
        #   if (s == -1):
        #       P(X<x)
        #   comparsion

        px = NormalStandard(x)

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

    n = NormalStandardInfo(0.18, -1)
    n = NormalStandardInfo(-0.27, 1)
    n = NormalStandardInfo(0.37, 1)
    n = NormalStandardInfo(-1.03, 1)
    n = NormalStandardInfo(0.8, 1)
    n = NormalStandardInfo(-1.06, -1)

    #exercice 71
    def NormalStandardIntervalInfo(a: float, b: float):

        pa = NormalStandard(a)
        pb = NormalStandard(b)

        px = pb - pa

        # print("\nNormal Standard Interval Distribution")
        # print("a = {:.4f} and b = {:.4f}".format(a,b))
        # print("E(X) = 0 and V(X) = 1")
        print("P({:.4f} < Z < {:.4f}) = {:.4f}".format(a, b, px))

        return px

    n = NormalStandardIntervalInfo(-1.9, 0.03)
    n = NormalStandardIntervalInfo(0.14, 0.62)
    n = NormalStandardIntervalInfo(0.67, 2.03)
    n = NormalStandardIntervalInfo(-1.14, 0.34)
    n = NormalStandardIntervalInfo(-1.34, 0.36)
    n = NormalStandardIntervalInfo(1.1, 2.42)

    #exercice 72
    def Normal(x: float, mu: float, sg: float):
        return NormalStandard((x - mu)/np.sqrt(sg))

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

    if(False):
        mu = 9
        sg = 9
        n = NormalIntervalInfo(8.72, 11.35, mu, sg)

    #exercice 73
    def NormalStandardReverse(px: float):
        # px: P(X < x)
        #
        # x: expected value

        return np.sqrt(2)*special.erfinv(2*px - 1)

    def NormalStandardReverseInfo(px: float, s: int, m: int):
        # px: number expected
        #  s: comparsion
        #   if (s == 1):
        #       P(X>x)
        #   if (s == -1):
        #       P(X<x)
        #   comparsion
        #
        #  m: module
        #   if (m == 1):
        #       P(|X| > x) or P(|X| < x)
        #   if (s == 0):
        #       P(X > x) or P(X < x)
        #   comparsion

        # |A| > a: A > a or A < -a
        # |A| < a: A < a or A > -a, -a < A < a

        # print("\nNormal Standard Reverse Distribution")
        # print("px = {:.4f}".format(x))

        #equals zero
        if(s == 0):
            return 0

        #P(X < x) = px
        if ((s == -1) & (m == 0)):
            x = NormalStandardReverse(px)
            print("P(X < {:.4f}) = {:.4f}".format(x, px))

        #P(|X| < x) = px
        elif((s == -1) & (m == 1)):
            x = NormalStandardReverse((1+px)/2)
            print("P(|X| < {:.4f}) = {:.4f}".format(x, px))

        #P(X > x) = px
        elif((s == 1) & (m == 0)):
            x = NormalStandardReverse(1-px)
            print("P(X > {:.4f}) = {:.4f}".format(x, px))

        #P(|X| > x) = px
        elif((s == 1) & (m == 1)):
            x = NormalStandardReverse(1-px/2)
            print("P(|X| > {:.4f}) = {:.4f}".format(x, px))

        return x

    if(False):
        x = NormalStandardReverseInfo(0.6201, 1, 0)
        x = NormalStandardReverseInfo(0.9525, 1, 0)
        x = NormalStandardReverseInfo(0.6527, -1, 0)
        x = NormalStandardReverseInfo(0.5837, -1, 0)
        x = NormalStandardReverseInfo(0.5152, 1, 1)
        x = NormalStandardReverseInfo(0.8006, 1, 1)
        x = NormalStandardReverseInfo(0.4293, -1, 1)
        x = NormalStandardReverseInfo(0.4541, -1, 1)

    #exercice 74
    def NormalReverse(px: float, mu: float, sg: float):
        # px: probability P(X < x)
        # mu: expected value
        # sg: variance value

        # print("\nNormal Reverse Distribution")
        # print("px = {:.4f}".format(x))

        return (mu + np.sqrt(sg)*NormalStandardReverse(px))

    def NormalReverseInfo(px: float, mu: float, sg: float):
        # px: probability P(X < x)
        # mu: expected value
        # sg: variance value

        print("\nNormal Reverse Distribution")

        x = NormalReverse(px, mu, sg)

        print("P(X < {:.2f}) = {:.4f}: E(X) = {} and V(X) = {}".format(px, x, mu, sg))

        return x
    if(False):
        n = NormalReverseInfo(0.99, 25, 6**2)

    #exercice 75
    if(False):
        n = NormalReverseInfo(0.82, 491, 47**2)
        n = NormalReverseInfo(0.86, 491, 47**2)

    #exercice 76
    if(False):
        n = NormalInfo(30000, 39000, 8000**2, 1)
        n = NormalInfo(30000, 32000, 6000**2, 1)

    #exercice 77
    if(False):
        p  = 0.22 #probability of study
        n  = 55   #number expected
        N  = 200  #number of population
        hp = NormalInfo(n/N, p, p*(1-p)/N, 1)

    #exercice 78
    if(True):
        lb = 1/11
        ex = 1/lb
        vx = ex**2
        e1 = ExponencialInfo(lb, 11)
        e2 = ExponencialReverseX(lb, 0.17)
        e3 = lb
        e4 = NormalReverseInfo(0.17, ex, vx/60)

        print(
            "\nexercice 78:" + 
            "\n a) {:.4}".format(ex) + 
            "\n b) {:.4}".format(vx) + 
            "\n c) {:.4}".format(1-e1) + 
            "\n d) {:.4}".format(ex) + 
            "\n e) {:.4}".format(e2) + 
            "\n f) {:.4}".format(e3) + 
            "\n g) {:.4}".format(e4)
        )

    #exercice 79
    if(False):
        ex = 35000 # média em milhas
        dp = 18000 # desvio padrão em milhas
        n  = 45    # participantes do programa
        b  = 10    # bônus em reais
        m  = 1000  # milhas percorridas
        a1 = 13950 # mínimo bonificação
        a2 = 17100 # máxima bonificação
        b1 = 17550 # mínimo esperado

        mi = a1*m/b/n # mínimo de milhas
        ma = a2*m/b/n # máximo de milhas
        vx = dp**2/n  # variância em milhas
        pa = NormalIntervalInfo(mi, ma, ex, vx)

        me = b1*m/b/n # mínimo em milhas
        pb = NormalInfo(me, ex, vx, 1)

        print(
            "\nexercice 79:" + 
            "\n a) mi: {}".format(mi) + 
            "\n    ma: {}".format(ma) + 
            "\n    ex: {}".format(ex) + 
            "\n    vx: {:.4}".format(vx) + 
            "\n    pa: {:.4}".format(pa) + 
            "\n b) ex: {}".format(ex) + 
            "\n    vx: {:.4}".format(vx) + 
            "\n    me: {}".format(me) + 
            "\n    pb: {:.4}".format(1-pb)
        )