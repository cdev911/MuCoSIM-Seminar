#include <stdio.h>
#include <stdlib.h>
#include "timing.h"
#include <errno.h>
#include <sys/time.h>
#include <time.h>

#ifdef USEOMP
#include <omp.h>
#endif


double check_sum(double *D, int length){
	double sum = 0.;
	int i;
	for(i = 0; i < length; ++i)
		sum += D[i];
	return sum;
}



void timing(double* wcTime, double* cpuTime)
{
	struct timeval tp;
	struct rusage ruse;

	gettimeofday(&tp, NULL);
	*wcTime=(double) (tp.tv_sec + tp.tv_usec/1000000.0); 

	getrusage(RUSAGE_SELF, &ruse);
	*cpuTime=(double)(ruse.ru_utime.tv_sec+ruse.ru_utime.tv_usec / 1000000.0);
}


int main(int argc, char* argv[]){

	if(argc != 2){
		printf("please call with correct arguments ./triad [num_elements in each array]\n");
		exit(-1);
	}
	const int avx = 4;
	const int unroll = 4;
	int num_elements = atoi(argv[1]);
	num_elements = num_elements - (num_elements%(avx*unroll));
	const int array_size = num_elements*sizeof(double);

	double *A; 
	double *B; 
	double *C; 
	double *D;	

	A = (double *) malloc(array_size);
	B = (double *) malloc(array_size);
	C = (double *) malloc(array_size);
	D = (double *) malloc(array_size);
	  

	// double a, b, c, d, tmp;
	int i;	
	#pragma omp parallel for
	for(i = 0; i < num_elements; ++i){
		A[i] = 1.01;
		B[i] = 1.03;
		C[i] = 1.04;
		D[i] = 0;
	}

	//vect triad
	int repeat = 1;
	double start, end, ct;
	int r;
	double s = 5;
	while( (end-start) < 0.1){
		#pragma inline
		timing(&start, &ct);
		#pragma omp parallel private (r, i)
		for(r = 0; r < repeat; ++r){
			#pragma omp for
			for(i = 0; i < num_elements; ++i){
				A[i] = B[i] + C[i] * D[i];
				// A[i] = s;
				// if(A[i]<0) printf("stop\n");
			}
			if(A[i]<0) printf("stop\n");
		}
		timing(&end, &ct);
		repeat *= 2;
	}
	repeat /= 2;

	printf(", %d, %f\n", num_elements, (2.0*repeat*num_elements)/(end-start)/1000000.0);

	free(A);
	free(B);
	free(C);
	free(D);
}
