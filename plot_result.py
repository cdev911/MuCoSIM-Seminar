import matplotlib.pyplot as plt
import numpy as np
import csv

x = []
y = []
with open('data/data_size1', 'r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
        x.append(int(row[1]))
        y.append(row[2])

plt.plot(x, y)
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
