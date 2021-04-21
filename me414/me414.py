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
if(True):
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

    #coeficiente de correlação
    x = np.array([0.63,1.83,0.13,0.21,-1.30,-0.26,0.77,2.79,-1.13,0.60,-0.63,-0.03,0.43 ,0.12,0.03,-1.39,-0.68,0.20])
    y = np.array([0.78,1.97,0.34,0.30,-0.12,-0.04,0.49,1.43,-1.63,0.33,-0.63,0.01 ,-0.47,0.03,1.17,-2.44,-1.08,0.77])

    #seguindo a fórmula
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


