import numpy as np

aux = [25,13,25,26,27,10,23,16,15,2,8]
end = []
mul = 1

for i in range(len(aux)):
    end.append(aux[i]*mul)

val = np.array(end)
freq = np.array([1,1,1,1,1,1,1,1,1,1,1])
data = np.repeat(val, freq)

print(data)
print("soma", np.sum(data))
print("média", data.mean())
print("mediana",np.median(data))
print("desvio padrão ",np.std(data, ddof=1))