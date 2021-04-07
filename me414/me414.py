import numpy as np

val = np.array([16,17,18,19,20])
freq = np.array([12,9,13,8,9])
data = np.repeat(val, freq)

print(data)
print("soma", np.sum(data))
print("média", data.mean())
print("mediana",np.median(data))
print("desvio padrão ",np.std(data, ddof=1))