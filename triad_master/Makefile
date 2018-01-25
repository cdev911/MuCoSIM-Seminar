CXX= icc

FLAGS =  -Ofast -fno-alias -O3 -xHost -qopt-streaming-stores=never
LDFLAGS = 
LIBS = 
FLAGS += -DUSEOMP -qopenmp
FLAGS += -qopt-report=5
target = triad_simple


$(target): $(target).o $(target).s 
	$(CXX) $(FLAGS) $(LDFLAGS) -o $@  $<

$(target).o: $(target).c Makefile
	$(CXX) $(FLAGS) -c -o $@  $<

$(target).s: $(target).c
	$(CXX) $(FLAGS) -fsource-asm -S $^ -o $(target).s

.PHONY: clean
clean:
	rm -rf timing.o $(target).o  $(target).s $(target)

