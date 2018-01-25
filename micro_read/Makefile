CXX = icc


FLAGS := -Ofast -fno-alias -O3 -xHost -qopt-streaming-stores=always
LDFLAGS = 
LIBS = 
INC = 
LDFLAGS = 

lik:=1
avx:=1
omp:=0
rpt:=1

ifeq ($(lik), 1)
LIBS += $(LIKWID_LIB)
INC += $(LIKWID_INC)
LDFLAGS += -llikwid
FLAGS += -DLIKWID_PERFMON 
endif

ifeq ($(omp), 1)
FLAGS += -DUSEOMP -qopenmp
endif

ifeq ($(rpt), 1)
FLAGS += -qopt-report=5
endif

ifeq ($(avx),1)
FLAGS += -xCOMMON-AVX512
endif



target = read

$(target): $(target).o $(target).s
	$(CXX) $(FLAGS) -o $@  $< $(LIBS) $(LDFLAGS)
	@echo 

$(target).o: $(target).c Makefile
	$(CXX) $(FLAGS) -c -o $@  $< $(INC)

$(target).s: $(target).c Makefile
	$(CXX) $(FLAGS) -fsource-asm -S $< -o $@ $(INC)


.PHONY: clean
clean:
	rm -rf  $(target).optrpt $(target).o  $(target).s $(target)

