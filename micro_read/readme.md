## assembly code
assembly code is always automatically created and loacated in file triad.s

## Data measurements
Output:
num_elements, bytes_total, num_reads, alignment, MB/s. 

num_reads is for example for A[i] = B[i] --> 1 read
bytes_total --> (num_reads+1)*num_elements*8

### no write-allocate!


# Ivy Bridge

### Peak Performance

|               |               |
| ---           | ---           |
| AVX	        | 1LD & 0.5ST	|
| Add	        | 1/cy			|
| Mul	        | 1/cy			|
| FMA	        | n/a			|
| Peak mem BW   | 51.2 GB/s     |
| Load-only BW   | 46.1 GB/s     |



P_peak_core = 2.2GHz * 2(superscalar) * 4(AVX) * 1(FMA) = 17.6 GFlop/s




### Code Balance
?

# SkyLake 

### Peak Performance

|               |               |
| ---           | ---           |
| AVX512	    | 2LD & 1ST	|
| AGU           | 2/cy & 1 'simple'/cy |
| Add	        | 1/cy			|
| Mul	        | 1/cy			|
| FMA	        | 1/cy			|
| Peak mem BW   | -     |
| Load-only BW   | -     |

Xeon 6148 Gold: *2.4 GHz*

P_peak_core = 2.4GHz * 2(superscalar) * 8(AVX) * 2(FMA) = 76.8 GFlop/s

1 Load + 1 Store: 2.4GHz * 2 * 64B = 307.2 GB/s


### Code Balance
?

https://www.nextplatform.com/2017/08/04/drilling-xeon-skylake-architecture/
