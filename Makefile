CC = gcc
CFLAGS = -O2

all:stream_c.exe mycode

stream_c.exe: stream.c
	$(CC) $(CFLAGS) stream.c -o stream_c.exe

mycode: mycode.c
	$(CC) $(CFLAGS) mycode.c -o mycode

clean:
	rm -f stream_c.exe mycode *.o

# an example of a more complex build line for the Intel icc compiler
stream.icc: stream.c
	icc -O3 -xCORE-AVX2 -ffreestanding -qopenmp -DSTREAM_ARRAY_SIZE=80000000 -DNTIMES=20 stream.c -o stream.omp.AVX2.80M.20x.icc
