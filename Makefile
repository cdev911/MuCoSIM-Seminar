CXX= icc

FLAGS =  -Ofast -fno-alias -O3 -xHost -qopt-streaming-stores=never
LDFLAGS = 
LIBS = 
INC = -I/apps/intel/Compiler/11.1/080/include/
FLAGS += -qopt-report=5
# FLAGS += -xCOMMON-AVX512

target = mycode
all:stream_c.exe mycode

$(target): $(target).o $(target).s 
	$(CXX) $(FLAGS) $(LDFLAGS) -o $@  $<

$(target).o: $(target).c Makefile
	$(CXX) $(FLAGS) -c -o $@  $<

$(target).s: $(target).c
	$(CXX) $(FLAGS) -fsource-asm -S $^ -o $(target).s

.PHONY: clean
clean:
	rm -rf timing.o $(target).o  $(target).s $(target)

# stream_c.exe: stream.c
# 	$(CC) $(CFLAGS) stream.c -o stream_c.exe

# mycode: mycode.c
# 	$(CC) $(CFLAGS) mycode.c -o mycode

# clean:
# 	rm -f stream_c.exe mycode *.o

# an example of a more complex build line for the Intel icc compiler
# stream.icc: stream.c
# 	icc -O3 -xCORE-AVX2 -ffreestanding -qopenmp -DSTREAM_ARRAY_SIZE=80000000 -DNTIMES=20 stream.c -o stream.omp.AVX2.80M.20x.icc
