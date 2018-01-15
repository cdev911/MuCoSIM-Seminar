import matplotlib.pyplot as plt
import numpy as np
import csv


for i in range(1, 11):
    x = []
    y = []
    file_name = 'data/data_size'+str(i) 
    with open(file_name, 'r') as csvfile:
        plots = csv.reader(csvfile, delimiter=',')
        for row in plots:
            threads = int(row[0])
            x.append(int(row[1]))
            y.append(row[2])
	legend_name = 'Thread' + str(threads)
    plt.plot(x, y, label=legend_name)
    plt.xscale('log')

cache_size = [1000, 8000, 781250]
for xc in cache_size:
    plt.axvline(x=xc)
plt.grid(True,which="both",ls="--")

plt.legend()
plt.xlabel('Number of elements')
plt.ylabel('M Flop')
plt.title('Plot for '+ str(threads)+ ' threads')
plt.show()
