import numpy as np
import scipy as sp
import statpy as stat

from scipy.stats import t

#exercice 67
if(False):
    n1 = 18
    n2 = 20
    lb = 1/10
    e1 = stat.Exponencial(lb, n1)
    e2 = stat.Exponencial(lb, n2)
    print("P(   X<{}) = {:.4f}".format(n1, e1))
    print("P({}<X<{}) = {:.4f}".format(n1, n2, e2-e1))

#exercice 68
if(False):
    e1 = stat.RLExponencial(17, 0.47)
    e2 = stat.RXExponencial(e1, 0.15)

    print(
        "\nexercice 68:" + 
        "\n a) {:.4}".format(e1) + 
        "\n b) {:.4}".format(e2)
    )


#exercice 69
if(False):
    n = 2
    e = 0.5
    # integral para funcao acumulada
    # integral para esperanca
    c = (n+2)*e/(n+1)
    b = (n+1)/(c**(n+1))
    pc3 = 1/(3**(n+1))
    vx = (b*c**(n+3))/(n+3) - e**2

    print(
        "\nexercice 69:" + 
        "\n a) {:.4}".format(b) + 
        "\n b) {:.4}".format(c) + 
        "\n c) {:.4}".format(pc3) + 
        "\n d) {:.4}".format(vx)
    )


#exercice 70
if(False):

    print(
        "\nexercice 70:" + 
        "\n a) {:.4}".format(stat.nrmStdDst_i( 0.18)) + 
        "\n b) {:.4}".format(stat.nrmStdDst_i(-0.27, True)) + 
        "\n c) {:.4}".format(stat.nrmStdDst_i( 0.37, True)) + 
        "\n d) {:.4}".format(stat.nrmStdDst_i(-1.03, True)) + 
        "\n e) {:.4}".format(stat.nrmStdDst_i( 0.80, True)) + 
        "\n f) {:.4}".format(stat.nrmStdDst_i(-1.06)) + 
        "\n g) {:.4}".format(0.0)
    )

#exercice 71
if(False):
    print(
        "\nexercice 71:" + 
        "\n a) {:.4}".format(stat.INrmStdDst(-1.90, 0.03)[0]) + 
        "\n b) {:.4}".format(stat.INrmStdDst( 0.14, 0.62)[0]) + 
        "\n c) {:.4}".format(stat.INrmStdDst( 0.67, 2.03)[0]) + 
        "\n d) {:.4}".format(stat.INrmStdDst(-1.14, 0.34)[0]) + 
        "\n e) {:.4}".format(stat.INrmStdDst(-1.34, 0.36)[0]) + 
        "\n f) {:.4}".format(stat.INrmStdDst( 1.10, 2.42)[0])
    )

#exercice 72
if(False):
    mu = 9
    sg = 9
    print(
        "\nexercice 72:" + 
        "\n a) {:.4}".format(stat.INrmDst( 7.22, 11.10, mu, sg)[0]) + 
        "\n b) {:.4}".format(stat.INrmDst( 4.87, 12.19, mu, sg)[0]) + 
        "\n c) {:.4}".format(stat.INrmDst( 8.72, 11.35, mu, sg)[0])
    )

#exercice 73
if(False):
    print(
        "\nexercice 73:" + 
        "\n a) {:.4}".format(stat.RNrmStdDst_i(0.6201, True, False)) + 
        "\n b) {:.4}".format(stat.RNrmStdDst_i(0.9525, True, False)) + 
        "\n c) {:.4}".format(stat.RNrmStdDst_i(0.6527, False, False)) + 
        "\n d) {:.4}".format(stat.RNrmStdDst_i(0.5837, False, False)) + 
        "\n e) {:.4}".format(stat.RNrmStdDst_i(0.5152, True, True)) + 
        "\n f) {:.4}".format(stat.RNrmStdDst_i(0.8006, True, True)) + 
        "\n g) {:.4}".format(stat.RNrmStdDst_i(0.4293, False, True)) + 
        "\n h) {:.4}".format(stat.RNrmStdDst_i(0.4541, False, True))
    )

#exercice 74
if(False):
    print(
        "\nexercice 74:" + 
        "\n a) {:.4}".format(stat.RNrmDst(0.99, 25, 6**2))
    )

#exercice 75
if(False):
    print(
        "\nexercice 75:" + 
        "\n a) {:.4}".format(stat.RNrmDst_i(1-0.18, 491, 47**2)) + 
        "\n b) {:.4}".format(stat.RNrmDst_i(1-0.14, 491, 47**2))
    )

#exercice 76
if(False):
    print(
        "\nexercice 76:" + 
        "\n a) {:.4}".format(stat.nrmDst_i(30000, 39000, 8000**2, True)) + 
        "\n b) {:.4}".format(stat.nrmDst_i(30000, 32000, 6000**2, True))
    )

#exercice 77
if(False):
    p  = 0.22 #probability of study
    n  = 55   #number expected
    N  = 200  #number of population
    print(
        "\nexercice 77:" + 
        "\n a) {:.4}".format(stat.nrmDst_i(n/N, p, p*(1-p)/N, True))
    )

#exercice 78
if(False):
    # exponencial distribution
    lb = 1/20  # lambda

    print(
        "\nexercice 78:" + 
        "\n a) {:.4}".format(1/lb) + 
        "\n b) {:.4}".format((1/lb)**2) + 
        "\n c) {:.4}".format(stat.Exponencial_i(lb, 20, True)[2]) + 
        "\n d) {:.4}".format(1/lb) + 
        "\n e) {:.4}".format(stat.RXExponencial(lb, 0.63)) + 
        "\n f) {:.4}".format(np.sqrt((1/lb)**2/190)) + 
        "\n g) {:.4}".format(stat.RNrmDst(0.63, 1/lb, (1/lb)**2/190))
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
    pa = stat.INrmDst(mi, ma, ex, vx)[0]

    me = b1*m/b/n # mínimo em milhas
    pb = stat.nrmDst_i(me, ex, vx, True)

    print(
        "\nexercice 79:" + 
        "\n a) pa: {:.4}".format(pa) + 
        "\n b) pb: {:.4}".format(pb)
    )

# exercice 80
if(False):
    # uniform distribution
    mi = 65 # minimum value
    ma = 84 # maximum value

    # a)
    a1 = (mi + ma)/2 # expected value

    # b)
    n = 121 # size sample
    vx = ((ma - mi)**2)/12
    b1 = np.sqrt(vx/n)

    print(
        "\nexercice 80:" + 
        "\n a) {:.4}".format(a1) + 
        "\n b) {:.4}".format(b1)
    )

# exercice 81
if(False):
    # exponencial distribution
    # a)
    ex = 3.0   # expected value
    vx = ex**2 # variance value

    # b)
    lb = 1/ex # lamba
    px = 0.56 # total of students
    dx = stat.RXExponencial(lb, px)

    # c)
    n = 200 #total of sample
    ep = np.sqrt(vx/n)

    # d)
    dm = stat.RNrmDst(px, ex, vx/n)

    print(
        "\nexercice 81:" + 
        "\n a) {:.4}".format(ex) + 
        "\n b) {:.4}".format(dx) + 
        "\n c) {:.4}".format(ep) + 
        "\n d) {:.4}".format(dm)
    )

# exercice 82
if(False):
    # bernoulli distribution
    s = 1/38  # probability of sucess
    f = 1 - s # probability of failler
    G = 35    # gain value
    L = -1    # lost value

    # a)
    ex = G*s + L*f # expected value

    # b)
    vx = ((G-ex)**2)*s + ((L-ex)**2)*f # variance value
    dp = vx**(1/2) # normal deviation

    # c)
    n = 791 # number of trials
    pc = stat.nrmDst_i(0, ex, vx/n, True)

    print(
        "\nexercice 82:" + 
        "\n a) {:.4}".format(ex) + 
        "\n b) {:.4}".format(dp) + 
        "\n c) {:.4}".format(pc)
    )

# exercice 83
if(False):
    p = 0.73 # probabilidade pesquisa
    n = 784  # tamanho da amostra

    # a) b)
    ic = 0.90 # intervalo de confiança
    ei = stat.SCnfIntPrp(p, ic, n)

    # c)
    erro = ei[0]*100

    # d)
    pe = 0.70
    d = ei[1] > pe

    print(
        "\nexercice 83:" + 
        "\n a) {:.4}".format(ei[1]) + 
        "\n b) {:.4}".format(ei[2]) + 
        "\n c) {:.4}".format(erro) + 
        "\n d) " + str(d)
    )

# exercice 84
if(True):
    f = 46  # quantidade de fumantes
    n = 108 # tamanho da amostra

    # a)
    p = f/n # proporção de fumantes

    #  b) c) d)
    ic = 0.90 # intervalo de confiança
    ei = stat.SCnfIntPrp(p, ic, n)

    # e) tamanho intervalo de confiança
    e = 0.04
    size1 = stat.sSCnfIntPrp(p, ic, e)

    # f) tamanho intervalo de confiança conservador
    size2 = stat.sSCCnfIntPrp(p, ic, e)

    print(
        "\nexercice 84:" + 
        "\n a) {:.4}".format(p) + 
        "\n b) {:.4}".format(ei[1]) + 
        "\n c) {:.4}".format(ei[2]) + 
        "\n d) {:.4}".format(ei[0]*100) + 
        "\n e) {:.4}".format(size1) + 
        "\n f) {:.4}".format(size2)
    )

# exercice 85
if(True):
    ex = 106   # valor esperado/amostra
    dp = 21.54 # desvio padrão/amostra
    n  = 543   # tamanho amostral
    ic = 0.99  # intervalo de confiança

    # a) b)
    ei = stat.SCnfIntAbs(ex, dp, ic, n)

    print(
        "\nexercice 85:" + 
        "\n a) {:.4}".format(ei[1]) + 
        "\n b) {:.4}".format(ei[2])
    )

# exercice 86
if(False):
    n  = 30      # tamanho da amostra
    mi = 22.90   # min
    ma = 28.43   # max
    ex = 26.06   # median
    me = 26.00   # mean
    vx = 2.06159 # var
    sd = 1.43582 # std dev
    cv = 0.05523 # coef var
    ic = 0.95    # confidence interval 2 sd

    # c)
    ei = stat.SCnfIntAbs(ex, sd, ic, n)
    q = 27 # quantidade de creditos
    print(ei[2])
    c = 2.0
    if (q-ei[2])>0: c =1.0

    #d
    d = 0.26214 # SE.mean

    #e
    ic = 0.99 # confidence interval
    ei = stat.SCnfIntAbs(ex, sd, ic, n)

    print(
        "\nexercice 86:" + 
        "\n a) {:.4}".format(ex) + 
        "\n b) {:.4}".format(sd) + 
        "\n c) {:.4}".format(c) + 
        "\n d) {:.4}".format(d) + 
        "\n e) {:.4}".format(ei[2])
    )

# exercice 88
if(False):
    vx = 14 # variance
    n  = 12 # size of sample

    s = np.array([
        14,
        12,
        10,
        12,
        17,
        8,
        13,
        17,
        10,
        12,
        22,
        19
    ])

    # a)
    ex = np.mean(s)

    # b) c) d)
    sc = 0.99
    sd = np.sqrt(vx)
    ic = stat.SCnfIntAbs(ex, sd, sc, n)

    # e)
    err = 2
    nn = stat.sSCnfIntAbs(sd, sc, err)

    # f)
    vd = np.var(s, ddof=1)

    # use this site: http://www.bertolo.pro.br/FinEst/Estatistica/DistribuicaoProbabilidades2/t/index.html
    # p-value: 1-sc
    # g.l:     n-1  graus de liberdade
    t = 3.106

    nnm = stat.cnfIntAbs(ex, np.sqrt(vd), t, n)

    print(
        "\nexercice 88:" + 
        "\n a) {:.6}".format(ex) + 
        "\n b) {:.6}".format(ic[1]) + 
        "\n c) {:.6}".format(ic[2]) + 
        "\n d) {:.6}".format(ic[0]) + 
        "\n e) {:.6}".format(nn) + 
        "\n f) {:.6}".format(nnm[2])
    )

# exercice 89
if(False):
    na = 48 # number of adults
    ia = 13 # number of infected adults
    ph = ia/na # porcentagem of infected
    po = 0.30  # null hipotese

    z = (ph - po)/np.sqrt(po*(1-po)/na)
    pz = 0.6700 # from tables
    print(pz, stat.nrmStdDst(-z))

    pvalue = 2*(1-pz)
    pvalue1 = 2*(1-stat.nrmStdDst(-z))
    pvalue2 = 2*stat.nrmStdDst(z)

    print(
        "\nexercice 89:" + 
        "\n          z: {:.4}".format(z) +
        "\n a) p value1: {:.4}".format(pvalue1) +
        "\n a) p value2: {:.4}".format(pvalue2) +
        "\n a) p value: {:.4}".format(pvalue)
    )

# exercice 90
if(False):
    n = 202    # total of amostral sample
    p = 135    # part of amostral sample
    ph = p/n   # porcentagem of amostral sample
    po = 0.60  # null hipotese

    z = (ph - po)/np.sqrt(po*(1-po)/n)

    pvalue = stat.nrmStdDst_i(z, True) # greatter = True

    print(
        "\nexercice 90:" + 
        "\n a) p-value: {:.4}".format(pvalue)
    )

# exercice 91
if(False):
    n =  73    # total of amostral sample
    ph = 0.44  # percentage of amostral sample
    po = 0.28  # percentage of population
    ns = 0.1  # nivel de significanca

    z = (ph - po)/np.sqrt(po*(1-po)/n)

    pvalue = stat.nrmStdDst_i(z, True) # greatter = True

    e = pvalue < ns
    print(
        "\nexercice 91:" + 
        "\n a) test:    " + 1 + 
        "\n b) test:    " + 3 + 
        "\n c) test:    {:.4}".format(z) +
        "\n d) p-value: {:.4}".format(pvalue) + 
        "\n e) p-value: "+ str(e)
    )

# exercice 92
if(False):
    mean_amazon = 46.99 # selling price in amazon
    n      = 14         # total of adds
    mean   = 44.55
    vare   = 10.297
    stddev =  3.209
    semean =  0.858
    ns = 0.05

    # c
    z = (mean - mean_amazon)/(stddev/np.sqrt(n)) # slide 18 page 20

    # d
    # http://me414-unicamp.github.io/about/Tabelas-impressao.pdf
    # t student distribution
    # v = n-1
    # t_ns = -t_(1-ns)
    pvalue = -1.771

    # e
    e = pvalue < ns
    print(
        "\nexercice 92:" + 
        "\n a) test:    " + str(1) + 
        "\n a) test:    " + str(3) + 
        "\n c) test:   {:.4}".format(z) +
        "\n d) p-value: {:.4}".format(pvalue) + 
        "\n e) p-value: "+ str(e)
    )

# exercice 93
if(False):
    exA      = 720

    size_sample       = 15
    mean_sample       = 732.1
    variance_sample   = 1615.5

    # c
    z = (
        mean_sample - exA
        )/(
        np.sqrt(variance_sample/size_sample)
        ) # slide 18 page 20

    # d
    # http://me414-unicamp.github.io/about/Tabelas-impressao.pdf
    # t student distribution
    # v = n-1
    # t_{1-ns/2}
    ns = 0.1
    pvalue = 1.761

    # e
    e = pvalue < ns
    print(
        "\nexercice 93:" + 
        "\n a) test:    " + str(1) + 
        "\n a) test:    " + str(4) + 
        "\n c) test:   {:.4}".format(z) +
        "\n d) p-value: {:.4}".format(pvalue) + 
        "\n e) p-value: "+ str(e)
    )

# exercice 94
if(False):
    exA      = 1700

    size_sample       = 210
    mean_sample       = 1705
    nDeviation_sample = 160

    # a
    test_value = (
                mean_sample - exA
                )/(
                nDeviation_sample/np.sqrt(size_sample)
                ) # slide 18 page 20

    # b
    # http://me414-unicamp.github.io/about/Tabelas-impressao.pdf
    # t student distribution
    # v = n-1
    # t_{1-ns/2} bicaudal
    ns = 0.05
    critical_value = 1.960

    # c
    pvalue = stat.nrmStdDst_i(test_value,True,True)

    # d
    e = pvalue < ns

    print(
        "\nexercice 94:" + 
        "\n a) test_value:     {:.4}".format(test_value) + 
        "\n b) critical_value: {:.4}".format(critical_value) + 
        "\n c) p-value:        {:.4}".format(pvalue) +
        "\n d) accepted:       " + str(e)
    )

# exercice 95
if(False):
    nA = 11.0
    nB = 15.0

    exA = 50.45
    exB = 35.07

    vrA = 242.67
    vrB = 247.35

    # c
    c = exA - exB

    # d
    sc = 0.99

    d = stat.CCnfIntAbs(
        exA, exB, 
        vrA, vrB, 
        nA, nB, 
        sc)

    # e
    ns = 0.01
    e = c < ns

    print(
        "\nexercice 95:" + 
        "\n a) {:.4}".format(exA) + 
        "\n b) {:.4}".format(exB) + 
        "\n c) {:.4}".format(c) + 
        "\n d) {:.4}".format(d[1]) + 
        "\n e) {:.4}".format(d[2]) + 
        "\n f) " + str(e)
    )

# exercice 96
if(False):
    vrA = 102
    vrB = 102

    nA = 16
    nB = 23

    exA = 54.06
    exB = 58.65

    sc = 0.96

    # a
    a = stat.SCnfIntAbs(exA, np.sqrt(vrA), sc, nA)

    # b
    b = stat.SCnfIntAbs(exB, np.sqrt(vrB), sc, nB)

    # c
    c = stat.SCnfIntAbsP(exA, exB, vrA, vrB, nA, nB, sc)

    cStr = True

    print(
        "\nexercice 96:" + 
        "\n a) {:.4}".format(a[1]) + 
        "\n b) {:.4}".format(b[2]) + 
        "\n c) " + str(cStr) + 
        "\n d) {:.4}".format(2*c[0]) + 
        "\n e) {:.4}".format(c[0])
    )

# exercice 97
if(False):
    nN = 115#122 148
    nL = 115#122 148

    fvN = 18#29 18
    fvL = 15#18 8

    # a
    a = fvN/nN

    # b
    b = fvL/nL

    # c
    c = a - b

    # d
    sc = 0.99#0.99 0.95
    d = stat.SCnfIntPrpP(a, b, nN, nL, sc)

    # c
    c = a - b

    # g
    phat = (nN*a + nL*b)/(nN + nL)
    zobs = (a - b)/np.sqrt(phat*(1-phat)*(1/nN + 1/nL))

    za = stat.nrmStdDst_i(1-(sc)/2,True,True)
    pvalue = stat.nrmStdDst_i(zobs,True,True)

    g1 = pvalue < 1-sc

    print(
        "\nexercice 97:" + 
        "\n a) {:.4}".format(a) + 
        "\n b) {:.4}".format(b) + 
        "\n c) {:.4}".format(c) + 
        "\n d) {:.4}".format(d[0]) + 
        "\n e) {:.4}".format(d[1]) + 
        "\n f) {:.4}".format(d[2]) + 
        "\n g) pvalue < 1-ic: "+ str(g1)
    )

# exercice 98
if(False):
    # c
    exA = 7.49
    exB = 7.09
    vrA = 2.054
    vrB = 3.082
    nA = 40
    nB = 40

    delta = 0
    c = ((exA - exB) - delta)/np.sqrt(vrA/nA + vrB/nB)

    # d
    # use t-student distribution because yes
    ns = 0.01
    cvalue = t.ppf(1-(ns)/2, nA+nB-2)

    # e
    e = abs(c) > cvalue

    print(
        "\nexercice 98:" + 
        "\n a) {:.4}".format(1.0) + 
        "\n b) {:.4}".format(2.0) + 
        "\n c) {:.4}".format(c) + 
        "\n d) {:.4}".format(cvalue) + 
        "\n e) " + str(e)
    )

# exercice 99
if(False):
    nA = 13
    nB = 14

    dp1 = 3161
    dp2 = 3858

    # c
    exA = 63561.09
    dpA = 3212.67

    exB = 57462.14
    dpB = 3311.87

    delta = 0
    # use stardard deviation because yes
    c = ((exA - exB) - delta)/np.sqrt(dp1**2/nA + dp2**2/nB)

    # d
    ns = 0.01
    sc = 1-ns
    cvalue = stat.RNrmStdDst(sc)

    # e
    pvalue = stat.nrmStdDst_i(c,True,False)

    # f
    f = abs(c) > cvalue

    print(
        "\nexercice 99:" + 
        "\n a) {:.4}".format(1.0) + 
        "\n b) {:.4}".format(3.0) + 
        "\n c) {:.4}".format(c) + 
        "\n d) {:.4}".format(cvalue) + 
        "\n e) {:.4}".format(pvalue) + 
        "\n f) " + str(f)
    )

# exercice 100
if(False):
    n1 = 57
    n2 = 296
    s1 = 7
    s2 = 163

    p1 = s1/n1
    p2 = s2/n2

    # a
    hp = (n1*p1 + n2*p2)/(n1 + n2)
    a = (p1 - p2)/np.sqrt(hp*(1-hp)*(1/n1 + 1/n2))

    # b
    b = stat.nrmStdDst_i(a,True,True)

    # c
    ns = 0.1/2
    sc = 1-ns
    cvalue = stat.RNrmStdDst(sc)

    # d
    d = abs(a) > cvalue

    print(
        "\nexercice 100:" + 
        "\n a) {:.4}".format(a) + 
        "\n b) {:.4}".format(b) + 
        "\n c) {:.4}".format(cvalue) + 
        "\n d) " + str(d)
    )