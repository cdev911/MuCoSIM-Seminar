#!/usr/bin/env python
import os.path
import sys
import numpy as np
import matplotlib.pylab as plt
from itertools import cycle

# # Data file name
filename = 'data_size1'

f = open(filename, 'r')
inp = f.readlines()  # All the details of the file are stored here
f.close()

x = []  # Data size in Bytes
y = []  # Flops
cache_size = [32000, 1000000, 28*1024*1024]
cache_label = ['32 kB', '1 MB', '28 MB']

for line in inp:
    temp = line
    temp = list(map(float, str.split(temp)))
    x.append(temp[1])
    y.append(temp[-1])

colors = cycle(["aqua", "black", "blue", "fuchsia", "gray", "green", "lime", "maroon", "navy", "olive"]) # , "purple", "red", "silver", "teal", "yellow"])

# # For the First allignment
title = 'Skylake_Micro_Read_Allignment_' + str.split(inp[0])[-2]
for i in range(0, 4):
    idx = (2**i-1)*33
    xx = x[idx:idx+32]
    yy = y[idx:idx+32]
    plt.plot(xx, yy, label = 'Reads '+str(2**i), color=next(colors), marker = '.')


plt.xscale('log')
plt.xlabel("Bytes")
plt.ylabel("MB/cyc")
plt.title(title)
plt.legend(prop={'size':12})

for i in range(3):
    plt.axvline(x=cache_size[i],ls='--', lw = 0.5, color = 'b')
    text = 'L'+str(i+1)+' = '+cache_label[i]
    plt.text(cache_size[i]*1.1, max(y)*1.1, text, rotation=90, size=10)

for i in range(6):
    plt.axhline(y=2**(i+2)*1000,ls='--', lw = 0.5, color = 'b')
    if i is 0:
        text = str(2**(i+2)) + ' GB/cyc '
    else:
        text = str(2**(i+2)) + ' GB/cyc'
    plt.text(150, 2.4*2**(i+2)*1000*1.01, text, size=10, )

fig = plt.gcf()
fig.set_size_inches(16, 9)
fig.savefig('../measurments/'+title+'.png', dpi=300)
plt.show()

# # For the First allignment 
title = 'Skylake_Micro_Read_Allignment_' + str.split(inp[-1])[-2]
for i in range(0, 10):
    idx = i*33 + 331
    xx = x[idx:idx+32]
    yy = y[idx:idx+32]
    plt.plot(xx, yy, label = 'Reads '+str(i+1), color=next(colors), marker = '.')


plt.xscale('log')
plt.xlabel("Bytes")
plt.ylabel("MB/s")
plt.title(title)
plt.legend(prop={'size':12})

for i in range(3):
    plt.axvline(x=cache_size[i],ls='--', lw = 0.5, color = 'b')
    text = 'L'+str(i+1)+' = '+cache_label[i]
    plt.text(cache_size[i]*1.1, max(y)*1.1, text, rotation=90, size=10)

for i in range(6):
    plt.axhline(y=2.4*2**(i+2)*1000,ls='--', lw = 0.5, color = 'b')
    if i is 0:
        text = str(2.4*2**(i+2)) + ' GB/cyc (2.4 GHz * 4 B/cyc)'
    else:
        text = str(2.4*2**(i+2)) + ' GB/cyc'
    plt.text(150, 2.4*2**(i+2)*1000*1.05, text, size=10, )

fig = plt.gcf()
fig.set_size_inches(16, 9)
fig.savefig('../measurments/'+title+'.png', dpi=300)
plt.show()
