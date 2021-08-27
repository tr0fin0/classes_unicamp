import matplotlib.pyplot as plt
import pandas as pd

data = pd.read_csv("Ex1.csv")

plt.figure(figsize=(8,8))
plt.plot(data['T (C)'], data['R (ohm)'])
plt.xlabel('T')
plt.ylabel('R')
plt.show()