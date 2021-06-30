import numpy as np
import scipy as sp
import statpy as stat

from scipy.stats import t

#exercice 67
if(False):
    n1 = 18
    n2 = 20
    lb = 1/10
    e1 = stat.ExponencialInfo(lb, n1)
    e2 = stat.Exponencial(lb, n2)
    print("P({}<X<{}) = {:.4f}".format(n1, n2, e2-e1))

#exercice 68
if(False):
    e = stat.ExponencialReverseL(17, 0.47)
    e = stat.ExponencialReverseX(0.0373, 0.15)

#exercice 69
if(False):
    n = 2
    e = 0.5
    c = (n+2)*e/(n+1)
    b = (n+1)/(c**(n+1))
    pc3 = 1/(3**(n+1))
    vx = (b*c**(n+3))/(n+3) - e**2

    print("\nb = {:.4f}\nc = {:.4f}\npc3 = {:.4f}\nvx = {:.4f}".format(b, c, pc3, vx))

#exercice 70
if(False):
    n = stat.NormalStandardInfo(0.18, -1)
    n = stat.NormalStandardInfo(-0.27, 1)
    n = stat.NormalStandardInfo(0.37, 1)
    n = stat.NormalStandardInfo(-1.03, 1)
    n = stat.NormalStandardInfo(0.8, 1)
    n = stat.NormalStandardInfo(-1.06, -1)

#exercice 71
if(False):
    n = stat.NormalStandardIntervalInfo(-1.9, 0.03)
    n = stat.NormalStandardIntervalInfo(0.14, 0.62)
    n = stat.NormalStandardIntervalInfo(0.67, 2.03)
    n = stat.NormalStandardIntervalInfo(-1.14, 0.34)
    n = stat.NormalStandardIntervalInfo(-1.34, 0.36)
    n = stat.NormalStandardIntervalInfo(1.1, 2.42)

#exercice 72
if(False):
    mu = 9
    sg = 9
    n = stat.NormalIntervalInfo(8.72, 11.35, mu, sg)

#exercice 73
if(False):
    x = stat.NormalStandardReverseInfo(0.6201, 1, 0)
    x = stat.NormalStandardReverseInfo(0.9525, 1, 0)
    x = stat.NormalStandardReverseInfo(0.6527, -1, 0)
    x = stat.NormalStandardReverseInfo(0.5837, -1, 0)
    x = stat.NormalStandardReverseInfo(0.5152, 1, 1)
    x = stat.NormalStandardReverseInfo(0.8006, 1, 1)
    x = stat.NormalStandardReverseInfo(0.4293, -1, 1)
    x = stat.NormalStandardReverseInfo(0.4541, -1, 1)

#exercice 74
if(False):
    n = stat.NormalReverseInfo(0.99, 25, 6**2)

#exercice 75
if(False):
    n = stat.NormalReverseInfo(0.82, 491, 47**2)
    n = stat.NormalReverseInfo(0.86, 491, 47**2)

#exercice 76
if(False):
    n = stat.NormalInfo(30000, 39000, 8000**2, 1)
    n = stat.NormalInfo(30000, 32000, 6000**2, 1)

#exercice 77
if(False):
    p  = 0.22 #probability of study
    n  = 55   #number expected
    N  = 200  #number of population
    hp = stat.NormalInfo(n/N, p, p*(1-p)/N, 1)

#exercice 78
if(False):
    # exponencial distribution
    lb = 1/20  # lambda

    # a) d)
    ex = 1/lb  # expected value

    # b)
    vx = ex**2 # variance value

    # c)
    d = 20 # dias
    e1 = stat.Exponencial(lb, d)

    # e)
    p = 0.63 # probability
    e2 = stat.ExponencialReverseX(lb, p)

    # f)
    n = 190 # amostral size
    e3 = np.sqrt(vx/n)

    # g)
    e4 = stat.NormalReverse(p, ex, vx/n)

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
    pa = stat.NormalIntervalInfo(mi, ma, ex, vx)

    me = b1*m/b/n # mínimo em milhas
    pb = stat.NormalInfo(me, ex, vx, 1)

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
    dx = stat.ExponencialReverseX(lb, px)

    # c)
    n = 200 #total of sample
    ep = np.sqrt(vx/n)

    # d)
    dm = stat.NormalReverse(px, ex, vx/n)

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
    gs = G*s
    pc = stat.NormalInfo(0, ex, vx/n, 1)

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
    ei = stat.expIntInf(p, ic, n)

    # c)
    erro = (p - ei[0])*100

    # d)
    pe = 0.70
    d = 0
    if(ei[0] > pe): d = 1

    print(
        "\nexercice 83:" + 
        "\n a) {:.4}".format(ei[0]) + 
        "\n b) {:.4}".format(ei[1]) + 
        "\n c) {:.4}".format(erro) + 
        "\n d) {}".format(d)
    )

# exercice 84
if(False):
    f = 46  # quantidade de fumantes
    n = 108 # tamanho da amostra

    # a)
    p = f/n # proporção de fumantes

    #  b) c) d)
    ic = 0.90 # intervalo de confiança
    ei = stat.SCnfInt(p, ic, n)

    # e) tamanho intervalo de confiança
    e = 0.04
    size1 = stat.sSCnfInt(p, ic, e)

    # f) tamanho intervalo de confiança conservador
    size2 = stat.sSCCnfInt(p, ic, e)

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
if(False):
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

if(True):
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