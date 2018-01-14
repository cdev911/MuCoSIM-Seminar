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

    plt.plot(x, y, 'bo', x, y, 'k')
    plt.xscale('log')

cache_size = [100, 500, 1000]
for xc in cache_size:
    plt.axvline(x=xc)
plt.grid(True,which="both",ls="-")

plt.xlabel('Number of elements')
plt.ylabel('M Flop')
plt.title('Plot for '+ str(threads)+ ' threads')
plt.show()
#
# t = np.arange(0.0, 2.0, 0.01)
# s = 1 + np.sin(2*np.pi*t)
# plt.plot(t, s)
#
# plt.xlabel('time (s)')
# plt.ylabel('voltage (mV)')
# plt.title('About as simple as it gets, folks')
# plt.grid(True)
# plt.show()
