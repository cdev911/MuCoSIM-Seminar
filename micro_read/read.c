#include <stdio.h>
#include <stdlib.h>
#include <immintrin.h>
#include <errno.h>
#include <sys/time.h>
#include <time.h>
#include <sys/resource.h>
#include <sys/types.h>

#ifdef LIKWID_PERFMON
#include <likwid.h>
#endif

#ifdef USEOMP
#include <omp.h>
#endif

typedef double real;


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
	
	if(argc != 4){
		printf("please call with correct arguments ./read [num_elements in each array] [alignment in bytes] [num reads]\n");
		exit(-1);
	}
	
#ifdef LIKWID_PERFMON
	LIKWID_MARKER_INIT;
#endif
	
	//AVX512 = 8, AVX2 = 4
	const int avx = 8;
	const int unroll = 8;
	int num_elements = atoi(argv[1]);
	num_elements = num_elements - (num_elements%(avx*unroll));
	const int array_size = num_elements*sizeof(real);
	const int alignment = atoi(argv[2]);
	const int num_reads = atoi(argv[3]);
	const long bytes_total = (num_reads+1.)*array_size;;

	
	//helper variables
	int i;
	int repeat = 1;
	double start = 0., end = 0., ct;
	int r;
	
	//1 read
	if(num_reads == 1){
		
		real *A, *B;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = 1.02*B[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
	}
	
	
	//2
	if(num_reads == 2){
		
		real *A, *B, *C;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
	}
	
	//3
	if(num_reads == 3){
		
		real *A, *B, *C, *D;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
	}
	
	//4
	if(num_reads == 4){
		
		real *A, *B, *C, *D, *E;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		E = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
			E[i] = 1.01;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i] + E[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
		_mm_free(E);
	}


	//5
	if(num_reads == 5){
		
		real *A, *B, *C, *D, *E, *F;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		E = (real *) _mm_malloc(array_size, alignment);
		F = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
			E[i] = 1.01;
			F[i] = 1.03;
			
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i] + E[i] + F[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
		_mm_free(E);
		_mm_free(F);
		
	}
	
	//6
	if(num_reads == 6){
		
		real *A, *B, *C, *D, *E, *F, *G;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		E = (real *) _mm_malloc(array_size, alignment);
		F = (real *) _mm_malloc(array_size, alignment);
		G = (real *) _mm_malloc(array_size, alignment);

		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
			E[i] = 1.01;
			F[i] = 1.03;
			G[i] = 1.04;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
		_mm_free(E);
		_mm_free(F);
		_mm_free(G);
	}
	
	//7
	if(num_reads == 7){
		
		real *A, *B, *C, *D, *E, *F, *G, *H;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		E = (real *) _mm_malloc(array_size, alignment);
		F = (real *) _mm_malloc(array_size, alignment);
		G = (real *) _mm_malloc(array_size, alignment);
		H = (real *) _mm_malloc(array_size, alignment);
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
			E[i] = 1.01;
			F[i] = 1.03;
			G[i] = 1.04;
			H[i] = 1.0;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
		_mm_free(E);
		_mm_free(F);
		_mm_free(G);
		_mm_free(H);
	}
	
	//8
	if(num_reads == 8){
		
		real *A, *B, *C, *D, *E, *F, *G, *H, *I;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		E = (real *) _mm_malloc(array_size, alignment);
		F = (real *) _mm_malloc(array_size, alignment);
		G = (real *) _mm_malloc(array_size, alignment);
		H = (real *) _mm_malloc(array_size, alignment);
		I = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
			E[i] = 1.01;
			F[i] = 1.03;
			G[i] = 1.04;
			H[i] = 1.0;
			I[i] = 1.01;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i] + I[i];
					
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
		_mm_free(E);
		_mm_free(F);
		_mm_free(G);
		_mm_free(H);
		_mm_free(I);
	}
	
	//9
	if(num_reads == 9){
		
		real *A, *B, *C, *D, *E, *F, *G, *H, *I, *J;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		E = (real *) _mm_malloc(array_size, alignment);
		F = (real *) _mm_malloc(array_size, alignment);
		G = (real *) _mm_malloc(array_size, alignment);
		H = (real *) _mm_malloc(array_size, alignment);
		I = (real *) _mm_malloc(array_size, alignment);
		J = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
			E[i] = 1.01;
			F[i] = 1.03;
			G[i] = 1.04;
			H[i] = 1.0;
			I[i] = 1.01;
			J[i] = 1.03;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i] + J[i] + I[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
		_mm_free(E);
		_mm_free(F);
		_mm_free(G);
		_mm_free(H);
		_mm_free(I);
		_mm_free(J);
	}
	
	//10
	if(num_reads == 10){
		real *A, *B, *C, *D, *E, *F, *G, *H, *I, *J, *K;
		
		A = (real *) _mm_malloc(array_size, alignment);
		B = (real *) _mm_malloc(array_size, alignment);
		C = (real *) _mm_malloc(array_size, alignment);
		D = (real *) _mm_malloc(array_size, alignment);
		E = (real *) _mm_malloc(array_size, alignment);
		F = (real *) _mm_malloc(array_size, alignment);
		G = (real *) _mm_malloc(array_size, alignment);
		H = (real *) _mm_malloc(array_size, alignment);
		I = (real *) _mm_malloc(array_size, alignment);
		J = (real *) _mm_malloc(array_size, alignment);
		K = (real *) _mm_malloc(array_size, alignment);
		
		for(i = 0; i < num_elements; ++i){
			A[i] = 1.01;
			B[i] = 1.03;
			C[i] = 1.04;
			D[i] = 1.0;
			E[i] = 1.01;
			F[i] = 1.03;
			G[i] = 1.04;
			H[i] = 1.0;
			I[i] = 1.01;
			J[i] = 1.03;
			K[i] = 1.04;
		}
		
		repeat = 1;
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_START("READ");
#endif
		while( (end-start) < 0.1){
#pragma inline
			timing(&start, &ct);
			for(r = 0; r < repeat; ++r){
				__assume(num_elements%8 == 0);
#pragma unroll(8)
#pragma vector aligned
				for(i = 0; i < num_elements; ++i){
					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i] + J[i] + I[i] + K[i];
				}
				if(A[i]<0) printf("stop\n");
			}
#pragma inline
			timing(&end, &ct);
			repeat *= 2;
		}
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_STOP("READ");
#endif
		repeat /= 2;
		
#ifdef LIKWID_PERFMON
		LIKWID_MARKER_CLOSE;
#endif
		_mm_free(A);
		_mm_free(B);
		_mm_free(C);
		_mm_free(D);
		_mm_free(E);
		_mm_free(F);
		_mm_free(G);
		_mm_free(H);
		_mm_free(I);
		_mm_free(J);
		_mm_free(K);
		
	}

	printf("%d %ld %d %d %f %ld \n", num_elements, bytes_total, num_reads, alignment, (bytes_total*((double)repeat))/(end-start)/1000000.0, (end-start));
	
	exit(EXIT_SUCCESS);
}
