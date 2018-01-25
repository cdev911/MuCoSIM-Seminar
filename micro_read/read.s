	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.4.196 Build 20170411";
# mark_description "-I/mnt/opt/likwid-4.3.1/include -Ofast -fno-alias -O3 -xHost -qopt-streaming-stores=always -DLIKWID_PERFMON ";
# mark_description "-qopt-report=5 -xCOMMON-AVX512 -fsource-asm -S -o read.s";
	.file "read.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main(int, char **)
main:
# parameter 1(argc): %edi
# parameter 2(argv): %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]

### int main(int argc, char* argv[]){

	.cfi_startproc
..___tag_value_main.1:
..L2:
                                                          #34.33
..LN0:
	.file   1 "read.c"
	.loc    1  34  is_stmt 1
        pushq     %rbp                                          #34.33
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #34.33
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        andq      $-128, %rsp                                   #34.33
..LN3:
        pushq     %r12                                          #34.33
..LN4:
        pushq     %r13                                          #34.33
..LN5:
        pushq     %r14                                          #34.33
..LN6:
        pushq     %r15                                          #34.33
..LN7:
        pushq     %rbx                                          #34.33
..LN8:
        subq      $216, %rsp                                    #34.33
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN9:
        movq      %rsi, %r12                                    #34.33
..LN10:
        movl      %edi, %ebx                                    #34.33
..LN11:
        movq      $0x4389d9ffe, %rsi                            #34.33
..LN12:
        movl      $3, %edi                                      #34.33
..LN13:
        call      __intel_new_feature_proc_init                 #34.33
..LN14:
                                # LOE r12 ebx
..B1.672:                       # Preds ..B1.1
                                # Execution count [1.00e+00]
..LN15:
        vstmxcsr  (%rsp)                                        #34.33
..LN16:
        orl       $32832, (%rsp)                                #34.33
..LN17:
        vldmxcsr  (%rsp)                                        #34.33
..LN18:
	.loc    1  36  is_stmt 1

### 	
### 	if(argc != 4){

        cmpl      $4, %ebx                                      #36.13
..LN19:
        je        ..B1.4        # Prob 16%                      #36.13
..LN20:
                                # LOE r12
..B1.2:                         # Preds ..B1.672
                                # Execution count [8.40e-01]
..LN21:
	.loc    1  37  is_stmt 1

### 		printf("please call with correct arguments ./read [num_elements in each array] [alignment in bytes] [num reads]\n");

        movl      $il0_peep_printf_format_10, %edi              #37.3
..LN22:
        call      puts                                          #37.3
..LN23:
                                # LOE
..B1.3:                         # Preds ..B1.2
                                # Execution count [8.40e-01]
..LN24:
	.loc    1  38  is_stmt 1

### 		exit(-1);

        movl      $-1, %edi                                     #38.3
..LN25:
#       exit(int)
        call      exit                                          #38.3
..LN26:
                                # LOE
..B1.4:                         # Preds ..B1.672
                                # Execution count [1.60e-01]: Infreq

### 	}
### 	
### #ifdef LIKWID_PERFMON
### 	LIKWID_MARKER_INIT;

..___tag_value_main.11:
..LN27:
	.loc    1  42  is_stmt 1
#       likwid_markerInit(void)
        call      likwid_markerInit                             #42.2
..___tag_value_main.12:
..LN28:
                                # LOE r12
..B1.5:                         # Preds ..B1.4
                                # Execution count [1.60e-01]: Infreq
..LN29:
	.file   2 "/usr/include/stdlib.h"
	.loc    2  280  is_stmt 1

### #endif
### 	
### 	//AVX512 = 8, AVX2 = 4
### 	const int avx = 8;
### 	const int unroll = 4;
### 	int num_elements = atoi(argv[1]);
### 	num_elements = num_elements - (num_elements%(avx*unroll));
### 	const int array_size = num_elements*sizeof(real);
### 	const int alignment = atoi(argv[2]);
### 	const int num_reads = atoi(argv[3]);
### 	const long bytes_total = (num_reads+1.)*array_size;;
### 
### 	
### 	//helper variables
### 	int i;
### 	int repeat = 1;
### 	double start = 0., end = 0., ct;
### 	int r;
### 	
### 	//1 read
### 	if(num_reads == 1){
### 		
### 		real *A, *B;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = 1.02*B[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 	}
### 	
### 	
### 	//2
### 	if(num_reads == 2){
### 		
### 		real *A, *B, *C;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 	}
### 	
### 	//3
### 	if(num_reads == 3){
### 		
### 		real *A, *B, *C, *D;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 	}
### 	
### 	//4
### 	if(num_reads == 4){
### 		
### 		real *A, *B, *C, *D, *E;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		E = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 			E[i] = 1.01;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i] + E[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 		_mm_free(E);
### 	}
### 
### 
### 	//5
### 	if(num_reads == 5){
### 		
### 		real *A, *B, *C, *D, *E, *F;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		E = (real *) _mm_malloc(array_size, alignment);
### 		F = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 			E[i] = 1.01;

        movq      8(%r12), %rcx                                 #280.16
..LN30:
        call      __intel_sse4_atol                             #280.16
..LN31:
                                # LOE rax r12
..B1.6:                         # Preds ..B1.5
                                # Execution count [1.60e-01]: Infreq
..LN32:
        movl      %eax, %r13d                                   #280.16
..LN33:
	.loc    1  49  is_stmt 1
        movl      %r13d, %edx                                   #49.46
..LN34:
        andl      $-2147483617, %edx                            #49.46
..LN35:
        jge       ..B1.670      # Prob 50%                      #49.46
..LN36:
                                # LOE r12 edx r13d
..B1.671:                       # Preds ..B1.6
                                # Execution count [1.60e-01]: Infreq
..LN37:
        subl      $1, %edx                                      #49.46
..LN38:
        orl       $-32, %edx                                    #49.46
..LN39:
        incl      %edx                                          #49.46
..LN40:
                                # LOE r12 edx r13d
..B1.670:                       # Preds ..B1.6 ..B1.671
                                # Execution count [1.60e-01]: Infreq
..LN41:
        subl      %edx, %r13d                                   #49.2
..LN42:
	.loc    1  50  is_stmt 1
        movslq    %r13d, %r13                                   #50.25
..LN43:
	.loc    2  280  is_stmt 1
        movq      16(%r12), %rcx                                #280.16
..LN44:
	.loc    1  50  is_stmt 1
        movq      %r13, 112(%rsp)                               #50.25[spill]
..LN45:
        lea       (,%r13,8), %rdx                               #50.38
..LN46:
        movslq    %edx, %rbx                                    #50.38
..LN47:
	.loc    2  280  is_stmt 1
        call      __intel_sse4_atol                             #280.16
..LN48:
                                # LOE rax rbx r12 r13d
..B1.7:                         # Preds ..B1.670
                                # Execution count [1.60e-01]: Infreq
..LN49:
        movq      24(%r12), %rcx                                #280.16
..LN50:
	.loc    1  51  is_stmt 1
        movslq    %eax, %r15                                    #51.24
..LN51:
	.loc    2  280  is_stmt 1
        call      __intel_sse4_atol                             #280.16
..LN52:
                                # LOE rax rbx r15 r13d
..B1.8:                         # Preds ..B1.7
                                # Execution count [1.60e-01]: Infreq
..LN53:
        movl      %eax, %r12d                                   #280.16
..LN54:
	.loc    1  53  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #53.28
..LN55:
        vcvtsi2sd %ebx, %xmm16, %xmm16                          #53.42
..LN56:
        vcvtsi2sd %r12d, %xmm0, %xmm0                           #53.28
..LN57:
        vfmadd213sd %xmm16, %xmm16, %xmm0                       #53.42
..LN58:
	.loc    1  59  is_stmt 1
        vxorpd    %xmm1, %xmm1, %xmm1                           #59.15
..LN59:
        vmovsd    %xmm1, 56(%rsp)                               #59.15
..LN60:
        vmovsd    %xmm1, 96(%rsp)                               #59.25
..LN61:
	.loc    1  53  is_stmt 1
        vcvttsd2si %xmm0, %rdx                                  #53.42
..LN62:
        movq      %rdx, 104(%rsp)                               #53.42[spill]
..LN63:
	.loc    1  58  is_stmt 1
        movl      $1, %r14d                                     #58.13
..LN64:
	.loc    1  63  is_stmt 1
        cmpl      $1, %r12d                                     #63.18
..LN65:
        je        ..B1.617      # Prob 5%                       #63.18
..LN66:
                                # LOE rbx r15 r12d r13d r14d
..B1.9:                         # Preds ..B1.8
                                # Execution count [1.52e-01]: Infreq
..LN67:
	.loc    1  110  is_stmt 1
        cmpl      $2, %r12d                                     #110.18
..LN68:
        je        ..B1.564      # Prob 5%                       #110.18
..LN69:
                                # LOE rbx r15 r12d r13d r14d
..B1.10:                        # Preds ..B1.9
                                # Execution count [1.51e-01]: Infreq
..LN70:
	.loc    1  158  is_stmt 1
        cmpl      $3, %r12d                                     #158.18
..LN71:
        je        ..B1.509      # Prob 5%                       #158.18
..LN72:
                                # LOE rbx r15 r12d r13d r14d
..B1.11:                        # Preds ..B1.10
                                # Execution count [1.51e-01]: Infreq
..LN73:
	.loc    1  209  is_stmt 1
        cmpl      $4, %r12d                                     #209.18
..LN74:
        je        ..B1.452      # Prob 5%                       #209.18
..LN75:
                                # LOE rbx r15 r12d r13d r14d
..B1.12:                        # Preds ..B1.11
                                # Execution count [1.51e-01]: Infreq
..LN76:
	.loc    1  264  is_stmt 1
        cmpl      $5, %r12d                                     #264.18
..LN77:
        je        ..B1.393      # Prob 5%                       #264.18
..LN78:
                                # LOE rbx r15 r12d r13d r14d
..B1.13:                        # Preds ..B1.12
                                # Execution count [1.43e-01]: Infreq
..LN79:
	.loc    1  323  is_stmt 1

### 			F[i] = 1.03;
### 			
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i] + E[i] + F[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 		_mm_free(E);
### 		_mm_free(F);
### 		
### 	}
### 	
### 	//6
### 	if(num_reads == 6){

        cmpl      $6, %r12d                                     #323.18
..LN80:
        je        ..B1.332      # Prob 5%                       #323.18
..LN81:
                                # LOE rbx r15 r12d r13d r14d
..B1.14:                        # Preds ..B1.13
                                # Execution count [1.43e-01]: Infreq
..LN82:
	.loc    1  383  is_stmt 1

### 		
### 		real *A, *B, *C, *D, *E, *F, *G;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		E = (real *) _mm_malloc(array_size, alignment);
### 		F = (real *) _mm_malloc(array_size, alignment);
### 		G = (real *) _mm_malloc(array_size, alignment);
### 
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 			E[i] = 1.01;
### 			F[i] = 1.03;
### 			G[i] = 1.04;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 		_mm_free(E);
### 		_mm_free(F);
### 		_mm_free(G);
### 	}
### 	
### 	//7
### 	if(num_reads == 7){

        cmpl      $7, %r12d                                     #383.18
..LN83:
        je        ..B1.269      # Prob 5%                       #383.18
..LN84:
                                # LOE rbx r15 r12d r13d r14d
..B1.15:                        # Preds ..B1.14
                                # Execution count [1.43e-01]: Infreq
..LN85:
	.loc    1  445  is_stmt 1

### 		
### 		real *A, *B, *C, *D, *E, *F, *G, *H;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		E = (real *) _mm_malloc(array_size, alignment);
### 		F = (real *) _mm_malloc(array_size, alignment);
### 		G = (real *) _mm_malloc(array_size, alignment);
### 		H = (real *) _mm_malloc(array_size, alignment);
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 			E[i] = 1.01;
### 			F[i] = 1.03;
### 			G[i] = 1.04;
### 			H[i] = 1.0;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 		_mm_free(E);
### 		_mm_free(F);
### 		_mm_free(G);
### 		_mm_free(H);
### 	}
### 	
### 	//8
### 	if(num_reads == 8){

        cmpl      $8, %r12d                                     #445.18
..LN86:
        je        ..B1.188      # Prob 5%                       #445.18
..LN87:
                                # LOE rbx r15 r12d r13d r14d
..B1.16:                        # Preds ..B1.15
                                # Execution count [1.43e-01]: Infreq
..LN88:
	.loc    1  512  is_stmt 1

### 		
### 		real *A, *B, *C, *D, *E, *F, *G, *H, *I;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		E = (real *) _mm_malloc(array_size, alignment);
### 		F = (real *) _mm_malloc(array_size, alignment);
### 		G = (real *) _mm_malloc(array_size, alignment);
### 		H = (real *) _mm_malloc(array_size, alignment);
### 		I = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 			E[i] = 1.01;
### 			F[i] = 1.03;
### 			G[i] = 1.04;
### 			H[i] = 1.0;
### 			I[i] = 1.01;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i] + I[i];
### 					
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 		_mm_free(E);
### 		_mm_free(F);
### 		_mm_free(G);
### 		_mm_free(H);
### 		_mm_free(I);
### 	}
### 	
### 	//9
### 	if(num_reads == 9){

        cmpl      $9, %r12d                                     #512.18
..LN89:
        je        ..B1.105      # Prob 5%                       #512.18
..LN90:
                                # LOE rbx r15 r12d r13d r14d
..B1.17:                        # Preds ..B1.16
                                # Execution count [1.35e-01]: Infreq
..LN91:
	.loc    1  581  is_stmt 1

### 		
### 		real *A, *B, *C, *D, *E, *F, *G, *H, *I, *J;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		E = (real *) _mm_malloc(array_size, alignment);
### 		F = (real *) _mm_malloc(array_size, alignment);
### 		G = (real *) _mm_malloc(array_size, alignment);
### 		H = (real *) _mm_malloc(array_size, alignment);
### 		I = (real *) _mm_malloc(array_size, alignment);
### 		J = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 			E[i] = 1.01;
### 			F[i] = 1.03;
### 			G[i] = 1.04;
### 			H[i] = 1.0;
### 			I[i] = 1.01;
### 			J[i] = 1.03;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i] + J[i] + I[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 		_mm_free(E);
### 		_mm_free(F);
### 		_mm_free(G);
### 		_mm_free(H);
### 		_mm_free(I);
### 		_mm_free(J);
### 	}
### 	
### 	//10
### 	if(num_reads == 10){

        cmpl      $10, %r12d                                    #581.18
..LN92:
        je        ..B1.20       # Prob 5%                       #581.18
..LN93:
                                # LOE rbx r15 r12d r13d r14d
..B1.18:                        # Preds ..B1.665 ..B1.614 ..B1.561 ..B1.506 ..B1.449
                                #       ..B1.390 ..B1.329 ..B1.265 ..B1.184 ..B1.101
                                #       ..B1.17
                                # Execution count [1.60e-01]: Infreq
..LN94:
	.loc    1  652  is_stmt 1

### 		real *A, *B, *C, *D, *E, *F, *G, *H, *I, *J, *K;
### 		
### 		A = (real *) _mm_malloc(array_size, alignment);
### 		B = (real *) _mm_malloc(array_size, alignment);
### 		C = (real *) _mm_malloc(array_size, alignment);
### 		D = (real *) _mm_malloc(array_size, alignment);
### 		E = (real *) _mm_malloc(array_size, alignment);
### 		F = (real *) _mm_malloc(array_size, alignment);
### 		G = (real *) _mm_malloc(array_size, alignment);
### 		H = (real *) _mm_malloc(array_size, alignment);
### 		I = (real *) _mm_malloc(array_size, alignment);
### 		J = (real *) _mm_malloc(array_size, alignment);
### 		K = (real *) _mm_malloc(array_size, alignment);
### 		
### 		for(i = 0; i < num_elements; ++i){
### 			A[i] = 1.01;
### 			B[i] = 1.03;
### 			C[i] = 1.04;
### 			D[i] = 1.0;
### 			E[i] = 1.01;
### 			F[i] = 1.03;
### 			G[i] = 1.04;
### 			H[i] = 1.0;
### 			I[i] = 1.01;
### 			J[i] = 1.03;
### 			K[i] = 1.04;
### 		}
### 		
### 		repeat = 1;
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_START("READ");
### #endif
### 		while( (end-start) < 0.1){
### #pragma inline
### 			timing(&start, &ct);
### 			for(r = 0; r < repeat; ++r){
### 				__assume(num_elements%8 == 0);
### #pragma unroll(8)
### #pragma vector aligned
### 				for(i = 0; i < num_elements; ++i){
### 					A[i] = B[i] + C[i] + D[i] + E[i] + F[i] + G[i] + H[i] + J[i] + I[i] + K[i];
### 				}
### 				if(A[i]<0) printf("stop\n");
### 			}
### #pragma inline
### 			timing(&end, &ct);
### 			repeat *= 2;
### 		}
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_STOP("READ");
### #endif
### 		repeat /= 2;
### 		
### #ifdef LIKWID_PERFMON
### 		LIKWID_MARKER_CLOSE;
### #endif
### 		_mm_free(A);
### 		_mm_free(B);
### 		_mm_free(C);
### 		_mm_free(D);
### 		_mm_free(E);
### 		_mm_free(F);
### 		_mm_free(G);
### 		_mm_free(H);
### 		_mm_free(I);
### 		_mm_free(J);
### 		_mm_free(K);
### 		
### 	}
### 
### 	printf("%d %ld %d %d %f\n", num_elements, bytes_total, num_reads, alignment, (bytes_total*((double)repeat))/(end-start)/1000000.0);

        vmovsd    96(%rsp), %xmm16                              #652.2
..LN95:
        movl      $.L_2__STRING.3, %edi                         #652.2
..LN96:
        vmovsd    .L_2il0floatpacket.7(%rip), %xmm17            #652.2
..LN97:
        movl      %r13d, %esi                                   #652.2
..LN98:
        movq      104(%rsp), %rdx                               #652.2[spill]
..LN99:
        movl      %r12d, %ecx                                   #652.2
..LN100:
        vcvtsi2sdq %rdx, %xmm20, %xmm20                         #652.2
..LN101:
        vcvtsi2sd %r14d, %xmm22, %xmm22                         #652.2
..LN102:
        vsubsd    56(%rsp), %xmm16, %xmm18                      #652.2
..LN103:
        vdivsd    %xmm18, %xmm17, %xmm19                        #652.2
..LN104:
        vmulsd    %xmm20, %xmm19, %xmm21                        #652.2
..LN105:
        movl      %r15d, %r8d                                   #652.2
..LN106:
        movl      $1, %eax                                      #652.2
..LN107:
        vmulsd    %xmm22, %xmm21, %xmm0                         #652.2
..___tag_value_main.13:
..LN108:
#       printf(const char *__restrict__, ...)
        call      printf                                        #652.2
..___tag_value_main.14:
..LN109:
                                # LOE
..B1.19:                        # Preds ..B1.18
                                # Execution count [1.60e-01]: Infreq
..LN110:
	.loc    1  654  is_stmt 1

### 	
### 	exit(EXIT_SUCCESS);

        xorl      %edi, %edi                                    #654.2
..LN111:
#       exit(int)
        call      exit                                          #654.2
..LN112:
                                # LOE
..B1.20:                        # Preds ..B1.17
                                # Execution count [8.16e-03]: Infreq
..LN113:
	.loc    1  584  is_stmt 1
        movq      %rbx, %rdi                                    #584.16
..LN114:
        movq      %r15, %rsi                                    #584.16
..LN115:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #584.16
..LN116:
                                # LOE rax rbx r15 r12d r13d
..B1.676:                       # Preds ..B1.20
                                # Execution count [8.16e-03]: Infreq
..LN117:
        movq      %rax, 208(%rsp)                               #584.16[spill]
..LN118:
                                # LOE rbx r15 r12d r13d
..B1.21:                        # Preds ..B1.676
                                # Execution count [8.16e-03]: Infreq
..LN119:
	.loc    1  585  is_stmt 1
        movq      %rbx, %rdi                                    #585.16
..LN120:
        movq      %r15, %rsi                                    #585.16
..LN121:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #585.16
..LN122:
                                # LOE rax rbx r15 r12d r13d
..B1.677:                       # Preds ..B1.21
                                # Execution count [8.16e-03]: Infreq
..LN123:
        movq      %rax, 24(%rsp)                                #585.16[spill]
..LN124:
                                # LOE rbx r15 r12d r13d
..B1.22:                        # Preds ..B1.677
                                # Execution count [8.16e-03]: Infreq
..LN125:
	.loc    1  586  is_stmt 1
        movq      %rbx, %rdi                                    #586.16
..LN126:
        movq      %r15, %rsi                                    #586.16
..LN127:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #586.16
..LN128:
                                # LOE rax rbx r15 r12d r13d
..B1.678:                       # Preds ..B1.22
                                # Execution count [8.16e-03]: Infreq
..LN129:
        movq      %rax, 32(%rsp)                                #586.16[spill]
..LN130:
                                # LOE rbx r15 r12d r13d
..B1.23:                        # Preds ..B1.678
                                # Execution count [8.16e-03]: Infreq
..LN131:
	.loc    1  587  is_stmt 1
        movq      %rbx, %rdi                                    #587.16
..LN132:
        movq      %r15, %rsi                                    #587.16
..LN133:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #587.16
..LN134:
                                # LOE rax rbx r15 r12d r13d
..B1.679:                       # Preds ..B1.23
                                # Execution count [8.16e-03]: Infreq
..LN135:
        movq      %rax, 48(%rsp)                                #587.16[spill]
..LN136:
                                # LOE rbx r15 r12d r13d
..B1.24:                        # Preds ..B1.679
                                # Execution count [8.16e-03]: Infreq
..LN137:
	.loc    1  588  is_stmt 1
        movq      %rbx, %rdi                                    #588.16
..LN138:
        movq      %r15, %rsi                                    #588.16
..LN139:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #588.16
..LN140:
                                # LOE rax rbx r15 r12d r13d
..B1.680:                       # Preds ..B1.24
                                # Execution count [8.16e-03]: Infreq
..LN141:
        movq      %rax, 120(%rsp)                               #588.16[spill]
..LN142:
                                # LOE rbx r15 r12d r13d
..B1.25:                        # Preds ..B1.680
                                # Execution count [8.16e-03]: Infreq
..LN143:
	.loc    1  589  is_stmt 1
        movq      %rbx, %rdi                                    #589.16
..LN144:
        movq      %r15, %rsi                                    #589.16
..LN145:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #589.16
..LN146:
                                # LOE rax rbx r15 r12d r13d
..B1.681:                       # Preds ..B1.25
                                # Execution count [8.16e-03]: Infreq
..LN147:
        movq      %rax, 128(%rsp)                               #589.16[spill]
..LN148:
                                # LOE rbx r15 r12d r13d
..B1.26:                        # Preds ..B1.681
                                # Execution count [8.16e-03]: Infreq
..LN149:
	.loc    1  590  is_stmt 1
        movq      %rbx, %rdi                                    #590.16
..LN150:
        movq      %r15, %rsi                                    #590.16
..LN151:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #590.16
..LN152:
                                # LOE rax rbx r15 r12d r13d
..B1.682:                       # Preds ..B1.26
                                # Execution count [8.16e-03]: Infreq
..LN153:
        movq      %rax, 136(%rsp)                               #590.16[spill]
..LN154:
                                # LOE rbx r15 r12d r13d
..B1.27:                        # Preds ..B1.682
                                # Execution count [8.16e-03]: Infreq
..LN155:
	.loc    1  591  is_stmt 1
        movq      %rbx, %rdi                                    #591.16
..LN156:
        movq      %r15, %rsi                                    #591.16
..LN157:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #591.16
..LN158:
                                # LOE rax rbx r15 r12d r13d
..B1.683:                       # Preds ..B1.27
                                # Execution count [8.16e-03]: Infreq
..LN159:
        movq      %rax, 144(%rsp)                               #591.16[spill]
..LN160:
                                # LOE rbx r15 r12d r13d
..B1.28:                        # Preds ..B1.683
                                # Execution count [8.16e-03]: Infreq
..LN161:
	.loc    1  592  is_stmt 1
        movq      %rbx, %rdi                                    #592.16
..LN162:
        movq      %r15, %rsi                                    #592.16
..LN163:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #592.16
..LN164:
                                # LOE rax rbx r15 r12d r13d
..B1.684:                       # Preds ..B1.28
                                # Execution count [8.16e-03]: Infreq
..LN165:
        movq      %rax, 152(%rsp)                               #592.16[spill]
..LN166:
                                # LOE rbx r15 r12d r13d
..B1.29:                        # Preds ..B1.684
                                # Execution count [8.16e-03]: Infreq
..LN167:
	.loc    1  593  is_stmt 1
        movq      %rbx, %rdi                                    #593.16
..LN168:
        movq      %r15, %rsi                                    #593.16
..LN169:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #593.16
..LN170:
                                # LOE rax rbx r15 r12d r13d
..B1.685:                       # Preds ..B1.29
                                # Execution count [8.16e-03]: Infreq
..LN171:
        movq      %rax, 160(%rsp)                               #593.16[spill]
..LN172:
                                # LOE rbx r15 r12d r13d
..B1.30:                        # Preds ..B1.685
                                # Execution count [8.16e-03]: Infreq
..LN173:
	.loc    1  594  is_stmt 1
        movq      %rbx, %rdi                                    #594.16
..LN174:
        movq      %r15, %rsi                                    #594.16
..LN175:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #594.16
..LN176:
                                # LOE rax r15 r12d r13d
..B1.686:                       # Preds ..B1.30
                                # Execution count [8.16e-03]: Infreq
..LN177:
        movq      %rax, 168(%rsp)                               #594.16[spill]
..LN178:
                                # LOE r15 r12d r13d
..B1.31:                        # Preds ..B1.686
                                # Execution count [8.16e-03]: Infreq
..LN179:
	.loc    1  596  is_stmt 1
        testl     %r13d, %r13d                                  #596.18
..LN180:
        jle       ..B1.62       # Prob 50%                      #596.18
..LN181:
                                # LOE r15 r12d r13d
..B1.32:                        # Preds ..B1.31
                                # Execution count [7.34e-03]: Infreq
..LN182:
        movq      144(%rsp), %rdx                               #596.3[spill]
..LN183:
        andq      $63, %rdx                                     #596.3
..LN184:
        testl     %edx, %edx                                    #596.3
..LN185:
        je        ..B1.35       # Prob 50%                      #596.3
..LN186:
                                # LOE r15 edx r12d r13d
..B1.33:                        # Preds ..B1.32
                                # Execution count [7.34e-03]: Infreq
..LN187:
        testb     $7, %dl                                       #596.3
..LN188:
        jne       ..B1.104      # Prob 10%                      #596.3
..LN189:
                                # LOE r15 edx r12d r13d
..B1.34:                        # Preds ..B1.33
                                # Execution count [0.00e+00]: Infreq
..LN190:
        negl      %edx                                          #596.3
..LN191:
        addl      $64, %edx                                     #596.3
..LN192:
        shrl      $3, %edx                                      #596.3
..LN193:
        cmpl      %edx, %r13d                                   #596.3
..LN194:
        cmovl     %r13d, %edx                                   #596.3
..LN195:
                                # LOE r15 edx r12d r13d
..B1.35:                        # Preds ..B1.34 ..B1.32
                                # Execution count [8.16e-03]: Infreq
..LN196:
        movl      %r13d, %r8d                                   #596.3
..LN197:
        subl      %edx, %r8d                                    #596.3
..LN198:
        andl      $7, %r8d                                      #596.3
..LN199:
        negl      %r8d                                          #596.3
..LN200:
        addl      %r13d, %r8d                                   #596.3
..LN201:
        cmpl      $1, %edx                                      #596.3
..LN202:
        jb        ..B1.39       # Prob 50%                      #596.3
..LN203:
                                # LOE r15 edx r8d r12d r13d
..B1.36:                        # Preds ..B1.35
                                # Execution count [7.34e-03]: Infreq
..LN204:
        movl      $8, %ebx                                      #596.3
..LN205:
        vmovd     %edx, %xmm0                                   #596.3
..LN206:
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN207:
        movl      $255, %eax                                    #596.3
..LN208:
        movq      %r15, 8(%rsp)                                 #596.3[spill]
..LN209:
        movl      %r13d, 192(%rsp)                              #596.3[spill]
..LN210:
        vmovd     %ebx, %xmm6                                   #596.3
..LN211:
        xorl      %ebx, %ebx                                    #596.3
..LN212:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #596.3
..LN213:
	.loc    1  597  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #597.11
..LN214:
	.loc    1  598  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #598.11
..LN215:
	.loc    1  599  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #599.11
..LN216:
	.loc    1  600  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #600.11
..LN217:
	.loc    1  596  is_stmt 1
        kmovw     %eax, %k1                                     #596.3
..LN218:
        vpbroadcastd %xmm6, %ymm6                               #596.3
..LN219:
        xorl      %eax, %eax                                    #596.3
..LN220:
        movslq    %edx, %rdi                                    #596.3
..LN221:
        movq      144(%rsp), %rsi                               #596.3[spill]
..LN222:
        movq      136(%rsp), %r9                                #596.3[spill]
..LN223:
        movq      128(%rsp), %r10                               #596.3[spill]
..LN224:
        movq      120(%rsp), %r11                               #596.3[spill]
..LN225:
        movq      48(%rsp), %r13                                #596.3[spill]
..LN226:
        movq      32(%rsp), %r14                                #596.3[spill]
..LN227:
        movq      24(%rsp), %r15                                #596.3[spill]
..LN228:
        movq      208(%rsp), %rcx                               #596.3[spill]
        .align    16,0x90
..LN229:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.37:                        # Preds ..B1.37 ..B1.36
                                # Execution count [4.08e-02]: Infreq
..LN230:
        addq      $8, %rbx                                      #596.3
..LN231:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #596.3
..LN232:
        vpaddd    %ymm6, %ymm5, %ymm5                           #596.3
..LN233:
	.loc    1  597  is_stmt 1
        vmovupd   %zmm4, (%rax,%rcx){%k2}                       #597.4
..LN234:
	.loc    1  598  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #598.4
..LN235:
	.loc    1  599  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #599.4
..LN236:
	.loc    1  600  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #600.4
..LN237:
	.loc    1  601  is_stmt 1
        vmovupd   %zmm4, (%rax,%r11){%k2}                       #601.4
..LN238:
	.loc    1  602  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #602.4
..LN239:
	.loc    1  603  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #603.4
..LN240:
	.loc    1  604  is_stmt 1
        vmovupd   %zmm1, (%rax,%rsi){%k2}                       #604.4
..LN241:
	.loc    1  596  is_stmt 1
        addq      $64, %rax                                     #596.3
..LN242:
        cmpq      %rdi, %rbx                                    #596.3
..LN243:
        jb        ..B1.37       # Prob 81%                      #596.3
..LN244:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.38:                        # Preds ..B1.37
                                # Execution count [7.34e-03]: Infreq
..LN245:
        movl      192(%rsp), %r13d                              #[spill]
..LN246:
        movq      8(%rsp), %r15                                 #[spill]
..LN247:
        cmpl      %edx, %r13d                                   #596.3
..LN248:
        je        ..B1.47       # Prob 10%                      #596.3
..LN249:
                                # LOE r15 edx r8d r12d r13d
..B1.39:                        # Preds ..B1.35 ..B1.38
                                # Execution count [0.00e+00]: Infreq
..LN250:
        lea       8(%rdx), %ebx                                 #596.3
..LN251:
        cmpl      %ebx, %r8d                                    #596.3
..LN252:
        jl        ..B1.43       # Prob 50%                      #596.3
..LN253:
                                # LOE r15 edx r8d r12d r13d
..B1.40:                        # Preds ..B1.39
                                # Execution count [7.34e-03]: Infreq
..LN254:
        movslq    %edx, %rdx                                    #596.3
..LN255:
	.loc    1  597  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #597.11
..LN256:
	.loc    1  598  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #598.11
..LN257:
	.loc    1  599  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #599.11
..LN258:
	.loc    1  600  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #600.11
..LN259:
	.loc    1  596  is_stmt 1
        movslq    %r8d, %rax                                    #596.3
..LN260:
        movq      144(%rsp), %rbx                               #596.3[spill]
..LN261:
        movq      136(%rsp), %rdi                               #596.3[spill]
..LN262:
        movq      128(%rsp), %r9                                #596.3[spill]
..LN263:
        movq      120(%rsp), %r10                               #596.3[spill]
..LN264:
        movq      48(%rsp), %r11                                #596.3[spill]
..LN265:
        movq      32(%rsp), %rcx                                #596.3[spill]
..LN266:
        movq      24(%rsp), %rsi                                #596.3[spill]
..LN267:
        movq      208(%rsp), %r14                               #596.3[spill]
        .align    16,0x90
..LN268:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.41:                        # Preds ..B1.41 ..B1.40
                                # Execution count [4.08e-02]: Infreq
..LN269:
	.loc    1  597  is_stmt 1
        vmovupd   %zmm3, (%r14,%rdx,8)                          #597.4
..LN270:
	.loc    1  598  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #598.4
..LN271:
	.loc    1  599  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #599.4
..LN272:
	.loc    1  600  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #600.4
..LN273:
	.loc    1  601  is_stmt 1
        vmovupd   %zmm3, (%r10,%rdx,8)                          #601.4
..LN274:
	.loc    1  602  is_stmt 1
        vmovupd   %zmm2, (%r9,%rdx,8)                           #602.4
..LN275:
	.loc    1  603  is_stmt 1
        vmovupd   %zmm1, (%rdi,%rdx,8)                          #603.4
..LN276:
	.loc    1  604  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%rdx,8)                          #604.4
..LN277:
	.loc    1  596  is_stmt 1
        addq      $8, %rdx                                      #596.3
..LN278:
        cmpq      %rax, %rdx                                    #596.3
..LN279:
        jb        ..B1.41       # Prob 81%                      #596.3
..LN280:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.43:                        # Preds ..B1.41 ..B1.39 ..B1.104
                                # Execution count [8.16e-03]: Infreq
..LN281:
        lea       1(%r8), %edx                                  #596.3
..LN282:
        cmpl      %r13d, %edx                                   #596.3
..LN283:
        ja        ..B1.47       # Prob 50%                      #596.3
..LN284:
                                # LOE r15 r8d r12d r13d
..B1.44:                        # Preds ..B1.43
                                # Execution count [7.34e-03]: Infreq
..LN285:
        movl      $255, %eax                                    #596.3
..LN286:
        movl      $8, %r11d                                     #596.3
..LN287:
        kmovw     %eax, %k1                                     #596.3
..LN288:
        xorl      %ecx, %ecx                                    #596.3
..LN289:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #596.3
..LN290:
	.loc    1  597  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #597.11
..LN291:
	.loc    1  596  is_stmt 1
        vmovd     %r11d, %xmm6                                  #596.3
..LN292:
	.loc    1  598  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #598.11
..LN293:
	.loc    1  599  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #599.11
..LN294:
	.loc    1  600  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #600.11
..LN295:
	.loc    1  596  is_stmt 1
        movslq    %r8d, %rax                                    #596.3
..LN296:
        negl      %r8d                                          #596.3
..LN297:
        addl      %r13d, %r8d                                   #596.3
..LN298:
	.loc    1  598  is_stmt 1
        movq      24(%rsp), %rsi                                #598.4[spill]
..LN299:
	.loc    1  604  is_stmt 1
        movq      144(%rsp), %r10                               #604.4[spill]
..LN300:
	.loc    1  603  is_stmt 1
        movq      136(%rsp), %r9                                #603.4[spill]
..LN301:
	.loc    1  601  is_stmt 1
        movq      120(%rsp), %rdi                               #601.4[spill]
..LN302:
	.loc    1  598  is_stmt 1
        lea       (%rsi,%rax,8), %r14                           #598.4
..LN303:
	.loc    1  600  is_stmt 1
        movq      48(%rsp), %rbx                                #600.4[spill]
..LN304:
	.loc    1  596  is_stmt 1
        vmovd     %r8d, %xmm0                                   #596.3
..LN305:
	.loc    1  602  is_stmt 1
        movq      128(%rsp), %r8                                #602.4[spill]
..LN306:
	.loc    1  604  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #604.4
..LN307:
	.loc    1  599  is_stmt 1
        movq      32(%rsp), %rdx                                #599.4[spill]
..LN308:
	.loc    1  603  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #603.4
..LN309:
	.loc    1  597  is_stmt 1
        movq      208(%rsp), %rsi                               #597.4[spill]
..LN310:
	.loc    1  601  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #601.4
..LN311:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN312:
	.loc    1  602  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #602.4
..LN313:
	.loc    1  600  is_stmt 1
        lea       (%rbx,%rax,8), %rbx                           #600.4
..LN314:
	.loc    1  596  is_stmt 1
        movq      112(%rsp), %r11                               #596.3[spill]
..LN315:
	.loc    1  599  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #599.4
..LN316:
	.loc    1  596  is_stmt 1
        subq      %rax, %r11                                    #596.3
..LN317:
        vpbroadcastd %xmm6, %ymm6                               #596.3
..LN318:
	.loc    1  597  is_stmt 1
        lea       (%rsi,%rax,8), %rsi                           #597.4
..LN319:
	.loc    1  596  is_stmt 1
        xorl      %eax, %eax                                    #596.3
        .align    16,0x90
..LN320:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.45:                        # Preds ..B1.45 ..B1.44
                                # Execution count [4.08e-02]: Infreq
..LN321:
        addq      $8, %rcx                                      #596.3
..LN322:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #596.3
..LN323:
        vpaddd    %ymm6, %ymm5, %ymm5                           #596.3
..LN324:
	.loc    1  597  is_stmt 1
        vmovupd   %zmm4, (%rax,%rsi){%k2}                       #597.4
..LN325:
	.loc    1  598  is_stmt 1
        vmovupd   %zmm3, (%rax,%r14){%k2}                       #598.4
..LN326:
	.loc    1  599  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #599.4
..LN327:
	.loc    1  600  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #600.4
..LN328:
	.loc    1  601  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #601.4
..LN329:
	.loc    1  602  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #602.4
..LN330:
	.loc    1  603  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #603.4
..LN331:
	.loc    1  604  is_stmt 1
        vmovupd   %zmm1, (%rax,%r10){%k2}                       #604.4
..LN332:
	.loc    1  596  is_stmt 1
        addq      $64, %rax                                     #596.3
..LN333:
        cmpq      %r11, %rcx                                    #596.3
..LN334:
        jb        ..B1.45       # Prob 81%                      #596.3
..LN335:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.47:                        # Preds ..B1.45 ..B1.38 ..B1.43
                                # Execution count [7.34e-03]: Infreq
..LN336:
        movq      168(%rsp), %r8                                #596.3[spill]
..LN337:
        andq      $63, %r8                                      #596.3
..LN338:
        testl     %r8d, %r8d                                    #596.3
..LN339:
        je        ..B1.50       # Prob 50%                      #596.3
..LN340:
                                # LOE r15 r8d r12d r13d
..B1.48:                        # Preds ..B1.47
                                # Execution count [7.34e-03]: Infreq
..LN341:
        testl     $7, %r8d                                      #596.3
..LN342:
        jne       ..B1.103      # Prob 10%                      #596.3
..LN343:
                                # LOE r15 r8d r12d r13d
..B1.49:                        # Preds ..B1.48
                                # Execution count [0.00e+00]: Infreq
..LN344:
        negl      %r8d                                          #596.3
..LN345:
        addl      $64, %r8d                                     #596.3
..LN346:
        shrl      $3, %r8d                                      #596.3
..LN347:
        cmpl      %r8d, %r13d                                   #596.3
..LN348:
        cmovl     %r13d, %r8d                                   #596.3
..LN349:
                                # LOE r15 r8d r12d r13d
..B1.50:                        # Preds ..B1.49 ..B1.47
                                # Execution count [8.16e-03]: Infreq
..LN350:
        movl      %r13d, %eax                                   #596.3
..LN351:
        subl      %r8d, %eax                                    #596.3
..LN352:
        andl      $7, %eax                                      #596.3
..LN353:
        negl      %eax                                          #596.3
..LN354:
        addl      %r13d, %eax                                   #596.3
..LN355:
        cmpl      $1, %r8d                                      #596.3
..LN356:
        jb        ..B1.54       # Prob 50%                      #596.3
..LN357:
                                # LOE r15 eax r8d r12d r13d
..B1.51:                        # Preds ..B1.50
                                # Execution count [7.34e-03]: Infreq
..LN358:
        movl      $255, %edx                                    #596.3
..LN359:
        vmovd     %r8d, %xmm0                                   #596.3
..LN360:
        kmovw     %edx, %k1                                     #596.3
..LN361:
        movl      $8, %edx                                      #596.3
..LN362:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #596.3
..LN363:
	.loc    1  605  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #605.11
..LN364:
	.loc    1  606  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #606.11
..LN365:
	.loc    1  596  is_stmt 1
        vmovd     %edx, %xmm5                                   #596.3
..LN366:
	.loc    1  607  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #607.11
..LN367:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN368:
        xorl      %edi, %edi                                    #596.3
..LN369:
        vpbroadcastd %xmm5, %ymm5                               #596.3
..LN370:
        xorl      %edx, %edx                                    #596.3
..LN371:
        movslq    %r8d, %rbx                                    #596.3
..LN372:
        movq      168(%rsp), %r9                                #596.3[spill]
..LN373:
        movq      160(%rsp), %r10                               #596.3[spill]
..LN374:
        movq      152(%rsp), %r11                               #596.3[spill]
..LN375:
                                # LOE rdx rbx rdi r9 r10 r11 r15 eax r8d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.52:                        # Preds ..B1.52 ..B1.51
                                # Execution count [4.08e-02]: Infreq
..LN376:
        addq      $8, %rdi                                      #596.3
..LN377:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #596.3
..LN378:
        vpaddd    %ymm5, %ymm4, %ymm4                           #596.3
..LN379:
	.loc    1  605  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r11){%k2}                       #605.4
..LN380:
	.loc    1  606  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r10){%k2}                       #606.4
..LN381:
	.loc    1  607  is_stmt 1
        vmovupd   %zmm1, (%rdx,%r9){%k2}                        #607.4
..LN382:
	.loc    1  596  is_stmt 1
        addq      $64, %rdx                                     #596.3
..LN383:
        cmpq      %rbx, %rdi                                    #596.3
..LN384:
        jb        ..B1.52       # Prob 81%                      #596.3
..LN385:
                                # LOE rdx rbx rdi r9 r10 r11 r15 eax r8d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.53:                        # Preds ..B1.52
                                # Execution count [7.34e-03]: Infreq
..LN386:
        cmpl      %r8d, %r13d                                   #596.3
..LN387:
        je        ..B1.62       # Prob 10%                      #596.3
..LN388:
                                # LOE r15 eax r8d r12d r13d
..B1.54:                        # Preds ..B1.50 ..B1.53
                                # Execution count [0.00e+00]: Infreq
..LN389:
        lea       8(%r8), %edx                                  #596.3
..LN390:
        cmpl      %edx, %eax                                    #596.3
..LN391:
        jl        ..B1.58       # Prob 50%                      #596.3
..LN392:
                                # LOE r15 eax r8d r12d r13d
..B1.55:                        # Preds ..B1.54
                                # Execution count [7.34e-03]: Infreq
..LN393:
        movslq    %r8d, %r8                                     #596.3
..LN394:
	.loc    1  605  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #605.11
..LN395:
	.loc    1  606  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #606.11
..LN396:
	.loc    1  607  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm0             #607.11
..LN397:
	.loc    1  596  is_stmt 1
        movslq    %eax, %rdx                                    #596.3
..LN398:
        movq      168(%rsp), %rbx                               #596.3[spill]
..LN399:
        movq      160(%rsp), %rdi                               #596.3[spill]
..LN400:
        movq      152(%rsp), %r9                                #596.3[spill]
..LN401:
                                # LOE rdx rbx rdi r8 r9 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.56:                        # Preds ..B1.56 ..B1.55
                                # Execution count [4.08e-02]: Infreq
..LN402:
	.loc    1  605  is_stmt 1
        vmovupd   %zmm2, (%r9,%r8,8)                            #605.4
..LN403:
	.loc    1  606  is_stmt 1
        vmovupd   %zmm1, (%rdi,%r8,8)                           #606.4
..LN404:
	.loc    1  607  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r8,8)                           #607.4
..LN405:
	.loc    1  596  is_stmt 1
        addq      $8, %r8                                       #596.3
..LN406:
        cmpq      %rdx, %r8                                     #596.3
..LN407:
        jb        ..B1.56       # Prob 81%                      #596.3
..LN408:
                                # LOE rdx rbx rdi r8 r9 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.58:                        # Preds ..B1.56 ..B1.54 ..B1.103
                                # Execution count [8.16e-03]: Infreq
..LN409:
        lea       1(%rax), %edx                                 #596.3
..LN410:
        cmpl      %r13d, %edx                                   #596.3
..LN411:
        ja        ..B1.62       # Prob 50%                      #596.3
..LN412:
                                # LOE r15 eax r12d r13d
..B1.59:                        # Preds ..B1.58
                                # Execution count [7.34e-03]: Infreq
..LN413:
        movslq    %eax, %r10                                    #596.3
..LN414:
        negl      %eax                                          #596.3
..LN415:
        addl      %r13d, %eax                                   #596.3
..LN416:
        movl      $8, %r8d                                      #596.3
..LN417:
        movl      $255, %edx                                    #596.3
..LN418:
        xorl      %r9d, %r9d                                    #596.3
..LN419:
        kmovw     %edx, %k1                                     #596.3
..LN420:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #596.3
..LN421:
        vmovd     %eax, %xmm0                                   #596.3
..LN422:
        vmovd     %r8d, %xmm5                                   #596.3
..LN423:
	.loc    1  605  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #605.11
..LN424:
	.loc    1  606  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #606.11
..LN425:
	.loc    1  607  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #607.11
..LN426:
        movq      168(%rsp), %rdi                               #607.4[spill]
..LN427:
	.loc    1  596  is_stmt 1
        xorl      %eax, %eax                                    #596.3
..LN428:
	.loc    1  606  is_stmt 1
        movq      160(%rsp), %rbx                               #606.4[spill]
..LN429:
	.loc    1  605  is_stmt 1
        movq      152(%rsp), %rdx                               #605.4[spill]
..LN430:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN431:
	.loc    1  607  is_stmt 1
        lea       (%rdi,%r10,8), %rdi                           #607.4
..LN432:
	.loc    1  596  is_stmt 1
        movq      112(%rsp), %r8                                #596.3[spill]
..LN433:
	.loc    1  606  is_stmt 1
        lea       (%rbx,%r10,8), %rbx                           #606.4
..LN434:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm5, %ymm5                               #596.3
..LN435:
        subq      %r10, %r8                                     #596.3
..LN436:
	.loc    1  605  is_stmt 1
        lea       (%rdx,%r10,8), %rdx                           #605.4
..LN437:
                                # LOE rax rdx rbx rdi r8 r9 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.60:                        # Preds ..B1.60 ..B1.59
                                # Execution count [4.08e-02]: Infreq
..LN438:
	.loc    1  596  is_stmt 1
        addq      $8, %r9                                       #596.3
..LN439:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #596.3
..LN440:
        vpaddd    %ymm5, %ymm4, %ymm4                           #596.3
..LN441:
	.loc    1  605  is_stmt 1
        vmovupd   %zmm3, (%rax,%rdx){%k2}                       #605.4
..LN442:
	.loc    1  606  is_stmt 1
        vmovupd   %zmm2, (%rax,%rbx){%k2}                       #606.4
..LN443:
	.loc    1  607  is_stmt 1
        vmovupd   %zmm1, (%rax,%rdi){%k2}                       #607.4
..LN444:
	.loc    1  596  is_stmt 1
        addq      $64, %rax                                     #596.3
..LN445:
        cmpq      %r8, %r9                                      #596.3
..LN446:
        jb        ..B1.60       # Prob 81%                      #596.3
..LN447:
                                # LOE rax rdx rbx rdi r8 r9 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.62:                        # Preds ..B1.60 ..B1.31 ..B1.53 ..B1.58
                                # Execution count [8.16e-03]: Infreq
..LN448:
	.loc    1  612  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #612.3
..LN449:
	.loc    1  610  is_stmt 1
        movl      $1, %r14d                                     #610.3
..LN450:
	.loc    1  612  is_stmt 1
        vzeroupper                                              #612.3
..___tag_value_main.15:
..LN451:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #612.3
..___tag_value_main.16:
..LN452:
                                # LOE r15 r12d r13d r14d
..B1.63:                        # Preds ..B1.62
                                # Execution count [8.16e-03]: Infreq
..LN453:
	.loc    1  614  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #614.11
..LN454:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #614.24
..LN455:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #614.15
..LN456:
        vcomisd   %xmm1, %xmm0                                  #614.24
..LN457:
        jbe       ..B1.89       # Prob 10%                      #614.24
..LN458:
                                # LOE r15 r12d r13d r14d
..B1.64:                        # Preds ..B1.63
                                # Execution count [7.34e-03]: Infreq
..LN459:
	.loc    1  621  is_stmt 1
        movl      $8, %edx                                      #621.5
..LN460:
        movl      %r13d, %ebx                                   #621.5
..LN461:
        andl      $-64, %ebx                                    #621.5
..LN462:
	.loc    1  616  is_stmt 1
        lea       56(%rsp), %rdi                                #616.4
..LN463:
	.loc    1  621  is_stmt 1
        movslq    %ebx, %rbx                                    #621.5
..LN464:
	.loc    1  616  is_stmt 1
        lea       40(%rsp), %rsi                                #616.4
..LN465:
	.loc    1  621  is_stmt 1
        movq      %rbx, 136(%rsi)                               #621.5[spill]
..LN466:
        vmovd     %edx, %xmm0                                   #621.5
..LN467:
        vpbroadcastd %xmm0, %ymm1                               #621.5
..LN468:
        vmovdqu   %ymm1, 24(%rsi)                               #621.5[spill]
..LN469:
	.loc    1  616  is_stmt 1
        vzeroupper                                              #616.4
..___tag_value_main.17:
..LN470:
#       timing(double *, double *)
        call      timing                                        #616.4
..___tag_value_main.18:
..LN471:
                                # LOE r15 ebx r12d r13d r14d
..B1.65:                        # Preds ..B1.64
                                # Execution count [6.61e-03]: Infreq
..LN472:
	.loc    1  617  is_stmt 1
        xorl      %edx, %edx                                    #617.4
..LN473:
        movl      %edx, 200(%rsp)                               #617.4[spill]
..LN474:
        vxorpd    %xmm2, %xmm2, %xmm2                           #617.4
..LN475:
        movl      %ebx, 16(%rsp)                                #617.4[spill]
..LN476:
        movl      %r14d, 184(%rsp)                              #617.4[spill]
..LN477:
        movl      %r12d, (%rsp)                                 #617.4[spill]
..LN478:
        movq      %r15, 8(%rsp)                                 #617.4[spill]
..LN479:
        movl      %r13d, 192(%rsp)                              #617.4[spill]
..LN480:
                                # LOE xmm2
..B1.66:                        # Preds ..B1.65 ..B1.81 ..B1.87
                                # Execution count [2.04e-01]: Infreq
..LN481:
	.loc    1  621  is_stmt 1
        xorl      %ecx, %ecx                                    #621.9
..LN482:
        cmpl      $0, 192(%rsp)                                 #621.20[spill]
..LN483:
        jle       ..B1.79       # Prob 50%                      #621.20
..LN484:
                                # LOE ecx xmm2
..B1.67:                        # Preds ..B1.66
                                # Execution count [1.84e-01]: Infreq
..LN485:
        cmpl      $64, 192(%rsp)                                #621.5[spill]
..LN486:
        jl        ..B1.102      # Prob 10%                      #621.5
..LN487:
                                # LOE ecx xmm2
..B1.68:                        # Preds ..B1.67
                                # Execution count [1.84e-01]: Infreq
..LN488:
        movl      16(%rsp), %edx                                #621.5[spill]
..LN489:
                                # LOE edx xmm2
..B1.70:                        # Preds ..B1.68
                                # Execution count [1.84e-01]: Infreq
..LN490:
        movq      176(%rsp), %rcx                               #621.5[spill]
..LN491:
        xorl      %eax, %eax                                    #621.5
..LN492:
        movq      168(%rsp), %rbx                               #621.5[spill]
..LN493:
        movq      160(%rsp), %rsi                               #621.5[spill]
..LN494:
        movq      152(%rsp), %rdi                               #621.5[spill]
..LN495:
        movq      144(%rsp), %r8                                #621.5[spill]
..LN496:
        movq      136(%rsp), %r9                                #621.5[spill]
..LN497:
        movq      128(%rsp), %r10                               #621.5[spill]
..LN498:
        movq      120(%rsp), %r11                               #621.5[spill]
..LN499:
        movq      48(%rsp), %r12                                #621.5[spill]
..LN500:
        movq      32(%rsp), %r13                                #621.5[spill]
..LN501:
        movq      24(%rsp), %r14                                #621.5[spill]
..LN502:
        movq      208(%rsp), %r15                               #621.5[spill]
..LN503:
                                # LOE rax rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 edx xmm2
..B1.71:                        # Preds ..B1.71 ..B1.70
                                # Execution count [1.02e+00]: Infreq
..LN504:
	.loc    1  622  is_stmt 1
        vmovups   (%r14,%rax,8), %zmm0                          #622.13
..LN505:
        vmovups   (%r12,%rax,8), %zmm1                          #622.27
..LN506:
        vmovups   (%r10,%rax,8), %zmm5                          #622.41
..LN507:
        vmovups   (%r8,%rax,8), %zmm6                           #622.55
..LN508:
        vmovups   64(%r8,%rax,8), %zmm19                        #622.55
..LN509:
        vmovups   64(%r14,%rax,8), %zmm14                       #622.13
..LN510:
        vmovups   64(%r12,%rax,8), %zmm15                       #622.27
..LN511:
        vmovups   64(%r10,%rax,8), %zmm18                       #622.41
..LN512:
        vmovups   (%rdi,%rax,8), %zmm11                         #622.69
..LN513:
        vmovups   64(%rdi,%rax,8), %zmm24                       #622.69
..LN514:
        vaddpd    (%r13,%rax,8), %zmm0, %zmm3                   #622.76
..LN515:
        vaddpd    (%r11,%rax,8), %zmm1, %zmm4                   #622.76
..LN516:
        vaddpd    (%r9,%rax,8), %zmm5, %zmm7                    #622.76
..LN517:
        vaddpd    (%rsi,%rax,8), %zmm6, %zmm8                   #622.76
..LN518:
        vaddpd    64(%rsi,%rax,8), %zmm19, %zmm21               #622.76
..LN519:
        vaddpd    64(%r13,%rax,8), %zmm14, %zmm16               #622.76
..LN520:
        vaddpd    64(%r11,%rax,8), %zmm15, %zmm17               #622.76
..LN521:
        vaddpd    64(%r9,%rax,8), %zmm18, %zmm20                #622.76
..LN522:
        vaddpd    %zmm4, %zmm3, %zmm9                           #622.76
..LN523:
        vaddpd    %zmm8, %zmm7, %zmm10                          #622.76
..LN524:
        vaddpd    %zmm17, %zmm16, %zmm22                        #622.76
..LN525:
        vaddpd    %zmm21, %zmm20, %zmm23                        #622.76
..LN526:
        vaddpd    %zmm10, %zmm9, %zmm12                         #622.76
..LN527:
        vaddpd    (%rbx,%rax,8), %zmm11, %zmm13                 #622.76
..LN528:
        vaddpd    64(%rbx,%rax,8), %zmm24, %zmm26               #622.76
..LN529:
        vaddpd    %zmm23, %zmm22, %zmm25                        #622.76
..LN530:
        vaddpd    %zmm13, %zmm12, %zmm27                        #622.76
..LN531:
        vaddpd    %zmm26, %zmm25, %zmm28                        #622.76
..LN532:
        vmovntpd  %zmm27, (%r15,%rax,8)                         #622.6
..LN533:
        vmovntpd  %zmm28, 64(%r15,%rax,8)                       #622.6
..LN534:
        vmovups   128(%r14,%rax,8), %zmm29                      #622.13
..LN535:
        vmovups   128(%r12,%rax,8), %zmm30                      #622.27
..LN536:
        vmovups   128(%r10,%rax,8), %zmm0                       #622.41
..LN537:
        vmovups   128(%r8,%rax,8), %zmm1                        #622.55
..LN538:
        vmovups   192(%r8,%rax,8), %zmm13                       #622.55
..LN539:
        vmovups   192(%r14,%rax,8), %zmm8                       #622.13
..LN540:
        vmovups   192(%r12,%rax,8), %zmm9                       #622.27
..LN541:
        .byte     15                                            #622.41
..LN542:
        .byte     31                                            #622.41
..LN543:
        .byte     0                                             #622.41
..LN544:
        vmovups   192(%r10,%rax,8), %zmm12                      #622.41
..LN545:
        vmovups   128(%rdi,%rax,8), %zmm5                       #622.69
..LN546:
        vmovups   192(%rdi,%rax,8), %zmm18                      #622.69
..LN547:
        vaddpd    128(%r13,%rax,8), %zmm29, %zmm31              #622.76
..LN548:
        vaddpd    128(%r11,%rax,8), %zmm30, %zmm29              #622.76
..LN549:
        vaddpd    128(%r9,%rax,8), %zmm0, %zmm30                #622.76
..LN550:
        vaddpd    192(%r9,%rax,8), %zmm12, %zmm14               #622.76
..LN551:
        vaddpd    %zmm29, %zmm31, %zmm3                         #622.76
..LN552:
        vaddpd    128(%rsi,%rax,8), %zmm1, %zmm31               #622.76
..LN553:
        vaddpd    192(%rsi,%rax,8), %zmm13, %zmm15              #622.76
..LN554:
        vaddpd    192(%r13,%rax,8), %zmm8, %zmm10               #622.76
..LN555:
        vaddpd    192(%r11,%rax,8), %zmm9, %zmm11               #622.76
..LN556:
        vaddpd    %zmm31, %zmm30, %zmm4                         #622.76
..LN557:
        vaddpd    %zmm15, %zmm14, %zmm17                        #622.76
..LN558:
        vaddpd    %zmm11, %zmm10, %zmm16                        #622.76
..LN559:
        vaddpd    %zmm4, %zmm3, %zmm6                           #622.76
..LN560:
        vaddpd    128(%rbx,%rax,8), %zmm5, %zmm7                #622.76
..LN561:
        vaddpd    192(%rbx,%rax,8), %zmm18, %zmm20              #622.76
..LN562:
        vaddpd    %zmm17, %zmm16, %zmm19                        #622.76
..LN563:
        vaddpd    %zmm7, %zmm6, %zmm21                          #622.76
..LN564:
        vaddpd    %zmm20, %zmm19, %zmm22                        #622.76
..LN565:
        vmovntpd  %zmm21, 128(%r15,%rax,8)                      #622.6
..LN566:
        vmovntpd  %zmm22, 192(%r15,%rax,8)                      #622.6
..LN567:
        vmovups   256(%r14,%rax,8), %zmm23                      #622.13
..LN568:
        vmovups   256(%r12,%rax,8), %zmm24                      #622.27
..LN569:
        vmovups   256(%r10,%rax,8), %zmm27                      #622.41
..LN570:
        vmovups   256(%r8,%rax,8), %zmm28                       #622.55
..LN571:
        vmovups   320(%r8,%rax,8), %zmm7                        #622.55
..LN572:
        vmovups   320(%r14,%rax,8), %zmm1                       #622.13
..LN573:
        vmovups   320(%r12,%rax,8), %zmm3                       #622.27
..LN574:
        vmovups   320(%r10,%rax,8), %zmm6                       #622.41
..LN575:
        vmovups   256(%rdi,%rax,8), %zmm0                       #622.69
..LN576:
        vmovups   320(%rdi,%rax,8), %zmm12                      #622.69
..LN577:
        vaddpd    256(%r13,%rax,8), %zmm23, %zmm25              #622.76
..LN578:
        vaddpd    256(%r11,%rax,8), %zmm24, %zmm26              #622.76
..LN579:
        .byte     144                                           #622.76
..LN580:
        vaddpd    256(%r9,%rax,8), %zmm27, %zmm27               #622.76
..LN581:
        vaddpd    256(%rsi,%rax,8), %zmm28, %zmm28              #622.76
..LN582:
        vaddpd    320(%rsi,%rax,8), %zmm7, %zmm9                #622.76
..LN583:
        vaddpd    320(%r13,%rax,8), %zmm1, %zmm4                #622.76
..LN584:
        vaddpd    320(%r11,%rax,8), %zmm3, %zmm5                #622.76
..LN585:
        vaddpd    320(%r9,%rax,8), %zmm6, %zmm8                 #622.76
..LN586:
        vaddpd    %zmm26, %zmm25, %zmm23                        #622.76
..LN587:
        vaddpd    %zmm28, %zmm27, %zmm24                        #622.76
..LN588:
        vaddpd    %zmm5, %zmm4, %zmm10                          #622.76
..LN589:
        vaddpd    %zmm9, %zmm8, %zmm11                          #622.76
..LN590:
        vaddpd    %zmm24, %zmm23, %zmm25                        #622.76
..LN591:
        .byte     102                                           #622.76
..LN592:
        .byte     144                                           #622.76
..LN593:
        vaddpd    256(%rbx,%rax,8), %zmm0, %zmm26               #622.76
..LN594:
        vaddpd    320(%rbx,%rax,8), %zmm12, %zmm14              #622.76
..LN595:
        vaddpd    %zmm11, %zmm10, %zmm13                        #622.76
..LN596:
        vaddpd    %zmm26, %zmm25, %zmm15                        #622.76
..LN597:
        vaddpd    %zmm14, %zmm13, %zmm16                        #622.76
..LN598:
        vmovntpd  %zmm15, 256(%r15,%rax,8)                      #622.6
..LN599:
        vmovntpd  %zmm16, 320(%r15,%rax,8)                      #622.6
..LN600:
        vmovups   384(%r14,%rax,8), %zmm17                      #622.13
..LN601:
        vmovups   384(%r12,%rax,8), %zmm18                      #622.27
..LN602:
        vmovups   384(%r10,%rax,8), %zmm21                      #622.41
..LN603:
        vmovups   384(%r8,%rax,8), %zmm22                       #622.55
..LN604:
        vmovups   448(%r8,%rax,8), %zmm5                        #622.55
..LN605:
        vmovups   448(%r14,%rax,8), %zmm1                       #622.13
..LN606:
        vmovups   448(%r12,%rax,8), %zmm3                       #622.27
..LN607:
        vmovups   448(%r10,%rax,8), %zmm4                       #622.41
..LN608:
        vmovups   384(%rdi,%rax,8), %zmm0                       #622.69
..LN609:
        vmovups   448(%rdi,%rax,8), %zmm6                       #622.69
..LN610:
        vaddpd    384(%r13,%rax,8), %zmm17, %zmm19              #622.76
..LN611:
        vaddpd    384(%r11,%rax,8), %zmm18, %zmm20              #622.76
..LN612:
        vaddpd    384(%r9,%rax,8), %zmm21, %zmm29               #622.76
..LN613:
        vaddpd    384(%rsi,%rax,8), %zmm22, %zmm30              #622.76
..LN614:
        vaddpd    %zmm20, %zmm19, %zmm31                        #622.76
..LN615:
        vaddpd    448(%r13,%rax,8), %zmm1, %zmm20               #622.76
..LN616:
        vaddpd    %zmm30, %zmm29, %zmm17                        #622.76
..LN617:
        vaddpd    448(%r11,%rax,8), %zmm3, %zmm21               #622.76
..LN618:
        vaddpd    448(%r9,%rax,8), %zmm4, %zmm22                #622.76
..LN619:
        vaddpd    448(%rsi,%rax,8), %zmm5, %zmm29               #622.76
..LN620:
        vaddpd    %zmm17, %zmm31, %zmm18                        #622.76
..LN621:
        vaddpd    %zmm21, %zmm20, %zmm30                        #622.76
..LN622:
        vaddpd    %zmm29, %zmm22, %zmm31                        #622.76
..LN623:
        vaddpd    384(%rbx,%rax,8), %zmm0, %zmm19               #622.76
..LN624:
        vaddpd    448(%rbx,%rax,8), %zmm6, %zmm8                #622.76
..LN625:
        vaddpd    %zmm31, %zmm30, %zmm7                         #622.76
..LN626:
        vaddpd    %zmm19, %zmm18, %zmm9                         #622.76
..LN627:
        vaddpd    %zmm8, %zmm7, %zmm10                          #622.76
..LN628:
        vmovntpd  %zmm9, 384(%r15,%rax,8)                       #622.6
..LN629:
        vmovntpd  %zmm10, 448(%r15,%rax,8)                      #622.6
..LN630:
	.loc    1  621  is_stmt 1
        addq      $64, %rax                                     #621.5
..LN631:
        cmpq      %rcx, %rax                                    #621.5
..LN632:
        jb        ..B1.71       # Prob 82%                      #621.5
..LN633:
                                # LOE rax rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 edx xmm2
..B1.72:                        # Preds ..B1.71
                                # Execution count [1.84e-01]: Infreq
..LN634:
        movl      %edx, %ecx                                    #621.36
..LN635:
                                # LOE edx ecx xmm2
..B1.73:                        # Preds ..B1.72 ..B1.102
                                # Execution count [2.04e-01]: Infreq
..LN636:
        lea       1(%rdx), %eax                                 #621.5
..LN637:
        cmpl      192(%rsp), %eax                               #621.5[spill]
..LN638:
        ja        ..B1.79       # Prob 50%                      #621.5
..LN639:
                                # LOE edx ecx xmm2
..B1.74:                        # Preds ..B1.73
                                # Execution count [1.84e-01]: Infreq
..LN640:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm0             #621.5
..LN641:
                                # LOE edx xmm2 ymm0
..B1.76:                        # Preds ..B1.74
                                # Execution count [1.84e-01]: Infreq
..LN642:
        movl      $255, %eax                                    #621.5
..LN643:
        xorl      %r14d, %r14d                                  #621.5
..LN644:
        kmovw     %eax, %k1                                     #621.5
..LN645:
        movslq    %edx, %rax                                    #621.5
..LN646:
        negl      %edx                                          #621.5
..LN647:
        addl      192(%rsp), %edx                               #621.5[spill]
..LN648:
	.loc    1  622  is_stmt 1
        movq      208(%rsp), %rbx                               #622.6[spill]
..LN649:
        movq      168(%rsp), %rcx                               #622.76[spill]
..LN650:
        movq      160(%rsp), %r13                               #622.62[spill]
..LN651:
        movq      144(%rsp), %rdi                               #622.55[spill]
..LN652:
	.loc    1  621  is_stmt 1
        vmovd     %edx, %xmm1                                   #621.5
..LN653:
	.loc    1  622  is_stmt 1
        movq      152(%rsp), %rdx                               #622.69[spill]
..LN654:
        lea       (%rbx,%rax,8), %rbx                           #622.6
..LN655:
        movq      136(%rsp), %r8                                #622.48[spill]
..LN656:
        lea       (%rcx,%rax,8), %rcx                           #622.76
..LN657:
        movq      128(%rsp), %r9                                #622.41[spill]
..LN658:
        lea       (%r13,%rax,8), %r13                           #622.62
..LN659:
        movq      120(%rsp), %r10                               #622.34[spill]
..LN660:
        lea       (%rdx,%rax,8), %rdx                           #622.69
..LN661:
        movq      48(%rsp), %r11                                #622.27[spill]
..LN662:
        lea       (%rdi,%rax,8), %rdi                           #622.55
..LN663:
        movq      32(%rsp), %r12                                #622.20[spill]
..LN664:
        lea       (%r8,%rax,8), %r8                             #622.48
..LN665:
        movq      24(%rsp), %r15                                #622.13[spill]
..LN666:
        lea       (%r9,%rax,8), %r9                             #622.41
..LN667:
	.loc    1  621  is_stmt 1
        vpbroadcastd %xmm1, %ymm3                               #621.5
..LN668:
	.loc    1  622  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #622.34
..LN669:
	.loc    1  621  is_stmt 1
        movq      112(%rsp), %rsi                               #621.5[spill]
..LN670:
	.loc    1  622  is_stmt 1
        lea       (%r11,%rax,8), %r11                           #622.27
..LN671:
	.loc    1  621  is_stmt 1
        vmovdqu   64(%rsp), %ymm1                               #621.5[spill]
..LN672:
        subq      %rax, %rsi                                    #621.5
..LN673:
	.loc    1  622  is_stmt 1
        lea       (%r12,%rax,8), %r12                           #622.20
..LN674:
        lea       (%r15,%rax,8), %r15                           #622.13
..LN675:
	.loc    1  621  is_stmt 1
        xorl      %eax, %eax                                    #621.5
        .align    16,0x90
..LN676:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm2 ymm0 ymm1 zmm3 k1
..B1.77:                        # Preds ..B1.77 ..B1.76
                                # Execution count [1.02e+00]: Infreq
..LN677:
	.loc    1  622  is_stmt 1
        vmovups   (%rax,%r15), %zmm4                            #622.13
..LN678:
	.loc    1  621  is_stmt 1
        addq      $8, %r14                                      #621.5
..LN679:
	.loc    1  622  is_stmt 1
        vmovups   (%rax,%r11), %zmm5                            #622.27
..LN680:
        vmovups   (%rax,%r9), %zmm8                             #622.41
..LN681:
        vmovups   (%rax,%rdi), %zmm9                            #622.55
..LN682:
        vmovups   (%rax,%rdx), %zmm14                           #622.69
..LN683:
        vaddpd    (%rax,%r12), %zmm4, %zmm6                     #622.76
..LN684:
        vaddpd    (%rax,%r10), %zmm5, %zmm7                     #622.76
..LN685:
        vaddpd    (%rax,%r8), %zmm8, %zmm10                     #622.76
..LN686:
        vaddpd    (%rax,%r13), %zmm9, %zmm11                    #622.76
..LN687:
        vaddpd    %zmm7, %zmm6, %zmm12                          #622.76
..LN688:
        vaddpd    (%rax,%rcx), %zmm14, %zmm16                   #622.76
..LN689:
        vaddpd    %zmm11, %zmm10, %zmm13                        #622.76
..LN690:
        vaddpd    %zmm13, %zmm12, %zmm15                        #622.76
..LN691:
        vaddpd    %zmm16, %zmm15, %zmm17                        #622.76
..LN692:
	.loc    1  621  is_stmt 1
        vpcmpgtd  %zmm0, %zmm3, %k2{%k1}                        #621.5
..LN693:
        vpaddd    %ymm1, %ymm0, %ymm0                           #621.5
..LN694:
	.loc    1  622  is_stmt 1
        vmovupd   %zmm17, (%rax,%rbx){%k2}                      #622.6
..LN695:
	.loc    1  621  is_stmt 1
        addq      $64, %rax                                     #621.5
..LN696:
        cmpq      %rsi, %r14                                    #621.5
..LN697:
        jb        ..B1.77       # Prob 82%                      #621.5
..LN698:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm2 ymm0 ymm1 zmm3 k1
..B1.78:                        # Preds ..B1.77
                                # Execution count [1.84e-01]: Infreq
..LN699:
        movl      192(%rsp), %ecx                               #621.36[spill]
..LN700:
                                # LOE ecx xmm2
..B1.79:                        # Preds ..B1.78 ..B1.73 ..B1.66
                                # Execution count [2.04e-01]: Infreq
..LN701:
	.loc    1  624  is_stmt 1
        movslq    %ecx, %rcx                                    #624.8
..LN702:
        movq      208(%rsp), %rax                               #624.13[spill]
..LN703:
        vcomisd   (%rax,%rcx,8), %xmm2                          #624.13
..LN704:
        jbe       ..B1.81       # Prob 78%                      #624.13
..LN705:
                                # LOE xmm2
..B1.80:                        # Preds ..B1.79
                                # Execution count [4.49e-02]: Infreq
..LN706:
        movl      $il0_peep_printf_format_0, %edi               #624.16
..LN707:
        vzeroupper                                              #624.16
..LN708:
        call      puts                                          #624.16
..LN709:
                                # LOE
..B1.750:                       # Preds ..B1.80
                                # Execution count [4.49e-02]: Infreq
..LN710:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN711:
                                # LOE xmm2
..B1.81:                        # Preds ..B1.79 ..B1.750
                                # Execution count [2.04e-01]: Infreq
..LN712:
	.loc    1  617  is_stmt 1
        movl      200(%rsp), %eax                               #617.4[spill]
..LN713:
        incl      %eax                                          #617.4
..LN714:
        movl      %eax, 200(%rsp)                               #617.4[spill]
..LN715:
        cmpl      184(%rsp), %eax                               #617.4[spill]
..LN716:
        jb        ..B1.66       # Prob 81%                      #617.4
..LN717:
                                # LOE xmm2
..B1.82:                        # Preds ..B1.81
                                # Execution count [3.74e-02]: Infreq
..LN718:
        movl      184(%rsp), %r14d                              #[spill]
..LN719:
                                # LOE r14d
..B1.83:                        # Preds ..B1.86 ..B1.82
                                # Execution count [4.08e-02]: Infreq
..LN720:
	.loc    1  627  is_stmt 1
        vzeroupper                                              #627.4
..LN721:
        lea       96(%rsp), %rdi                                #627.4
..LN722:
        lea       40(%rsp), %rsi                                #627.4
..___tag_value_main.19:
..LN723:
#       timing(double *, double *)
        call      timing                                        #627.4
..___tag_value_main.20:
..LN724:
                                # LOE r14d
..B1.84:                        # Preds ..B1.83
                                # Execution count [4.08e-02]: Infreq
..LN725:
	.loc    1  614  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #614.11
..LN726:
	.loc    1  628  is_stmt 1
        addl      %r14d, %r14d                                  #628.4
..LN727:
	.loc    1  614  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #614.24
..LN728:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #614.15
..LN729:
        vcomisd   %xmm1, %xmm0                                  #614.24
..LN730:
        jbe       ..B1.88       # Prob 18%                      #614.24
..LN731:
                                # LOE r14d
..B1.85:                        # Preds ..B1.84
                                # Execution count [3.34e-02]: Infreq
..LN732:
	.loc    1  616  is_stmt 1
        lea       56(%rsp), %rdi                                #616.4
..LN733:
        lea       40(%rsp), %rsi                                #616.4
..___tag_value_main.21:
..LN734:
#       timing(double *, double *)
        call      timing                                        #616.4
..___tag_value_main.22:
..LN735:
                                # LOE r14d
..B1.86:                        # Preds ..B1.85
                                # Execution count [3.34e-02]: Infreq
..LN736:
	.loc    1  617  is_stmt 1
        xorl      %eax, %eax                                    #617.4
..LN737:
        testl     %r14d, %r14d                                  #617.19
..LN738:
        jle       ..B1.83       # Prob 9%                       #617.19
..LN739:
                                # LOE eax r14d
..B1.87:                        # Preds ..B1.86
                                # Execution count [3.01e-02]: Infreq
..LN740:
        movl      %eax, 200(%rsp)                               #[spill]
..LN741:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN742:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN743:
        jmp       ..B1.66       # Prob 100%                     #
..LN744:
                                # LOE xmm2
..B1.88:                        # Preds ..B1.84
                                # Execution count [7.34e-03]: Infreq
..LN745:
        movl      (%rsp), %r12d                                 #[spill]
..LN746:
        movq      8(%rsp), %r15                                 #[spill]
..LN747:
        movl      192(%rsp), %r13d                              #[spill]
..LN748:
                                # LOE r15 r12d r13d r14d
..B1.89:                        # Preds ..B1.88 ..B1.63
                                # Execution count [8.16e-03]: Infreq
..LN749:
	.loc    1  631  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #631.3
..___tag_value_main.23:
..LN750:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #631.3
..___tag_value_main.24:
..LN751:
                                # LOE r15 r12d r13d r14d
..B1.90:                        # Preds ..B1.89
                                # Execution count [8.16e-03]: Infreq
..LN752:
	.loc    1  633  is_stmt 1
        movl      %r14d, %edx                                   #633.3
..LN753:
        shrl      $31, %edx                                     #633.3
..LN754:
        addl      %edx, %r14d                                   #633.3
..LN755:
        sarl      $1, %r14d                                     #633.3
..___tag_value_main.25:
..LN756:
	.loc    1  636  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #636.3
..___tag_value_main.26:
..LN757:
                                # LOE r15 r12d r13d r14d
..B1.91:                        # Preds ..B1.90
                                # Execution count [8.16e-03]: Infreq
..LN758:
	.loc    1  638  is_stmt 1
        movq      208(%rsp), %rdi                               #638.3[spill]
..LN759:
#       _mm_free(void *)
        call      _mm_free                                      #638.3
..LN760:
                                # LOE r15 r12d r13d r14d
..B1.92:                        # Preds ..B1.91
                                # Execution count [8.16e-03]: Infreq
..LN761:
	.loc    1  639  is_stmt 1
        movq      24(%rsp), %rdi                                #639.3[spill]
..LN762:
#       _mm_free(void *)
        call      _mm_free                                      #639.3
..LN763:
                                # LOE r15 r12d r13d r14d
..B1.93:                        # Preds ..B1.92
                                # Execution count [8.16e-03]: Infreq
..LN764:
	.loc    1  640  is_stmt 1
        movq      32(%rsp), %rdi                                #640.3[spill]
..LN765:
#       _mm_free(void *)
        call      _mm_free                                      #640.3
..LN766:
                                # LOE r15 r12d r13d r14d
..B1.94:                        # Preds ..B1.93
                                # Execution count [8.16e-03]: Infreq
..LN767:
	.loc    1  641  is_stmt 1
        movq      48(%rsp), %rdi                                #641.3[spill]
..LN768:
#       _mm_free(void *)
        call      _mm_free                                      #641.3
..LN769:
                                # LOE r15 r12d r13d r14d
..B1.95:                        # Preds ..B1.94
                                # Execution count [8.16e-03]: Infreq
..LN770:
	.loc    1  642  is_stmt 1
        movq      120(%rsp), %rdi                               #642.3[spill]
..LN771:
#       _mm_free(void *)
        call      _mm_free                                      #642.3
..LN772:
                                # LOE r15 r12d r13d r14d
..B1.96:                        # Preds ..B1.95
                                # Execution count [8.16e-03]: Infreq
..LN773:
	.loc    1  643  is_stmt 1
        movq      128(%rsp), %rdi                               #643.3[spill]
..LN774:
#       _mm_free(void *)
        call      _mm_free                                      #643.3
..LN775:
                                # LOE r15 r12d r13d r14d
..B1.97:                        # Preds ..B1.96
                                # Execution count [8.16e-03]: Infreq
..LN776:
	.loc    1  644  is_stmt 1
        movq      136(%rsp), %rdi                               #644.3[spill]
..LN777:
#       _mm_free(void *)
        call      _mm_free                                      #644.3
..LN778:
                                # LOE r15 r12d r13d r14d
..B1.98:                        # Preds ..B1.97
                                # Execution count [8.16e-03]: Infreq
..LN779:
	.loc    1  645  is_stmt 1
        movq      144(%rsp), %rdi                               #645.3[spill]
..LN780:
#       _mm_free(void *)
        call      _mm_free                                      #645.3
..LN781:
                                # LOE r15 r12d r13d r14d
..B1.99:                        # Preds ..B1.98
                                # Execution count [8.16e-03]: Infreq
..LN782:
	.loc    1  646  is_stmt 1
        movq      152(%rsp), %rdi                               #646.3[spill]
..LN783:
#       _mm_free(void *)
        call      _mm_free                                      #646.3
..LN784:
                                # LOE r15 r12d r13d r14d
..B1.100:                       # Preds ..B1.99
                                # Execution count [8.16e-03]: Infreq
..LN785:
	.loc    1  647  is_stmt 1
        movq      160(%rsp), %rdi                               #647.3[spill]
..LN786:
#       _mm_free(void *)
        call      _mm_free                                      #647.3
..LN787:
                                # LOE r15 r12d r13d r14d
..B1.101:                       # Preds ..B1.100
                                # Execution count [8.16e-03]: Infreq
..LN788:
	.loc    1  648  is_stmt 1
        movq      168(%rsp), %rdi                               #648.3[spill]
..LN789:
#       _mm_free(void *)
        call      _mm_free                                      #648.3
..LN790:
        jmp       ..B1.18       # Prob 100%                     #648.3
..LN791:
                                # LOE r15 r12d r13d r14d
..B1.102:                       # Preds ..B1.67
                                # Execution count [1.84e-02]: Infreq
..LN792:
	.loc    1  621  is_stmt 1
        xorl      %edx, %edx                                    #621.5
..LN793:
        jmp       ..B1.73       # Prob 100%                     #621.5
..LN794:
                                # LOE edx ecx xmm2
..B1.103:                       # Preds ..B1.48
                                # Execution count [7.34e-04]: Infreq
..LN795:
	.loc    1  596  is_stmt 1
        xorl      %eax, %eax                                    #596.3
..LN796:
        jmp       ..B1.58       # Prob 100%                     #596.3
..LN797:
                                # LOE r15 eax r12d r13d
..B1.104:                       # Preds ..B1.33
                                # Execution count [7.34e-04]: Infreq
..LN798:
        xorl      %r8d, %r8d                                    #596.3
..LN799:
        jmp       ..B1.43       # Prob 100%                     #596.3
..LN800:
                                # LOE r15 r8d r12d r13d
..B1.105:                       # Preds ..B1.16
                                # Execution count [8.16e-03]: Infreq
..LN801:
	.loc    1  516  is_stmt 1
        movq      %rbx, %rdi                                    #516.16
..LN802:
        movq      %r15, %rsi                                    #516.16
..LN803:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #516.16
..LN804:
                                # LOE rax rbx r15 r12d r13d
..B1.687:                       # Preds ..B1.105
                                # Execution count [8.16e-03]: Infreq
..LN805:
        movq      %rax, 176(%rsp)                               #516.16[spill]
..LN806:
                                # LOE rbx r15 r12d r13d
..B1.106:                       # Preds ..B1.687
                                # Execution count [8.16e-03]: Infreq
..LN807:
	.loc    1  517  is_stmt 1
        movq      %rbx, %rdi                                    #517.16
..LN808:
        movq      %r15, %rsi                                    #517.16
..LN809:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #517.16
..LN810:
                                # LOE rax rbx r15 r12d r13d
..B1.688:                       # Preds ..B1.106
                                # Execution count [8.16e-03]: Infreq
..LN811:
        movq      %rax, 24(%rsp)                                #517.16[spill]
..LN812:
                                # LOE rbx r15 r12d r13d
..B1.107:                       # Preds ..B1.688
                                # Execution count [8.16e-03]: Infreq
..LN813:
	.loc    1  518  is_stmt 1
        movq      %rbx, %rdi                                    #518.16
..LN814:
        movq      %r15, %rsi                                    #518.16
..LN815:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #518.16
..LN816:
                                # LOE rax rbx r15 r12d r13d
..B1.689:                       # Preds ..B1.107
                                # Execution count [8.16e-03]: Infreq
..LN817:
        movq      %rax, 32(%rsp)                                #518.16[spill]
..LN818:
                                # LOE rbx r15 r12d r13d
..B1.108:                       # Preds ..B1.689
                                # Execution count [8.16e-03]: Infreq
..LN819:
	.loc    1  519  is_stmt 1
        movq      %rbx, %rdi                                    #519.16
..LN820:
        movq      %r15, %rsi                                    #519.16
..LN821:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #519.16
..LN822:
                                # LOE rax rbx r15 r12d r13d
..B1.690:                       # Preds ..B1.108
                                # Execution count [8.16e-03]: Infreq
..LN823:
        movq      %rax, 48(%rsp)                                #519.16[spill]
..LN824:
                                # LOE rbx r15 r12d r13d
..B1.109:                       # Preds ..B1.690
                                # Execution count [8.16e-03]: Infreq
..LN825:
	.loc    1  520  is_stmt 1
        movq      %rbx, %rdi                                    #520.16
..LN826:
        movq      %r15, %rsi                                    #520.16
..LN827:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #520.16
..LN828:
                                # LOE rax rbx r15 r12d r13d
..B1.691:                       # Preds ..B1.109
                                # Execution count [8.16e-03]: Infreq
..LN829:
        movq      %rax, 120(%rsp)                               #520.16[spill]
..LN830:
                                # LOE rbx r15 r12d r13d
..B1.110:                       # Preds ..B1.691
                                # Execution count [8.16e-03]: Infreq
..LN831:
	.loc    1  521  is_stmt 1
        movq      %rbx, %rdi                                    #521.16
..LN832:
        movq      %r15, %rsi                                    #521.16
..LN833:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #521.16
..LN834:
                                # LOE rax rbx r15 r12d r13d
..B1.692:                       # Preds ..B1.110
                                # Execution count [8.16e-03]: Infreq
..LN835:
        movq      %rax, 128(%rsp)                               #521.16[spill]
..LN836:
                                # LOE rbx r15 r12d r13d
..B1.111:                       # Preds ..B1.692
                                # Execution count [8.16e-03]: Infreq
..LN837:
	.loc    1  522  is_stmt 1
        movq      %rbx, %rdi                                    #522.16
..LN838:
        movq      %r15, %rsi                                    #522.16
..LN839:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #522.16
..LN840:
                                # LOE rax rbx r15 r12d r13d
..B1.693:                       # Preds ..B1.111
                                # Execution count [8.16e-03]: Infreq
..LN841:
        movq      %rax, 136(%rsp)                               #522.16[spill]
..LN842:
                                # LOE rbx r15 r12d r13d
..B1.112:                       # Preds ..B1.693
                                # Execution count [8.16e-03]: Infreq
..LN843:
	.loc    1  523  is_stmt 1
        movq      %rbx, %rdi                                    #523.16
..LN844:
        movq      %r15, %rsi                                    #523.16
..LN845:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #523.16
..LN846:
                                # LOE rax rbx r15 r12d r13d
..B1.694:                       # Preds ..B1.112
                                # Execution count [8.16e-03]: Infreq
..LN847:
        movq      %rax, 144(%rsp)                               #523.16[spill]
..LN848:
                                # LOE rbx r15 r12d r13d
..B1.113:                       # Preds ..B1.694
                                # Execution count [8.16e-03]: Infreq
..LN849:
	.loc    1  524  is_stmt 1
        movq      %rbx, %rdi                                    #524.16
..LN850:
        movq      %r15, %rsi                                    #524.16
..LN851:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #524.16
..LN852:
                                # LOE rax rbx r15 r12d r13d
..B1.695:                       # Preds ..B1.113
                                # Execution count [8.16e-03]: Infreq
..LN853:
        movq      %rax, 152(%rsp)                               #524.16[spill]
..LN854:
                                # LOE rbx r15 r12d r13d
..B1.114:                       # Preds ..B1.695
                                # Execution count [8.16e-03]: Infreq
..LN855:
	.loc    1  525  is_stmt 1
        movq      %rbx, %rdi                                    #525.16
..LN856:
        movq      %r15, %rsi                                    #525.16
..LN857:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #525.16
..LN858:
                                # LOE rax r15 r12d r13d
..B1.696:                       # Preds ..B1.114
                                # Execution count [8.16e-03]: Infreq
..LN859:
        movq      %rax, 160(%rsp)                               #525.16[spill]
..LN860:
                                # LOE r15 r12d r13d
..B1.115:                       # Preds ..B1.696
                                # Execution count [8.16e-03]: Infreq
..LN861:
	.loc    1  527  is_stmt 1
        testl     %r13d, %r13d                                  #527.18
..LN862:
        jle       ..B1.146      # Prob 50%                      #527.18
..LN863:
                                # LOE r15 r12d r13d
..B1.116:                       # Preds ..B1.115
                                # Execution count [7.34e-03]: Infreq
..LN864:
        movq      144(%rsp), %rdx                               #527.3[spill]
..LN865:
        andq      $63, %rdx                                     #527.3
..LN866:
        testl     %edx, %edx                                    #527.3
..LN867:
        je        ..B1.119      # Prob 50%                      #527.3
..LN868:
                                # LOE r15 edx r12d r13d
..B1.117:                       # Preds ..B1.116
                                # Execution count [7.34e-03]: Infreq
..LN869:
        testb     $7, %dl                                       #527.3
..LN870:
        jne       ..B1.187      # Prob 10%                      #527.3
..LN871:
                                # LOE r15 edx r12d r13d
..B1.118:                       # Preds ..B1.117
                                # Execution count [0.00e+00]: Infreq
..LN872:
        negl      %edx                                          #527.3
..LN873:
        addl      $64, %edx                                     #527.3
..LN874:
        shrl      $3, %edx                                      #527.3
..LN875:
        cmpl      %edx, %r13d                                   #527.3
..LN876:
        cmovl     %r13d, %edx                                   #527.3
..LN877:
                                # LOE r15 edx r12d r13d
..B1.119:                       # Preds ..B1.118 ..B1.116
                                # Execution count [8.16e-03]: Infreq
..LN878:
        movl      %r13d, %r8d                                   #527.3
..LN879:
        subl      %edx, %r8d                                    #527.3
..LN880:
        andl      $7, %r8d                                      #527.3
..LN881:
        negl      %r8d                                          #527.3
..LN882:
        addl      %r13d, %r8d                                   #527.3
..LN883:
        cmpl      $1, %edx                                      #527.3
..LN884:
        jb        ..B1.123      # Prob 50%                      #527.3
..LN885:
                                # LOE r15 edx r8d r12d r13d
..B1.120:                       # Preds ..B1.119
                                # Execution count [7.34e-03]: Infreq
..LN886:
        movl      $8, %ebx                                      #527.3
..LN887:
        vmovd     %edx, %xmm0                                   #527.3
..LN888:
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN889:
        movl      $255, %eax                                    #527.3
..LN890:
        movq      %r15, 8(%rsp)                                 #527.3[spill]
..LN891:
        movl      %r13d, 192(%rsp)                              #527.3[spill]
..LN892:
        vmovd     %ebx, %xmm6                                   #527.3
..LN893:
        xorl      %ebx, %ebx                                    #527.3
..LN894:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #527.3
..LN895:
	.loc    1  528  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #528.11
..LN896:
	.loc    1  529  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #529.11
..LN897:
	.loc    1  530  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #530.11
..LN898:
	.loc    1  531  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #531.11
..LN899:
	.loc    1  527  is_stmt 1
        kmovw     %eax, %k1                                     #527.3
..LN900:
        vpbroadcastd %xmm6, %ymm6                               #527.3
..LN901:
        xorl      %eax, %eax                                    #527.3
..LN902:
        movslq    %edx, %rdi                                    #527.3
..LN903:
        movq      144(%rsp), %rsi                               #527.3[spill]
..LN904:
        movq      136(%rsp), %r9                                #527.3[spill]
..LN905:
        movq      128(%rsp), %r10                               #527.3[spill]
..LN906:
        movq      120(%rsp), %r11                               #527.3[spill]
..LN907:
        movq      48(%rsp), %r13                                #527.3[spill]
..LN908:
        movq      32(%rsp), %r14                                #527.3[spill]
..LN909:
        movq      24(%rsp), %r15                                #527.3[spill]
..LN910:
        movq      176(%rsp), %rcx                               #527.3[spill]
        .align    16,0x90
..LN911:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.121:                       # Preds ..B1.121 ..B1.120
                                # Execution count [4.08e-02]: Infreq
..LN912:
        addq      $8, %rbx                                      #527.3
..LN913:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #527.3
..LN914:
        vpaddd    %ymm6, %ymm5, %ymm5                           #527.3
..LN915:
	.loc    1  528  is_stmt 1
        vmovupd   %zmm4, (%rax,%rcx){%k2}                       #528.4
..LN916:
	.loc    1  529  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #529.4
..LN917:
	.loc    1  530  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #530.4
..LN918:
	.loc    1  531  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #531.4
..LN919:
	.loc    1  532  is_stmt 1
        vmovupd   %zmm4, (%rax,%r11){%k2}                       #532.4
..LN920:
	.loc    1  533  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #533.4
..LN921:
	.loc    1  534  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #534.4
..LN922:
	.loc    1  535  is_stmt 1
        vmovupd   %zmm1, (%rax,%rsi){%k2}                       #535.4
..LN923:
	.loc    1  527  is_stmt 1
        addq      $64, %rax                                     #527.3
..LN924:
        cmpq      %rdi, %rbx                                    #527.3
..LN925:
        jb        ..B1.121      # Prob 81%                      #527.3
..LN926:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.122:                       # Preds ..B1.121
                                # Execution count [7.34e-03]: Infreq
..LN927:
        movl      192(%rsp), %r13d                              #[spill]
..LN928:
        movq      8(%rsp), %r15                                 #[spill]
..LN929:
        cmpl      %edx, %r13d                                   #527.3
..LN930:
        je        ..B1.131      # Prob 10%                      #527.3
..LN931:
                                # LOE r15 edx r8d r12d r13d
..B1.123:                       # Preds ..B1.119 ..B1.122
                                # Execution count [0.00e+00]: Infreq
..LN932:
        lea       8(%rdx), %ebx                                 #527.3
..LN933:
        cmpl      %ebx, %r8d                                    #527.3
..LN934:
        jl        ..B1.127      # Prob 50%                      #527.3
..LN935:
                                # LOE r15 edx r8d r12d r13d
..B1.124:                       # Preds ..B1.123
                                # Execution count [7.34e-03]: Infreq
..LN936:
        movslq    %edx, %rdx                                    #527.3
..LN937:
	.loc    1  528  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #528.11
..LN938:
	.loc    1  529  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #529.11
..LN939:
	.loc    1  530  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #530.11
..LN940:
	.loc    1  531  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #531.11
..LN941:
	.loc    1  527  is_stmt 1
        movslq    %r8d, %rax                                    #527.3
..LN942:
        movq      144(%rsp), %rbx                               #527.3[spill]
..LN943:
        movq      136(%rsp), %rdi                               #527.3[spill]
..LN944:
        movq      128(%rsp), %r9                                #527.3[spill]
..LN945:
        movq      120(%rsp), %r10                               #527.3[spill]
..LN946:
        movq      48(%rsp), %r11                                #527.3[spill]
..LN947:
        movq      32(%rsp), %rcx                                #527.3[spill]
..LN948:
        movq      24(%rsp), %rsi                                #527.3[spill]
..LN949:
        movq      176(%rsp), %r14                               #527.3[spill]
        .align    16,0x90
..LN950:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.125:                       # Preds ..B1.125 ..B1.124
                                # Execution count [4.08e-02]: Infreq
..LN951:
	.loc    1  528  is_stmt 1
        vmovupd   %zmm3, (%r14,%rdx,8)                          #528.4
..LN952:
	.loc    1  529  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #529.4
..LN953:
	.loc    1  530  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #530.4
..LN954:
	.loc    1  531  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #531.4
..LN955:
	.loc    1  532  is_stmt 1
        vmovupd   %zmm3, (%r10,%rdx,8)                          #532.4
..LN956:
	.loc    1  533  is_stmt 1
        vmovupd   %zmm2, (%r9,%rdx,8)                           #533.4
..LN957:
	.loc    1  534  is_stmt 1
        vmovupd   %zmm1, (%rdi,%rdx,8)                          #534.4
..LN958:
	.loc    1  535  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%rdx,8)                          #535.4
..LN959:
	.loc    1  527  is_stmt 1
        addq      $8, %rdx                                      #527.3
..LN960:
        cmpq      %rax, %rdx                                    #527.3
..LN961:
        jb        ..B1.125      # Prob 81%                      #527.3
..LN962:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.127:                       # Preds ..B1.125 ..B1.123 ..B1.187
                                # Execution count [8.16e-03]: Infreq
..LN963:
        lea       1(%r8), %edx                                  #527.3
..LN964:
        cmpl      %r13d, %edx                                   #527.3
..LN965:
        ja        ..B1.131      # Prob 50%                      #527.3
..LN966:
                                # LOE r15 r8d r12d r13d
..B1.128:                       # Preds ..B1.127
                                # Execution count [7.34e-03]: Infreq
..LN967:
        movl      $255, %eax                                    #527.3
..LN968:
        movl      $8, %r11d                                     #527.3
..LN969:
        kmovw     %eax, %k1                                     #527.3
..LN970:
        xorl      %ecx, %ecx                                    #527.3
..LN971:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #527.3
..LN972:
	.loc    1  528  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #528.11
..LN973:
	.loc    1  527  is_stmt 1
        vmovd     %r11d, %xmm6                                  #527.3
..LN974:
	.loc    1  529  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #529.11
..LN975:
	.loc    1  530  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #530.11
..LN976:
	.loc    1  531  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #531.11
..LN977:
	.loc    1  527  is_stmt 1
        movslq    %r8d, %rax                                    #527.3
..LN978:
        negl      %r8d                                          #527.3
..LN979:
        addl      %r13d, %r8d                                   #527.3
..LN980:
	.loc    1  529  is_stmt 1
        movq      24(%rsp), %rsi                                #529.4[spill]
..LN981:
	.loc    1  535  is_stmt 1
        movq      144(%rsp), %r10                               #535.4[spill]
..LN982:
	.loc    1  534  is_stmt 1
        movq      136(%rsp), %r9                                #534.4[spill]
..LN983:
	.loc    1  532  is_stmt 1
        movq      120(%rsp), %rdi                               #532.4[spill]
..LN984:
	.loc    1  529  is_stmt 1
        lea       (%rsi,%rax,8), %r14                           #529.4
..LN985:
	.loc    1  531  is_stmt 1
        movq      48(%rsp), %rbx                                #531.4[spill]
..LN986:
	.loc    1  527  is_stmt 1
        vmovd     %r8d, %xmm0                                   #527.3
..LN987:
	.loc    1  533  is_stmt 1
        movq      128(%rsp), %r8                                #533.4[spill]
..LN988:
	.loc    1  535  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #535.4
..LN989:
	.loc    1  530  is_stmt 1
        movq      32(%rsp), %rdx                                #530.4[spill]
..LN990:
	.loc    1  534  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #534.4
..LN991:
	.loc    1  528  is_stmt 1
        movq      176(%rsp), %rsi                               #528.4[spill]
..LN992:
	.loc    1  532  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #532.4
..LN993:
	.loc    1  527  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN994:
	.loc    1  533  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #533.4
..LN995:
	.loc    1  531  is_stmt 1
        lea       (%rbx,%rax,8), %rbx                           #531.4
..LN996:
	.loc    1  527  is_stmt 1
        movq      112(%rsp), %r11                               #527.3[spill]
..LN997:
	.loc    1  530  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #530.4
..LN998:
	.loc    1  527  is_stmt 1
        subq      %rax, %r11                                    #527.3
..LN999:
        vpbroadcastd %xmm6, %ymm6                               #527.3
..LN1000:
	.loc    1  528  is_stmt 1
        lea       (%rsi,%rax,8), %rsi                           #528.4
..LN1001:
	.loc    1  527  is_stmt 1
        xorl      %eax, %eax                                    #527.3
        .align    16,0x90
..LN1002:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.129:                       # Preds ..B1.129 ..B1.128
                                # Execution count [4.08e-02]: Infreq
..LN1003:
        addq      $8, %rcx                                      #527.3
..LN1004:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #527.3
..LN1005:
        vpaddd    %ymm6, %ymm5, %ymm5                           #527.3
..LN1006:
	.loc    1  528  is_stmt 1
        vmovupd   %zmm4, (%rax,%rsi){%k2}                       #528.4
..LN1007:
	.loc    1  529  is_stmt 1
        vmovupd   %zmm3, (%rax,%r14){%k2}                       #529.4
..LN1008:
	.loc    1  530  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #530.4
..LN1009:
	.loc    1  531  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #531.4
..LN1010:
	.loc    1  532  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #532.4
..LN1011:
	.loc    1  533  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #533.4
..LN1012:
	.loc    1  534  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #534.4
..LN1013:
	.loc    1  535  is_stmt 1
        vmovupd   %zmm1, (%rax,%r10){%k2}                       #535.4
..LN1014:
	.loc    1  527  is_stmt 1
        addq      $64, %rax                                     #527.3
..LN1015:
        cmpq      %r11, %rcx                                    #527.3
..LN1016:
        jb        ..B1.129      # Prob 81%                      #527.3
..LN1017:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.131:                       # Preds ..B1.129 ..B1.122 ..B1.127
                                # Execution count [7.34e-03]: Infreq
..LN1018:
        movq      160(%rsp), %r8                                #527.3[spill]
..LN1019:
        andq      $63, %r8                                      #527.3
..LN1020:
        testl     %r8d, %r8d                                    #527.3
..LN1021:
        je        ..B1.134      # Prob 50%                      #527.3
..LN1022:
                                # LOE r15 r8d r12d r13d
..B1.132:                       # Preds ..B1.131
                                # Execution count [7.34e-03]: Infreq
..LN1023:
        testl     $7, %r8d                                      #527.3
..LN1024:
        jne       ..B1.186      # Prob 10%                      #527.3
..LN1025:
                                # LOE r15 r8d r12d r13d
..B1.133:                       # Preds ..B1.132
                                # Execution count [0.00e+00]: Infreq
..LN1026:
        negl      %r8d                                          #527.3
..LN1027:
        addl      $64, %r8d                                     #527.3
..LN1028:
        shrl      $3, %r8d                                      #527.3
..LN1029:
        cmpl      %r8d, %r13d                                   #527.3
..LN1030:
        cmovl     %r13d, %r8d                                   #527.3
..LN1031:
                                # LOE r15 r8d r12d r13d
..B1.134:                       # Preds ..B1.133 ..B1.131
                                # Execution count [8.16e-03]: Infreq
..LN1032:
        movl      %r13d, %eax                                   #527.3
..LN1033:
        subl      %r8d, %eax                                    #527.3
..LN1034:
        andl      $7, %eax                                      #527.3
..LN1035:
        negl      %eax                                          #527.3
..LN1036:
        addl      %r13d, %eax                                   #527.3
..LN1037:
        cmpl      $1, %r8d                                      #527.3
..LN1038:
        jb        ..B1.138      # Prob 50%                      #527.3
..LN1039:
                                # LOE r15 eax r8d r12d r13d
..B1.135:                       # Preds ..B1.134
                                # Execution count [7.34e-03]: Infreq
..LN1040:
        movl      $255, %edx                                    #527.3
..LN1041:
        vmovd     %r8d, %xmm0                                   #527.3
..LN1042:
        kmovw     %edx, %k1                                     #527.3
..LN1043:
        movl      $8, %edx                                      #527.3
..LN1044:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #527.3
..LN1045:
	.loc    1  536  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #536.11
..LN1046:
	.loc    1  537  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #537.11
..LN1047:
	.loc    1  527  is_stmt 1
        vmovd     %edx, %xmm4                                   #527.3
..LN1048:
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN1049:
        xorl      %edi, %edi                                    #527.3
..LN1050:
        vpbroadcastd %xmm4, %ymm4                               #527.3
..LN1051:
        xorl      %edx, %edx                                    #527.3
..LN1052:
        movslq    %r8d, %rbx                                    #527.3
..LN1053:
        movq      160(%rsp), %r9                                #527.3[spill]
..LN1054:
        movq      152(%rsp), %r10                               #527.3[spill]
..LN1055:
                                # LOE rdx rbx rdi r9 r10 r15 eax r8d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.136:                       # Preds ..B1.136 ..B1.135
                                # Execution count [4.08e-02]: Infreq
..LN1056:
        addq      $8, %rdi                                      #527.3
..LN1057:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #527.3
..LN1058:
        vpaddd    %ymm4, %ymm3, %ymm3                           #527.3
..LN1059:
	.loc    1  536  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r10){%k2}                       #536.4
..LN1060:
	.loc    1  537  is_stmt 1
        vmovupd   %zmm1, (%rdx,%r9){%k2}                        #537.4
..LN1061:
	.loc    1  527  is_stmt 1
        addq      $64, %rdx                                     #527.3
..LN1062:
        cmpq      %rbx, %rdi                                    #527.3
..LN1063:
        jb        ..B1.136      # Prob 81%                      #527.3
..LN1064:
                                # LOE rdx rbx rdi r9 r10 r15 eax r8d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.137:                       # Preds ..B1.136
                                # Execution count [7.34e-03]: Infreq
..LN1065:
        cmpl      %r8d, %r13d                                   #527.3
..LN1066:
        je        ..B1.146      # Prob 10%                      #527.3
..LN1067:
                                # LOE r15 eax r8d r12d r13d
..B1.138:                       # Preds ..B1.134 ..B1.137
                                # Execution count [0.00e+00]: Infreq
..LN1068:
        lea       8(%r8), %edx                                  #527.3
..LN1069:
        cmpl      %edx, %eax                                    #527.3
..LN1070:
        jl        ..B1.142      # Prob 50%                      #527.3
..LN1071:
                                # LOE r15 eax r8d r12d r13d
..B1.139:                       # Preds ..B1.138
                                # Execution count [7.34e-03]: Infreq
..LN1072:
        movslq    %r8d, %r8                                     #527.3
..LN1073:
	.loc    1  536  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #536.11
..LN1074:
	.loc    1  537  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm0             #537.11
..LN1075:
	.loc    1  527  is_stmt 1
        movslq    %eax, %rdx                                    #527.3
..LN1076:
        movq      160(%rsp), %rbx                               #527.3[spill]
..LN1077:
        movq      152(%rsp), %rdi                               #527.3[spill]
..LN1078:
                                # LOE rdx rbx rdi r8 r15 eax r12d r13d zmm0 zmm1
..B1.140:                       # Preds ..B1.140 ..B1.139
                                # Execution count [4.08e-02]: Infreq
..LN1079:
	.loc    1  536  is_stmt 1
        vmovupd   %zmm1, (%rdi,%r8,8)                           #536.4
..LN1080:
	.loc    1  537  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r8,8)                           #537.4
..LN1081:
	.loc    1  527  is_stmt 1
        addq      $8, %r8                                       #527.3
..LN1082:
        cmpq      %rdx, %r8                                     #527.3
..LN1083:
        jb        ..B1.140      # Prob 81%                      #527.3
..LN1084:
                                # LOE rdx rbx rdi r8 r15 eax r12d r13d zmm0 zmm1
..B1.142:                       # Preds ..B1.140 ..B1.138 ..B1.186
                                # Execution count [8.16e-03]: Infreq
..LN1085:
        lea       1(%rax), %edx                                 #527.3
..LN1086:
        cmpl      %r13d, %edx                                   #527.3
..LN1087:
        ja        ..B1.146      # Prob 50%                      #527.3
..LN1088:
                                # LOE r15 eax r12d r13d
..B1.143:                       # Preds ..B1.142
                                # Execution count [7.34e-03]: Infreq
..LN1089:
        movslq    %eax, %r9                                     #527.3
..LN1090:
        negl      %eax                                          #527.3
..LN1091:
        addl      %r13d, %eax                                   #527.3
..LN1092:
        movl      $8, %edi                                      #527.3
..LN1093:
        movl      $255, %edx                                    #527.3
..LN1094:
        xorl      %r8d, %r8d                                    #527.3
..LN1095:
        kmovw     %edx, %k1                                     #527.3
..LN1096:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #527.3
..LN1097:
        vmovd     %eax, %xmm0                                   #527.3
..LN1098:
        vmovd     %edi, %xmm4                                   #527.3
..LN1099:
	.loc    1  536  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #536.11
..LN1100:
	.loc    1  537  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #537.11
..LN1101:
        movq      160(%rsp), %rbx                               #537.4[spill]
..LN1102:
	.loc    1  527  is_stmt 1
        xorl      %eax, %eax                                    #527.3
..LN1103:
	.loc    1  536  is_stmt 1
        movq      152(%rsp), %rdx                               #536.4[spill]
..LN1104:
	.loc    1  527  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN1105:
        movq      112(%rsp), %rdi                               #527.3[spill]
..LN1106:
	.loc    1  537  is_stmt 1
        lea       (%rbx,%r9,8), %rbx                            #537.4
..LN1107:
	.loc    1  527  is_stmt 1
        vpbroadcastd %xmm4, %ymm4                               #527.3
..LN1108:
        subq      %r9, %rdi                                     #527.3
..LN1109:
	.loc    1  536  is_stmt 1
        lea       (%rdx,%r9,8), %rdx                            #536.4
..LN1110:
                                # LOE rax rdx rbx rdi r8 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.144:                       # Preds ..B1.144 ..B1.143
                                # Execution count [4.08e-02]: Infreq
..LN1111:
	.loc    1  527  is_stmt 1
        addq      $8, %r8                                       #527.3
..LN1112:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #527.3
..LN1113:
        vpaddd    %ymm4, %ymm3, %ymm3                           #527.3
..LN1114:
	.loc    1  536  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #536.4
..LN1115:
	.loc    1  537  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #537.4
..LN1116:
	.loc    1  527  is_stmt 1
        addq      $64, %rax                                     #527.3
..LN1117:
        cmpq      %rdi, %r8                                     #527.3
..LN1118:
        jb        ..B1.144      # Prob 81%                      #527.3
..LN1119:
                                # LOE rax rdx rbx rdi r8 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.146:                       # Preds ..B1.144 ..B1.115 ..B1.137 ..B1.142
                                # Execution count [8.16e-03]: Infreq
..LN1120:
	.loc    1  542  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #542.3
..LN1121:
	.loc    1  540  is_stmt 1
        movl      $1, %r14d                                     #540.3
..LN1122:
	.loc    1  542  is_stmt 1
        vzeroupper                                              #542.3
..___tag_value_main.27:
..LN1123:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #542.3
..___tag_value_main.28:
..LN1124:
                                # LOE r15 r12d r13d r14d
..B1.147:                       # Preds ..B1.146
                                # Execution count [8.16e-03]: Infreq
..LN1125:
	.loc    1  544  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #544.11
..LN1126:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #544.24
..LN1127:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #544.15
..LN1128:
        vcomisd   %xmm1, %xmm0                                  #544.24
..LN1129:
        jbe       ..B1.173      # Prob 10%                      #544.24
..LN1130:
                                # LOE r15 r12d r13d r14d
..B1.148:                       # Preds ..B1.147
                                # Execution count [7.34e-03]: Infreq
..LN1131:
	.loc    1  551  is_stmt 1
        movl      $8, %edx                                      #551.5
..LN1132:
        movl      %r13d, %ebx                                   #551.5
..LN1133:
        andl      $-64, %ebx                                    #551.5
..LN1134:
	.loc    1  546  is_stmt 1
        lea       56(%rsp), %rdi                                #546.4
..LN1135:
	.loc    1  551  is_stmt 1
        movslq    %ebx, %rbx                                    #551.5
..LN1136:
	.loc    1  546  is_stmt 1
        lea       40(%rsp), %rsi                                #546.4
..LN1137:
	.loc    1  551  is_stmt 1
        movq      %rbx, 128(%rsi)                               #551.5[spill]
..LN1138:
        vmovd     %edx, %xmm0                                   #551.5
..LN1139:
        vpbroadcastd %xmm0, %ymm1                               #551.5
..LN1140:
        vmovdqu   %ymm1, 24(%rsi)                               #551.5[spill]
..LN1141:
	.loc    1  546  is_stmt 1
        vzeroupper                                              #546.4
..___tag_value_main.29:
..LN1142:
#       timing(double *, double *)
        call      timing                                        #546.4
..___tag_value_main.30:
..LN1143:
                                # LOE r15 ebx r12d r13d r14d
..B1.149:                       # Preds ..B1.148
                                # Execution count [6.61e-03]: Infreq
..LN1144:
	.loc    1  547  is_stmt 1
        xorl      %eax, %eax                                    #547.4
..LN1145:
        movl      %ebx, 16(%rsp)                                #547.4[spill]
..LN1146:
        movl      %eax, %ebx                                    #547.4
..LN1147:
        movl      %r14d, 184(%rsp)                              #547.4[spill]
..LN1148:
        vxorpd    %xmm2, %xmm2, %xmm2                           #547.4
..LN1149:
        movl      %r12d, (%rsp)                                 #547.4[spill]
..LN1150:
        movq      %r15, 8(%rsp)                                 #547.4[spill]
..LN1151:
        movl      %r13d, 192(%rsp)                              #547.4[spill]
..LN1152:
                                # LOE ebx xmm2
..B1.150:                       # Preds ..B1.149 ..B1.165 ..B1.171
                                # Execution count [2.04e-01]: Infreq
..LN1153:
	.loc    1  551  is_stmt 1
        xorl      %ecx, %ecx                                    #551.9
..LN1154:
        cmpl      $0, 192(%rsp)                                 #551.20[spill]
..LN1155:
        jle       ..B1.163      # Prob 50%                      #551.20
..LN1156:
                                # LOE ecx ebx xmm2
..B1.151:                       # Preds ..B1.150
                                # Execution count [1.84e-01]: Infreq
..LN1157:
        cmpl      $64, 192(%rsp)                                #551.5[spill]
..LN1158:
        jl        ..B1.185      # Prob 10%                      #551.5
..LN1159:
                                # LOE ecx ebx xmm2
..B1.152:                       # Preds ..B1.151
                                # Execution count [1.84e-01]: Infreq
..LN1160:
        movl      16(%rsp), %eax                                #551.5[spill]
..LN1161:
                                # LOE eax ebx xmm2
..B1.154:                       # Preds ..B1.152
                                # Execution count [1.84e-01]: Infreq
..LN1162:
        movq      168(%rsp), %rcx                               #551.5[spill]
..LN1163:
        xorl      %edx, %edx                                    #551.5
..LN1164:
        movq      160(%rsp), %rsi                               #551.5[spill]
..LN1165:
        movq      152(%rsp), %rdi                               #551.5[spill]
..LN1166:
        movq      144(%rsp), %r8                                #551.5[spill]
..LN1167:
        movq      136(%rsp), %r9                                #551.5[spill]
..LN1168:
        movq      128(%rsp), %r10                               #551.5[spill]
..LN1169:
        movq      120(%rsp), %r11                               #551.5[spill]
..LN1170:
        movq      48(%rsp), %r12                                #551.5[spill]
..LN1171:
        movq      32(%rsp), %r13                                #551.5[spill]
..LN1172:
        movq      24(%rsp), %r14                                #551.5[spill]
..LN1173:
        movq      176(%rsp), %r15                               #551.5[spill]
..LN1174:
                                # LOE rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 eax ebx xmm2
..B1.155:                       # Preds ..B1.155 ..B1.154
                                # Execution count [1.02e+00]: Infreq
..LN1175:
	.loc    1  552  is_stmt 1
        vmovups   (%r14,%rdx,8), %zmm0                          #552.13
..LN1176:
        vmovups   (%r12,%rdx,8), %zmm1                          #552.27
..LN1177:
        vmovups   (%r10,%rdx,8), %zmm5                          #552.41
..LN1178:
        vmovups   (%r8,%rdx,8), %zmm6                           #552.55
..LN1179:
        vmovups   64(%r8,%rdx,8), %zmm17                        #552.55
..LN1180:
        vmovups   64(%r14,%rdx,8), %zmm12                       #552.13
..LN1181:
        vmovups   64(%r12,%rdx,8), %zmm13                       #552.27
..LN1182:
        vmovups   64(%r10,%rdx,8), %zmm16                       #552.41
..LN1183:
        vaddpd    (%r13,%rdx,8), %zmm0, %zmm3                   #552.69
..LN1184:
        vaddpd    (%r11,%rdx,8), %zmm1, %zmm4                   #552.69
..LN1185:
        vaddpd    (%r9,%rdx,8), %zmm5, %zmm7                    #552.69
..LN1186:
        vaddpd    (%rsi,%rdx,8), %zmm6, %zmm8                   #552.69
..LN1187:
        vaddpd    64(%rsi,%rdx,8), %zmm17, %zmm19               #552.69
..LN1188:
        vaddpd    64(%r13,%rdx,8), %zmm12, %zmm14               #552.69
..LN1189:
        vaddpd    64(%r11,%rdx,8), %zmm13, %zmm15               #552.69
..LN1190:
        vaddpd    64(%r9,%rdx,8), %zmm16, %zmm18                #552.69
..LN1191:
        vaddpd    %zmm4, %zmm3, %zmm9                           #552.69
..LN1192:
        vaddpd    %zmm8, %zmm7, %zmm10                          #552.69
..LN1193:
        vaddpd    %zmm15, %zmm14, %zmm20                        #552.69
..LN1194:
        vaddpd    %zmm19, %zmm18, %zmm21                        #552.69
..LN1195:
        vaddpd    %zmm10, %zmm9, %zmm11                         #552.69
..LN1196:
        vaddpd    %zmm21, %zmm20, %zmm22                        #552.69
..LN1197:
        vaddpd    (%rdi,%rdx,8), %zmm11, %zmm23                 #552.69
..LN1198:
        vaddpd    64(%rdi,%rdx,8), %zmm22, %zmm24               #552.69
..LN1199:
        vmovntpd  %zmm23, (%r15,%rdx,8)                         #552.6
..LN1200:
        vmovntpd  %zmm24, 64(%r15,%rdx,8)                       #552.6
..LN1201:
        vmovups   128(%r14,%rdx,8), %zmm25                      #552.13
..LN1202:
        vmovups   128(%r12,%rdx,8), %zmm26                      #552.27
..LN1203:
        vmovups   128(%r10,%rdx,8), %zmm29                      #552.41
..LN1204:
        vmovups   128(%r8,%rdx,8), %zmm30                       #552.55
..LN1205:
        vmovups   192(%r8,%rdx,8), %zmm4                        #552.55
..LN1206:
        vmovups   192(%r14,%rdx,8), %zmm0                       #552.13
..LN1207:
        vmovups   192(%r12,%rdx,8), %zmm1                       #552.27
..LN1208:
        vmovups   192(%r10,%rdx,8), %zmm3                       #552.41
..LN1209:
        vaddpd    128(%r13,%rdx,8), %zmm25, %zmm27              #552.69
..LN1210:
        vaddpd    128(%r11,%rdx,8), %zmm26, %zmm28              #552.69
..LN1211:
        vaddpd    128(%r9,%rdx,8), %zmm29, %zmm31               #552.69
..LN1212:
        vaddpd    128(%rsi,%rdx,8), %zmm30, %zmm29              #552.69
..LN1213:
        vaddpd    192(%rsi,%rdx,8), %zmm4, %zmm6                #552.69
..LN1214:
        vaddpd    %zmm28, %zmm27, %zmm25                        #552.69
..LN1215:
        vaddpd    192(%r13,%rdx,8), %zmm0, %zmm28               #552.69
..LN1216:
        vaddpd    192(%r11,%rdx,8), %zmm1, %zmm30               #552.69
..LN1217:
        vaddpd    192(%r9,%rdx,8), %zmm3, %zmm5                 #552.69
..LN1218:
        vaddpd    %zmm29, %zmm31, %zmm26                        #552.69
..LN1219:
        vaddpd    %zmm30, %zmm28, %zmm7                         #552.69
..LN1220:
        vaddpd    %zmm6, %zmm5, %zmm8                           #552.69
..LN1221:
        vaddpd    %zmm26, %zmm25, %zmm27                        #552.69
..LN1222:
        vaddpd    %zmm8, %zmm7, %zmm9                           #552.69
..LN1223:
        vaddpd    128(%rdi,%rdx,8), %zmm27, %zmm10              #552.69
..LN1224:
        vaddpd    192(%rdi,%rdx,8), %zmm9, %zmm11               #552.69
..LN1225:
        vmovntpd  %zmm10, 128(%r15,%rdx,8)                      #552.6
..LN1226:
        vmovntpd  %zmm11, 192(%r15,%rdx,8)                      #552.6
..LN1227:
        vmovups   320(%r14,%rdx,8), %zmm23                      #552.13
..LN1228:
        vmovups   320(%r12,%rdx,8), %zmm24                      #552.27
..LN1229:
        vmovups   256(%r12,%rdx,8), %zmm13                      #552.27
..LN1230:
        vmovups   256(%r14,%rdx,8), %zmm12                      #552.13
..LN1231:
        vmovups   256(%r10,%rdx,8), %zmm16                      #552.41
..LN1232:
        vmovups   256(%r8,%rdx,8), %zmm17                       #552.55
..LN1233:
        vmovups   320(%r8,%rdx,8), %zmm1                        #552.55
..LN1234:
        vmovups   320(%r10,%rdx,8), %zmm0                       #552.41
..LN1235:
        vaddpd    320(%r13,%rdx,8), %zmm23, %zmm31              #552.69
..LN1236:
        vaddpd    320(%r11,%rdx,8), %zmm24, %zmm23              #552.69
..LN1237:
        vaddpd    256(%r11,%rdx,8), %zmm13, %zmm15              #552.69
..LN1238:
        vaddpd    256(%r13,%rdx,8), %zmm12, %zmm14              #552.69
..LN1239:
        vaddpd    256(%r9,%rdx,8), %zmm16, %zmm18               #552.69
..LN1240:
        vaddpd    256(%rsi,%rdx,8), %zmm17, %zmm19              #552.69
..LN1241:
        vaddpd    %zmm23, %zmm31, %zmm3                         #552.69
..LN1242:
        vaddpd    320(%rsi,%rdx,8), %zmm1, %zmm31               #552.69
..LN1243:
        vaddpd    320(%r9,%rdx,8), %zmm0, %zmm24                #552.69
..LN1244:
        vaddpd    %zmm15, %zmm14, %zmm20                        #552.69
..LN1245:
        vaddpd    %zmm19, %zmm18, %zmm21                        #552.69
..LN1246:
        vaddpd    %zmm31, %zmm24, %zmm4                         #552.69
..LN1247:
        vaddpd    %zmm21, %zmm20, %zmm22                        #552.69
..LN1248:
        vaddpd    %zmm4, %zmm3, %zmm5                           #552.69
..LN1249:
        vaddpd    256(%rdi,%rdx,8), %zmm22, %zmm6               #552.69
..LN1250:
        vaddpd    320(%rdi,%rdx,8), %zmm5, %zmm7                #552.69
..LN1251:
        vmovntpd  %zmm6, 256(%r15,%rdx,8)                       #552.6
..LN1252:
        vmovntpd  %zmm7, 320(%r15,%rdx,8)                       #552.6
..LN1253:
        vmovups   384(%r14,%rdx,8), %zmm8                       #552.13
..LN1254:
        .byte     15                                            #552.27
..LN1255:
        .byte     31                                            #552.27
..LN1256:
        .byte     0                                             #552.27
..LN1257:
        vmovups   384(%r12,%rdx,8), %zmm9                       #552.27
..LN1258:
        vmovups   384(%r10,%rdx,8), %zmm12                      #552.41
..LN1259:
        vmovups   384(%r8,%rdx,8), %zmm13                       #552.55
..LN1260:
        vmovups   448(%r8,%rdx,8), %zmm26                       #552.55
..LN1261:
        vmovups   448(%r14,%rdx,8), %zmm19                      #552.13
..LN1262:
        vmovups   448(%r12,%rdx,8), %zmm20                      #552.27
..LN1263:
        vmovups   448(%r10,%rdx,8), %zmm25                      #552.41
..LN1264:
        vaddpd    384(%r13,%rdx,8), %zmm8, %zmm10               #552.69
..LN1265:
        vaddpd    384(%r11,%rdx,8), %zmm9, %zmm11               #552.69
..LN1266:
        vaddpd    384(%r9,%rdx,8), %zmm12, %zmm14               #552.69
..LN1267:
        vaddpd    384(%rsi,%rdx,8), %zmm13, %zmm15              #552.69
..LN1268:
        vaddpd    448(%rsi,%rdx,8), %zmm26, %zmm28              #552.69
..LN1269:
        vaddpd    448(%r13,%rdx,8), %zmm19, %zmm21              #552.69
..LN1270:
        vaddpd    448(%r11,%rdx,8), %zmm20, %zmm22              #552.69
..LN1271:
        vaddpd    448(%r9,%rdx,8), %zmm25, %zmm27               #552.69
..LN1272:
        vaddpd    %zmm11, %zmm10, %zmm16                        #552.69
..LN1273:
        vaddpd    %zmm15, %zmm14, %zmm17                        #552.69
..LN1274:
        vaddpd    %zmm22, %zmm21, %zmm29                        #552.69
..LN1275:
        vaddpd    %zmm28, %zmm27, %zmm30                        #552.69
..LN1276:
        vaddpd    %zmm17, %zmm16, %zmm18                        #552.69
..LN1277:
        vaddpd    %zmm30, %zmm29, %zmm19                        #552.69
..LN1278:
        vaddpd    384(%rdi,%rdx,8), %zmm18, %zmm0               #552.69
..LN1279:
        vaddpd    448(%rdi,%rdx,8), %zmm19, %zmm1               #552.69
..LN1280:
        vmovntpd  %zmm0, 384(%r15,%rdx,8)                       #552.6
..LN1281:
        vmovntpd  %zmm1, 448(%r15,%rdx,8)                       #552.6
..LN1282:
	.loc    1  551  is_stmt 1
        addq      $64, %rdx                                     #551.5
..LN1283:
        cmpq      %rcx, %rdx                                    #551.5
..LN1284:
        jb        ..B1.155      # Prob 82%                      #551.5
..LN1285:
                                # LOE rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 eax ebx xmm2
..B1.156:                       # Preds ..B1.155
                                # Execution count [1.84e-01]: Infreq
..LN1286:
        movl      %eax, %ecx                                    #551.36
..LN1287:
                                # LOE eax ecx ebx xmm2
..B1.157:                       # Preds ..B1.156 ..B1.185
                                # Execution count [2.04e-01]: Infreq
..LN1288:
        lea       1(%rax), %edx                                 #551.5
..LN1289:
        cmpl      192(%rsp), %edx                               #551.5[spill]
..LN1290:
        ja        ..B1.163      # Prob 50%                      #551.5
..LN1291:
                                # LOE eax ecx ebx xmm2
..B1.158:                       # Preds ..B1.157
                                # Execution count [1.84e-01]: Infreq
..LN1292:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm0             #551.5
..LN1293:
                                # LOE eax ebx xmm2 ymm0
..B1.160:                       # Preds ..B1.158
                                # Execution count [1.84e-01]: Infreq
..LN1294:
	.loc    1  552  is_stmt 1
        movslq    %eax, %r13                                    #552.13
..LN1295:
	.loc    1  551  is_stmt 1
        negl      %eax                                          #551.5
..LN1296:
        addl      192(%rsp), %eax                               #551.5[spill]
..LN1297:
        movl      $255, %edx                                    #551.5
..LN1298:
	.loc    1  552  is_stmt 1
        movq      176(%rsp), %r11                               #552.6[spill]
..LN1299:
	.loc    1  551  is_stmt 1
        xorl      %r12d, %r12d                                  #551.5
..LN1300:
	.loc    1  552  is_stmt 1
        movq      152(%rsp), %r10                               #552.69[spill]
..LN1301:
        movq      160(%rsp), %r9                                #552.62[spill]
..LN1302:
        movq      144(%rsp), %r8                                #552.55[spill]
..LN1303:
	.loc    1  551  is_stmt 1
        vmovd     %eax, %xmm1                                   #551.5
..LN1304:
	.loc    1  552  is_stmt 1
        movq      136(%rsp), %rdi                               #552.48[spill]
..LN1305:
        lea       (%r11,%r13,8), %r11                           #552.6
..LN1306:
        movq      128(%rsp), %rsi                               #552.41[spill]
..LN1307:
        lea       (%r10,%r13,8), %r10                           #552.69
..LN1308:
        movq      120(%rsp), %rcx                               #552.34[spill]
..LN1309:
        lea       (%r9,%r13,8), %r9                             #552.62
..LN1310:
        movq      32(%rsp), %r14                                #552.20[spill]
..LN1311:
        lea       (%r8,%r13,8), %r8                             #552.55
..LN1312:
        movq      24(%rsp), %r15                                #552.13[spill]
..LN1313:
        lea       (%rdi,%r13,8), %rdi                           #552.48
..LN1314:
	.loc    1  551  is_stmt 1
        kmovw     %edx, %k1                                     #551.5
..LN1315:
	.loc    1  552  is_stmt 1
        lea       (%rsi,%r13,8), %rsi                           #552.41
..LN1316:
        movq      48(%rsp), %rdx                                #552.27[spill]
..LN1317:
        lea       (%rcx,%r13,8), %rcx                           #552.34
..LN1318:
	.loc    1  551  is_stmt 1
        vpbroadcastd %xmm1, %ymm3                               #551.5
..LN1319:
	.loc    1  552  is_stmt 1
        lea       (%r14,%r13,8), %rax                           #552.20
..LN1320:
	.loc    1  551  is_stmt 1
        vmovdqu   64(%rsp), %ymm1                               #551.5[spill]
..LN1321:
	.loc    1  552  is_stmt 1
        lea       (%r15,%r13,8), %r15                           #552.13
..LN1322:
	.loc    1  551  is_stmt 1
        xorl      %r14d, %r14d                                  #551.5
..LN1323:
	.loc    1  552  is_stmt 1
        lea       (%rdx,%r13,8), %rdx                           #552.27
..LN1324:
	.loc    1  551  is_stmt 1
        negq      %r13                                          #551.5
..LN1325:
        addq      112(%rsp), %r13                               #551.5[spill]
        .align    16,0x90
..LN1326:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx xmm2 ymm0 ymm1 zmm3 k1
..B1.161:                       # Preds ..B1.161 ..B1.160
                                # Execution count [1.02e+00]: Infreq
..LN1327:
	.loc    1  552  is_stmt 1
        vmovups   (%r14,%r15), %zmm4                            #552.13
..LN1328:
	.loc    1  551  is_stmt 1
        addq      $8, %r12                                      #551.5
..LN1329:
	.loc    1  552  is_stmt 1
        vmovups   (%r14,%rdx), %zmm5                            #552.27
..LN1330:
        vmovups   (%r14,%rsi), %zmm8                            #552.41
..LN1331:
        vmovups   (%r14,%r8), %zmm9                             #552.55
..LN1332:
        vaddpd    (%r14,%rax), %zmm4, %zmm6                     #552.69
..LN1333:
        vaddpd    (%r14,%rcx), %zmm5, %zmm7                     #552.69
..LN1334:
        vaddpd    (%r14,%rdi), %zmm8, %zmm10                    #552.69
..LN1335:
        vaddpd    (%r14,%r9), %zmm9, %zmm11                     #552.69
..LN1336:
        vaddpd    %zmm7, %zmm6, %zmm12                          #552.69
..LN1337:
        vaddpd    %zmm11, %zmm10, %zmm13                        #552.69
..LN1338:
        vaddpd    %zmm13, %zmm12, %zmm14                        #552.69
..LN1339:
        vaddpd    (%r14,%r10), %zmm14, %zmm15                   #552.69
..LN1340:
	.loc    1  551  is_stmt 1
        vpcmpgtd  %zmm0, %zmm3, %k2{%k1}                        #551.5
..LN1341:
        vpaddd    %ymm1, %ymm0, %ymm0                           #551.5
..LN1342:
	.loc    1  552  is_stmt 1
        vmovupd   %zmm15, (%r14,%r11){%k2}                      #552.6
..LN1343:
	.loc    1  551  is_stmt 1
        addq      $64, %r14                                     #551.5
..LN1344:
        cmpq      %r13, %r12                                    #551.5
..LN1345:
        jb        ..B1.161      # Prob 82%                      #551.5
..LN1346:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx xmm2 ymm0 ymm1 zmm3 k1
..B1.162:                       # Preds ..B1.161
                                # Execution count [1.84e-01]: Infreq
..LN1347:
        movl      192(%rsp), %ecx                               #551.36[spill]
..LN1348:
                                # LOE ecx ebx xmm2
..B1.163:                       # Preds ..B1.162 ..B1.157 ..B1.150
                                # Execution count [2.04e-01]: Infreq
..LN1349:
	.loc    1  554  is_stmt 1
        movslq    %ecx, %rcx                                    #554.8
..LN1350:
        movq      176(%rsp), %rdx                               #554.13[spill]
..LN1351:
        vcomisd   (%rdx,%rcx,8), %xmm2                          #554.13
..LN1352:
        jbe       ..B1.165      # Prob 78%                      #554.13
..LN1353:
                                # LOE ebx xmm2
..B1.164:                       # Preds ..B1.163
                                # Execution count [4.49e-02]: Infreq
..LN1354:
        movl      $il0_peep_printf_format_1, %edi               #554.16
..LN1355:
        vzeroupper                                              #554.16
..LN1356:
        call      puts                                          #554.16
..LN1357:
                                # LOE ebx
..B1.749:                       # Preds ..B1.164
                                # Execution count [4.49e-02]: Infreq
..LN1358:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN1359:
                                # LOE ebx xmm2
..B1.165:                       # Preds ..B1.163 ..B1.749
                                # Execution count [2.04e-01]: Infreq
..LN1360:
	.loc    1  547  is_stmt 1
        incl      %ebx                                          #547.4
..LN1361:
        cmpl      184(%rsp), %ebx                               #547.4[spill]
..LN1362:
        jb        ..B1.150      # Prob 81%                      #547.4
..LN1363:
                                # LOE ebx xmm2
..B1.166:                       # Preds ..B1.165
                                # Execution count [3.74e-02]: Infreq
..LN1364:
        movl      184(%rsp), %r14d                              #[spill]
..LN1365:
                                # LOE r14d
..B1.167:                       # Preds ..B1.170 ..B1.166
                                # Execution count [4.08e-02]: Infreq
..LN1366:
	.loc    1  557  is_stmt 1
        vzeroupper                                              #557.4
..LN1367:
        lea       96(%rsp), %rdi                                #557.4
..LN1368:
        lea       40(%rsp), %rsi                                #557.4
..___tag_value_main.31:
..LN1369:
#       timing(double *, double *)
        call      timing                                        #557.4
..___tag_value_main.32:
..LN1370:
                                # LOE r14d
..B1.168:                       # Preds ..B1.167
                                # Execution count [4.08e-02]: Infreq
..LN1371:
	.loc    1  544  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #544.11
..LN1372:
	.loc    1  558  is_stmt 1
        addl      %r14d, %r14d                                  #558.4
..LN1373:
	.loc    1  544  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #544.24
..LN1374:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #544.15
..LN1375:
        vcomisd   %xmm1, %xmm0                                  #544.24
..LN1376:
        jbe       ..B1.172      # Prob 18%                      #544.24
..LN1377:
                                # LOE r14d
..B1.169:                       # Preds ..B1.168
                                # Execution count [3.34e-02]: Infreq
..LN1378:
	.loc    1  546  is_stmt 1
        lea       56(%rsp), %rdi                                #546.4
..LN1379:
        lea       40(%rsp), %rsi                                #546.4
..___tag_value_main.33:
..LN1380:
#       timing(double *, double *)
        call      timing                                        #546.4
..___tag_value_main.34:
..LN1381:
                                # LOE r14d
..B1.170:                       # Preds ..B1.169
                                # Execution count [3.34e-02]: Infreq
..LN1382:
	.loc    1  547  is_stmt 1
        xorl      %ebx, %ebx                                    #547.4
..LN1383:
        testl     %r14d, %r14d                                  #547.19
..LN1384:
        jle       ..B1.167      # Prob 9%                       #547.19
..LN1385:
                                # LOE ebx r14d
..B1.171:                       # Preds ..B1.170
                                # Execution count [3.01e-02]: Infreq
..LN1386:
        .byte     102                                           #
..LN1387:
        .byte     144                                           #
..LN1388:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN1389:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN1390:
        jmp       ..B1.150      # Prob 100%                     #
..LN1391:
                                # LOE ebx xmm2
..B1.172:                       # Preds ..B1.168
                                # Execution count [7.34e-03]: Infreq
..LN1392:
        movl      (%rsp), %r12d                                 #[spill]
..LN1393:
        movq      8(%rsp), %r15                                 #[spill]
..LN1394:
        movl      192(%rsp), %r13d                              #[spill]
..LN1395:
                                # LOE r15 r12d r13d r14d
..B1.173:                       # Preds ..B1.172 ..B1.147
                                # Execution count [8.16e-03]: Infreq
..LN1396:
	.loc    1  561  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #561.3
..___tag_value_main.35:
..LN1397:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #561.3
..___tag_value_main.36:
..LN1398:
                                # LOE r15 r12d r13d r14d
..B1.174:                       # Preds ..B1.173
                                # Execution count [8.16e-03]: Infreq
..LN1399:
	.loc    1  563  is_stmt 1
        movl      %r14d, %edx                                   #563.3
..LN1400:
        shrl      $31, %edx                                     #563.3
..LN1401:
        addl      %edx, %r14d                                   #563.3
..LN1402:
        sarl      $1, %r14d                                     #563.3
..___tag_value_main.37:
..LN1403:
	.loc    1  566  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #566.3
..___tag_value_main.38:
..LN1404:
                                # LOE r15 r12d r13d r14d
..B1.175:                       # Preds ..B1.174
                                # Execution count [8.16e-03]: Infreq
..LN1405:
	.loc    1  568  is_stmt 1
        movq      176(%rsp), %rdi                               #568.3[spill]
..LN1406:
#       _mm_free(void *)
        call      _mm_free                                      #568.3
..LN1407:
                                # LOE r15 r12d r13d r14d
..B1.176:                       # Preds ..B1.175
                                # Execution count [8.16e-03]: Infreq
..LN1408:
	.loc    1  569  is_stmt 1
        movq      24(%rsp), %rdi                                #569.3[spill]
..LN1409:
#       _mm_free(void *)
        call      _mm_free                                      #569.3
..LN1410:
                                # LOE r15 r12d r13d r14d
..B1.177:                       # Preds ..B1.176
                                # Execution count [8.16e-03]: Infreq
..LN1411:
	.loc    1  570  is_stmt 1
        movq      32(%rsp), %rdi                                #570.3[spill]
..LN1412:
#       _mm_free(void *)
        call      _mm_free                                      #570.3
..LN1413:
                                # LOE r15 r12d r13d r14d
..B1.178:                       # Preds ..B1.177
                                # Execution count [8.16e-03]: Infreq
..LN1414:
	.loc    1  571  is_stmt 1
        movq      48(%rsp), %rdi                                #571.3[spill]
..LN1415:
#       _mm_free(void *)
        call      _mm_free                                      #571.3
..LN1416:
                                # LOE r15 r12d r13d r14d
..B1.179:                       # Preds ..B1.178
                                # Execution count [8.16e-03]: Infreq
..LN1417:
	.loc    1  572  is_stmt 1
        movq      120(%rsp), %rdi                               #572.3[spill]
..LN1418:
#       _mm_free(void *)
        call      _mm_free                                      #572.3
..LN1419:
                                # LOE r15 r12d r13d r14d
..B1.180:                       # Preds ..B1.179
                                # Execution count [8.16e-03]: Infreq
..LN1420:
	.loc    1  573  is_stmt 1
        movq      128(%rsp), %rdi                               #573.3[spill]
..LN1421:
#       _mm_free(void *)
        call      _mm_free                                      #573.3
..LN1422:
                                # LOE r15 r12d r13d r14d
..B1.181:                       # Preds ..B1.180
                                # Execution count [8.16e-03]: Infreq
..LN1423:
	.loc    1  574  is_stmt 1
        movq      136(%rsp), %rdi                               #574.3[spill]
..LN1424:
#       _mm_free(void *)
        call      _mm_free                                      #574.3
..LN1425:
                                # LOE r15 r12d r13d r14d
..B1.182:                       # Preds ..B1.181
                                # Execution count [8.16e-03]: Infreq
..LN1426:
	.loc    1  575  is_stmt 1
        movq      144(%rsp), %rdi                               #575.3[spill]
..LN1427:
#       _mm_free(void *)
        call      _mm_free                                      #575.3
..LN1428:
                                # LOE r15 r12d r13d r14d
..B1.183:                       # Preds ..B1.182
                                # Execution count [8.16e-03]: Infreq
..LN1429:
	.loc    1  576  is_stmt 1
        movq      152(%rsp), %rdi                               #576.3[spill]
..LN1430:
#       _mm_free(void *)
        call      _mm_free                                      #576.3
..LN1431:
                                # LOE r15 r12d r13d r14d
..B1.184:                       # Preds ..B1.183
                                # Execution count [8.16e-03]: Infreq
..LN1432:
	.loc    1  577  is_stmt 1
        movq      160(%rsp), %rdi                               #577.3[spill]
..LN1433:
#       _mm_free(void *)
        call      _mm_free                                      #577.3
..LN1434:
        jmp       ..B1.18       # Prob 100%                     #577.3
..LN1435:
                                # LOE r15 r12d r13d r14d
..B1.185:                       # Preds ..B1.151
                                # Execution count [1.84e-02]: Infreq
..LN1436:
	.loc    1  551  is_stmt 1
        xorl      %eax, %eax                                    #551.5
..LN1437:
        jmp       ..B1.157      # Prob 100%                     #551.5
..LN1438:
                                # LOE eax ecx ebx xmm2
..B1.186:                       # Preds ..B1.132
                                # Execution count [7.34e-04]: Infreq
..LN1439:
	.loc    1  527  is_stmt 1
        xorl      %eax, %eax                                    #527.3
..LN1440:
        jmp       ..B1.142      # Prob 100%                     #527.3
..LN1441:
                                # LOE r15 eax r12d r13d
..B1.187:                       # Preds ..B1.117
                                # Execution count [7.34e-04]: Infreq
..LN1442:
        xorl      %r8d, %r8d                                    #527.3
..LN1443:
        jmp       ..B1.127      # Prob 100%                     #527.3
..LN1444:
                                # LOE r15 r8d r12d r13d
..B1.188:                       # Preds ..B1.15
                                # Execution count [8.16e-03]: Infreq
..LN1445:
	.loc    1  449  is_stmt 1
        movq      %rbx, %rdi                                    #449.16
..LN1446:
        movq      %r15, %rsi                                    #449.16
..LN1447:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #449.16
..LN1448:
                                # LOE rax rbx r15 r12d r13d
..B1.697:                       # Preds ..B1.188
                                # Execution count [8.16e-03]: Infreq
..LN1449:
        movq      %rax, 168(%rsp)                               #449.16[spill]
..LN1450:
                                # LOE rbx r15 r12d r13d
..B1.189:                       # Preds ..B1.697
                                # Execution count [8.16e-03]: Infreq
..LN1451:
	.loc    1  450  is_stmt 1
        movq      %rbx, %rdi                                    #450.16
..LN1452:
        movq      %r15, %rsi                                    #450.16
..LN1453:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #450.16
..LN1454:
                                # LOE rax rbx r15 r12d r13d
..B1.698:                       # Preds ..B1.189
                                # Execution count [8.16e-03]: Infreq
..LN1455:
        movq      %rax, 152(%rsp)                               #450.16[spill]
..LN1456:
                                # LOE rbx r15 r12d r13d
..B1.190:                       # Preds ..B1.698
                                # Execution count [8.16e-03]: Infreq
..LN1457:
	.loc    1  451  is_stmt 1
        movq      %rbx, %rdi                                    #451.16
..LN1458:
        movq      %r15, %rsi                                    #451.16
..LN1459:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #451.16
..LN1460:
                                # LOE rax rbx r15 r12d r13d
..B1.699:                       # Preds ..B1.190
                                # Execution count [8.16e-03]: Infreq
..LN1461:
        movq      %rax, 144(%rsp)                               #451.16[spill]
..LN1462:
                                # LOE rbx r15 r12d r13d
..B1.191:                       # Preds ..B1.699
                                # Execution count [8.16e-03]: Infreq
..LN1463:
	.loc    1  452  is_stmt 1
        movq      %rbx, %rdi                                    #452.16
..LN1464:
        movq      %r15, %rsi                                    #452.16
..LN1465:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #452.16
..LN1466:
                                # LOE rax rbx r15 r12d r13d
..B1.700:                       # Preds ..B1.191
                                # Execution count [8.16e-03]: Infreq
..LN1467:
        movq      %rax, 128(%rsp)                               #452.16[spill]
..LN1468:
                                # LOE rbx r15 r12d r13d
..B1.192:                       # Preds ..B1.700
                                # Execution count [8.16e-03]: Infreq
..LN1469:
	.loc    1  453  is_stmt 1
        movq      %rbx, %rdi                                    #453.16
..LN1470:
        movq      %r15, %rsi                                    #453.16
..LN1471:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #453.16
..LN1472:
                                # LOE rax rbx r15 r12d r13d
..B1.701:                       # Preds ..B1.192
                                # Execution count [8.16e-03]: Infreq
..LN1473:
        movq      %rax, 136(%rsp)                               #453.16[spill]
..LN1474:
                                # LOE rbx r15 r12d r13d
..B1.193:                       # Preds ..B1.701
                                # Execution count [8.16e-03]: Infreq
..LN1475:
	.loc    1  454  is_stmt 1
        movq      %rbx, %rdi                                    #454.16
..LN1476:
        movq      %r15, %rsi                                    #454.16
..LN1477:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #454.16
..LN1478:
                                # LOE rax rbx r15 r12d r13d
..B1.702:                       # Preds ..B1.193
                                # Execution count [8.16e-03]: Infreq
..LN1479:
        movq      %rax, 120(%rsp)                               #454.16[spill]
..LN1480:
                                # LOE rbx r15 r12d r13d
..B1.194:                       # Preds ..B1.702
                                # Execution count [8.16e-03]: Infreq
..LN1481:
	.loc    1  455  is_stmt 1
        movq      %rbx, %rdi                                    #455.16
..LN1482:
        movq      %r15, %rsi                                    #455.16
..LN1483:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #455.16
..LN1484:
                                # LOE rax rbx r15 r12d r13d
..B1.703:                       # Preds ..B1.194
                                # Execution count [8.16e-03]: Infreq
..LN1485:
        movq      %rax, 48(%rsp)                                #455.16[spill]
..LN1486:
                                # LOE rbx r15 r12d r13d
..B1.195:                       # Preds ..B1.703
                                # Execution count [8.16e-03]: Infreq
..LN1487:
	.loc    1  456  is_stmt 1
        movq      %rbx, %rdi                                    #456.16
..LN1488:
        movq      %r15, %rsi                                    #456.16
..LN1489:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #456.16
..LN1490:
                                # LOE rax rbx r15 r12d r13d
..B1.704:                       # Preds ..B1.195
                                # Execution count [8.16e-03]: Infreq
..LN1491:
        movq      %rax, 32(%rsp)                                #456.16[spill]
..LN1492:
                                # LOE rbx r15 r12d r13d
..B1.196:                       # Preds ..B1.704
                                # Execution count [8.16e-03]: Infreq
..LN1493:
	.loc    1  457  is_stmt 1
        movq      %rbx, %rdi                                    #457.16
..LN1494:
        movq      %r15, %rsi                                    #457.16
..LN1495:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #457.16
..LN1496:
                                # LOE rax r15 r12d r13d
..B1.705:                       # Preds ..B1.196
                                # Execution count [8.16e-03]: Infreq
..LN1497:
        movq      %rax, %rbx                                    #457.16
..LN1498:
                                # LOE rbx r15 r12d r13d
..B1.197:                       # Preds ..B1.705
                                # Execution count [8.16e-03]: Infreq
..LN1499:
	.loc    1  459  is_stmt 1
        testl     %r13d, %r13d                                  #459.18
..LN1500:
        jle       ..B1.228      # Prob 50%                      #459.18
..LN1501:
                                # LOE rbx r15 r12d r13d
..B1.198:                       # Preds ..B1.197
                                # Execution count [7.34e-03]: Infreq
..LN1502:
        movq      32(%rsp), %rdx                                #459.3[spill]
..LN1503:
        andq      $63, %rdx                                     #459.3
..LN1504:
        testl     %edx, %edx                                    #459.3
..LN1505:
        je        ..B1.201      # Prob 50%                      #459.3
..LN1506:
                                # LOE rbx r15 edx r12d r13d
..B1.199:                       # Preds ..B1.198
                                # Execution count [7.34e-03]: Infreq
..LN1507:
        testb     $7, %dl                                       #459.3
..LN1508:
        jne       ..B1.268      # Prob 10%                      #459.3
..LN1509:
                                # LOE rbx r15 edx r12d r13d
..B1.200:                       # Preds ..B1.199
                                # Execution count [0.00e+00]: Infreq
..LN1510:
        negl      %edx                                          #459.3
..LN1511:
        addl      $64, %edx                                     #459.3
..LN1512:
        shrl      $3, %edx                                      #459.3
..LN1513:
        cmpl      %edx, %r13d                                   #459.3
..LN1514:
        cmovl     %r13d, %edx                                   #459.3
..LN1515:
                                # LOE rbx r15 edx r12d r13d
..B1.201:                       # Preds ..B1.200 ..B1.198
                                # Execution count [8.16e-03]: Infreq
..LN1516:
        movl      %r13d, %r10d                                  #459.3
..LN1517:
        subl      %edx, %r10d                                   #459.3
..LN1518:
        andl      $7, %r10d                                     #459.3
..LN1519:
        negl      %r10d                                         #459.3
..LN1520:
        addl      %r13d, %r10d                                  #459.3
..LN1521:
        cmpl      $1, %edx                                      #459.3
..LN1522:
        jb        ..B1.205      # Prob 50%                      #459.3
..LN1523:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.202:                       # Preds ..B1.201
                                # Execution count [7.34e-03]: Infreq
..LN1524:
        movl      $8, %r8d                                      #459.3
..LN1525:
        vmovd     %edx, %xmm0                                   #459.3
..LN1526:
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1527:
        movl      $255, %eax                                    #459.3
..LN1528:
        movl      %r12d, (%rsp)                                 #459.3[spill]
..LN1529:
        movq      %r15, 8(%rsp)                                 #459.3[spill]
..LN1530:
        vmovd     %r8d, %xmm6                                   #459.3
..LN1531:
        xorl      %r8d, %r8d                                    #459.3
..LN1532:
        movl      %r13d, 192(%rsp)                              #459.3[spill]
..LN1533:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #459.3
..LN1534:
	.loc    1  460  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #460.11
..LN1535:
	.loc    1  461  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #461.11
..LN1536:
	.loc    1  462  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #462.11
..LN1537:
	.loc    1  463  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #463.11
..LN1538:
	.loc    1  459  is_stmt 1
        kmovw     %eax, %k1                                     #459.3
..LN1539:
        vpbroadcastd %xmm6, %ymm6                               #459.3
..LN1540:
        xorl      %eax, %eax                                    #459.3
..LN1541:
        movslq    %edx, %r9                                     #459.3
..LN1542:
        movq      32(%rsp), %rcx                                #459.3[spill]
..LN1543:
        movq      48(%rsp), %rsi                                #459.3[spill]
..LN1544:
        movq      120(%rsp), %r11                               #459.3[spill]
..LN1545:
        movq      136(%rsp), %r12                               #459.3[spill]
..LN1546:
        movq      128(%rsp), %r13                               #459.3[spill]
..LN1547:
        movq      144(%rsp), %r14                               #459.3[spill]
..LN1548:
        movq      152(%rsp), %r15                               #459.3[spill]
..LN1549:
        movq      168(%rsp), %rdi                               #459.3[spill]
        .align    16,0x90
..LN1550:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 edx r10d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.203:                       # Preds ..B1.203 ..B1.202
                                # Execution count [4.08e-02]: Infreq
..LN1551:
        addq      $8, %r8                                       #459.3
..LN1552:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #459.3
..LN1553:
        vpaddd    %ymm6, %ymm5, %ymm5                           #459.3
..LN1554:
	.loc    1  460  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #460.4
..LN1555:
	.loc    1  461  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #461.4
..LN1556:
	.loc    1  462  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #462.4
..LN1557:
	.loc    1  463  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #463.4
..LN1558:
	.loc    1  464  is_stmt 1
        vmovupd   %zmm4, (%rax,%r12){%k2}                       #464.4
..LN1559:
	.loc    1  465  is_stmt 1
        vmovupd   %zmm3, (%rax,%r11){%k2}                       #465.4
..LN1560:
	.loc    1  466  is_stmt 1
        vmovupd   %zmm2, (%rax,%rsi){%k2}                       #466.4
..LN1561:
	.loc    1  467  is_stmt 1
        vmovupd   %zmm1, (%rax,%rcx){%k2}                       #467.4
..LN1562:
	.loc    1  459  is_stmt 1
        addq      $64, %rax                                     #459.3
..LN1563:
        cmpq      %r9, %r8                                      #459.3
..LN1564:
        jb        ..B1.203      # Prob 81%                      #459.3
..LN1565:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 edx r10d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.204:                       # Preds ..B1.203
                                # Execution count [7.34e-03]: Infreq
..LN1566:
        movl      192(%rsp), %r13d                              #[spill]
..LN1567:
        movl      (%rsp), %r12d                                 #[spill]
..LN1568:
        movq      8(%rsp), %r15                                 #[spill]
..LN1569:
        cmpl      %edx, %r13d                                   #459.3
..LN1570:
        je        ..B1.213      # Prob 10%                      #459.3
..LN1571:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.205:                       # Preds ..B1.204 ..B1.201
                                # Execution count [0.00e+00]: Infreq
..LN1572:
        lea       8(%rdx), %r8d                                 #459.3
..LN1573:
        cmpl      %r8d, %r10d                                   #459.3
..LN1574:
        jl        ..B1.209      # Prob 50%                      #459.3
..LN1575:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.206:                       # Preds ..B1.205
                                # Execution count [7.34e-03]: Infreq
..LN1576:
        movl      %r13d, 192(%rsp)                              #459.3[spill]
..LN1577:
        movslq    %edx, %rdx                                    #459.3
..LN1578:
	.loc    1  460  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #460.11
..LN1579:
	.loc    1  461  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #461.11
..LN1580:
	.loc    1  462  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #462.11
..LN1581:
	.loc    1  463  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #463.11
..LN1582:
	.loc    1  459  is_stmt 1
        movslq    %r10d, %rax                                   #459.3
..LN1583:
        movq      32(%rsp), %r8                                 #459.3[spill]
..LN1584:
        movq      48(%rsp), %r9                                 #459.3[spill]
..LN1585:
        movq      120(%rsp), %r11                               #459.3[spill]
..LN1586:
        movq      136(%rsp), %r13                               #459.3[spill]
..LN1587:
        movq      128(%rsp), %r14                               #459.3[spill]
..LN1588:
        movq      144(%rsp), %rcx                               #459.3[spill]
..LN1589:
        movq      152(%rsp), %rsi                               #459.3[spill]
..LN1590:
        movq      168(%rsp), %rdi                               #459.3[spill]
        .align    16,0x90
..LN1591:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d zmm0 zmm1 zmm2 zmm3
..B1.207:                       # Preds ..B1.207 ..B1.206
                                # Execution count [4.08e-02]: Infreq
..LN1592:
	.loc    1  460  is_stmt 1
        vmovupd   %zmm3, (%rdi,%rdx,8)                          #460.4
..LN1593:
	.loc    1  461  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #461.4
..LN1594:
	.loc    1  462  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #462.4
..LN1595:
	.loc    1  463  is_stmt 1
        vmovupd   %zmm0, (%r14,%rdx,8)                          #463.4
..LN1596:
	.loc    1  464  is_stmt 1
        vmovupd   %zmm3, (%r13,%rdx,8)                          #464.4
..LN1597:
	.loc    1  465  is_stmt 1
        vmovupd   %zmm2, (%r11,%rdx,8)                          #465.4
..LN1598:
	.loc    1  466  is_stmt 1
        vmovupd   %zmm1, (%r9,%rdx,8)                           #466.4
..LN1599:
	.loc    1  467  is_stmt 1
        vmovntpd  %zmm0, (%r8,%rdx,8)                           #467.4
..LN1600:
	.loc    1  459  is_stmt 1
        addq      $8, %rdx                                      #459.3
..LN1601:
        cmpq      %rax, %rdx                                    #459.3
..LN1602:
        jb        ..B1.207      # Prob 81%                      #459.3
..LN1603:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d zmm0 zmm1 zmm2 zmm3
..B1.208:                       # Preds ..B1.207
                                # Execution count [7.34e-03]: Infreq
..LN1604:
        movl      192(%rsp), %r13d                              #[spill]
..LN1605:
                                # LOE rbx r15 r10d r12d r13d
..B1.209:                       # Preds ..B1.208 ..B1.205 ..B1.268
                                # Execution count [8.16e-03]: Infreq
..LN1606:
        lea       1(%r10), %edx                                 #459.3
..LN1607:
        cmpl      %r13d, %edx                                   #459.3
..LN1608:
        ja        ..B1.213      # Prob 50%                      #459.3
..LN1609:
                                # LOE rbx r15 r10d r12d r13d
..B1.210:                       # Preds ..B1.209
                                # Execution count [7.34e-03]: Infreq
..LN1610:
        movslq    %r10d, %rdx                                   #459.3
..LN1611:
        movl      $8, %r11d                                     #459.3
..LN1612:
	.loc    1  465  is_stmt 1
        movq      120(%rsp), %r8                                #465.4[spill]
..LN1613:
	.loc    1  459  is_stmt 1
        negl      %r10d                                         #459.3
..LN1614:
        addl      %r13d, %r10d                                  #459.3
..LN1615:
        movl      $255, %eax                                    #459.3
..LN1616:
	.loc    1  466  is_stmt 1
        movq      48(%rsp), %r9                                 #466.4[spill]
..LN1617:
	.loc    1  459  is_stmt 1
        vmovd     %r11d, %xmm6                                  #459.3
..LN1618:
	.loc    1  465  is_stmt 1
        lea       (%r8,%rdx,8), %r11                            #465.4
..LN1619:
	.loc    1  462  is_stmt 1
        movq      144(%rsp), %r8                                #462.4[spill]
..LN1620:
	.loc    1  459  is_stmt 1
        vmovd     %r10d, %xmm0                                  #459.3
..LN1621:
	.loc    1  466  is_stmt 1
        lea       (%r9,%rdx,8), %rcx                            #466.4
..LN1622:
	.loc    1  467  is_stmt 1
        movq      32(%rsp), %r10                                #467.4[spill]
..LN1623:
	.loc    1  463  is_stmt 1
        movq      128(%rsp), %r9                                #463.4[spill]
..LN1624:
	.loc    1  462  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #462.4
..LN1625:
        movq      %r8, 24(%rsp)                                 #462.4[spill]
..LN1626:
	.loc    1  461  is_stmt 1
        movq      152(%rsp), %r8                                #461.4[spill]
..LN1627:
	.loc    1  467  is_stmt 1
        lea       (%r10,%rdx,8), %rsi                           #467.4
..LN1628:
	.loc    1  464  is_stmt 1
        movq      136(%rsp), %r10                               #464.4[spill]
..LN1629:
	.loc    1  463  is_stmt 1
        lea       (%r9,%rdx,8), %r9                             #463.4
..LN1630:
	.loc    1  459  is_stmt 1
        kmovw     %eax, %k1                                     #459.3
..LN1631:
        xorl      %eax, %eax                                    #459.3
..LN1632:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #459.3
..LN1633:
	.loc    1  460  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #460.11
..LN1634:
	.loc    1  461  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #461.11
..LN1635:
	.loc    1  462  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #462.11
..LN1636:
	.loc    1  463  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #463.11
..LN1637:
	.loc    1  459  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1638:
	.loc    1  461  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #461.4
..LN1639:
        movq      %r8, 16(%rsp)                                 #461.4[spill]
..LN1640:
	.loc    1  464  is_stmt 1
        lea       (%r10,%rdx,8), %r10                           #464.4
..LN1641:
	.loc    1  460  is_stmt 1
        movq      168(%rsp), %r8                                #460.4[spill]
..LN1642:
	.loc    1  459  is_stmt 1
        movq      112(%rsp), %rdi                               #459.3[spill]
..LN1643:
        movl      %r13d, 192(%rsp)                              #459.3[spill]
..LN1644:
        subq      %rdx, %rdi                                    #459.3
..LN1645:
        vpbroadcastd %xmm6, %ymm6                               #459.3
..LN1646:
	.loc    1  460  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #460.4
..LN1647:
	.loc    1  459  is_stmt 1
        movq      16(%rsp), %r13                                #459.3[spill]
..LN1648:
        xorl      %edx, %edx                                    #459.3
..LN1649:
        movq      24(%rsp), %r14                                #459.3[spill]
        .align    16,0x90
..LN1650:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r13 r14 r15 r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.211:                       # Preds ..B1.211 ..B1.210
                                # Execution count [4.08e-02]: Infreq
..LN1651:
        addq      $8, %rax                                      #459.3
..LN1652:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #459.3
..LN1653:
        vpaddd    %ymm6, %ymm5, %ymm5                           #459.3
..LN1654:
	.loc    1  460  is_stmt 1
        vmovupd   %zmm4, (%rdx,%r8){%k2}                        #460.4
..LN1655:
	.loc    1  461  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r13){%k2}                       #461.4
..LN1656:
	.loc    1  462  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r14){%k2}                       #462.4
..LN1657:
	.loc    1  463  is_stmt 1
        vmovupd   %zmm1, (%rdx,%r9){%k2}                        #463.4
..LN1658:
	.loc    1  464  is_stmt 1
        vmovupd   %zmm4, (%rdx,%r10){%k2}                       #464.4
..LN1659:
	.loc    1  465  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r11){%k2}                       #465.4
..LN1660:
	.loc    1  466  is_stmt 1
        vmovupd   %zmm2, (%rdx,%rcx){%k2}                       #466.4
..LN1661:
	.loc    1  467  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rsi){%k2}                       #467.4
..LN1662:
	.loc    1  459  is_stmt 1
        addq      $64, %rdx                                     #459.3
..LN1663:
        cmpq      %rdi, %rax                                    #459.3
..LN1664:
        jb        ..B1.211      # Prob 81%                      #459.3
..LN1665:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r13 r14 r15 r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.212:                       # Preds ..B1.211
                                # Execution count [7.34e-03]: Infreq
..LN1666:
        movl      192(%rsp), %r13d                              #[spill]
..LN1667:
                                # LOE rbx r15 r12d r13d
..B1.213:                       # Preds ..B1.204 ..B1.209 ..B1.212
                                # Execution count [7.34e-03]: Infreq
..LN1668:
        movq      %rbx, %r10                                    #459.3
..LN1669:
        andq      $63, %r10                                     #459.3
..LN1670:
        testl     %r10d, %r10d                                  #459.3
..LN1671:
        je        ..B1.216      # Prob 50%                      #459.3
..LN1672:
                                # LOE rbx r15 r10d r12d r13d
..B1.214:                       # Preds ..B1.213
                                # Execution count [7.34e-03]: Infreq
..LN1673:
        testl     $7, %r10d                                     #459.3
..LN1674:
        jne       ..B1.267      # Prob 10%                      #459.3
..LN1675:
                                # LOE rbx r15 r10d r12d r13d
..B1.215:                       # Preds ..B1.214
                                # Execution count [0.00e+00]: Infreq
..LN1676:
        negl      %r10d                                         #459.3
..LN1677:
        addl      $64, %r10d                                    #459.3
..LN1678:
        shrl      $3, %r10d                                     #459.3
..LN1679:
        cmpl      %r10d, %r13d                                  #459.3
..LN1680:
        cmovl     %r13d, %r10d                                  #459.3
..LN1681:
                                # LOE rbx r15 r10d r12d r13d
..B1.216:                       # Preds ..B1.215 ..B1.213
                                # Execution count [8.16e-03]: Infreq
..LN1682:
        movl      %r13d, %eax                                   #459.3
..LN1683:
        subl      %r10d, %eax                                   #459.3
..LN1684:
        andl      $7, %eax                                      #459.3
..LN1685:
        negl      %eax                                          #459.3
..LN1686:
        addl      %r13d, %eax                                   #459.3
..LN1687:
        cmpl      $1, %r10d                                     #459.3
..LN1688:
        jb        ..B1.220      # Prob 50%                      #459.3
..LN1689:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.217:                       # Preds ..B1.216
                                # Execution count [7.34e-03]: Infreq
..LN1690:
        movl      $255, %edx                                    #459.3
..LN1691:
        vmovd     %r10d, %xmm0                                  #459.3
..LN1692:
        kmovw     %edx, %k1                                     #459.3
..LN1693:
        movl      $8, %edx                                      #459.3
..LN1694:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #459.3
..LN1695:
	.loc    1  468  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #468.11
..LN1696:
	.loc    1  459  is_stmt 1
        vmovd     %edx, %xmm3                                   #459.3
..LN1697:
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1698:
        xorl      %r9d, %r9d                                    #459.3
..LN1699:
        vpbroadcastd %xmm3, %ymm3                               #459.3
..LN1700:
        xorl      %edx, %edx                                    #459.3
..LN1701:
        movslq    %r10d, %r8                                    #459.3
..LN1702:
                                # LOE rdx rbx r8 r9 r15 eax r10d r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.218:                       # Preds ..B1.218 ..B1.217
                                # Execution count [4.08e-02]: Infreq
..LN1703:
        addq      $8, %r9                                       #459.3
..LN1704:
        vpcmpgtd  %zmm2, %zmm0, %k2{%k1}                        #459.3
..LN1705:
        vpaddd    %ymm3, %ymm2, %ymm2                           #459.3
..LN1706:
	.loc    1  468  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rbx){%k2}                       #468.4
..LN1707:
	.loc    1  459  is_stmt 1
        addq      $64, %rdx                                     #459.3
..LN1708:
        cmpq      %r8, %r9                                      #459.3
..LN1709:
        jb        ..B1.218      # Prob 81%                      #459.3
..LN1710:
                                # LOE rdx rbx r8 r9 r15 eax r10d r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.219:                       # Preds ..B1.218
                                # Execution count [7.34e-03]: Infreq
..LN1711:
        cmpl      %r10d, %r13d                                  #459.3
..LN1712:
        je        ..B1.228      # Prob 10%                      #459.3
..LN1713:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.220:                       # Preds ..B1.216 ..B1.219
                                # Execution count [0.00e+00]: Infreq
..LN1714:
        lea       8(%r10), %edx                                 #459.3
..LN1715:
        cmpl      %edx, %eax                                    #459.3
..LN1716:
        jl        ..B1.224      # Prob 50%                      #459.3
..LN1717:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.221:                       # Preds ..B1.220
                                # Execution count [7.34e-03]: Infreq
..LN1718:
        movslq    %r10d, %r10                                   #459.3
..LN1719:
	.loc    1  468  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm0             #468.11
..LN1720:
	.loc    1  459  is_stmt 1
        movslq    %eax, %rdx                                    #459.3
..LN1721:
                                # LOE rdx rbx r10 r15 eax r12d r13d zmm0
..B1.222:                       # Preds ..B1.222 ..B1.221
                                # Execution count [4.08e-02]: Infreq
..LN1722:
	.loc    1  468  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r10,8)                          #468.4
..LN1723:
	.loc    1  459  is_stmt 1
        addq      $8, %r10                                      #459.3
..LN1724:
        cmpq      %rdx, %r10                                    #459.3
..LN1725:
        jb        ..B1.222      # Prob 81%                      #459.3
..LN1726:
                                # LOE rdx rbx r10 r15 eax r12d r13d zmm0
..B1.224:                       # Preds ..B1.222 ..B1.220 ..B1.267
                                # Execution count [8.16e-03]: Infreq
..LN1727:
        lea       1(%rax), %edx                                 #459.3
..LN1728:
        cmpl      %r13d, %edx                                   #459.3
..LN1729:
        ja        ..B1.228      # Prob 50%                      #459.3
..LN1730:
                                # LOE rbx r15 eax r12d r13d
..B1.225:                       # Preds ..B1.224
                                # Execution count [7.34e-03]: Infreq
..LN1731:
        movl      $255, %edx                                    #459.3
..LN1732:
        movl      $8, %r8d                                      #459.3
..LN1733:
        kmovw     %edx, %k1                                     #459.3
..LN1734:
        xorl      %r9d, %r9d                                    #459.3
..LN1735:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #459.3
..LN1736:
	.loc    1  468  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #468.11
..LN1737:
	.loc    1  459  is_stmt 1
        vmovd     %r8d, %xmm3                                   #459.3
..LN1738:
        movslq    %eax, %rdx                                    #459.3
..LN1739:
        negl      %eax                                          #459.3
..LN1740:
        addl      %r13d, %eax                                   #459.3
..LN1741:
        movq      112(%rsp), %r8                                #459.3[spill]
..LN1742:
        vpbroadcastd %xmm3, %ymm3                               #459.3
..LN1743:
        subq      %rdx, %r8                                     #459.3
..LN1744:
	.loc    1  468  is_stmt 1
        lea       (%rbx,%rdx,8), %rdx                           #468.4
..LN1745:
	.loc    1  459  is_stmt 1
        vmovd     %eax, %xmm0                                   #459.3
..LN1746:
        xorl      %eax, %eax                                    #459.3
..LN1747:
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1748:
                                # LOE rax rdx rbx r8 r9 r15 r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.226:                       # Preds ..B1.226 ..B1.225
                                # Execution count [4.08e-02]: Infreq
..LN1749:
        addq      $8, %r9                                       #459.3
..LN1750:
        vpcmpgtd  %zmm2, %zmm0, %k2{%k1}                        #459.3
..LN1751:
        vpaddd    %ymm3, %ymm2, %ymm2                           #459.3
..LN1752:
	.loc    1  468  is_stmt 1
        vmovupd   %zmm1, (%rax,%rdx){%k2}                       #468.4
..LN1753:
	.loc    1  459  is_stmt 1
        addq      $64, %rax                                     #459.3
..LN1754:
        cmpq      %r8, %r9                                      #459.3
..LN1755:
        jb        ..B1.226      # Prob 81%                      #459.3
..LN1756:
                                # LOE rax rdx rbx r8 r9 r15 r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.228:                       # Preds ..B1.226 ..B1.219 ..B1.224 ..B1.197
                                # Execution count [8.16e-03]: Infreq
..LN1757:
	.loc    1  473  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #473.3
..LN1758:
	.loc    1  471  is_stmt 1
        movl      $1, %r14d                                     #471.3
..LN1759:
	.loc    1  473  is_stmt 1
        vzeroupper                                              #473.3
..___tag_value_main.39:
..LN1760:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #473.3
..___tag_value_main.40:
..LN1761:
                                # LOE rbx r15 r12d r13d r14d
..B1.229:                       # Preds ..B1.228
                                # Execution count [8.16e-03]: Infreq
..LN1762:
	.loc    1  475  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #475.11
..LN1763:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #475.24
..LN1764:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #475.15
..LN1765:
        vcomisd   %xmm1, %xmm0                                  #475.24
..LN1766:
        jbe       ..B1.255      # Prob 10%                      #475.24
..LN1767:
                                # LOE rbx r15 r12d r13d r14d
..B1.230:                       # Preds ..B1.229
                                # Execution count [7.34e-03]: Infreq
..LN1768:
	.loc    1  482  is_stmt 1
        movl      $8, %r8d                                      #482.5
..LN1769:
        movl      %r13d, %edx                                   #482.5
..LN1770:
        andl      $-64, %edx                                    #482.5
..LN1771:
	.loc    1  477  is_stmt 1
        lea       56(%rsp), %rdi                                #477.4
..LN1772:
	.loc    1  482  is_stmt 1
        movl      %edx, 104(%rdi)                               #482.5[spill]
..LN1773:
	.loc    1  477  is_stmt 1
        lea       40(%rsp), %rsi                                #477.4
..LN1774:
	.loc    1  482  is_stmt 1
        movslq    %edx, %rdx                                    #482.5
..LN1775:
        vmovd     %r8d, %xmm0                                   #482.5
..LN1776:
        vpbroadcastd %xmm0, %ymm1                               #482.5
..LN1777:
        vmovdqu   %ymm1, 24(%rsi)                               #482.5[spill]
..LN1778:
        movq      %rdx, -16(%rsi)                               #482.5[spill]
..LN1779:
	.loc    1  477  is_stmt 1
        vzeroupper                                              #477.4
..___tag_value_main.41:
..LN1780:
#       timing(double *, double *)
        call      timing                                        #477.4
..___tag_value_main.42:
..LN1781:
                                # LOE rbx r15 r12d r13d r14d
..B1.231:                       # Preds ..B1.230
                                # Execution count [6.61e-03]: Infreq
..LN1782:
	.loc    1  478  is_stmt 1
        xorl      %eax, %eax                                    #478.4
..LN1783:
        movq      %rbx, 16(%rsp)                                #478.4[spill]
..LN1784:
        movl      %eax, %ebx                                    #478.4
..LN1785:
        movl      %r14d, 184(%rsp)                              #478.4[spill]
..LN1786:
        vxorpd    %xmm1, %xmm1, %xmm1                           #478.4
..LN1787:
        movl      %r12d, (%rsp)                                 #478.4[spill]
..LN1788:
        movq      %r15, 8(%rsp)                                 #478.4[spill]
..LN1789:
                                # LOE ebx r13d xmm1
..B1.232:                       # Preds ..B1.231 ..B1.247 ..B1.253
                                # Execution count [2.04e-01]: Infreq
..LN1790:
	.loc    1  482  is_stmt 1
        xorl      %edi, %edi                                    #482.9
..LN1791:
        testl     %r13d, %r13d                                  #482.20
..LN1792:
        jle       ..B1.245      # Prob 50%                      #482.20
..LN1793:
                                # LOE ebx edi r13d xmm1
..B1.233:                       # Preds ..B1.232
                                # Execution count [1.84e-01]: Infreq
..LN1794:
        cmpl      $64, %r13d                                    #482.5
..LN1795:
        jl        ..B1.266      # Prob 10%                      #482.5
..LN1796:
                                # LOE ebx edi r13d xmm1
..B1.234:                       # Preds ..B1.233
                                # Execution count [1.84e-01]: Infreq
..LN1797:
        movl      160(%rsp), %edx                               #482.5[spill]
..LN1798:
                                # LOE edx ebx r13d xmm1
..B1.236:                       # Preds ..B1.234
                                # Execution count [1.84e-01]: Infreq
..LN1799:
        movq      24(%rsp), %rdi                                #482.5[spill]
..LN1800:
        xorl      %ecx, %ecx                                    #482.5
..LN1801:
        movq      16(%rsp), %r8                                 #482.5[spill]
..LN1802:
        movq      32(%rsp), %r9                                 #482.5[spill]
..LN1803:
        movq      48(%rsp), %r10                                #482.5[spill]
..LN1804:
        movq      120(%rsp), %r11                               #482.5[spill]
..LN1805:
        movq      136(%rsp), %r12                               #482.5[spill]
..LN1806:
        movq      128(%rsp), %r15                               #482.5[spill]
..LN1807:
        movq      144(%rsp), %rax                               #482.5[spill]
..LN1808:
        movq      152(%rsp), %rsi                               #482.5[spill]
..LN1809:
        movq      168(%rsp), %r14                               #482.5[spill]
..LN1810:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 edx ebx r13d xmm1
..B1.237:                       # Preds ..B1.237 ..B1.236
                                # Execution count [1.02e+00]: Infreq
..LN1811:
	.loc    1  483  is_stmt 1
        vmovups   (%rsi,%rcx,8), %zmm0                          #483.13
..LN1812:
        vmovups   (%r15,%rcx,8), %zmm2                          #483.27
..LN1813:
        vmovups   (%r11,%rcx,8), %zmm5                          #483.41
..LN1814:
        vmovups   (%r9,%rcx,8), %zmm6                           #483.55
..LN1815:
        vmovups   64(%r9,%rcx,8), %zmm16                        #483.55
..LN1816:
        vmovups   64(%rsi,%rcx,8), %zmm11                       #483.13
..LN1817:
        vmovups   64(%r15,%rcx,8), %zmm12                       #483.27
..LN1818:
        vmovups   64(%r11,%rcx,8), %zmm15                       #483.41
..LN1819:
        vaddpd    (%rax,%rcx,8), %zmm0, %zmm3                   #483.62
..LN1820:
        vaddpd    (%r12,%rcx,8), %zmm2, %zmm4                   #483.62
..LN1821:
        vaddpd    (%r10,%rcx,8), %zmm5, %zmm7                   #483.62
..LN1822:
        vaddpd    (%r8,%rcx,8), %zmm6, %zmm8                    #483.62
..LN1823:
        vaddpd    64(%r8,%rcx,8), %zmm16, %zmm18                #483.62
..LN1824:
        vaddpd    64(%rax,%rcx,8), %zmm11, %zmm13               #483.62
..LN1825:
        vaddpd    64(%r12,%rcx,8), %zmm12, %zmm14               #483.62
..LN1826:
        vaddpd    64(%r10,%rcx,8), %zmm15, %zmm17               #483.62
..LN1827:
        vaddpd    %zmm4, %zmm3, %zmm9                           #483.62
..LN1828:
        vaddpd    %zmm8, %zmm7, %zmm10                          #483.62
..LN1829:
        vaddpd    %zmm14, %zmm13, %zmm19                        #483.62
..LN1830:
        vaddpd    %zmm18, %zmm17, %zmm20                        #483.62
..LN1831:
        vaddpd    %zmm10, %zmm9, %zmm21                         #483.62
..LN1832:
        vaddpd    %zmm20, %zmm19, %zmm22                        #483.62
..LN1833:
        vmovntpd  %zmm21, (%r14,%rcx,8)                         #483.6
..LN1834:
        vmovntpd  %zmm22, 64(%r14,%rcx,8)                       #483.6
..LN1835:
        vmovups   128(%rsi,%rcx,8), %zmm23                      #483.13
..LN1836:
        vmovups   128(%r15,%rcx,8), %zmm24                      #483.27
..LN1837:
        vmovups   128(%r11,%rcx,8), %zmm27                      #483.41
..LN1838:
        vmovups   128(%r9,%rcx,8), %zmm28                       #483.55
..LN1839:
        vmovups   192(%r9,%rcx,8), %zmm4                        #483.55
..LN1840:
        vmovups   192(%rsi,%rcx,8), %zmm0                       #483.13
..LN1841:
        vmovups   192(%r15,%rcx,8), %zmm2                       #483.27
..LN1842:
        vmovups   192(%r11,%rcx,8), %zmm3                       #483.41
..LN1843:
        vaddpd    128(%rax,%rcx,8), %zmm23, %zmm25              #483.62
..LN1844:
        vaddpd    128(%r12,%rcx,8), %zmm24, %zmm26              #483.62
..LN1845:
        vaddpd    128(%r10,%rcx,8), %zmm27, %zmm29              #483.62
..LN1846:
        vaddpd    128(%r8,%rcx,8), %zmm28, %zmm30               #483.62
..LN1847:
        vaddpd    192(%r8,%rcx,8), %zmm4, %zmm6                 #483.62
..LN1848:
        vaddpd    %zmm26, %zmm25, %zmm31                        #483.62
..LN1849:
        vaddpd    192(%rax,%rcx,8), %zmm0, %zmm24               #483.62
..LN1850:
        vaddpd    192(%r12,%rcx,8), %zmm2, %zmm25               #483.62
..LN1851:
        vaddpd    192(%r10,%rcx,8), %zmm3, %zmm5                #483.62
..LN1852:
        vaddpd    %zmm30, %zmm29, %zmm23                        #483.62
..LN1853:
        vaddpd    %zmm25, %zmm24, %zmm7                         #483.62
..LN1854:
        vaddpd    %zmm6, %zmm5, %zmm8                           #483.62
..LN1855:
        vaddpd    %zmm23, %zmm31, %zmm9                         #483.62
..LN1856:
        vaddpd    %zmm8, %zmm7, %zmm10                          #483.62
..LN1857:
        vmovntpd  %zmm9, 128(%r14,%rcx,8)                       #483.6
..LN1858:
        vmovntpd  %zmm10, 192(%r14,%rcx,8)                      #483.6
..LN1859:
        vmovups   256(%rsi,%rcx,8), %zmm11                      #483.13
..LN1860:
        vmovups   256(%r15,%rcx,8), %zmm12                      #483.27
..LN1861:
        vmovups   256(%r11,%rcx,8), %zmm15                      #483.41
..LN1862:
        vmovups   256(%r9,%rcx,8), %zmm16                       #483.55
..LN1863:
        vmovups   320(%r9,%rcx,8), %zmm29                       #483.55
..LN1864:
        vmovups   320(%rsi,%rcx,8), %zmm21                      #483.13
..LN1865:
        vmovups   320(%r15,%rcx,8), %zmm22                      #483.27
..LN1866:
        vmovups   320(%r11,%rcx,8), %zmm28                      #483.41
..LN1867:
        vaddpd    256(%rax,%rcx,8), %zmm11, %zmm13              #483.62
..LN1868:
        vaddpd    256(%r12,%rcx,8), %zmm12, %zmm14              #483.62
..LN1869:
        vaddpd    256(%r10,%rcx,8), %zmm15, %zmm17              #483.62
..LN1870:
        vaddpd    256(%r8,%rcx,8), %zmm16, %zmm18               #483.62
..LN1871:
        vaddpd    320(%r8,%rcx,8), %zmm29, %zmm31               #483.62
..LN1872:
        vaddpd    320(%rax,%rcx,8), %zmm21, %zmm26              #483.62
..LN1873:
        vaddpd    320(%r12,%rcx,8), %zmm22, %zmm27              #483.62
..LN1874:
        vaddpd    320(%r10,%rcx,8), %zmm28, %zmm30              #483.62
..LN1875:
        vaddpd    %zmm14, %zmm13, %zmm19                        #483.62
..LN1876:
        vaddpd    %zmm18, %zmm17, %zmm20                        #483.62
..LN1877:
        vaddpd    %zmm27, %zmm26, %zmm21                        #483.62
..LN1878:
        vaddpd    %zmm31, %zmm30, %zmm22                        #483.62
..LN1879:
        vaddpd    %zmm20, %zmm19, %zmm0                         #483.62
..LN1880:
        vaddpd    %zmm22, %zmm21, %zmm2                         #483.62
..LN1881:
        vmovntpd  %zmm0, 256(%r14,%rcx,8)                       #483.6
..LN1882:
        vmovntpd  %zmm2, 320(%r14,%rcx,8)                       #483.6
..LN1883:
        vmovups   384(%rsi,%rcx,8), %zmm3                       #483.13
..LN1884:
        vmovups   384(%r15,%rcx,8), %zmm4                       #483.27
..LN1885:
        vmovups   384(%r11,%rcx,8), %zmm7                       #483.41
..LN1886:
        vmovups   384(%r9,%rcx,8), %zmm8                        #483.55
..LN1887:
        vmovups   448(%r9,%rcx,8), %zmm18                       #483.55
..LN1888:
        vmovups   448(%rsi,%rcx,8), %zmm13                      #483.13
..LN1889:
        .byte     144                                           #483.27
..LN1890:
        vmovups   448(%r15,%rcx,8), %zmm14                      #483.27
..LN1891:
        vmovups   448(%r11,%rcx,8), %zmm17                      #483.41
..LN1892:
        vaddpd    384(%rax,%rcx,8), %zmm3, %zmm5                #483.62
..LN1893:
        vaddpd    384(%r12,%rcx,8), %zmm4, %zmm6                #483.62
..LN1894:
        vaddpd    384(%r10,%rcx,8), %zmm7, %zmm9                #483.62
..LN1895:
        vaddpd    384(%r8,%rcx,8), %zmm8, %zmm10                #483.62
..LN1896:
        vaddpd    448(%r8,%rcx,8), %zmm18, %zmm20               #483.62
..LN1897:
        vaddpd    448(%rax,%rcx,8), %zmm13, %zmm15              #483.62
..LN1898:
        vaddpd    448(%r12,%rcx,8), %zmm14, %zmm16              #483.62
..LN1899:
        vaddpd    448(%r10,%rcx,8), %zmm17, %zmm19              #483.62
..LN1900:
        vaddpd    %zmm6, %zmm5, %zmm11                          #483.62
..LN1901:
        vaddpd    %zmm10, %zmm9, %zmm12                         #483.62
..LN1902:
        vaddpd    %zmm16, %zmm15, %zmm23                        #483.62
..LN1903:
        vaddpd    %zmm20, %zmm19, %zmm24                        #483.62
..LN1904:
        vaddpd    %zmm12, %zmm11, %zmm25                        #483.62
..LN1905:
        vaddpd    %zmm24, %zmm23, %zmm26                        #483.62
..LN1906:
        vmovntpd  %zmm25, 384(%r14,%rcx,8)                      #483.6
..LN1907:
        vmovntpd  %zmm26, 448(%r14,%rcx,8)                      #483.6
..LN1908:
	.loc    1  482  is_stmt 1
        addq      $64, %rcx                                     #482.5
..LN1909:
        cmpq      %rdi, %rcx                                    #482.5
..LN1910:
        jb        ..B1.237      # Prob 82%                      #482.5
..LN1911:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 edx ebx r13d xmm1
..B1.238:                       # Preds ..B1.237
                                # Execution count [1.84e-01]: Infreq
..LN1912:
        movl      %edx, %edi                                    #482.36
..LN1913:
                                # LOE edx ebx edi r13d xmm1
..B1.239:                       # Preds ..B1.238 ..B1.266
                                # Execution count [2.04e-01]: Infreq
..LN1914:
        lea       1(%rdx), %ecx                                 #482.5
..LN1915:
        cmpl      %r13d, %ecx                                   #482.5
..LN1916:
        ja        ..B1.245      # Prob 50%                      #482.5
..LN1917:
                                # LOE edx ebx edi r13d xmm1
..B1.240:                       # Preds ..B1.239
                                # Execution count [1.84e-01]: Infreq
..LN1918:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm0             #482.5
..LN1919:
                                # LOE edx ebx r13d xmm1 ymm0
..B1.242:                       # Preds ..B1.240
                                # Execution count [1.84e-01]: Infreq
..LN1920:
        movl      $255, %eax                                    #482.5
..LN1921:
        xorl      %esi, %esi                                    #482.5
..LN1922:
        kmovw     %eax, %k1                                     #482.5
..LN1923:
        vmovdqu   64(%rsp), %ymm14                              #482.5[spill]
..LN1924:
        movslq    %edx, %rax                                    #482.5
..LN1925:
        negl      %edx                                          #482.5
..LN1926:
        addl      %r13d, %edx                                   #482.5
..LN1927:
	.loc    1  483  is_stmt 1
        movq      168(%rsp), %rcx                               #483.6[spill]
..LN1928:
        movq      32(%rsp), %r9                                 #483.55[spill]
..LN1929:
        movq      48(%rsp), %r8                                 #483.48[spill]
..LN1930:
        movq      120(%rsp), %r10                               #483.41[spill]
..LN1931:
	.loc    1  482  is_stmt 1
        vmovd     %edx, %xmm2                                   #482.5
..LN1932:
	.loc    1  483  is_stmt 1
        movq      16(%rsp), %rdx                                #483.62[spill]
..LN1933:
        lea       (%rcx,%rax,8), %rcx                           #483.6
..LN1934:
        movq      136(%rsp), %r11                               #483.34[spill]
..LN1935:
        lea       (%r9,%rax,8), %r9                             #483.55
..LN1936:
        movq      128(%rsp), %r12                               #483.27[spill]
..LN1937:
        lea       (%r8,%rax,8), %r8                             #483.48
..LN1938:
        movq      144(%rsp), %r15                               #483.20[spill]
..LN1939:
        lea       (%rdx,%rax,8), %rdx                           #483.62
..LN1940:
        movq      152(%rsp), %r14                               #483.13[spill]
..LN1941:
        lea       (%r10,%rax,8), %r10                           #483.41
..LN1942:
	.loc    1  482  is_stmt 1
        vpbroadcastd %xmm2, %ymm2                               #482.5
..LN1943:
	.loc    1  483  is_stmt 1
        lea       (%r11,%rax,8), %r11                           #483.34
..LN1944:
	.loc    1  482  is_stmt 1
        movq      112(%rsp), %rdi                               #482.5[spill]
..LN1945:
	.loc    1  483  is_stmt 1
        lea       (%r12,%rax,8), %r12                           #483.27
..LN1946:
	.loc    1  482  is_stmt 1
        subq      %rax, %rdi                                    #482.5
..LN1947:
	.loc    1  483  is_stmt 1
        lea       (%r15,%rax,8), %r15                           #483.20
..LN1948:
        lea       (%r14,%rax,8), %r14                           #483.13
..LN1949:
	.loc    1  482  is_stmt 1
        xorl      %eax, %eax                                    #482.5
        .align    16,0x90
..LN1950:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm1 ymm0 ymm14 zmm2 k1
..B1.243:                       # Preds ..B1.243 ..B1.242
                                # Execution count [1.02e+00]: Infreq
..LN1951:
	.loc    1  483  is_stmt 1
        vmovups   (%rax,%r14), %zmm3                            #483.13
..LN1952:
	.loc    1  482  is_stmt 1
        addq      $8, %rsi                                      #482.5
..LN1953:
	.loc    1  483  is_stmt 1
        vmovups   (%rax,%r12), %zmm4                            #483.27
..LN1954:
        vmovups   (%rax,%r10), %zmm7                            #483.41
..LN1955:
        vmovups   (%rax,%r9), %zmm8                             #483.55
..LN1956:
        vaddpd    (%rax,%r15), %zmm3, %zmm5                     #483.62
..LN1957:
        vaddpd    (%rax,%r11), %zmm4, %zmm6                     #483.62
..LN1958:
        vaddpd    (%rax,%r8), %zmm7, %zmm9                      #483.62
..LN1959:
        vaddpd    (%rax,%rdx), %zmm8, %zmm10                    #483.62
..LN1960:
        vaddpd    %zmm6, %zmm5, %zmm11                          #483.62
..LN1961:
        vaddpd    %zmm10, %zmm9, %zmm12                         #483.62
..LN1962:
        vaddpd    %zmm12, %zmm11, %zmm13                        #483.62
..LN1963:
	.loc    1  482  is_stmt 1
        vpcmpgtd  %zmm0, %zmm2, %k2{%k1}                        #482.5
..LN1964:
        vpaddd    %ymm14, %ymm0, %ymm0                          #482.5
..LN1965:
	.loc    1  483  is_stmt 1
        vmovupd   %zmm13, (%rax,%rcx){%k2}                      #483.6
..LN1966:
	.loc    1  482  is_stmt 1
        addq      $64, %rax                                     #482.5
..LN1967:
        cmpq      %rdi, %rsi                                    #482.5
..LN1968:
        jb        ..B1.243      # Prob 82%                      #482.5
..LN1969:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm1 ymm0 ymm14 zmm2 k1
..B1.244:                       # Preds ..B1.243
                                # Execution count [1.84e-01]: Infreq
..LN1970:
        movl      %r13d, %edi                                   #482.36
..LN1971:
                                # LOE ebx edi r13d xmm1
..B1.245:                       # Preds ..B1.244 ..B1.239 ..B1.232
                                # Execution count [2.04e-01]: Infreq
..LN1972:
	.loc    1  486  is_stmt 1
        movslq    %edi, %rdi                                    #486.8
..LN1973:
        movq      168(%rsp), %rdx                               #486.13[spill]
..LN1974:
        vcomisd   (%rdx,%rdi,8), %xmm1                          #486.13
..LN1975:
        jbe       ..B1.247      # Prob 78%                      #486.13
..LN1976:
                                # LOE ebx r13d xmm1
..B1.246:                       # Preds ..B1.245
                                # Execution count [4.49e-02]: Infreq
..LN1977:
        movl      $il0_peep_printf_format_2, %edi               #486.16
..LN1978:
        vzeroupper                                              #486.16
..LN1979:
        call      puts                                          #486.16
..LN1980:
                                # LOE ebx r13d
..B1.748:                       # Preds ..B1.246
                                # Execution count [4.49e-02]: Infreq
..LN1981:
        vxorpd    %xmm1, %xmm1, %xmm1                           #
..LN1982:
                                # LOE ebx r13d xmm1
..B1.247:                       # Preds ..B1.245 ..B1.748
                                # Execution count [2.04e-01]: Infreq
..LN1983:
	.loc    1  478  is_stmt 1
        incl      %ebx                                          #478.4
..LN1984:
        cmpl      184(%rsp), %ebx                               #478.4[spill]
..LN1985:
        jb        ..B1.232      # Prob 81%                      #478.4
..LN1986:
                                # LOE ebx r13d xmm1
..B1.248:                       # Preds ..B1.247
                                # Execution count [3.74e-02]: Infreq
..LN1987:
        movl      184(%rsp), %r14d                              #[spill]
..LN1988:
                                # LOE r13d r14d
..B1.249:                       # Preds ..B1.252 ..B1.248
                                # Execution count [4.08e-02]: Infreq
..LN1989:
	.loc    1  489  is_stmt 1
        vzeroupper                                              #489.4
..LN1990:
        lea       96(%rsp), %rdi                                #489.4
..LN1991:
        lea       40(%rsp), %rsi                                #489.4
..___tag_value_main.43:
..LN1992:
#       timing(double *, double *)
        call      timing                                        #489.4
..___tag_value_main.44:
..LN1993:
                                # LOE r13d r14d
..B1.250:                       # Preds ..B1.249
                                # Execution count [4.08e-02]: Infreq
..LN1994:
	.loc    1  475  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #475.11
..LN1995:
	.loc    1  490  is_stmt 1
        addl      %r14d, %r14d                                  #490.4
..LN1996:
	.loc    1  475  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #475.24
..LN1997:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #475.15
..LN1998:
        vcomisd   %xmm1, %xmm0                                  #475.24
..LN1999:
        jbe       ..B1.254      # Prob 18%                      #475.24
..LN2000:
                                # LOE r13d r14d
..B1.251:                       # Preds ..B1.250
                                # Execution count [3.34e-02]: Infreq
..LN2001:
	.loc    1  477  is_stmt 1
        lea       56(%rsp), %rdi                                #477.4
..LN2002:
        lea       40(%rsp), %rsi                                #477.4
..___tag_value_main.45:
..LN2003:
#       timing(double *, double *)
        call      timing                                        #477.4
..___tag_value_main.46:
..LN2004:
                                # LOE r13d r14d
..B1.252:                       # Preds ..B1.251
                                # Execution count [3.34e-02]: Infreq
..LN2005:
	.loc    1  478  is_stmt 1
        xorl      %ebx, %ebx                                    #478.4
..LN2006:
        testl     %r14d, %r14d                                  #478.19
..LN2007:
        jle       ..B1.249      # Prob 9%                       #478.19
..LN2008:
                                # LOE ebx r13d r14d
..B1.253:                       # Preds ..B1.252
                                # Execution count [3.01e-02]: Infreq
..LN2009:
        .byte     102                                           #
..LN2010:
        .byte     144                                           #
..LN2011:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN2012:
        vxorpd    %xmm1, %xmm1, %xmm1                           #
..LN2013:
        jmp       ..B1.232      # Prob 100%                     #
..LN2014:
                                # LOE ebx r13d xmm1
..B1.254:                       # Preds ..B1.250
                                # Execution count [7.34e-03]: Infreq
..LN2015:
        movq      16(%rsp), %rbx                                #[spill]
..LN2016:
        movl      (%rsp), %r12d                                 #[spill]
..LN2017:
        movq      8(%rsp), %r15                                 #[spill]
..LN2018:
                                # LOE rbx r15 r12d r13d r14d
..B1.255:                       # Preds ..B1.254 ..B1.229
                                # Execution count [8.16e-03]: Infreq
..LN2019:
	.loc    1  493  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #493.3
..___tag_value_main.47:
..LN2020:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #493.3
..___tag_value_main.48:
..LN2021:
                                # LOE rbx r15 r12d r13d r14d
..B1.256:                       # Preds ..B1.255
                                # Execution count [8.16e-03]: Infreq
..LN2022:
	.loc    1  495  is_stmt 1
        movl      %r14d, %edx                                   #495.3
..LN2023:
        shrl      $31, %edx                                     #495.3
..LN2024:
        addl      %edx, %r14d                                   #495.3
..LN2025:
        sarl      $1, %r14d                                     #495.3
..___tag_value_main.49:
..LN2026:
	.loc    1  498  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #498.3
..___tag_value_main.50:
..LN2027:
                                # LOE rbx r15 r12d r13d r14d
..B1.257:                       # Preds ..B1.256
                                # Execution count [8.16e-03]: Infreq
..LN2028:
	.loc    1  500  is_stmt 1
        movq      168(%rsp), %rdi                               #500.3[spill]
..LN2029:
#       _mm_free(void *)
        call      _mm_free                                      #500.3
..LN2030:
                                # LOE rbx r15 r12d r13d r14d
..B1.258:                       # Preds ..B1.257
                                # Execution count [8.16e-03]: Infreq
..LN2031:
	.loc    1  501  is_stmt 1
        movq      152(%rsp), %rdi                               #501.3[spill]
..LN2032:
#       _mm_free(void *)
        call      _mm_free                                      #501.3
..LN2033:
                                # LOE rbx r15 r12d r13d r14d
..B1.259:                       # Preds ..B1.258
                                # Execution count [8.16e-03]: Infreq
..LN2034:
	.loc    1  502  is_stmt 1
        movq      144(%rsp), %rdi                               #502.3[spill]
..LN2035:
#       _mm_free(void *)
        call      _mm_free                                      #502.3
..LN2036:
                                # LOE rbx r15 r12d r13d r14d
..B1.260:                       # Preds ..B1.259
                                # Execution count [8.16e-03]: Infreq
..LN2037:
	.loc    1  503  is_stmt 1
        movq      128(%rsp), %rdi                               #503.3[spill]
..LN2038:
#       _mm_free(void *)
        call      _mm_free                                      #503.3
..LN2039:
                                # LOE rbx r15 r12d r13d r14d
..B1.261:                       # Preds ..B1.260
                                # Execution count [8.16e-03]: Infreq
..LN2040:
	.loc    1  504  is_stmt 1
        movq      136(%rsp), %rdi                               #504.3[spill]
..LN2041:
#       _mm_free(void *)
        call      _mm_free                                      #504.3
..LN2042:
                                # LOE rbx r15 r12d r13d r14d
..B1.262:                       # Preds ..B1.261
                                # Execution count [8.16e-03]: Infreq
..LN2043:
	.loc    1  505  is_stmt 1
        movq      120(%rsp), %rdi                               #505.3[spill]
..LN2044:
#       _mm_free(void *)
        call      _mm_free                                      #505.3
..LN2045:
                                # LOE rbx r15 r12d r13d r14d
..B1.263:                       # Preds ..B1.262
                                # Execution count [8.16e-03]: Infreq
..LN2046:
	.loc    1  506  is_stmt 1
        movq      48(%rsp), %rdi                                #506.3[spill]
..LN2047:
#       _mm_free(void *)
        call      _mm_free                                      #506.3
..LN2048:
                                # LOE rbx r15 r12d r13d r14d
..B1.264:                       # Preds ..B1.263
                                # Execution count [8.16e-03]: Infreq
..LN2049:
	.loc    1  507  is_stmt 1
        movq      32(%rsp), %rdi                                #507.3[spill]
..LN2050:
#       _mm_free(void *)
        call      _mm_free                                      #507.3
..LN2051:
                                # LOE rbx r15 r12d r13d r14d
..B1.265:                       # Preds ..B1.264
                                # Execution count [8.16e-03]: Infreq
..LN2052:
	.loc    1  508  is_stmt 1
        movq      %rbx, %rdi                                    #508.3
..LN2053:
#       _mm_free(void *)
        call      _mm_free                                      #508.3
..LN2054:
        jmp       ..B1.18       # Prob 100%                     #508.3
..LN2055:
                                # LOE r15 r12d r13d r14d
..B1.266:                       # Preds ..B1.233
                                # Execution count [1.84e-02]: Infreq
..LN2056:
	.loc    1  482  is_stmt 1
        xorl      %edx, %edx                                    #482.5
..LN2057:
        jmp       ..B1.239      # Prob 100%                     #482.5
..LN2058:
                                # LOE edx ebx edi r13d xmm1
..B1.267:                       # Preds ..B1.214
                                # Execution count [7.34e-04]: Infreq
..LN2059:
	.loc    1  459  is_stmt 1
        xorl      %eax, %eax                                    #459.3
..LN2060:
        jmp       ..B1.224      # Prob 100%                     #459.3
..LN2061:
                                # LOE rbx r15 eax r12d r13d
..B1.268:                       # Preds ..B1.199
                                # Execution count [7.34e-04]: Infreq
..LN2062:
        xorl      %r10d, %r10d                                  #459.3
..LN2063:
        jmp       ..B1.209      # Prob 100%                     #459.3
..LN2064:
                                # LOE rbx r15 r10d r12d r13d
..B1.269:                       # Preds ..B1.14
                                # Execution count [8.16e-03]: Infreq
..LN2065:
	.loc    1  387  is_stmt 1
        movq      %rbx, %rdi                                    #387.16
..LN2066:
        movq      %r15, %rsi                                    #387.16
..LN2067:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #387.16
..LN2068:
                                # LOE rax rbx r15 r12d r13d
..B1.706:                       # Preds ..B1.269
                                # Execution count [8.16e-03]: Infreq
..LN2069:
        movq      %rax, 16(%rsp)                                #387.16[spill]
..LN2070:
                                # LOE rbx r15 r12d r13d
..B1.270:                       # Preds ..B1.706
                                # Execution count [8.16e-03]: Infreq
..LN2071:
	.loc    1  388  is_stmt 1
        movq      %rbx, %rdi                                    #388.16
..LN2072:
        movq      %r15, %rsi                                    #388.16
..LN2073:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #388.16
..LN2074:
                                # LOE rax rbx r15 r12d r13d
..B1.707:                       # Preds ..B1.270
                                # Execution count [8.16e-03]: Infreq
..LN2075:
        movq      %rax, 144(%rsp)                               #388.16[spill]
..LN2076:
                                # LOE rbx r15 r12d r13d
..B1.271:                       # Preds ..B1.707
                                # Execution count [8.16e-03]: Infreq
..LN2077:
	.loc    1  389  is_stmt 1
        movq      %rbx, %rdi                                    #389.16
..LN2078:
        movq      %r15, %rsi                                    #389.16
..LN2079:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #389.16
..LN2080:
                                # LOE rax rbx r15 r12d r13d
..B1.708:                       # Preds ..B1.271
                                # Execution count [8.16e-03]: Infreq
..LN2081:
        movq      %rax, 32(%rsp)                                #389.16[spill]
..LN2082:
                                # LOE rbx r15 r12d r13d
..B1.272:                       # Preds ..B1.708
                                # Execution count [8.16e-03]: Infreq
..LN2083:
	.loc    1  390  is_stmt 1
        movq      %rbx, %rdi                                    #390.16
..LN2084:
        movq      %r15, %rsi                                    #390.16
..LN2085:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #390.16
..LN2086:
                                # LOE rax rbx r15 r12d r13d
..B1.709:                       # Preds ..B1.272
                                # Execution count [8.16e-03]: Infreq
..LN2087:
        movq      %rax, 136(%rsp)                               #390.16[spill]
..LN2088:
                                # LOE rbx r15 r12d r13d
..B1.273:                       # Preds ..B1.709
                                # Execution count [8.16e-03]: Infreq
..LN2089:
	.loc    1  391  is_stmt 1
        movq      %rbx, %rdi                                    #391.16
..LN2090:
        movq      %r15, %rsi                                    #391.16
..LN2091:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #391.16
..LN2092:
                                # LOE rax rbx r15 r12d r13d
..B1.710:                       # Preds ..B1.273
                                # Execution count [8.16e-03]: Infreq
..LN2093:
        movq      %rax, 120(%rsp)                               #391.16[spill]
..LN2094:
                                # LOE rbx r15 r12d r13d
..B1.274:                       # Preds ..B1.710
                                # Execution count [8.16e-03]: Infreq
..LN2095:
	.loc    1  392  is_stmt 1
        movq      %rbx, %rdi                                    #392.16
..LN2096:
        movq      %r15, %rsi                                    #392.16
..LN2097:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #392.16
..LN2098:
                                # LOE rax rbx r15 r12d r13d
..B1.711:                       # Preds ..B1.274
                                # Execution count [8.16e-03]: Infreq
..LN2099:
        movq      %rax, 128(%rsp)                               #392.16[spill]
..LN2100:
                                # LOE rbx r15 r12d r13d
..B1.275:                       # Preds ..B1.711
                                # Execution count [8.16e-03]: Infreq
..LN2101:
	.loc    1  393  is_stmt 1
        movq      %rbx, %rdi                                    #393.16
..LN2102:
        movq      %r15, %rsi                                    #393.16
..LN2103:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #393.16
..LN2104:
                                # LOE rax rbx r15 r12d r13d
..B1.712:                       # Preds ..B1.275
                                # Execution count [8.16e-03]: Infreq
..LN2105:
        movq      %rax, 24(%rsp)                                #393.16[spill]
..LN2106:
                                # LOE rbx r15 r12d r13d
..B1.276:                       # Preds ..B1.712
                                # Execution count [8.16e-03]: Infreq
..LN2107:
	.loc    1  394  is_stmt 1
        movq      %rbx, %rdi                                    #394.16
..LN2108:
        movq      %r15, %rsi                                    #394.16
..LN2109:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #394.16
..LN2110:
                                # LOE rax r15 r12d r13d
..B1.713:                       # Preds ..B1.276
                                # Execution count [8.16e-03]: Infreq
..LN2111:
        movq      %rax, 48(%rsp)                                #394.16[spill]
..LN2112:
                                # LOE rax r15 r12d r13d
..B1.277:                       # Preds ..B1.713
                                # Execution count [8.16e-03]: Infreq
..LN2113:
	.loc    1  395  is_stmt 1
        testl     %r13d, %r13d                                  #395.18
..LN2114:
        jle       ..B1.293      # Prob 50%                      #395.18
..LN2115:
                                # LOE rax r15 r12d r13d
..B1.278:                       # Preds ..B1.277
                                # Execution count [7.34e-03]: Infreq
..LN2116:
        movq      %rax, %rdx                                    #395.3
..LN2117:
        andq      $63, %rdx                                     #395.3
..LN2118:
        testl     %edx, %edx                                    #395.3
..LN2119:
        je        ..B1.281      # Prob 50%                      #395.3
..LN2120:
                                # LOE rax r15 edx r12d r13d
..B1.279:                       # Preds ..B1.278
                                # Execution count [7.34e-03]: Infreq
..LN2121:
        testb     $7, %dl                                       #395.3
..LN2122:
        jne       ..B1.331      # Prob 10%                      #395.3
..LN2123:
                                # LOE rax r15 edx r12d r13d
..B1.280:                       # Preds ..B1.279
                                # Execution count [0.00e+00]: Infreq
..LN2124:
        negl      %edx                                          #395.3
..LN2125:
        addl      $64, %edx                                     #395.3
..LN2126:
        shrl      $3, %edx                                      #395.3
..LN2127:
        cmpl      %edx, %r13d                                   #395.3
..LN2128:
        cmovl     %r13d, %edx                                   #395.3
..LN2129:
                                # LOE rax r15 edx r12d r13d
..B1.281:                       # Preds ..B1.280 ..B1.278
                                # Execution count [8.16e-03]: Infreq
..LN2130:
        movl      %r13d, %r8d                                   #395.3
..LN2131:
        subl      %edx, %r8d                                    #395.3
..LN2132:
        andl      $7, %r8d                                      #395.3
..LN2133:
        negl      %r8d                                          #395.3
..LN2134:
        addl      %r13d, %r8d                                   #395.3
..LN2135:
        cmpl      $1, %edx                                      #395.3
..LN2136:
        jb        ..B1.285      # Prob 50%                      #395.3
..LN2137:
                                # LOE rax r15 edx r8d r12d r13d
..B1.282:                       # Preds ..B1.281
                                # Execution count [7.34e-03]: Infreq
..LN2138:
        movq      %rax, %rsi                                    #395.3
..LN2139:
        movl      $8, %ebx                                      #395.3
..LN2140:
        vmovd     %edx, %xmm0                                   #395.3
..LN2141:
        vpbroadcastd %xmm0, %ymm0                               #395.3
..LN2142:
        movl      $255, %eax                                    #395.3
..LN2143:
        movq      %r15, 8(%rsp)                                 #395.3[spill]
..LN2144:
        movl      %r13d, 192(%rsp)                              #395.3[spill]
..LN2145:
        vmovd     %ebx, %xmm6                                   #395.3
..LN2146:
        xorl      %ebx, %ebx                                    #395.3
..LN2147:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #395.3
..LN2148:
	.loc    1  396  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #396.11
..LN2149:
	.loc    1  397  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #397.11
..LN2150:
	.loc    1  398  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #398.11
..LN2151:
	.loc    1  399  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #399.11
..LN2152:
	.loc    1  395  is_stmt 1
        kmovw     %eax, %k1                                     #395.3
..LN2153:
        vpbroadcastd %xmm6, %ymm6                               #395.3
..LN2154:
        xorl      %eax, %eax                                    #395.3
..LN2155:
        movslq    %edx, %rdi                                    #395.3
..LN2156:
        movq      24(%rsp), %r9                                 #395.3[spill]
..LN2157:
        movq      128(%rsp), %r10                               #395.3[spill]
..LN2158:
        movq      120(%rsp), %r11                               #395.3[spill]
..LN2159:
        movq      136(%rsp), %r13                               #395.3[spill]
..LN2160:
        movq      32(%rsp), %r14                                #395.3[spill]
..LN2161:
        movq      144(%rsp), %r15                               #395.3[spill]
..LN2162:
        movq      16(%rsp), %rcx                                #395.3[spill]
        .align    16,0x90
..LN2163:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.283:                       # Preds ..B1.283 ..B1.282
                                # Execution count [4.08e-02]: Infreq
..LN2164:
        addq      $8, %rbx                                      #395.3
..LN2165:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #395.3
..LN2166:
        vpaddd    %ymm6, %ymm5, %ymm5                           #395.3
..LN2167:
	.loc    1  396  is_stmt 1
        vmovupd   %zmm4, (%rax,%rcx){%k2}                       #396.4
..LN2168:
	.loc    1  397  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #397.4
..LN2169:
	.loc    1  398  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #398.4
..LN2170:
	.loc    1  399  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #399.4
..LN2171:
	.loc    1  400  is_stmt 1
        vmovupd   %zmm4, (%rax,%r11){%k2}                       #400.4
..LN2172:
	.loc    1  401  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #401.4
..LN2173:
	.loc    1  402  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #402.4
..LN2174:
	.loc    1  403  is_stmt 1
        vmovupd   %zmm1, (%rax,%rsi){%k2}                       #403.4
..LN2175:
	.loc    1  395  is_stmt 1
        addq      $64, %rax                                     #395.3
..LN2176:
        cmpq      %rdi, %rbx                                    #395.3
..LN2177:
        jb        ..B1.283      # Prob 81%                      #395.3
..LN2178:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.284:                       # Preds ..B1.283
                                # Execution count [7.34e-03]: Infreq
..LN2179:
        movl      192(%rsp), %r13d                              #[spill]
..LN2180:
        movq      8(%rsp), %r15                                 #[spill]
..LN2181:
        cmpl      %edx, %r13d                                   #395.3
..LN2182:
        je        ..B1.293      # Prob 10%                      #395.3
..LN2183:
                                # LOE r15 edx r8d r12d r13d
..B1.285:                       # Preds ..B1.281 ..B1.284
                                # Execution count [0.00e+00]: Infreq
..LN2184:
        lea       8(%rdx), %ebx                                 #395.3
..LN2185:
        cmpl      %ebx, %r8d                                    #395.3
..LN2186:
        jl        ..B1.289      # Prob 50%                      #395.3
..LN2187:
                                # LOE r15 edx r8d r12d r13d
..B1.286:                       # Preds ..B1.285
                                # Execution count [7.34e-03]: Infreq
..LN2188:
        movslq    %edx, %rdx                                    #395.3
..LN2189:
	.loc    1  396  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #396.11
..LN2190:
	.loc    1  397  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #397.11
..LN2191:
	.loc    1  398  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #398.11
..LN2192:
	.loc    1  399  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #399.11
..LN2193:
	.loc    1  395  is_stmt 1
        movslq    %r8d, %rax                                    #395.3
..LN2194:
        movq      48(%rsp), %rbx                                #395.3[spill]
..LN2195:
        movq      24(%rsp), %rdi                                #395.3[spill]
..LN2196:
        movq      128(%rsp), %r9                                #395.3[spill]
..LN2197:
        movq      120(%rsp), %r10                               #395.3[spill]
..LN2198:
        movq      136(%rsp), %r11                               #395.3[spill]
..LN2199:
        movq      32(%rsp), %rcx                                #395.3[spill]
..LN2200:
        movq      144(%rsp), %rsi                               #395.3[spill]
..LN2201:
        movq      16(%rsp), %r14                                #395.3[spill]
        .align    16,0x90
..LN2202:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.287:                       # Preds ..B1.287 ..B1.286
                                # Execution count [4.08e-02]: Infreq
..LN2203:
	.loc    1  396  is_stmt 1
        vmovupd   %zmm3, (%r14,%rdx,8)                          #396.4
..LN2204:
	.loc    1  397  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #397.4
..LN2205:
	.loc    1  398  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #398.4
..LN2206:
	.loc    1  399  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #399.4
..LN2207:
	.loc    1  400  is_stmt 1
        vmovupd   %zmm3, (%r10,%rdx,8)                          #400.4
..LN2208:
	.loc    1  401  is_stmt 1
        vmovupd   %zmm2, (%r9,%rdx,8)                           #401.4
..LN2209:
	.loc    1  402  is_stmt 1
        vmovupd   %zmm1, (%rdi,%rdx,8)                          #402.4
..LN2210:
	.loc    1  403  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%rdx,8)                          #403.4
..LN2211:
	.loc    1  395  is_stmt 1
        addq      $8, %rdx                                      #395.3
..LN2212:
        cmpq      %rax, %rdx                                    #395.3
..LN2213:
        jb        ..B1.287      # Prob 81%                      #395.3
..LN2214:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.289:                       # Preds ..B1.287 ..B1.285 ..B1.331
                                # Execution count [8.16e-03]: Infreq
..LN2215:
        lea       1(%r8), %edx                                  #395.3
..LN2216:
        cmpl      %r13d, %edx                                   #395.3
..LN2217:
        ja        ..B1.293      # Prob 50%                      #395.3
..LN2218:
                                # LOE r15 r8d r12d r13d
..B1.290:                       # Preds ..B1.289
                                # Execution count [7.34e-03]: Infreq
..LN2219:
        movl      $255, %eax                                    #395.3
..LN2220:
        movl      $8, %r11d                                     #395.3
..LN2221:
        kmovw     %eax, %k1                                     #395.3
..LN2222:
        xorl      %ecx, %ecx                                    #395.3
..LN2223:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #395.3
..LN2224:
	.loc    1  396  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #396.11
..LN2225:
	.loc    1  395  is_stmt 1
        vmovd     %r11d, %xmm6                                  #395.3
..LN2226:
	.loc    1  397  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #397.11
..LN2227:
	.loc    1  398  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #398.11
..LN2228:
	.loc    1  399  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #399.11
..LN2229:
	.loc    1  395  is_stmt 1
        movslq    %r8d, %rax                                    #395.3
..LN2230:
        negl      %r8d                                          #395.3
..LN2231:
        addl      %r13d, %r8d                                   #395.3
..LN2232:
	.loc    1  397  is_stmt 1
        movq      144(%rsp), %rsi                               #397.4[spill]
..LN2233:
	.loc    1  403  is_stmt 1
        movq      48(%rsp), %r10                                #403.4[spill]
..LN2234:
	.loc    1  402  is_stmt 1
        movq      24(%rsp), %r9                                 #402.4[spill]
..LN2235:
	.loc    1  400  is_stmt 1
        movq      120(%rsp), %rdi                               #400.4[spill]
..LN2236:
	.loc    1  397  is_stmt 1
        lea       (%rsi,%rax,8), %r14                           #397.4
..LN2237:
	.loc    1  399  is_stmt 1
        movq      136(%rsp), %rbx                               #399.4[spill]
..LN2238:
	.loc    1  395  is_stmt 1
        vmovd     %r8d, %xmm0                                   #395.3
..LN2239:
	.loc    1  401  is_stmt 1
        movq      128(%rsp), %r8                                #401.4[spill]
..LN2240:
	.loc    1  403  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #403.4
..LN2241:
	.loc    1  398  is_stmt 1
        movq      32(%rsp), %rdx                                #398.4[spill]
..LN2242:
	.loc    1  402  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #402.4
..LN2243:
	.loc    1  396  is_stmt 1
        movq      16(%rsp), %rsi                                #396.4[spill]
..LN2244:
	.loc    1  400  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #400.4
..LN2245:
	.loc    1  395  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #395.3
..LN2246:
	.loc    1  401  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #401.4
..LN2247:
	.loc    1  399  is_stmt 1
        lea       (%rbx,%rax,8), %rbx                           #399.4
..LN2248:
	.loc    1  395  is_stmt 1
        movq      112(%rsp), %r11                               #395.3[spill]
..LN2249:
	.loc    1  398  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #398.4
..LN2250:
	.loc    1  395  is_stmt 1
        subq      %rax, %r11                                    #395.3
..LN2251:
        vpbroadcastd %xmm6, %ymm6                               #395.3
..LN2252:
	.loc    1  396  is_stmt 1
        lea       (%rsi,%rax,8), %rsi                           #396.4
..LN2253:
	.loc    1  395  is_stmt 1
        xorl      %eax, %eax                                    #395.3
        .align    16,0x90
..LN2254:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.291:                       # Preds ..B1.291 ..B1.290
                                # Execution count [4.08e-02]: Infreq
..LN2255:
        addq      $8, %rcx                                      #395.3
..LN2256:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #395.3
..LN2257:
        vpaddd    %ymm6, %ymm5, %ymm5                           #395.3
..LN2258:
	.loc    1  396  is_stmt 1
        vmovupd   %zmm4, (%rax,%rsi){%k2}                       #396.4
..LN2259:
	.loc    1  397  is_stmt 1
        vmovupd   %zmm3, (%rax,%r14){%k2}                       #397.4
..LN2260:
	.loc    1  398  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #398.4
..LN2261:
	.loc    1  399  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #399.4
..LN2262:
	.loc    1  400  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #400.4
..LN2263:
	.loc    1  401  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #401.4
..LN2264:
	.loc    1  402  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #402.4
..LN2265:
	.loc    1  403  is_stmt 1
        vmovupd   %zmm1, (%rax,%r10){%k2}                       #403.4
..LN2266:
	.loc    1  395  is_stmt 1
        addq      $64, %rax                                     #395.3
..LN2267:
        cmpq      %r11, %rcx                                    #395.3
..LN2268:
        jb        ..B1.291      # Prob 81%                      #395.3
..LN2269:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.293:                       # Preds ..B1.291 ..B1.277 ..B1.284 ..B1.289
                                # Execution count [8.16e-03]: Infreq
..LN2270:
	.loc    1  408  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #408.3
..LN2271:
	.loc    1  406  is_stmt 1
        movl      $1, %r14d                                     #406.3
..LN2272:
	.loc    1  408  is_stmt 1
        vzeroupper                                              #408.3
..___tag_value_main.51:
..LN2273:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #408.3
..___tag_value_main.52:
..LN2274:
                                # LOE r15 r12d r13d r14d
..B1.294:                       # Preds ..B1.293
                                # Execution count [8.16e-03]: Infreq
..LN2275:
	.loc    1  410  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #410.11
..LN2276:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #410.24
..LN2277:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #410.15
..LN2278:
        vcomisd   %xmm1, %xmm0                                  #410.24
..LN2279:
        jbe       ..B1.320      # Prob 10%                      #410.24
..LN2280:
                                # LOE r15 r12d r13d r14d
..B1.295:                       # Preds ..B1.294
                                # Execution count [7.34e-03]: Infreq
..LN2281:
	.loc    1  417  is_stmt 1
        movl      $8, %edx                                      #417.5
..LN2282:
        movl      %r13d, %ebx                                   #417.5
..LN2283:
        andl      $-64, %ebx                                    #417.5
..LN2284:
	.loc    1  412  is_stmt 1
        lea       56(%rsp), %rdi                                #412.4
..LN2285:
	.loc    1  417  is_stmt 1
        movslq    %ebx, %rbx                                    #417.5
..LN2286:
	.loc    1  412  is_stmt 1
        lea       40(%rsp), %rsi                                #412.4
..LN2287:
	.loc    1  417  is_stmt 1
        movq      %rbx, 120(%rsi)                               #417.5[spill]
..LN2288:
        vmovd     %edx, %xmm0                                   #417.5
..LN2289:
        vpbroadcastd %xmm0, %ymm1                               #417.5
..LN2290:
        vmovdqu   %ymm1, 24(%rsi)                               #417.5[spill]
..LN2291:
	.loc    1  412  is_stmt 1
        vzeroupper                                              #412.4
..___tag_value_main.53:
..LN2292:
#       timing(double *, double *)
        call      timing                                        #412.4
..___tag_value_main.54:
..LN2293:
                                # LOE r15 ebx r12d r13d r14d
..B1.296:                       # Preds ..B1.295
                                # Execution count [6.61e-03]: Infreq
..LN2294:
	.loc    1  413  is_stmt 1
        xorl      %eax, %eax                                    #413.4
..LN2295:
        movl      %r12d, (%rsp)                                 #413.4[spill]
..LN2296:
        vxorpd    %xmm0, %xmm0, %xmm0                           #413.4
..LN2297:
        movl      %ebx, 152(%rsp)                               #413.4[spill]
..LN2298:
        movl      %eax, %ebx                                    #413.4
..LN2299:
        movl      %r14d, 184(%rsp)                              #413.4[spill]
..LN2300:
        movq      %r15, 8(%rsp)                                 #413.4[spill]
..LN2301:
        movq      16(%rsp), %r12                                #413.4[spill]
..LN2302:
                                # LOE r12 ebx r13d xmm0
..B1.297:                       # Preds ..B1.296 ..B1.312 ..B1.318
                                # Execution count [2.04e-01]: Infreq
..LN2303:
	.loc    1  417  is_stmt 1
        xorl      %edi, %edi                                    #417.9
..LN2304:
        testl     %r13d, %r13d                                  #417.20
..LN2305:
        jle       ..B1.310      # Prob 50%                      #417.20
..LN2306:
                                # LOE r12 ebx edi r13d xmm0
..B1.298:                       # Preds ..B1.297
                                # Execution count [1.84e-01]: Infreq
..LN2307:
        cmpl      $64, %r13d                                    #417.5
..LN2308:
        jl        ..B1.330      # Prob 10%                      #417.5
..LN2309:
                                # LOE r12 ebx edi r13d xmm0
..B1.299:                       # Preds ..B1.298
                                # Execution count [1.84e-01]: Infreq
..LN2310:
        movl      152(%rsp), %edx                               #417.5[spill]
..LN2311:
                                # LOE r12 edx ebx r13d xmm0
..B1.301:                       # Preds ..B1.299
                                # Execution count [1.84e-01]: Infreq
..LN2312:
        movq      160(%rsp), %rdi                               #417.5[spill]
..LN2313:
        xorl      %ecx, %ecx                                    #417.5
..LN2314:
        movq      48(%rsp), %r8                                 #417.5[spill]
..LN2315:
        movq      24(%rsp), %r9                                 #417.5[spill]
..LN2316:
        movq      128(%rsp), %r10                               #417.5[spill]
..LN2317:
        movq      120(%rsp), %r11                               #417.5[spill]
..LN2318:
        movq      136(%rsp), %r15                               #417.5[spill]
..LN2319:
        movq      32(%rsp), %rax                                #417.5[spill]
..LN2320:
        movq      144(%rsp), %rsi                               #417.5[spill]
..LN2321:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.302:                       # Preds ..B1.302 ..B1.301
                                # Execution count [1.02e+00]: Infreq
..LN2322:
	.loc    1  418  is_stmt 1
        vmovups   (%rsi,%rcx,8), %zmm1                          #418.13
..LN2323:
        vmovups   (%r15,%rcx,8), %zmm2                          #418.27
..LN2324:
        vmovups   (%r10,%rcx,8), %zmm5                          #418.41
..LN2325:
        vmovups   64(%r10,%rcx,8), %zmm13                       #418.41
..LN2326:
        vmovups   64(%rsi,%rcx,8), %zmm9                        #418.13
..LN2327:
        vmovups   64(%r15,%rcx,8), %zmm10                       #418.27
..LN2328:
        vaddpd    (%rax,%rcx,8), %zmm1, %zmm3                   #418.55
..LN2329:
        vaddpd    (%r11,%rcx,8), %zmm2, %zmm4                   #418.55
..LN2330:
        vaddpd    (%r9,%rcx,8), %zmm5, %zmm6                    #418.55
..LN2331:
        vaddpd    64(%r9,%rcx,8), %zmm13, %zmm14                #418.55
..LN2332:
        vaddpd    64(%rax,%rcx,8), %zmm9, %zmm11                #418.55
..LN2333:
        vaddpd    64(%r11,%rcx,8), %zmm10, %zmm12               #418.55
..LN2334:
        vaddpd    %zmm4, %zmm3, %zmm7                           #418.55
..LN2335:
        vaddpd    (%r8,%rcx,8), %zmm6, %zmm8                    #418.55
..LN2336:
        vaddpd    64(%r8,%rcx,8), %zmm14, %zmm16                #418.55
..LN2337:
        vaddpd    %zmm12, %zmm11, %zmm15                        #418.55
..LN2338:
        vaddpd    %zmm8, %zmm7, %zmm17                          #418.55
..LN2339:
        vaddpd    %zmm16, %zmm15, %zmm18                        #418.55
..LN2340:
        vmovntpd  %zmm17, (%r12,%rcx,8)                         #418.6
..LN2341:
        vmovntpd  %zmm18, 64(%r12,%rcx,8)                       #418.6
..LN2342:
        vmovups   128(%rsi,%rcx,8), %zmm19                      #418.13
..LN2343:
        vmovups   128(%r15,%rcx,8), %zmm20                      #418.27
..LN2344:
        vmovups   128(%r10,%rcx,8), %zmm23                      #418.41
..LN2345:
        vmovups   192(%r10,%rcx,8), %zmm31                      #418.41
..LN2346:
        vmovups   192(%rsi,%rcx,8), %zmm27                      #418.13
..LN2347:
        vmovups   192(%r15,%rcx,8), %zmm28                      #418.27
..LN2348:
        vaddpd    128(%rax,%rcx,8), %zmm19, %zmm21              #418.55
..LN2349:
        vaddpd    128(%r11,%rcx,8), %zmm20, %zmm22              #418.55
..LN2350:
        vaddpd    128(%r9,%rcx,8), %zmm23, %zmm24               #418.55
..LN2351:
        vaddpd    192(%r9,%rcx,8), %zmm31, %zmm31               #418.55
..LN2352:
        vaddpd    192(%rax,%rcx,8), %zmm27, %zmm29              #418.55
..LN2353:
        vaddpd    192(%r11,%rcx,8), %zmm28, %zmm30              #418.55
..LN2354:
        vaddpd    %zmm22, %zmm21, %zmm25                        #418.55
..LN2355:
        vaddpd    128(%r8,%rcx,8), %zmm24, %zmm26               #418.55
..LN2356:
        vaddpd    192(%r8,%rcx,8), %zmm31, %zmm28               #418.55
..LN2357:
        vaddpd    %zmm30, %zmm29, %zmm27                        #418.55
..LN2358:
        vaddpd    %zmm26, %zmm25, %zmm1                         #418.55
..LN2359:
        vaddpd    %zmm28, %zmm27, %zmm2                         #418.55
..LN2360:
        vmovntpd  %zmm1, 128(%r12,%rcx,8)                       #418.6
..LN2361:
        vmovntpd  %zmm2, 192(%r12,%rcx,8)                       #418.6
..LN2362:
        vmovups   256(%rsi,%rcx,8), %zmm3                       #418.13
..LN2363:
        vmovups   256(%r15,%rcx,8), %zmm4                       #418.27
..LN2364:
        vmovups   256(%r10,%rcx,8), %zmm7                       #418.41
..LN2365:
        vmovups   320(%r10,%rcx,8), %zmm15                      #418.41
..LN2366:
        vmovups   320(%rsi,%rcx,8), %zmm11                      #418.13
..LN2367:
        vmovups   320(%r15,%rcx,8), %zmm12                      #418.27
..LN2368:
        vaddpd    256(%rax,%rcx,8), %zmm3, %zmm5                #418.55
..LN2369:
        .byte     144                                           #418.55
..LN2370:
        vaddpd    256(%r11,%rcx,8), %zmm4, %zmm6                #418.55
..LN2371:
        vaddpd    256(%r9,%rcx,8), %zmm7, %zmm8                 #418.55
..LN2372:
        vaddpd    320(%r9,%rcx,8), %zmm15, %zmm16               #418.55
..LN2373:
        vaddpd    320(%rax,%rcx,8), %zmm11, %zmm13              #418.55
..LN2374:
        vaddpd    320(%r11,%rcx,8), %zmm12, %zmm14              #418.55
..LN2375:
        vaddpd    %zmm6, %zmm5, %zmm9                           #418.55
..LN2376:
        vaddpd    256(%r8,%rcx,8), %zmm8, %zmm10                #418.55
..LN2377:
        vaddpd    320(%r8,%rcx,8), %zmm16, %zmm18               #418.55
..LN2378:
        vaddpd    %zmm14, %zmm13, %zmm17                        #418.55
..LN2379:
        vaddpd    %zmm10, %zmm9, %zmm19                         #418.55
..LN2380:
        vaddpd    %zmm18, %zmm17, %zmm20                        #418.55
..LN2381:
        vmovntpd  %zmm19, 256(%r12,%rcx,8)                      #418.6
..LN2382:
        vmovntpd  %zmm20, 320(%r12,%rcx,8)                      #418.6
..LN2383:
        vmovups   384(%rsi,%rcx,8), %zmm21                      #418.13
..LN2384:
        vmovups   384(%r15,%rcx,8), %zmm22                      #418.27
..LN2385:
        vmovups   384(%r10,%rcx,8), %zmm25                      #418.41
..LN2386:
        vmovups   448(%r10,%rcx,8), %zmm3                       #418.41
..LN2387:
        vmovups   448(%rsi,%rcx,8), %zmm1                       #418.13
..LN2388:
        vmovups   448(%r15,%rcx,8), %zmm2                       #418.27
..LN2389:
        vaddpd    384(%rax,%rcx,8), %zmm21, %zmm23              #418.55
..LN2390:
        vaddpd    384(%r11,%rcx,8), %zmm22, %zmm24              #418.55
..LN2391:
        vaddpd    384(%r9,%rcx,8), %zmm25, %zmm26               #418.55
..LN2392:
        vaddpd    448(%r9,%rcx,8), %zmm3, %zmm4                 #418.55
..LN2393:
        vaddpd    448(%rax,%rcx,8), %zmm1, %zmm21               #418.55
..LN2394:
        vaddpd    448(%r11,%rcx,8), %zmm2, %zmm22               #418.55
..LN2395:
        vaddpd    %zmm24, %zmm23, %zmm29                        #418.55
..LN2396:
        vaddpd    384(%r8,%rcx,8), %zmm26, %zmm30               #418.55
..LN2397:
        vaddpd    448(%r8,%rcx,8), %zmm4, %zmm6                 #418.55
..LN2398:
        vaddpd    %zmm22, %zmm21, %zmm5                         #418.55
..LN2399:
        vaddpd    %zmm30, %zmm29, %zmm7                         #418.55
..LN2400:
        vaddpd    %zmm6, %zmm5, %zmm8                           #418.55
..LN2401:
        vmovntpd  %zmm7, 384(%r12,%rcx,8)                       #418.6
..LN2402:
        vmovntpd  %zmm8, 448(%r12,%rcx,8)                       #418.6
..LN2403:
	.loc    1  417  is_stmt 1
        addq      $64, %rcx                                     #417.5
..LN2404:
        cmpq      %rdi, %rcx                                    #417.5
..LN2405:
        jb        ..B1.302      # Prob 82%                      #417.5
..LN2406:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.303:                       # Preds ..B1.302
                                # Execution count [1.84e-01]: Infreq
..LN2407:
        movl      %edx, %edi                                    #417.36
..LN2408:
                                # LOE r12 edx ebx edi r13d xmm0
..B1.304:                       # Preds ..B1.303 ..B1.330
                                # Execution count [2.04e-01]: Infreq
..LN2409:
        lea       1(%rdx), %ecx                                 #417.5
..LN2410:
        cmpl      %r13d, %ecx                                   #417.5
..LN2411:
        ja        ..B1.310      # Prob 50%                      #417.5
..LN2412:
                                # LOE r12 edx ebx edi r13d xmm0
..B1.305:                       # Preds ..B1.304
                                # Execution count [1.84e-01]: Infreq
..LN2413:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #417.5
..LN2414:
                                # LOE r12 edx ebx r13d xmm0 ymm2
..B1.307:                       # Preds ..B1.305
                                # Execution count [1.84e-01]: Infreq
..LN2415:
        movl      $255, %eax                                    #417.5
..LN2416:
        xorl      %esi, %esi                                    #417.5
..LN2417:
        kmovw     %eax, %k1                                     #417.5
..LN2418:
        vmovdqu   64(%rsp), %ymm12                              #417.5[spill]
..LN2419:
        movslq    %edx, %rax                                    #417.5
..LN2420:
        negl      %edx                                          #417.5
..LN2421:
        addl      %r13d, %edx                                   #417.5
..LN2422:
	.loc    1  418  is_stmt 1
        movq      48(%rsp), %r8                                 #418.55[spill]
..LN2423:
        movq      24(%rsp), %rdi                                #418.48[spill]
..LN2424:
        movq      128(%rsp), %r9                                #418.41[spill]
..LN2425:
        movq      120(%rsp), %r10                               #418.34[spill]
..LN2426:
	.loc    1  417  is_stmt 1
        vmovd     %edx, %xmm1                                   #417.5
..LN2427:
	.loc    1  418  is_stmt 1
        movq      136(%rsp), %r11                               #418.27[spill]
..LN2428:
        lea       (%r12,%rax,8), %rdx                           #418.6
..LN2429:
        movq      32(%rsp), %r15                                #418.20[spill]
..LN2430:
        lea       (%r8,%rax,8), %r8                             #418.55
..LN2431:
        movq      144(%rsp), %r14                               #418.13[spill]
..LN2432:
        lea       (%rdi,%rax,8), %rdi                           #418.48
..LN2433:
	.loc    1  417  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #417.5
..LN2434:
	.loc    1  418  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #418.41
..LN2435:
	.loc    1  417  is_stmt 1
        movq      112(%rsp), %rcx                               #417.5[spill]
..LN2436:
	.loc    1  418  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #418.34
..LN2437:
	.loc    1  417  is_stmt 1
        subq      %rax, %rcx                                    #417.5
..LN2438:
	.loc    1  418  is_stmt 1
        lea       (%r11,%rax,8), %r11                           #418.27
..LN2439:
        lea       (%r15,%rax,8), %r15                           #418.20
..LN2440:
        lea       (%r14,%rax,8), %r14                           #418.13
..LN2441:
	.loc    1  417  is_stmt 1
        xorl      %eax, %eax                                    #417.5
        .align    16,0x90
..LN2442:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm12 zmm1 k1
..B1.308:                       # Preds ..B1.308 ..B1.307
                                # Execution count [1.02e+00]: Infreq
..LN2443:
	.loc    1  418  is_stmt 1
        vmovups   (%rax,%r14), %zmm3                            #418.13
..LN2444:
	.loc    1  417  is_stmt 1
        addq      $8, %rsi                                      #417.5
..LN2445:
	.loc    1  418  is_stmt 1
        vmovups   (%rax,%r11), %zmm4                            #418.27
..LN2446:
        vmovups   (%rax,%r9), %zmm7                             #418.41
..LN2447:
        vaddpd    (%rax,%r15), %zmm3, %zmm5                     #418.55
..LN2448:
        vaddpd    (%rax,%r10), %zmm4, %zmm6                     #418.55
..LN2449:
        vaddpd    (%rax,%rdi), %zmm7, %zmm8                     #418.55
..LN2450:
        vaddpd    %zmm6, %zmm5, %zmm9                           #418.55
..LN2451:
        vaddpd    (%rax,%r8), %zmm8, %zmm10                     #418.55
..LN2452:
        vaddpd    %zmm10, %zmm9, %zmm11                         #418.55
..LN2453:
	.loc    1  417  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #417.5
..LN2454:
        vpaddd    %ymm12, %ymm2, %ymm2                          #417.5
..LN2455:
	.loc    1  418  is_stmt 1
        vmovupd   %zmm11, (%rax,%rdx){%k2}                      #418.6
..LN2456:
	.loc    1  417  is_stmt 1
        addq      $64, %rax                                     #417.5
..LN2457:
        cmpq      %rcx, %rsi                                    #417.5
..LN2458:
        jb        ..B1.308      # Prob 82%                      #417.5
..LN2459:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm12 zmm1 k1
..B1.309:                       # Preds ..B1.308
                                # Execution count [1.84e-01]: Infreq
..LN2460:
        movl      %r13d, %edi                                   #417.36
..LN2461:
                                # LOE r12 ebx edi r13d xmm0
..B1.310:                       # Preds ..B1.309 ..B1.304 ..B1.297
                                # Execution count [2.04e-01]: Infreq
..LN2462:
	.loc    1  420  is_stmt 1
        movslq    %edi, %rdi                                    #420.8
..LN2463:
        vcomisd   (%r12,%rdi,8), %xmm0                          #420.13
..LN2464:
        jbe       ..B1.312      # Prob 78%                      #420.13
..LN2465:
                                # LOE r12 ebx r13d xmm0
..B1.311:                       # Preds ..B1.310
                                # Execution count [4.49e-02]: Infreq
..LN2466:
        movl      $il0_peep_printf_format_3, %edi               #420.16
..LN2467:
        vzeroupper                                              #420.16
..LN2468:
        call      puts                                          #420.16
..LN2469:
                                # LOE r12 ebx r13d
..B1.747:                       # Preds ..B1.311
                                # Execution count [4.49e-02]: Infreq
..LN2470:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2471:
                                # LOE r12 ebx r13d xmm0
..B1.312:                       # Preds ..B1.747 ..B1.310
                                # Execution count [2.04e-01]: Infreq
..LN2472:
	.loc    1  413  is_stmt 1
        incl      %ebx                                          #413.4
..LN2473:
        cmpl      184(%rsp), %ebx                               #413.4[spill]
..LN2474:
        jb        ..B1.297      # Prob 81%                      #413.4
..LN2475:
                                # LOE r12 ebx r13d xmm0
..B1.313:                       # Preds ..B1.312
                                # Execution count [3.74e-02]: Infreq
..LN2476:
        movl      184(%rsp), %r14d                              #[spill]
..LN2477:
                                # LOE r12 r13d r14d
..B1.314:                       # Preds ..B1.317 ..B1.313
                                # Execution count [4.08e-02]: Infreq
..LN2478:
	.loc    1  423  is_stmt 1
        vzeroupper                                              #423.4
..LN2479:
        lea       96(%rsp), %rdi                                #423.4
..LN2480:
        lea       40(%rsp), %rsi                                #423.4
..___tag_value_main.55:
..LN2481:
#       timing(double *, double *)
        call      timing                                        #423.4
..___tag_value_main.56:
..LN2482:
                                # LOE r12 r13d r14d
..B1.315:                       # Preds ..B1.314
                                # Execution count [4.08e-02]: Infreq
..LN2483:
	.loc    1  410  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #410.11
..LN2484:
	.loc    1  424  is_stmt 1
        addl      %r14d, %r14d                                  #424.4
..LN2485:
	.loc    1  410  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #410.24
..LN2486:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #410.15
..LN2487:
        vcomisd   %xmm1, %xmm0                                  #410.24
..LN2488:
        jbe       ..B1.319      # Prob 18%                      #410.24
..LN2489:
                                # LOE r12 r13d r14d
..B1.316:                       # Preds ..B1.315
                                # Execution count [3.34e-02]: Infreq
..LN2490:
	.loc    1  412  is_stmt 1
        lea       56(%rsp), %rdi                                #412.4
..LN2491:
        lea       40(%rsp), %rsi                                #412.4
..___tag_value_main.57:
..LN2492:
#       timing(double *, double *)
        call      timing                                        #412.4
..___tag_value_main.58:
..LN2493:
                                # LOE r12 r13d r14d
..B1.317:                       # Preds ..B1.316
                                # Execution count [3.34e-02]: Infreq
..LN2494:
	.loc    1  413  is_stmt 1
        xorl      %ebx, %ebx                                    #413.4
..LN2495:
        testl     %r14d, %r14d                                  #413.19
..LN2496:
        jle       ..B1.314      # Prob 9%                       #413.19
..LN2497:
                                # LOE r12 ebx r13d r14d
..B1.318:                       # Preds ..B1.317
                                # Execution count [3.01e-02]: Infreq
..LN2498:
        .byte     102                                           #
..LN2499:
        .byte     144                                           #
..LN2500:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN2501:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2502:
        jmp       ..B1.297      # Prob 100%                     #
..LN2503:
                                # LOE r12 ebx r13d xmm0
..B1.319:                       # Preds ..B1.315
                                # Execution count [7.34e-03]: Infreq
..LN2504:
        movl      (%rsp), %r12d                                 #[spill]
..LN2505:
        movq      8(%rsp), %r15                                 #[spill]
..LN2506:
                                # LOE r15 r12d r13d r14d
..B1.320:                       # Preds ..B1.319 ..B1.294
                                # Execution count [8.16e-03]: Infreq
..LN2507:
	.loc    1  427  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #427.3
..___tag_value_main.59:
..LN2508:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #427.3
..___tag_value_main.60:
..LN2509:
                                # LOE r15 r12d r13d r14d
..B1.321:                       # Preds ..B1.320
                                # Execution count [8.16e-03]: Infreq
..LN2510:
	.loc    1  429  is_stmt 1
        movl      %r14d, %edx                                   #429.3
..LN2511:
        shrl      $31, %edx                                     #429.3
..LN2512:
        addl      %edx, %r14d                                   #429.3
..LN2513:
        sarl      $1, %r14d                                     #429.3
..___tag_value_main.61:
..LN2514:
	.loc    1  432  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #432.3
..___tag_value_main.62:
..LN2515:
                                # LOE r15 r12d r13d r14d
..B1.322:                       # Preds ..B1.321
                                # Execution count [8.16e-03]: Infreq
..LN2516:
	.loc    1  434  is_stmt 1
        movq      16(%rsp), %rdi                                #434.3[spill]
..LN2517:
#       _mm_free(void *)
        call      _mm_free                                      #434.3
..LN2518:
                                # LOE r15 r12d r13d r14d
..B1.323:                       # Preds ..B1.322
                                # Execution count [8.16e-03]: Infreq
..LN2519:
	.loc    1  435  is_stmt 1
        movq      144(%rsp), %rdi                               #435.3[spill]
..LN2520:
#       _mm_free(void *)
        call      _mm_free                                      #435.3
..LN2521:
                                # LOE r15 r12d r13d r14d
..B1.324:                       # Preds ..B1.323
                                # Execution count [8.16e-03]: Infreq
..LN2522:
	.loc    1  436  is_stmt 1
        movq      32(%rsp), %rdi                                #436.3[spill]
..LN2523:
#       _mm_free(void *)
        call      _mm_free                                      #436.3
..LN2524:
                                # LOE r15 r12d r13d r14d
..B1.325:                       # Preds ..B1.324
                                # Execution count [8.16e-03]: Infreq
..LN2525:
	.loc    1  437  is_stmt 1
        movq      136(%rsp), %rdi                               #437.3[spill]
..LN2526:
#       _mm_free(void *)
        call      _mm_free                                      #437.3
..LN2527:
                                # LOE r15 r12d r13d r14d
..B1.326:                       # Preds ..B1.325
                                # Execution count [8.16e-03]: Infreq
..LN2528:
	.loc    1  438  is_stmt 1
        movq      120(%rsp), %rdi                               #438.3[spill]
..LN2529:
#       _mm_free(void *)
        call      _mm_free                                      #438.3
..LN2530:
                                # LOE r15 r12d r13d r14d
..B1.327:                       # Preds ..B1.326
                                # Execution count [8.16e-03]: Infreq
..LN2531:
	.loc    1  439  is_stmt 1
        movq      128(%rsp), %rdi                               #439.3[spill]
..LN2532:
#       _mm_free(void *)
        call      _mm_free                                      #439.3
..LN2533:
                                # LOE r15 r12d r13d r14d
..B1.328:                       # Preds ..B1.327
                                # Execution count [8.16e-03]: Infreq
..LN2534:
	.loc    1  440  is_stmt 1
        movq      24(%rsp), %rdi                                #440.3[spill]
..LN2535:
#       _mm_free(void *)
        call      _mm_free                                      #440.3
..LN2536:
                                # LOE r15 r12d r13d r14d
..B1.329:                       # Preds ..B1.328
                                # Execution count [8.16e-03]: Infreq
..LN2537:
	.loc    1  441  is_stmt 1
        movq      48(%rsp), %rdi                                #441.3[spill]
..LN2538:
#       _mm_free(void *)
        call      _mm_free                                      #441.3
..LN2539:
        jmp       ..B1.18       # Prob 100%                     #441.3
..LN2540:
                                # LOE r15 r12d r13d r14d
..B1.330:                       # Preds ..B1.298
                                # Execution count [1.84e-02]: Infreq
..LN2541:
	.loc    1  417  is_stmt 1
        xorl      %edx, %edx                                    #417.5
..LN2542:
        jmp       ..B1.304      # Prob 100%                     #417.5
..LN2543:
                                # LOE r12 edx ebx edi r13d xmm0
..B1.331:                       # Preds ..B1.279
                                # Execution count [7.34e-04]: Infreq
..LN2544:
	.loc    1  395  is_stmt 1
        xorl      %r8d, %r8d                                    #395.3
..LN2545:
        jmp       ..B1.289      # Prob 100%                     #395.3
..LN2546:
                                # LOE r15 r8d r12d r13d
..B1.332:                       # Preds ..B1.13
                                # Execution count [8.16e-03]: Infreq
..LN2547:
	.loc    1  327  is_stmt 1
        movq      %rbx, %rdi                                    #327.16
..LN2548:
        movq      %r15, %rsi                                    #327.16
..LN2549:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #327.16
..LN2550:
                                # LOE rax rbx r15 r12d r13d
..B1.714:                       # Preds ..B1.332
                                # Execution count [8.16e-03]: Infreq
..LN2551:
        movq      %rax, 24(%rsp)                                #327.16[spill]
..LN2552:
                                # LOE rbx r15 r12d r13d
..B1.333:                       # Preds ..B1.714
                                # Execution count [8.16e-03]: Infreq
..LN2553:
	.loc    1  328  is_stmt 1
        movq      %rbx, %rdi                                    #328.16
..LN2554:
        movq      %r15, %rsi                                    #328.16
..LN2555:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #328.16
..LN2556:
                                # LOE rax rbx r15 r12d r13d
..B1.715:                       # Preds ..B1.333
                                # Execution count [8.16e-03]: Infreq
..LN2557:
        movq      %rax, 120(%rsp)                               #328.16[spill]
..LN2558:
                                # LOE rbx r15 r12d r13d
..B1.334:                       # Preds ..B1.715
                                # Execution count [8.16e-03]: Infreq
..LN2559:
	.loc    1  329  is_stmt 1
        movq      %rbx, %rdi                                    #329.16
..LN2560:
        movq      %r15, %rsi                                    #329.16
..LN2561:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #329.16
..LN2562:
                                # LOE rax rbx r15 r12d r13d
..B1.716:                       # Preds ..B1.334
                                # Execution count [8.16e-03]: Infreq
..LN2563:
        movq      %rax, 16(%rsp)                                #329.16[spill]
..LN2564:
                                # LOE rbx r15 r12d r13d
..B1.335:                       # Preds ..B1.716
                                # Execution count [8.16e-03]: Infreq
..LN2565:
	.loc    1  330  is_stmt 1
        movq      %rbx, %rdi                                    #330.16
..LN2566:
        movq      %r15, %rsi                                    #330.16
..LN2567:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #330.16
..LN2568:
                                # LOE rax rbx r15 r12d r13d
..B1.717:                       # Preds ..B1.335
                                # Execution count [8.16e-03]: Infreq
..LN2569:
        movq      %rax, 32(%rsp)                                #330.16[spill]
..LN2570:
                                # LOE rbx r15 r12d r13d
..B1.336:                       # Preds ..B1.717
                                # Execution count [8.16e-03]: Infreq
..LN2571:
	.loc    1  331  is_stmt 1
        movq      %rbx, %rdi                                    #331.16
..LN2572:
        movq      %r15, %rsi                                    #331.16
..LN2573:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #331.16
..LN2574:
                                # LOE rax rbx r15 r12d r13d
..B1.718:                       # Preds ..B1.336
                                # Execution count [8.16e-03]: Infreq
..LN2575:
        movq      %rax, 128(%rsp)                               #331.16[spill]
..LN2576:
                                # LOE rbx r15 r12d r13d
..B1.337:                       # Preds ..B1.718
                                # Execution count [8.16e-03]: Infreq
..LN2577:
	.loc    1  332  is_stmt 1
        movq      %rbx, %rdi                                    #332.16
..LN2578:
        movq      %r15, %rsi                                    #332.16
..LN2579:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #332.16
..LN2580:
                                # LOE rax rbx r15 r12d r13d
..B1.719:                       # Preds ..B1.337
                                # Execution count [8.16e-03]: Infreq
..LN2581:
        movq      %rax, 48(%rsp)                                #332.16[spill]
..LN2582:
                                # LOE rbx r15 r12d r13d
..B1.338:                       # Preds ..B1.719
                                # Execution count [8.16e-03]: Infreq
..LN2583:
	.loc    1  333  is_stmt 1
        movq      %rbx, %rdi                                    #333.16
..LN2584:
        movq      %r15, %rsi                                    #333.16
..LN2585:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #333.16
..LN2586:
                                # LOE rax r15 r12d r13d
..B1.720:                       # Preds ..B1.338
                                # Execution count [8.16e-03]: Infreq
..LN2587:
        movq      %rax, %rbx                                    #333.16
..LN2588:
                                # LOE rbx r15 r12d r13d
..B1.339:                       # Preds ..B1.720
                                # Execution count [8.16e-03]: Infreq
..LN2589:
	.loc    1  335  is_stmt 1
        testl     %r13d, %r13d                                  #335.18
..LN2590:
        jle       ..B1.355      # Prob 50%                      #335.18
..LN2591:
                                # LOE rbx r15 r12d r13d
..B1.340:                       # Preds ..B1.339
                                # Execution count [7.34e-03]: Infreq
..LN2592:
        movq      %rbx, %rdx                                    #335.3
..LN2593:
        andq      $63, %rdx                                     #335.3
..LN2594:
        testl     %edx, %edx                                    #335.3
..LN2595:
        je        ..B1.343      # Prob 50%                      #335.3
..LN2596:
                                # LOE rbx r15 edx r12d r13d
..B1.341:                       # Preds ..B1.340
                                # Execution count [7.34e-03]: Infreq
..LN2597:
        testb     $7, %dl                                       #335.3
..LN2598:
        jne       ..B1.392      # Prob 10%                      #335.3
..LN2599:
                                # LOE rbx r15 edx r12d r13d
..B1.342:                       # Preds ..B1.341
                                # Execution count [0.00e+00]: Infreq
..LN2600:
        negl      %edx                                          #335.3
..LN2601:
        addl      $64, %edx                                     #335.3
..LN2602:
        shrl      $3, %edx                                      #335.3
..LN2603:
        cmpl      %edx, %r13d                                   #335.3
..LN2604:
        cmovl     %r13d, %edx                                   #335.3
..LN2605:
                                # LOE rbx r15 edx r12d r13d
..B1.343:                       # Preds ..B1.342 ..B1.340
                                # Execution count [8.16e-03]: Infreq
..LN2606:
        movl      %r13d, %r10d                                  #335.3
..LN2607:
        subl      %edx, %r10d                                   #335.3
..LN2608:
        andl      $7, %r10d                                     #335.3
..LN2609:
        negl      %r10d                                         #335.3
..LN2610:
        addl      %r13d, %r10d                                  #335.3
..LN2611:
        cmpl      $1, %edx                                      #335.3
..LN2612:
        jb        ..B1.347      # Prob 50%                      #335.3
..LN2613:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.344:                       # Preds ..B1.343
                                # Execution count [7.34e-03]: Infreq
..LN2614:
        movl      $8, %r8d                                      #335.3
..LN2615:
        vmovd     %edx, %xmm0                                   #335.3
..LN2616:
        vpbroadcastd %xmm0, %ymm0                               #335.3
..LN2617:
        movl      $255, %eax                                    #335.3
..LN2618:
        movl      %r13d, 192(%rsp)                              #335.3[spill]
..LN2619:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #335.3
..LN2620:
        vmovd     %r8d, %xmm6                                   #335.3
..LN2621:
	.loc    1  336  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #336.11
..LN2622:
	.loc    1  337  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #337.11
..LN2623:
	.loc    1  338  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #338.11
..LN2624:
	.loc    1  339  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #339.11
..LN2625:
	.loc    1  335  is_stmt 1
        kmovw     %eax, %k1                                     #335.3
..LN2626:
        xorl      %r8d, %r8d                                    #335.3
..LN2627:
        vpbroadcastd %xmm6, %ymm6                               #335.3
..LN2628:
        xorl      %eax, %eax                                    #335.3
..LN2629:
        movslq    %edx, %r9                                     #335.3
..LN2630:
        movq      48(%rsp), %r11                                #335.3[spill]
..LN2631:
        movq      128(%rsp), %r13                               #335.3[spill]
..LN2632:
        movq      32(%rsp), %r14                                #335.3[spill]
..LN2633:
        movq      16(%rsp), %rcx                                #335.3[spill]
..LN2634:
        movq      120(%rsp), %rsi                               #335.3[spill]
..LN2635:
        movq      24(%rsp), %rdi                                #335.3[spill]
        .align    16,0x90
..LN2636:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 edx r10d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.345:                       # Preds ..B1.345 ..B1.344
                                # Execution count [4.08e-02]: Infreq
..LN2637:
        addq      $8, %r8                                       #335.3
..LN2638:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #335.3
..LN2639:
        vpaddd    %ymm6, %ymm5, %ymm5                           #335.3
..LN2640:
	.loc    1  336  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #336.4
..LN2641:
	.loc    1  337  is_stmt 1
        vmovupd   %zmm3, (%rax,%rsi){%k2}                       #337.4
..LN2642:
	.loc    1  338  is_stmt 1
        vmovupd   %zmm2, (%rax,%rcx){%k2}                       #338.4
..LN2643:
	.loc    1  339  is_stmt 1
        vmovupd   %zmm1, (%rax,%r14){%k2}                       #339.4
..LN2644:
	.loc    1  340  is_stmt 1
        vmovupd   %zmm4, (%rax,%r13){%k2}                       #340.4
..LN2645:
	.loc    1  341  is_stmt 1
        vmovupd   %zmm3, (%rax,%r11){%k2}                       #341.4
..LN2646:
	.loc    1  342  is_stmt 1
        vmovupd   %zmm2, (%rax,%rbx){%k2}                       #342.4
..LN2647:
	.loc    1  335  is_stmt 1
        addq      $64, %rax                                     #335.3
..LN2648:
        cmpq      %r9, %r8                                      #335.3
..LN2649:
        jb        ..B1.345      # Prob 81%                      #335.3
..LN2650:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 edx r10d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.346:                       # Preds ..B1.345
                                # Execution count [7.34e-03]: Infreq
..LN2651:
        movl      192(%rsp), %r13d                              #[spill]
..LN2652:
        cmpl      %edx, %r13d                                   #335.3
..LN2653:
        je        ..B1.355      # Prob 10%                      #335.3
..LN2654:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.347:                       # Preds ..B1.343 ..B1.346
                                # Execution count [0.00e+00]: Infreq
..LN2655:
        lea       8(%rdx), %r8d                                 #335.3
..LN2656:
        cmpl      %r8d, %r10d                                   #335.3
..LN2657:
        jl        ..B1.351      # Prob 50%                      #335.3
..LN2658:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.348:                       # Preds ..B1.347
                                # Execution count [7.34e-03]: Infreq
..LN2659:
        movslq    %edx, %rdx                                    #335.3
..LN2660:
	.loc    1  336  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #336.11
..LN2661:
	.loc    1  337  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #337.11
..LN2662:
	.loc    1  338  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #338.11
..LN2663:
	.loc    1  339  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #339.11
..LN2664:
	.loc    1  335  is_stmt 1
        movslq    %r10d, %rax                                   #335.3
..LN2665:
        movq      48(%rsp), %r8                                 #335.3[spill]
..LN2666:
        movq      128(%rsp), %r9                                #335.3[spill]
..LN2667:
        movq      32(%rsp), %r11                                #335.3[spill]
..LN2668:
        movq      16(%rsp), %rcx                                #335.3[spill]
..LN2669:
        movq      120(%rsp), %rsi                               #335.3[spill]
..LN2670:
        movq      24(%rsp), %rdi                                #335.3[spill]
..LN2671:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r15 r10d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.349:                       # Preds ..B1.349 ..B1.348
                                # Execution count [4.08e-02]: Infreq
..LN2672:
	.loc    1  336  is_stmt 1
        vmovupd   %zmm3, (%rdi,%rdx,8)                          #336.4
..LN2673:
	.loc    1  337  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #337.4
..LN2674:
	.loc    1  338  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #338.4
..LN2675:
	.loc    1  339  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #339.4
..LN2676:
	.loc    1  340  is_stmt 1
        vmovupd   %zmm3, (%r9,%rdx,8)                           #340.4
..LN2677:
	.loc    1  341  is_stmt 1
        vmovupd   %zmm2, (%r8,%rdx,8)                           #341.4
..LN2678:
	.loc    1  342  is_stmt 1
        vmovntpd  %zmm1, (%rbx,%rdx,8)                          #342.4
..LN2679:
	.loc    1  335  is_stmt 1
        addq      $8, %rdx                                      #335.3
..LN2680:
        cmpq      %rax, %rdx                                    #335.3
..LN2681:
        jb        ..B1.349      # Prob 81%                      #335.3
..LN2682:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r15 r10d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.351:                       # Preds ..B1.349 ..B1.347 ..B1.392
                                # Execution count [8.16e-03]: Infreq
..LN2683:
        lea       1(%r10), %edx                                 #335.3
..LN2684:
        cmpl      %r13d, %edx                                   #335.3
..LN2685:
        ja        ..B1.355      # Prob 50%                      #335.3
..LN2686:
                                # LOE rbx r15 r10d r12d r13d
..B1.352:                       # Preds ..B1.351
                                # Execution count [7.34e-03]: Infreq
..LN2687:
        movl      $255, %eax                                    #335.3
..LN2688:
        movl      $8, %r11d                                     #335.3
..LN2689:
        kmovw     %eax, %k1                                     #335.3
..LN2690:
        xorl      %esi, %esi                                    #335.3
..LN2691:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #335.3
..LN2692:
	.loc    1  336  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #336.11
..LN2693:
	.loc    1  335  is_stmt 1
        vmovd     %r11d, %xmm6                                  #335.3
..LN2694:
	.loc    1  337  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #337.11
..LN2695:
	.loc    1  338  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #338.11
..LN2696:
	.loc    1  339  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #339.11
..LN2697:
	.loc    1  335  is_stmt 1
        movslq    %r10d, %rax                                   #335.3
..LN2698:
        negl      %r10d                                         #335.3
..LN2699:
        addl      %r13d, %r10d                                  #335.3
..LN2700:
	.loc    1  338  is_stmt 1
        movq      16(%rsp), %r8                                 #338.4[spill]
..LN2701:
	.loc    1  340  is_stmt 1
        movq      128(%rsp), %r9                                #340.4[spill]
..LN2702:
	.loc    1  339  is_stmt 1
        movq      32(%rsp), %rdx                                #339.4[spill]
..LN2703:
	.loc    1  342  is_stmt 1
        lea       (%rbx,%rax,8), %r11                           #342.4
..LN2704:
	.loc    1  336  is_stmt 1
        movq      24(%rsp), %rdi                                #336.4[spill]
..LN2705:
	.loc    1  338  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #338.4
..LN2706:
        movq      %r8, (%rsp)                                   #338.4[spill]
..LN2707:
	.loc    1  335  is_stmt 1
        vmovd     %r10d, %xmm0                                  #335.3
..LN2708:
	.loc    1  341  is_stmt 1
        movq      48(%rsp), %r10                                #341.4[spill]
..LN2709:
	.loc    1  340  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #340.4
..LN2710:
	.loc    1  337  is_stmt 1
        movq      120(%rsp), %r8                                #337.4[spill]
..LN2711:
	.loc    1  339  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #339.4
..LN2712:
	.loc    1  335  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #335.3
..LN2713:
	.loc    1  336  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #336.4
..LN2714:
	.loc    1  335  is_stmt 1
        movq      112(%rsp), %rcx                               #335.3[spill]
..LN2715:
	.loc    1  341  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #341.4
..LN2716:
	.loc    1  335  is_stmt 1
        movq      (%rsp), %r14                                  #335.3[spill]
..LN2717:
        subq      %rax, %rcx                                    #335.3
..LN2718:
        vpbroadcastd %xmm6, %ymm6                               #335.3
..LN2719:
	.loc    1  337  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #337.4
..LN2720:
	.loc    1  335  is_stmt 1
        xorl      %eax, %eax                                    #335.3
        .align    16,0x90
..LN2721:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.353:                       # Preds ..B1.353 ..B1.352
                                # Execution count [4.08e-02]: Infreq
..LN2722:
        addq      $8, %rsi                                      #335.3
..LN2723:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #335.3
..LN2724:
        vpaddd    %ymm6, %ymm5, %ymm5                           #335.3
..LN2725:
	.loc    1  336  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #336.4
..LN2726:
	.loc    1  337  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #337.4
..LN2727:
	.loc    1  338  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #338.4
..LN2728:
	.loc    1  339  is_stmt 1
        vmovupd   %zmm1, (%rax,%rdx){%k2}                       #339.4
..LN2729:
	.loc    1  340  is_stmt 1
        vmovupd   %zmm4, (%rax,%r9){%k2}                        #340.4
..LN2730:
	.loc    1  341  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #341.4
..LN2731:
	.loc    1  342  is_stmt 1
        vmovupd   %zmm2, (%rax,%r11){%k2}                       #342.4
..LN2732:
	.loc    1  335  is_stmt 1
        addq      $64, %rax                                     #335.3
..LN2733:
        cmpq      %rcx, %rsi                                    #335.3
..LN2734:
        jb        ..B1.353      # Prob 81%                      #335.3
..LN2735:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.355:                       # Preds ..B1.353 ..B1.339 ..B1.346 ..B1.351
                                # Execution count [8.16e-03]: Infreq
..LN2736:
	.loc    1  347  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #347.3
..LN2737:
	.loc    1  345  is_stmt 1
        movl      $1, %r14d                                     #345.3
..LN2738:
	.loc    1  347  is_stmt 1
        vzeroupper                                              #347.3
..___tag_value_main.63:
..LN2739:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #347.3
..___tag_value_main.64:
..LN2740:
                                # LOE rbx r15 r12d r13d r14d
..B1.356:                       # Preds ..B1.355
                                # Execution count [8.16e-03]: Infreq
..LN2741:
	.loc    1  349  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #349.11
..LN2742:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #349.24
..LN2743:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #349.15
..LN2744:
        vcomisd   %xmm1, %xmm0                                  #349.24
..LN2745:
        jbe       ..B1.382      # Prob 10%                      #349.24
..LN2746:
                                # LOE rbx r15 r12d r13d r14d
..B1.357:                       # Preds ..B1.356
                                # Execution count [7.34e-03]: Infreq
..LN2747:
	.loc    1  356  is_stmt 1
        movl      $8, %r8d                                      #356.5
..LN2748:
        movl      %r13d, %edx                                   #356.5
..LN2749:
        andl      $-64, %edx                                    #356.5
..LN2750:
	.loc    1  351  is_stmt 1
        lea       56(%rsp), %rdi                                #351.4
..LN2751:
	.loc    1  356  is_stmt 1
        movl      %edx, 96(%rdi)                                #356.5[spill]
..LN2752:
	.loc    1  351  is_stmt 1
        lea       40(%rsp), %rsi                                #351.4
..LN2753:
	.loc    1  356  is_stmt 1
        movslq    %edx, %rdx                                    #356.5
..LN2754:
        vmovd     %r8d, %xmm0                                   #356.5
..LN2755:
        vpbroadcastd %xmm0, %ymm1                               #356.5
..LN2756:
        vmovdqu   %ymm1, 24(%rsi)                               #356.5[spill]
..LN2757:
        movq      %rdx, 104(%rsi)                               #356.5[spill]
..LN2758:
	.loc    1  351  is_stmt 1
        vzeroupper                                              #351.4
..___tag_value_main.65:
..LN2759:
#       timing(double *, double *)
        call      timing                                        #351.4
..___tag_value_main.66:
..LN2760:
                                # LOE rbx r15 r12d r13d r14d
..B1.358:                       # Preds ..B1.357
                                # Execution count [6.61e-03]: Infreq
..LN2761:
	.loc    1  352  is_stmt 1
        xorl      %eax, %eax                                    #352.4
..LN2762:
        movl      %r12d, (%rsp)                                 #352.4[spill]
..LN2763:
        vxorpd    %xmm0, %xmm0, %xmm0                           #352.4
..LN2764:
        movq      %r15, 8(%rsp)                                 #352.4[spill]
..LN2765:
        movq      %rbx, 136(%rsp)                               #352.4[spill]
..LN2766:
        movl      %eax, %ebx                                    #352.4
..LN2767:
        movl      %r14d, 184(%rsp)                              #352.4[spill]
..LN2768:
        movq      16(%rsp), %r12                                #352.4[spill]
..LN2769:
        movq      24(%rsp), %r15                                #352.4[spill]
..LN2770:
                                # LOE r12 r15 ebx r13d xmm0
..B1.359:                       # Preds ..B1.358 ..B1.374 ..B1.380
                                # Execution count [2.04e-01]: Infreq
..LN2771:
	.loc    1  356  is_stmt 1
        xorl      %edi, %edi                                    #356.9
..LN2772:
        testl     %r13d, %r13d                                  #356.20
..LN2773:
        jle       ..B1.372      # Prob 50%                      #356.20
..LN2774:
                                # LOE r12 r15 ebx edi r13d xmm0
..B1.360:                       # Preds ..B1.359
                                # Execution count [1.84e-01]: Infreq
..LN2775:
        cmpl      $64, %r13d                                    #356.5
..LN2776:
        jl        ..B1.391      # Prob 10%                      #356.5
..LN2777:
                                # LOE r12 r15 ebx edi r13d xmm0
..B1.361:                       # Preds ..B1.360
                                # Execution count [1.84e-01]: Infreq
..LN2778:
        movl      152(%rsp), %edx                               #356.5[spill]
..LN2779:
                                # LOE r12 r15 edx ebx r13d xmm0
..B1.363:                       # Preds ..B1.361
                                # Execution count [1.84e-01]: Infreq
..LN2780:
        movq      144(%rsp), %rdi                               #356.5[spill]
..LN2781:
        xorl      %ecx, %ecx                                    #356.5
..LN2782:
        movq      136(%rsp), %r8                                #356.5[spill]
..LN2783:
        movq      48(%rsp), %r9                                 #356.5[spill]
..LN2784:
        movq      128(%rsp), %r10                               #356.5[spill]
..LN2785:
        movq      32(%rsp), %r11                                #356.5[spill]
..LN2786:
        movq      120(%rsp), %rax                               #356.5[spill]
..LN2787:
                                # LOE rax rcx rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.364:                       # Preds ..B1.364 ..B1.363
                                # Execution count [1.02e+00]: Infreq
..LN2788:
	.loc    1  357  is_stmt 1
        vmovups   (%rax,%rcx,8), %zmm1                          #357.13
..LN2789:
        vmovups   64(%rax,%rcx,8), %zmm2                        #357.13
..LN2790:
        vaddpd    (%r12,%rcx,8), %zmm1, %zmm3                   #357.20
..LN2791:
        vaddpd    64(%r12,%rcx,8), %zmm2, %zmm4                 #357.20
..LN2792:
        vaddpd    (%r11,%rcx,8), %zmm3, %zmm5                   #357.27
..LN2793:
        vaddpd    64(%r11,%rcx,8), %zmm4, %zmm6                 #357.27
..LN2794:
        vaddpd    (%r10,%rcx,8), %zmm5, %zmm7                   #357.34
..LN2795:
        vaddpd    64(%r10,%rcx,8), %zmm6, %zmm8                 #357.34
..LN2796:
        vaddpd    (%r9,%rcx,8), %zmm7, %zmm9                    #357.41
..LN2797:
        vaddpd    64(%r9,%rcx,8), %zmm8, %zmm10                 #357.41
..LN2798:
        vaddpd    (%r8,%rcx,8), %zmm9, %zmm11                   #357.48
..LN2799:
        vaddpd    64(%r8,%rcx,8), %zmm10, %zmm12                #357.48
..LN2800:
        vmovntpd  %zmm11, (%r15,%rcx,8)                         #357.6
..LN2801:
        vmovntpd  %zmm12, 64(%r15,%rcx,8)                       #357.6
..LN2802:
        vmovups   128(%rax,%rcx,8), %zmm13                      #357.13
..LN2803:
        vmovups   192(%rax,%rcx,8), %zmm14                      #357.13
..LN2804:
        vaddpd    128(%r12,%rcx,8), %zmm13, %zmm15              #357.20
..LN2805:
        vaddpd    192(%r12,%rcx,8), %zmm14, %zmm16              #357.20
..LN2806:
        vaddpd    128(%r11,%rcx,8), %zmm15, %zmm17              #357.27
..LN2807:
        vaddpd    192(%r11,%rcx,8), %zmm16, %zmm18              #357.27
..LN2808:
        vaddpd    128(%r10,%rcx,8), %zmm17, %zmm19              #357.34
..LN2809:
        vaddpd    192(%r10,%rcx,8), %zmm18, %zmm20              #357.34
..LN2810:
        vaddpd    128(%r9,%rcx,8), %zmm19, %zmm21               #357.41
..LN2811:
        vaddpd    192(%r9,%rcx,8), %zmm20, %zmm22               #357.41
..LN2812:
        vaddpd    128(%r8,%rcx,8), %zmm21, %zmm23               #357.48
..LN2813:
        vaddpd    192(%r8,%rcx,8), %zmm22, %zmm24               #357.48
..LN2814:
        vmovntpd  %zmm23, 128(%r15,%rcx,8)                      #357.6
..LN2815:
        vmovntpd  %zmm24, 192(%r15,%rcx,8)                      #357.6
..LN2816:
        vmovups   256(%rax,%rcx,8), %zmm25                      #357.13
..LN2817:
        vmovups   320(%rax,%rcx,8), %zmm26                      #357.13
..LN2818:
        vaddpd    256(%r12,%rcx,8), %zmm25, %zmm27              #357.20
..LN2819:
        vaddpd    320(%r12,%rcx,8), %zmm26, %zmm28              #357.20
..LN2820:
        vaddpd    256(%r11,%rcx,8), %zmm27, %zmm29              #357.27
..LN2821:
        vaddpd    320(%r11,%rcx,8), %zmm28, %zmm30              #357.27
..LN2822:
        vaddpd    256(%r10,%rcx,8), %zmm29, %zmm31              #357.34
..LN2823:
        vaddpd    320(%r10,%rcx,8), %zmm30, %zmm1               #357.34
..LN2824:
        vaddpd    256(%r9,%rcx,8), %zmm31, %zmm2                #357.41
..LN2825:
        vaddpd    320(%r9,%rcx,8), %zmm1, %zmm3                 #357.41
..LN2826:
        vaddpd    256(%r8,%rcx,8), %zmm2, %zmm4                 #357.48
..LN2827:
        vaddpd    320(%r8,%rcx,8), %zmm3, %zmm5                 #357.48
..LN2828:
        vmovntpd  %zmm4, 256(%r15,%rcx,8)                       #357.6
..LN2829:
        vmovntpd  %zmm5, 320(%r15,%rcx,8)                       #357.6
..LN2830:
        vmovups   384(%rax,%rcx,8), %zmm6                       #357.13
..LN2831:
        vmovups   448(%rax,%rcx,8), %zmm7                       #357.13
..LN2832:
        vaddpd    384(%r12,%rcx,8), %zmm6, %zmm8                #357.20
..LN2833:
        vaddpd    448(%r12,%rcx,8), %zmm7, %zmm9                #357.20
..LN2834:
        .byte     144                                           #357.27
..LN2835:
        vaddpd    384(%r11,%rcx,8), %zmm8, %zmm10               #357.27
..LN2836:
        vaddpd    448(%r11,%rcx,8), %zmm9, %zmm11               #357.27
..LN2837:
        vaddpd    384(%r10,%rcx,8), %zmm10, %zmm12              #357.34
..LN2838:
        vaddpd    448(%r10,%rcx,8), %zmm11, %zmm13              #357.34
..LN2839:
        vaddpd    384(%r9,%rcx,8), %zmm12, %zmm14               #357.41
..LN2840:
        vaddpd    448(%r9,%rcx,8), %zmm13, %zmm15               #357.41
..LN2841:
        vaddpd    384(%r8,%rcx,8), %zmm14, %zmm16               #357.48
..LN2842:
        vaddpd    448(%r8,%rcx,8), %zmm15, %zmm17               #357.48
..LN2843:
        vmovntpd  %zmm16, 384(%r15,%rcx,8)                      #357.6
..LN2844:
        vmovntpd  %zmm17, 448(%r15,%rcx,8)                      #357.6
..LN2845:
	.loc    1  356  is_stmt 1
        addq      $64, %rcx                                     #356.5
..LN2846:
        cmpq      %rdi, %rcx                                    #356.5
..LN2847:
        jb        ..B1.364      # Prob 82%                      #356.5
..LN2848:
                                # LOE rax rcx rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.365:                       # Preds ..B1.364
                                # Execution count [1.84e-01]: Infreq
..LN2849:
        movl      %edx, %edi                                    #356.36
..LN2850:
                                # LOE r12 r15 edx ebx edi r13d xmm0
..B1.366:                       # Preds ..B1.365 ..B1.391
                                # Execution count [2.04e-01]: Infreq
..LN2851:
        lea       1(%rdx), %ecx                                 #356.5
..LN2852:
        cmpl      %r13d, %ecx                                   #356.5
..LN2853:
        ja        ..B1.372      # Prob 50%                      #356.5
..LN2854:
                                # LOE r12 r15 edx ebx edi r13d xmm0
..B1.367:                       # Preds ..B1.366
                                # Execution count [1.84e-01]: Infreq
..LN2855:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #356.5
..LN2856:
                                # LOE r12 r15 edx ebx r13d xmm0 ymm2
..B1.369:                       # Preds ..B1.367
                                # Execution count [1.84e-01]: Infreq
..LN2857:
        movl      $255, %eax                                    #356.5
..LN2858:
        xorl      %esi, %esi                                    #356.5
..LN2859:
        kmovw     %eax, %k1                                     #356.5
..LN2860:
        vmovdqu   64(%rsp), %ymm9                               #356.5[spill]
..LN2861:
        movslq    %edx, %rax                                    #356.5
..LN2862:
        negl      %edx                                          #356.5
..LN2863:
        addl      %r13d, %edx                                   #356.5
..LN2864:
	.loc    1  357  is_stmt 1
        movq      136(%rsp), %rcx                               #357.48[spill]
..LN2865:
        movq      48(%rsp), %r8                                 #357.41[spill]
..LN2866:
        movq      128(%rsp), %r9                                #357.34[spill]
..LN2867:
        lea       (%r15,%rax,8), %rdi                           #357.6
..LN2868:
        movq      32(%rsp), %r10                                #357.27[spill]
..LN2869:
	.loc    1  356  is_stmt 1
        vmovd     %edx, %xmm1                                   #356.5
..LN2870:
	.loc    1  357  is_stmt 1
        movq      120(%rsp), %r14                               #357.13[spill]
..LN2871:
        lea       (%rcx,%rax,8), %rcx                           #357.48
..LN2872:
	.loc    1  356  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #356.5
..LN2873:
	.loc    1  357  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #357.41
..LN2874:
	.loc    1  356  is_stmt 1
        movq      112(%rsp), %rdx                               #356.5[spill]
..LN2875:
	.loc    1  357  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #357.34
..LN2876:
	.loc    1  356  is_stmt 1
        subq      %rax, %rdx                                    #356.5
..LN2877:
	.loc    1  357  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #357.27
..LN2878:
        lea       (%r12,%rax,8), %r11                           #357.20
..LN2879:
        lea       (%r14,%rax,8), %r14                           #357.13
..LN2880:
	.loc    1  356  is_stmt 1
        xorl      %eax, %eax                                    #356.5
        .align    16,0x90
..LN2881:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm9 zmm1 k1
..B1.370:                       # Preds ..B1.370 ..B1.369
                                # Execution count [1.02e+00]: Infreq
..LN2882:
	.loc    1  357  is_stmt 1
        vmovups   (%rax,%r14), %zmm3                            #357.13
..LN2883:
	.loc    1  356  is_stmt 1
        addq      $8, %rsi                                      #356.5
..LN2884:
	.loc    1  357  is_stmt 1
        vaddpd    (%rax,%r11), %zmm3, %zmm4                     #357.20
..LN2885:
        vaddpd    (%rax,%r10), %zmm4, %zmm5                     #357.27
..LN2886:
        vaddpd    (%rax,%r9), %zmm5, %zmm6                      #357.34
..LN2887:
        vaddpd    (%rax,%r8), %zmm6, %zmm7                      #357.41
..LN2888:
        vaddpd    (%rax,%rcx), %zmm7, %zmm8                     #357.48
..LN2889:
	.loc    1  356  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #356.5
..LN2890:
        vpaddd    %ymm9, %ymm2, %ymm2                           #356.5
..LN2891:
	.loc    1  357  is_stmt 1
        vmovupd   %zmm8, (%rax,%rdi){%k2}                       #357.6
..LN2892:
	.loc    1  356  is_stmt 1
        addq      $64, %rax                                     #356.5
..LN2893:
        cmpq      %rdx, %rsi                                    #356.5
..LN2894:
        jb        ..B1.370      # Prob 82%                      #356.5
..LN2895:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm9 zmm1 k1
..B1.371:                       # Preds ..B1.370
                                # Execution count [1.84e-01]: Infreq
..LN2896:
        movl      %r13d, %edi                                   #356.36
..LN2897:
                                # LOE r12 r15 ebx edi r13d xmm0
..B1.372:                       # Preds ..B1.371 ..B1.366 ..B1.359
                                # Execution count [2.04e-01]: Infreq
..LN2898:
	.loc    1  359  is_stmt 1
        movslq    %edi, %rdi                                    #359.8
..LN2899:
        vcomisd   (%r15,%rdi,8), %xmm0                          #359.13
..LN2900:
        jbe       ..B1.374      # Prob 78%                      #359.13
..LN2901:
                                # LOE r12 r15 ebx r13d xmm0
..B1.373:                       # Preds ..B1.372
                                # Execution count [4.49e-02]: Infreq
..LN2902:
        movl      $il0_peep_printf_format_4, %edi               #359.16
..LN2903:
        vzeroupper                                              #359.16
..LN2904:
        call      puts                                          #359.16
..LN2905:
                                # LOE r12 r15 ebx r13d
..B1.746:                       # Preds ..B1.373
                                # Execution count [4.49e-02]: Infreq
..LN2906:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2907:
                                # LOE r12 r15 ebx r13d xmm0
..B1.374:                       # Preds ..B1.372 ..B1.746
                                # Execution count [2.04e-01]: Infreq
..LN2908:
	.loc    1  352  is_stmt 1
        incl      %ebx                                          #352.4
..LN2909:
        cmpl      184(%rsp), %ebx                               #352.4[spill]
..LN2910:
        jb        ..B1.359      # Prob 81%                      #352.4
..LN2911:
                                # LOE r12 r15 ebx r13d xmm0
..B1.375:                       # Preds ..B1.374
                                # Execution count [3.74e-02]: Infreq
..LN2912:
        movl      184(%rsp), %r14d                              #[spill]
..LN2913:
                                # LOE r12 r15 r13d r14d
..B1.376:                       # Preds ..B1.379 ..B1.375
                                # Execution count [4.08e-02]: Infreq
..LN2914:
	.loc    1  362  is_stmt 1
        vzeroupper                                              #362.4
..LN2915:
        lea       96(%rsp), %rdi                                #362.4
..LN2916:
        lea       40(%rsp), %rsi                                #362.4
..___tag_value_main.67:
..LN2917:
#       timing(double *, double *)
        call      timing                                        #362.4
..___tag_value_main.68:
..LN2918:
                                # LOE r12 r15 r13d r14d
..B1.377:                       # Preds ..B1.376
                                # Execution count [4.08e-02]: Infreq
..LN2919:
	.loc    1  349  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #349.11
..LN2920:
	.loc    1  363  is_stmt 1
        addl      %r14d, %r14d                                  #363.4
..LN2921:
	.loc    1  349  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #349.24
..LN2922:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #349.15
..LN2923:
        vcomisd   %xmm1, %xmm0                                  #349.24
..LN2924:
        jbe       ..B1.381      # Prob 18%                      #349.24
..LN2925:
                                # LOE r12 r15 r13d r14d
..B1.378:                       # Preds ..B1.377
                                # Execution count [3.34e-02]: Infreq
..LN2926:
	.loc    1  351  is_stmt 1
        lea       56(%rsp), %rdi                                #351.4
..LN2927:
        lea       40(%rsp), %rsi                                #351.4
..___tag_value_main.69:
..LN2928:
#       timing(double *, double *)
        call      timing                                        #351.4
..___tag_value_main.70:
..LN2929:
                                # LOE r12 r15 r13d r14d
..B1.379:                       # Preds ..B1.378
                                # Execution count [3.34e-02]: Infreq
..LN2930:
	.loc    1  352  is_stmt 1
        xorl      %ebx, %ebx                                    #352.4
..LN2931:
        testl     %r14d, %r14d                                  #352.19
..LN2932:
        jle       ..B1.376      # Prob 9%                       #352.19
..LN2933:
                                # LOE r12 r15 ebx r13d r14d
..B1.380:                       # Preds ..B1.379
                                # Execution count [3.01e-02]: Infreq
..LN2934:
        .byte     102                                           #
..LN2935:
        .byte     144                                           #
..LN2936:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN2937:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2938:
        jmp       ..B1.359      # Prob 100%                     #
..LN2939:
                                # LOE r12 r15 ebx r13d xmm0
..B1.381:                       # Preds ..B1.377
                                # Execution count [7.34e-03]: Infreq
..LN2940:
        movq      136(%rsp), %rbx                               #[spill]
..LN2941:
        movl      (%rsp), %r12d                                 #[spill]
..LN2942:
        movq      8(%rsp), %r15                                 #[spill]
..LN2943:
                                # LOE rbx r15 r12d r13d r14d
..B1.382:                       # Preds ..B1.381 ..B1.356
                                # Execution count [8.16e-03]: Infreq
..LN2944:
	.loc    1  366  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #366.3
..___tag_value_main.71:
..LN2945:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #366.3
..___tag_value_main.72:
..LN2946:
                                # LOE rbx r15 r12d r13d r14d
..B1.383:                       # Preds ..B1.382
                                # Execution count [8.16e-03]: Infreq
..LN2947:
	.loc    1  368  is_stmt 1
        movl      %r14d, %edx                                   #368.3
..LN2948:
        shrl      $31, %edx                                     #368.3
..LN2949:
        addl      %edx, %r14d                                   #368.3
..LN2950:
        sarl      $1, %r14d                                     #368.3
..___tag_value_main.73:
..LN2951:
	.loc    1  371  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #371.3
..___tag_value_main.74:
..LN2952:
                                # LOE rbx r15 r12d r13d r14d
..B1.384:                       # Preds ..B1.383
                                # Execution count [8.16e-03]: Infreq
..LN2953:
	.loc    1  373  is_stmt 1
        movq      24(%rsp), %rdi                                #373.3[spill]
..LN2954:
#       _mm_free(void *)
        call      _mm_free                                      #373.3
..LN2955:
                                # LOE rbx r15 r12d r13d r14d
..B1.385:                       # Preds ..B1.384
                                # Execution count [8.16e-03]: Infreq
..LN2956:
	.loc    1  374  is_stmt 1
        movq      120(%rsp), %rdi                               #374.3[spill]
..LN2957:
#       _mm_free(void *)
        call      _mm_free                                      #374.3
..LN2958:
                                # LOE rbx r15 r12d r13d r14d
..B1.386:                       # Preds ..B1.385
                                # Execution count [8.16e-03]: Infreq
..LN2959:
	.loc    1  375  is_stmt 1
        movq      16(%rsp), %rdi                                #375.3[spill]
..LN2960:
#       _mm_free(void *)
        call      _mm_free                                      #375.3
..LN2961:
                                # LOE rbx r15 r12d r13d r14d
..B1.387:                       # Preds ..B1.386
                                # Execution count [8.16e-03]: Infreq
..LN2962:
	.loc    1  376  is_stmt 1
        movq      32(%rsp), %rdi                                #376.3[spill]
..LN2963:
#       _mm_free(void *)
        call      _mm_free                                      #376.3
..LN2964:
                                # LOE rbx r15 r12d r13d r14d
..B1.388:                       # Preds ..B1.387
                                # Execution count [8.16e-03]: Infreq
..LN2965:
	.loc    1  377  is_stmt 1
        movq      128(%rsp), %rdi                               #377.3[spill]
..LN2966:
#       _mm_free(void *)
        call      _mm_free                                      #377.3
..LN2967:
                                # LOE rbx r15 r12d r13d r14d
..B1.389:                       # Preds ..B1.388
                                # Execution count [8.16e-03]: Infreq
..LN2968:
	.loc    1  378  is_stmt 1
        movq      48(%rsp), %rdi                                #378.3[spill]
..LN2969:
#       _mm_free(void *)
        call      _mm_free                                      #378.3
..LN2970:
                                # LOE rbx r15 r12d r13d r14d
..B1.390:                       # Preds ..B1.389
                                # Execution count [8.16e-03]: Infreq
..LN2971:
	.loc    1  379  is_stmt 1
        movq      %rbx, %rdi                                    #379.3
..LN2972:
#       _mm_free(void *)
        call      _mm_free                                      #379.3
..LN2973:
        jmp       ..B1.18       # Prob 100%                     #379.3
..LN2974:
                                # LOE r15 r12d r13d r14d
..B1.391:                       # Preds ..B1.360
                                # Execution count [1.84e-02]: Infreq
..LN2975:
	.loc    1  356  is_stmt 1
        xorl      %edx, %edx                                    #356.5
..LN2976:
        jmp       ..B1.366      # Prob 100%                     #356.5
..LN2977:
                                # LOE r12 r15 edx ebx edi r13d xmm0
..B1.392:                       # Preds ..B1.341
                                # Execution count [7.34e-04]: Infreq
..LN2978:
	.loc    1  335  is_stmt 1
        xorl      %r10d, %r10d                                  #335.3
..LN2979:
        jmp       ..B1.351      # Prob 100%                     #335.3
..LN2980:
                                # LOE rbx r15 r10d r12d r13d
..B1.393:                       # Preds ..B1.12
                                # Execution count [8.16e-03]: Infreq
..LN2981:
	.loc    1  268  is_stmt 1
        movq      %rbx, %rdi                                    #268.16
..LN2982:
        movq      %r15, %rsi                                    #268.16
..LN2983:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #268.16
..LN2984:
                                # LOE rax rbx r15 r12d r13d
..B1.721:                       # Preds ..B1.393
                                # Execution count [8.16e-03]: Infreq
..LN2985:
        movq      %rax, 32(%rsp)                                #268.16[spill]
..LN2986:
                                # LOE rbx r15 r12d r13d
..B1.394:                       # Preds ..B1.721
                                # Execution count [8.16e-03]: Infreq
..LN2987:
	.loc    1  269  is_stmt 1
        movq      %rbx, %rdi                                    #269.16
..LN2988:
        movq      %r15, %rsi                                    #269.16
..LN2989:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #269.16
..LN2990:
                                # LOE rax rbx r15 r12d r13d
..B1.722:                       # Preds ..B1.394
                                # Execution count [8.16e-03]: Infreq
..LN2991:
        movq      %rax, 24(%rsp)                                #269.16[spill]
..LN2992:
                                # LOE rbx r15 r12d r13d
..B1.395:                       # Preds ..B1.722
                                # Execution count [8.16e-03]: Infreq
..LN2993:
	.loc    1  270  is_stmt 1
        movq      %rbx, %rdi                                    #270.16
..LN2994:
        movq      %r15, %rsi                                    #270.16
..LN2995:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #270.16
..LN2996:
                                # LOE rax rbx r15 r12d r13d
..B1.723:                       # Preds ..B1.395
                                # Execution count [8.16e-03]: Infreq
..LN2997:
        movq      %rax, 120(%rsp)                               #270.16[spill]
..LN2998:
                                # LOE rbx r15 r12d r13d
..B1.396:                       # Preds ..B1.723
                                # Execution count [8.16e-03]: Infreq
..LN2999:
	.loc    1  271  is_stmt 1
        movq      %rbx, %rdi                                    #271.16
..LN3000:
        movq      %r15, %rsi                                    #271.16
..LN3001:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #271.16
..LN3002:
                                # LOE rax rbx r15 r12d r13d
..B1.724:                       # Preds ..B1.396
                                # Execution count [8.16e-03]: Infreq
..LN3003:
        movq      %rax, 16(%rsp)                                #271.16[spill]
..LN3004:
                                # LOE rbx r15 r12d r13d
..B1.397:                       # Preds ..B1.724
                                # Execution count [8.16e-03]: Infreq
..LN3005:
	.loc    1  272  is_stmt 1
        movq      %rbx, %rdi                                    #272.16
..LN3006:
        movq      %r15, %rsi                                    #272.16
..LN3007:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #272.16
..LN3008:
                                # LOE rax rbx r15 r12d r13d
..B1.725:                       # Preds ..B1.397
                                # Execution count [8.16e-03]: Infreq
..LN3009:
        movq      %rax, 128(%rsp)                               #272.16[spill]
..LN3010:
                                # LOE rbx r15 r12d r13d
..B1.398:                       # Preds ..B1.725
                                # Execution count [8.16e-03]: Infreq
..LN3011:
	.loc    1  273  is_stmt 1
        movq      %rbx, %rdi                                    #273.16
..LN3012:
        movq      %r15, %rsi                                    #273.16
..LN3013:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #273.16
..LN3014:
                                # LOE rax r15 r12d r13d
..B1.726:                       # Preds ..B1.398
                                # Execution count [8.16e-03]: Infreq
..LN3015:
        movq      %rax, 136(%rsp)                               #273.16[spill]
..LN3016:
                                # LOE rax r15 r12d r13d
..B1.399:                       # Preds ..B1.726
                                # Execution count [8.16e-03]: Infreq
..LN3017:
	.loc    1  275  is_stmt 1
        testl     %r13d, %r13d                                  #275.18
..LN3018:
        jle       ..B1.415      # Prob 50%                      #275.18
..LN3019:
                                # LOE rax r15 r12d r13d
..B1.400:                       # Preds ..B1.399
                                # Execution count [7.34e-03]: Infreq
..LN3020:
        andq      $63, %rax                                     #275.3
..LN3021:
        testl     %eax, %eax                                    #275.3
..LN3022:
        je        ..B1.403      # Prob 50%                      #275.3
..LN3023:
                                # LOE r15 eax r12d r13d
..B1.401:                       # Preds ..B1.400
                                # Execution count [7.34e-03]: Infreq
..LN3024:
        testb     $7, %al                                       #275.3
..LN3025:
        jne       ..B1.451      # Prob 10%                      #275.3
..LN3026:
                                # LOE r15 eax r12d r13d
..B1.402:                       # Preds ..B1.401
                                # Execution count [0.00e+00]: Infreq
..LN3027:
        negl      %eax                                          #275.3
..LN3028:
        addl      $64, %eax                                     #275.3
..LN3029:
        shrl      $3, %eax                                      #275.3
..LN3030:
        cmpl      %eax, %r13d                                   #275.3
..LN3031:
        cmovl     %r13d, %eax                                   #275.3
..LN3032:
                                # LOE r15 eax r12d r13d
..B1.403:                       # Preds ..B1.402 ..B1.400
                                # Execution count [8.16e-03]: Infreq
..LN3033:
        movl      %r13d, %edx                                   #275.3
..LN3034:
        subl      %eax, %edx                                    #275.3
..LN3035:
        andl      $7, %edx                                      #275.3
..LN3036:
        negl      %edx                                          #275.3
..LN3037:
        addl      %r13d, %edx                                   #275.3
..LN3038:
        cmpl      $1, %eax                                      #275.3
..LN3039:
        jb        ..B1.407      # Prob 50%                      #275.3
..LN3040:
                                # LOE r15 eax edx r12d r13d
..B1.404:                       # Preds ..B1.403
                                # Execution count [7.34e-03]: Infreq
..LN3041:
        movl      $8, %ebx                                      #275.3
..LN3042:
        vmovd     %eax, %xmm0                                   #275.3
..LN3043:
        vpbroadcastd %xmm0, %ymm0                               #275.3
..LN3044:
        movl      $255, %ecx                                    #275.3
..LN3045:
        xorl      %r8d, %r8d                                    #275.3
..LN3046:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #275.3
..LN3047:
        vmovd     %ebx, %xmm6                                   #275.3
..LN3048:
	.loc    1  276  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #276.11
..LN3049:
	.loc    1  277  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #277.11
..LN3050:
	.loc    1  278  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #278.11
..LN3051:
	.loc    1  279  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #279.11
..LN3052:
	.loc    1  275  is_stmt 1
        kmovw     %ecx, %k1                                     #275.3
..LN3053:
        vpbroadcastd %xmm6, %ymm6                               #275.3
..LN3054:
        xorl      %ebx, %ebx                                    #275.3
..LN3055:
        movslq    %eax, %rdi                                    #275.3
..LN3056:
        movq      136(%rsp), %r9                                #275.3[spill]
..LN3057:
        movq      128(%rsp), %r10                               #275.3[spill]
..LN3058:
        movq      16(%rsp), %r11                                #275.3[spill]
..LN3059:
        movq      120(%rsp), %rcx                               #275.3[spill]
..LN3060:
        movq      24(%rsp), %rsi                                #275.3[spill]
..LN3061:
        movq      32(%rsp), %r14                                #275.3[spill]
        .align    16,0x90
..LN3062:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.405:                       # Preds ..B1.405 ..B1.404
                                # Execution count [4.08e-02]: Infreq
..LN3063:
        addq      $8, %r8                                       #275.3
..LN3064:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #275.3
..LN3065:
        vpaddd    %ymm6, %ymm5, %ymm5                           #275.3
..LN3066:
	.loc    1  276  is_stmt 1
        vmovupd   %zmm4, (%rbx,%r14){%k2}                       #276.4
..LN3067:
	.loc    1  277  is_stmt 1
        vmovupd   %zmm3, (%rbx,%rsi){%k2}                       #277.4
..LN3068:
	.loc    1  278  is_stmt 1
        vmovupd   %zmm2, (%rbx,%rcx){%k2}                       #278.4
..LN3069:
	.loc    1  279  is_stmt 1
        vmovupd   %zmm1, (%rbx,%r11){%k2}                       #279.4
..LN3070:
	.loc    1  280  is_stmt 1
        vmovupd   %zmm4, (%rbx,%r10){%k2}                       #280.4
..LN3071:
	.loc    1  281  is_stmt 1
        vmovupd   %zmm3, (%rbx,%r9){%k2}                        #281.4
..LN3072:
	.loc    1  275  is_stmt 1
        addq      $64, %rbx                                     #275.3
..LN3073:
        cmpq      %rdi, %r8                                     #275.3
..LN3074:
        jb        ..B1.405      # Prob 81%                      #275.3
..LN3075:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.406:                       # Preds ..B1.405
                                # Execution count [7.34e-03]: Infreq
..LN3076:
        cmpl      %eax, %r13d                                   #275.3
..LN3077:
        je        ..B1.415      # Prob 10%                      #275.3
..LN3078:
                                # LOE r15 eax edx r12d r13d
..B1.407:                       # Preds ..B1.403 ..B1.406
                                # Execution count [0.00e+00]: Infreq
..LN3079:
        lea       8(%rax), %ebx                                 #275.3
..LN3080:
        cmpl      %ebx, %edx                                    #275.3
..LN3081:
        jl        ..B1.411      # Prob 50%                      #275.3
..LN3082:
                                # LOE r15 eax edx r12d r13d
..B1.408:                       # Preds ..B1.407
                                # Execution count [7.34e-03]: Infreq
..LN3083:
        movslq    %eax, %rax                                    #275.3
..LN3084:
	.loc    1  276  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #276.11
..LN3085:
	.loc    1  277  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #277.11
..LN3086:
	.loc    1  278  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #278.11
..LN3087:
	.loc    1  279  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #279.11
..LN3088:
	.loc    1  275  is_stmt 1
        movslq    %edx, %rbx                                    #275.3
..LN3089:
        movq      136(%rsp), %rdi                               #275.3[spill]
..LN3090:
        movq      128(%rsp), %r8                                #275.3[spill]
..LN3091:
        movq      16(%rsp), %r9                                 #275.3[spill]
..LN3092:
        movq      120(%rsp), %r10                               #275.3[spill]
..LN3093:
        movq      24(%rsp), %r11                                #275.3[spill]
..LN3094:
        movq      32(%rsp), %rcx                                #275.3[spill]
..LN3095:
                                # LOE rax rcx rbx rdi r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.409:                       # Preds ..B1.409 ..B1.408
                                # Execution count [4.08e-02]: Infreq
..LN3096:
	.loc    1  276  is_stmt 1
        vmovupd   %zmm3, (%rcx,%rax,8)                          #276.4
..LN3097:
	.loc    1  277  is_stmt 1
        vmovupd   %zmm2, (%r11,%rax,8)                          #277.4
..LN3098:
	.loc    1  278  is_stmt 1
        vmovupd   %zmm1, (%r10,%rax,8)                          #278.4
..LN3099:
	.loc    1  279  is_stmt 1
        vmovupd   %zmm0, (%r9,%rax,8)                           #279.4
..LN3100:
	.loc    1  280  is_stmt 1
        vmovupd   %zmm3, (%r8,%rax,8)                           #280.4
..LN3101:
	.loc    1  281  is_stmt 1
        vmovntpd  %zmm2, (%rdi,%rax,8)                          #281.4
..LN3102:
	.loc    1  275  is_stmt 1
        addq      $8, %rax                                      #275.3
..LN3103:
        cmpq      %rbx, %rax                                    #275.3
..LN3104:
        jb        ..B1.409      # Prob 81%                      #275.3
..LN3105:
                                # LOE rax rcx rbx rdi r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.411:                       # Preds ..B1.409 ..B1.407 ..B1.451
                                # Execution count [8.16e-03]: Infreq
..LN3106:
        lea       1(%rdx), %ebx                                 #275.3
..LN3107:
        cmpl      %r13d, %ebx                                   #275.3
..LN3108:
        ja        ..B1.415      # Prob 50%                      #275.3
..LN3109:
                                # LOE r15 edx r12d r13d
..B1.412:                       # Preds ..B1.411
                                # Execution count [7.34e-03]: Infreq
..LN3110:
        movslq    %edx, %r8                                     #275.3
..LN3111:
        negl      %edx                                          #275.3
..LN3112:
	.loc    1  278  is_stmt 1
        movq      120(%rsp), %r11                               #278.4[spill]
..LN3113:
	.loc    1  275  is_stmt 1
        movl      $255, %eax                                    #275.3
..LN3114:
        addl      %r13d, %edx                                   #275.3
..LN3115:
        movl      $8, %r9d                                      #275.3
..LN3116:
        kmovw     %eax, %k1                                     #275.3
..LN3117:
        xorl      %r10d, %r10d                                  #275.3
..LN3118:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #275.3
..LN3119:
	.loc    1  276  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #276.11
..LN3120:
	.loc    1  275  is_stmt 1
        vmovd     %edx, %xmm0                                   #275.3
..LN3121:
        vmovd     %r9d, %xmm6                                   #275.3
..LN3122:
	.loc    1  277  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #277.11
..LN3123:
	.loc    1  278  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #278.11
..LN3124:
	.loc    1  279  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #279.11
..LN3125:
	.loc    1  281  is_stmt 1
        movq      136(%rsp), %rdi                               #281.4[spill]
..LN3126:
	.loc    1  278  is_stmt 1
        lea       (%r11,%r8,8), %rax                            #278.4
..LN3127:
	.loc    1  277  is_stmt 1
        movq      24(%rsp), %r11                                #277.4[spill]
..LN3128:
	.loc    1  280  is_stmt 1
        movq      128(%rsp), %rbx                               #280.4[spill]
..LN3129:
	.loc    1  279  is_stmt 1
        movq      16(%rsp), %rdx                                #279.4[spill]
..LN3130:
	.loc    1  281  is_stmt 1
        lea       (%rdi,%r8,8), %rdi                            #281.4
..LN3131:
	.loc    1  275  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #275.3
..LN3132:
	.loc    1  277  is_stmt 1
        lea       (%r11,%r8,8), %rcx                            #277.4
..LN3133:
	.loc    1  276  is_stmt 1
        movq      32(%rsp), %r11                                #276.4[spill]
..LN3134:
	.loc    1  280  is_stmt 1
        lea       (%rbx,%r8,8), %rbx                            #280.4
..LN3135:
	.loc    1  275  is_stmt 1
        movq      112(%rsp), %r9                                #275.3[spill]
..LN3136:
	.loc    1  279  is_stmt 1
        lea       (%rdx,%r8,8), %rdx                            #279.4
..LN3137:
	.loc    1  275  is_stmt 1
        vpbroadcastd %xmm6, %ymm6                               #275.3
..LN3138:
        subq      %r8, %r9                                      #275.3
..LN3139:
	.loc    1  276  is_stmt 1
        lea       (%r11,%r8,8), %r11                            #276.4
..LN3140:
	.loc    1  275  is_stmt 1
        xorl      %r8d, %r8d                                    #275.3
        .align    16,0x90
..LN3141:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.413:                       # Preds ..B1.413 ..B1.412
                                # Execution count [4.08e-02]: Infreq
..LN3142:
        addq      $8, %r10                                      #275.3
..LN3143:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #275.3
..LN3144:
        vpaddd    %ymm6, %ymm5, %ymm5                           #275.3
..LN3145:
	.loc    1  276  is_stmt 1
        vmovupd   %zmm4, (%r8,%r11){%k2}                        #276.4
..LN3146:
	.loc    1  277  is_stmt 1
        vmovupd   %zmm3, (%r8,%rcx){%k2}                        #277.4
..LN3147:
	.loc    1  278  is_stmt 1
        vmovupd   %zmm2, (%r8,%rax){%k2}                        #278.4
..LN3148:
	.loc    1  279  is_stmt 1
        vmovupd   %zmm1, (%r8,%rdx){%k2}                        #279.4
..LN3149:
	.loc    1  280  is_stmt 1
        vmovupd   %zmm4, (%r8,%rbx){%k2}                        #280.4
..LN3150:
	.loc    1  281  is_stmt 1
        vmovupd   %zmm3, (%r8,%rdi){%k2}                        #281.4
..LN3151:
	.loc    1  275  is_stmt 1
        addq      $64, %r8                                      #275.3
..LN3152:
        cmpq      %r9, %r10                                     #275.3
..LN3153:
        jb        ..B1.413      # Prob 81%                      #275.3
..LN3154:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.415:                       # Preds ..B1.413 ..B1.399 ..B1.406 ..B1.411
                                # Execution count [8.16e-03]: Infreq
..LN3155:
	.loc    1  287  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #287.3
..LN3156:
	.loc    1  285  is_stmt 1
        movl      $1, %r14d                                     #285.3
..LN3157:
	.loc    1  287  is_stmt 1
        vzeroupper                                              #287.3
..___tag_value_main.75:
..LN3158:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #287.3
..___tag_value_main.76:
..LN3159:
                                # LOE r15 r12d r13d r14d
..B1.416:                       # Preds ..B1.415
                                # Execution count [8.16e-03]: Infreq
..LN3160:
	.loc    1  289  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #289.11
..LN3161:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #289.24
..LN3162:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #289.15
..LN3163:
        vcomisd   %xmm1, %xmm0                                  #289.24
..LN3164:
        jbe       ..B1.442      # Prob 10%                      #289.24
..LN3165:
                                # LOE r15 r12d r13d r14d
..B1.417:                       # Preds ..B1.416
                                # Execution count [7.34e-03]: Infreq
..LN3166:
	.loc    1  296  is_stmt 1
        movl      $8, %edx                                      #296.5
..LN3167:
        movl      %r13d, %ebx                                   #296.5
..LN3168:
        andl      $-64, %ebx                                    #296.5
..LN3169:
	.loc    1  291  is_stmt 1
        lea       56(%rsp), %rdi                                #291.4
..LN3170:
	.loc    1  296  is_stmt 1
        movslq    %ebx, %rbx                                    #296.5
..LN3171:
	.loc    1  291  is_stmt 1
        lea       40(%rsp), %rsi                                #291.4
..LN3172:
	.loc    1  296  is_stmt 1
        movq      %rbx, 104(%rsi)                               #296.5[spill]
..LN3173:
        vmovd     %edx, %xmm0                                   #296.5
..LN3174:
        vpbroadcastd %xmm0, %ymm1                               #296.5
..LN3175:
        vmovdqu   %ymm1, 24(%rsi)                               #296.5[spill]
..LN3176:
	.loc    1  291  is_stmt 1
        vzeroupper                                              #291.4
..___tag_value_main.77:
..LN3177:
#       timing(double *, double *)
        call      timing                                        #291.4
..___tag_value_main.78:
..LN3178:
                                # LOE r15 ebx r12d r13d r14d
..B1.418:                       # Preds ..B1.417
                                # Execution count [6.61e-03]: Infreq
..LN3179:
	.loc    1  292  is_stmt 1
        xorl      %eax, %eax                                    #292.4
..LN3180:
        movl      %ebx, 48(%rsp)                                #292.4[spill]
..LN3181:
        vxorpd    %xmm0, %xmm0, %xmm0                           #292.4
..LN3182:
        movl      %r12d, (%rsp)                                 #292.4[spill]
..LN3183:
        movq      %r15, 8(%rsp)                                 #292.4[spill]
..LN3184:
        movl      %r14d, 184(%rsp)                              #292.4[spill]
..LN3185:
        movl      %eax, %r14d                                   #292.4
..LN3186:
        movq      16(%rsp), %r12                                #292.4[spill]
..LN3187:
        movq      24(%rsp), %rbx                                #292.4[spill]
..LN3188:
        movq      32(%rsp), %r15                                #292.4[spill]
..LN3189:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.419:                       # Preds ..B1.418 ..B1.434 ..B1.440
                                # Execution count [2.04e-01]: Infreq
..LN3190:
	.loc    1  296  is_stmt 1
        xorl      %ecx, %ecx                                    #296.9
..LN3191:
        testl     %r13d, %r13d                                  #296.20
..LN3192:
        jle       ..B1.432      # Prob 50%                      #296.20
..LN3193:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.420:                       # Preds ..B1.419
                                # Execution count [1.84e-01]: Infreq
..LN3194:
        cmpl      $64, %r13d                                    #296.5
..LN3195:
        jl        ..B1.450      # Prob 10%                      #296.5
..LN3196:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.421:                       # Preds ..B1.420
                                # Execution count [1.84e-01]: Infreq
..LN3197:
        movl      48(%rsp), %eax                                #296.5[spill]
..LN3198:
                                # LOE rbx r12 r15 eax r13d r14d xmm0
..B1.423:                       # Preds ..B1.421
                                # Execution count [1.84e-01]: Infreq
..LN3199:
        movq      144(%rsp), %rcx                               #296.5[spill]
..LN3200:
        xorl      %edx, %edx                                    #296.5
..LN3201:
        movq      136(%rsp), %rdi                               #296.5[spill]
..LN3202:
        movq      128(%rsp), %r8                                #296.5[spill]
..LN3203:
        movq      120(%rsp), %r9                                #296.5[spill]
..LN3204:
                                # LOE rdx rcx rbx rdi r8 r9 r12 r15 eax r13d r14d xmm0
..B1.424:                       # Preds ..B1.424 ..B1.423
                                # Execution count [1.02e+00]: Infreq
..LN3205:
	.loc    1  297  is_stmt 1
        vmovups   (%rbx,%rdx,8), %zmm1                          #297.13
..LN3206:
        vmovups   64(%rbx,%rdx,8), %zmm2                        #297.13
..LN3207:
        vaddpd    (%r9,%rdx,8), %zmm1, %zmm3                    #297.20
..LN3208:
        vaddpd    64(%r9,%rdx,8), %zmm2, %zmm4                  #297.20
..LN3209:
        vaddpd    (%r12,%rdx,8), %zmm3, %zmm5                   #297.27
..LN3210:
        vaddpd    64(%r12,%rdx,8), %zmm4, %zmm6                 #297.27
..LN3211:
        vaddpd    (%r8,%rdx,8), %zmm5, %zmm7                    #297.34
..LN3212:
        vaddpd    64(%r8,%rdx,8), %zmm6, %zmm8                  #297.34
..LN3213:
        vaddpd    (%rdi,%rdx,8), %zmm7, %zmm9                   #297.41
..LN3214:
        vaddpd    64(%rdi,%rdx,8), %zmm8, %zmm10                #297.41
..LN3215:
        vmovntpd  %zmm9, (%r15,%rdx,8)                          #297.6
..LN3216:
        vmovntpd  %zmm10, 64(%r15,%rdx,8)                       #297.6
..LN3217:
        vmovups   128(%rbx,%rdx,8), %zmm11                      #297.13
..LN3218:
        vmovups   192(%rbx,%rdx,8), %zmm12                      #297.13
..LN3219:
        vaddpd    128(%r9,%rdx,8), %zmm11, %zmm13               #297.20
..LN3220:
        vaddpd    192(%r9,%rdx,8), %zmm12, %zmm14               #297.20
..LN3221:
        vaddpd    128(%r12,%rdx,8), %zmm13, %zmm15              #297.27
..LN3222:
        vaddpd    192(%r12,%rdx,8), %zmm14, %zmm16              #297.27
..LN3223:
        vaddpd    128(%r8,%rdx,8), %zmm15, %zmm17               #297.34
..LN3224:
        vaddpd    192(%r8,%rdx,8), %zmm16, %zmm18               #297.34
..LN3225:
        vaddpd    128(%rdi,%rdx,8), %zmm17, %zmm19              #297.41
..LN3226:
        vaddpd    192(%rdi,%rdx,8), %zmm18, %zmm20              #297.41
..LN3227:
        vmovntpd  %zmm19, 128(%r15,%rdx,8)                      #297.6
..LN3228:
        vmovntpd  %zmm20, 192(%r15,%rdx,8)                      #297.6
..LN3229:
        vmovups   256(%rbx,%rdx,8), %zmm21                      #297.13
..LN3230:
        vmovups   320(%rbx,%rdx,8), %zmm22                      #297.13
..LN3231:
        vaddpd    256(%r9,%rdx,8), %zmm21, %zmm23               #297.20
..LN3232:
        vaddpd    320(%r9,%rdx,8), %zmm22, %zmm24               #297.20
..LN3233:
        vaddpd    256(%r12,%rdx,8), %zmm23, %zmm25              #297.27
..LN3234:
        vaddpd    320(%r12,%rdx,8), %zmm24, %zmm26              #297.27
..LN3235:
        vaddpd    256(%r8,%rdx,8), %zmm25, %zmm27               #297.34
..LN3236:
        vaddpd    320(%r8,%rdx,8), %zmm26, %zmm28               #297.34
..LN3237:
        vaddpd    256(%rdi,%rdx,8), %zmm27, %zmm29              #297.41
..LN3238:
        vaddpd    320(%rdi,%rdx,8), %zmm28, %zmm30              #297.41
..LN3239:
        vmovntpd  %zmm29, 256(%r15,%rdx,8)                      #297.6
..LN3240:
        vmovntpd  %zmm30, 320(%r15,%rdx,8)                      #297.6
..LN3241:
        vmovups   384(%rbx,%rdx,8), %zmm31                      #297.13
..LN3242:
        vmovups   448(%rbx,%rdx,8), %zmm1                       #297.13
..LN3243:
        vaddpd    384(%r9,%rdx,8), %zmm31, %zmm2                #297.20
..LN3244:
        vaddpd    448(%r9,%rdx,8), %zmm1, %zmm3                 #297.20
..LN3245:
        vaddpd    384(%r12,%rdx,8), %zmm2, %zmm4                #297.27
..LN3246:
        vaddpd    448(%r12,%rdx,8), %zmm3, %zmm5                #297.27
..LN3247:
        vaddpd    384(%r8,%rdx,8), %zmm4, %zmm6                 #297.34
..LN3248:
        vaddpd    448(%r8,%rdx,8), %zmm5, %zmm7                 #297.34
..LN3249:
        .byte     144                                           #297.41
..LN3250:
        vaddpd    384(%rdi,%rdx,8), %zmm6, %zmm8                #297.41
..LN3251:
        vaddpd    448(%rdi,%rdx,8), %zmm7, %zmm9                #297.41
..LN3252:
        vmovntpd  %zmm8, 384(%r15,%rdx,8)                       #297.6
..LN3253:
        vmovntpd  %zmm9, 448(%r15,%rdx,8)                       #297.6
..LN3254:
	.loc    1  296  is_stmt 1
        addq      $64, %rdx                                     #296.5
..LN3255:
        cmpq      %rcx, %rdx                                    #296.5
..LN3256:
        jb        ..B1.424      # Prob 82%                      #296.5
..LN3257:
                                # LOE rdx rcx rbx rdi r8 r9 r12 r15 eax r13d r14d xmm0
..B1.425:                       # Preds ..B1.424
                                # Execution count [1.84e-01]: Infreq
..LN3258:
        movl      %eax, %ecx                                    #296.36
..LN3259:
                                # LOE rbx r12 r15 eax ecx r13d r14d xmm0
..B1.426:                       # Preds ..B1.425 ..B1.450
                                # Execution count [2.04e-01]: Infreq
..LN3260:
        lea       1(%rax), %edx                                 #296.5
..LN3261:
        cmpl      %r13d, %edx                                   #296.5
..LN3262:
        ja        ..B1.432      # Prob 50%                      #296.5
..LN3263:
                                # LOE rbx r12 r15 eax ecx r13d r14d xmm0
..B1.427:                       # Preds ..B1.426
                                # Execution count [1.84e-01]: Infreq
..LN3264:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #296.5
..LN3265:
                                # LOE rbx r12 r15 eax r13d r14d xmm0 ymm2
..B1.429:                       # Preds ..B1.427
                                # Execution count [1.84e-01]: Infreq
..LN3266:
        movl      $255, %edx                                    #296.5
..LN3267:
        xorl      %r11d, %r11d                                  #296.5
..LN3268:
        kmovw     %edx, %k1                                     #296.5
..LN3269:
        vmovdqu   64(%rsp), %ymm8                               #296.5[spill]
..LN3270:
        movslq    %eax, %rdx                                    #296.5
..LN3271:
        negl      %eax                                          #296.5
..LN3272:
        addl      %r13d, %eax                                   #296.5
..LN3273:
	.loc    1  297  is_stmt 1
        movq      136(%rsp), %rdi                               #297.41[spill]
..LN3274:
        movq      128(%rsp), %r8                                #297.34[spill]
..LN3275:
        movq      120(%rsp), %r10                               #297.20[spill]
..LN3276:
        lea       (%r12,%rdx,8), %r9                            #297.27
..LN3277:
	.loc    1  296  is_stmt 1
        vmovd     %eax, %xmm1                                   #296.5
..LN3278:
	.loc    1  297  is_stmt 1
        lea       (%r15,%rdx,8), %rax                           #297.6
..LN3279:
	.loc    1  296  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #296.5
..LN3280:
	.loc    1  297  is_stmt 1
        lea       (%rdi,%rdx,8), %rdi                           #297.41
..LN3281:
	.loc    1  296  is_stmt 1
        movq      112(%rsp), %rcx                               #296.5[spill]
..LN3282:
	.loc    1  297  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #297.34
..LN3283:
	.loc    1  296  is_stmt 1
        subq      %rdx, %rcx                                    #296.5
..LN3284:
	.loc    1  297  is_stmt 1
        lea       (%r10,%rdx,8), %r10                           #297.20
..LN3285:
        lea       (%rbx,%rdx,8), %rsi                           #297.13
..LN3286:
	.loc    1  296  is_stmt 1
        xorl      %edx, %edx                                    #296.5
        .align    16,0x90
..LN3287:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm8 zmm1 k1
..B1.430:                       # Preds ..B1.430 ..B1.429
                                # Execution count [1.02e+00]: Infreq
..LN3288:
	.loc    1  297  is_stmt 1
        vmovups   (%rdx,%rsi), %zmm3                            #297.13
..LN3289:
	.loc    1  296  is_stmt 1
        addq      $8, %r11                                      #296.5
..LN3290:
	.loc    1  297  is_stmt 1
        vaddpd    (%rdx,%r10), %zmm3, %zmm4                     #297.20
..LN3291:
        vaddpd    (%rdx,%r9), %zmm4, %zmm5                      #297.27
..LN3292:
        vaddpd    (%rdx,%r8), %zmm5, %zmm6                      #297.34
..LN3293:
        vaddpd    (%rdx,%rdi), %zmm6, %zmm7                     #297.41
..LN3294:
	.loc    1  296  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #296.5
..LN3295:
        vpaddd    %ymm8, %ymm2, %ymm2                           #296.5
..LN3296:
	.loc    1  297  is_stmt 1
        vmovupd   %zmm7, (%rdx,%rax){%k2}                       #297.6
..LN3297:
	.loc    1  296  is_stmt 1
        addq      $64, %rdx                                     #296.5
..LN3298:
        cmpq      %rcx, %r11                                    #296.5
..LN3299:
        jb        ..B1.430      # Prob 82%                      #296.5
..LN3300:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm8 zmm1 k1
..B1.431:                       # Preds ..B1.430
                                # Execution count [1.84e-01]: Infreq
..LN3301:
        movl      %r13d, %ecx                                   #296.36
..LN3302:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.432:                       # Preds ..B1.431 ..B1.426 ..B1.419
                                # Execution count [2.04e-01]: Infreq
..LN3303:
	.loc    1  299  is_stmt 1
        movslq    %ecx, %rcx                                    #299.8
..LN3304:
        vcomisd   (%r15,%rcx,8), %xmm0                          #299.13
..LN3305:
        jbe       ..B1.434      # Prob 78%                      #299.13
..LN3306:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.433:                       # Preds ..B1.432
                                # Execution count [4.49e-02]: Infreq
..LN3307:
        movl      $il0_peep_printf_format_5, %edi               #299.16
..LN3308:
        vzeroupper                                              #299.16
..LN3309:
        call      puts                                          #299.16
..LN3310:
                                # LOE rbx r12 r15 r13d r14d
..B1.745:                       # Preds ..B1.433
                                # Execution count [4.49e-02]: Infreq
..LN3311:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3312:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.434:                       # Preds ..B1.432 ..B1.745
                                # Execution count [2.04e-01]: Infreq
..LN3313:
	.loc    1  292  is_stmt 1
        incl      %r14d                                         #292.4
..LN3314:
        cmpl      184(%rsp), %r14d                              #292.4[spill]
..LN3315:
        jb        ..B1.419      # Prob 81%                      #292.4
..LN3316:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.435:                       # Preds ..B1.434
                                # Execution count [3.74e-02]: Infreq
..LN3317:
        movl      184(%rsp), %r14d                              #[spill]
..LN3318:
                                # LOE rbx r12 r15 r13d r14d
..B1.436:                       # Preds ..B1.439 ..B1.435
                                # Execution count [4.08e-02]: Infreq
..LN3319:
	.loc    1  302  is_stmt 1
        vzeroupper                                              #302.4
..LN3320:
        lea       96(%rsp), %rdi                                #302.4
..LN3321:
        lea       40(%rsp), %rsi                                #302.4
..___tag_value_main.79:
..LN3322:
#       timing(double *, double *)
        call      timing                                        #302.4
..___tag_value_main.80:
..LN3323:
                                # LOE rbx r12 r15 r13d r14d
..B1.437:                       # Preds ..B1.436
                                # Execution count [4.08e-02]: Infreq
..LN3324:
	.loc    1  289  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #289.11
..LN3325:
	.loc    1  303  is_stmt 1
        addl      %r14d, %r14d                                  #303.4
..LN3326:
	.loc    1  289  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #289.24
..LN3327:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #289.15
..LN3328:
        vcomisd   %xmm1, %xmm0                                  #289.24
..LN3329:
        jbe       ..B1.441      # Prob 18%                      #289.24
..LN3330:
                                # LOE rbx r12 r15 r13d r14d
..B1.438:                       # Preds ..B1.437
                                # Execution count [3.34e-02]: Infreq
..LN3331:
	.loc    1  291  is_stmt 1
        lea       56(%rsp), %rdi                                #291.4
..LN3332:
        lea       40(%rsp), %rsi                                #291.4
..___tag_value_main.81:
..LN3333:
#       timing(double *, double *)
        call      timing                                        #291.4
..___tag_value_main.82:
..LN3334:
                                # LOE rbx r12 r15 r13d r14d
..B1.439:                       # Preds ..B1.438
                                # Execution count [3.34e-02]: Infreq
..LN3335:
	.loc    1  292  is_stmt 1
        xorl      %eax, %eax                                    #292.4
..LN3336:
        testl     %r14d, %r14d                                  #292.19
..LN3337:
        jle       ..B1.436      # Prob 9%                       #292.19
..LN3338:
                                # LOE rbx r12 r15 eax r13d r14d
..B1.440:                       # Preds ..B1.439
                                # Execution count [3.01e-02]: Infreq
..LN3339:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN3340:
        movl      %eax, %r14d                                   #
..LN3341:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3342:
        jmp       ..B1.419      # Prob 100%                     #
..LN3343:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.441:                       # Preds ..B1.437
                                # Execution count [7.34e-03]: Infreq
..LN3344:
        movl      (%rsp), %r12d                                 #[spill]
..LN3345:
        movq      8(%rsp), %r15                                 #[spill]
..LN3346:
                                # LOE r15 r12d r13d r14d
..B1.442:                       # Preds ..B1.441 ..B1.416
                                # Execution count [8.16e-03]: Infreq
..LN3347:
	.loc    1  306  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #306.3
..___tag_value_main.83:
..LN3348:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #306.3
..___tag_value_main.84:
..LN3349:
                                # LOE r15 r12d r13d r14d
..B1.443:                       # Preds ..B1.442
                                # Execution count [8.16e-03]: Infreq
..LN3350:
	.loc    1  308  is_stmt 1
        movl      %r14d, %edx                                   #308.3
..LN3351:
        shrl      $31, %edx                                     #308.3
..LN3352:
        addl      %edx, %r14d                                   #308.3
..LN3353:
        sarl      $1, %r14d                                     #308.3
..___tag_value_main.85:
..LN3354:
	.loc    1  311  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #311.3
..___tag_value_main.86:
..LN3355:
                                # LOE r15 r12d r13d r14d
..B1.444:                       # Preds ..B1.443
                                # Execution count [8.16e-03]: Infreq
..LN3356:
	.loc    1  313  is_stmt 1
        movq      32(%rsp), %rdi                                #313.3[spill]
..LN3357:
#       _mm_free(void *)
        call      _mm_free                                      #313.3
..LN3358:
                                # LOE r15 r12d r13d r14d
..B1.445:                       # Preds ..B1.444
                                # Execution count [8.16e-03]: Infreq
..LN3359:
	.loc    1  314  is_stmt 1
        movq      24(%rsp), %rdi                                #314.3[spill]
..LN3360:
#       _mm_free(void *)
        call      _mm_free                                      #314.3
..LN3361:
                                # LOE r15 r12d r13d r14d
..B1.446:                       # Preds ..B1.445
                                # Execution count [8.16e-03]: Infreq
..LN3362:
	.loc    1  315  is_stmt 1
        movq      120(%rsp), %rdi                               #315.3[spill]
..LN3363:
#       _mm_free(void *)
        call      _mm_free                                      #315.3
..LN3364:
                                # LOE r15 r12d r13d r14d
..B1.447:                       # Preds ..B1.446
                                # Execution count [8.16e-03]: Infreq
..LN3365:
	.loc    1  316  is_stmt 1
        movq      16(%rsp), %rdi                                #316.3[spill]
..LN3366:
#       _mm_free(void *)
        call      _mm_free                                      #316.3
..LN3367:
                                # LOE r15 r12d r13d r14d
..B1.448:                       # Preds ..B1.447
                                # Execution count [8.16e-03]: Infreq
..LN3368:
	.loc    1  317  is_stmt 1
        movq      128(%rsp), %rdi                               #317.3[spill]
..LN3369:
#       _mm_free(void *)
        call      _mm_free                                      #317.3
..LN3370:
                                # LOE r15 r12d r13d r14d
..B1.449:                       # Preds ..B1.448
                                # Execution count [8.16e-03]: Infreq
..LN3371:
	.loc    1  318  is_stmt 1
        movq      136(%rsp), %rdi                               #318.3[spill]
..LN3372:
#       _mm_free(void *)
        call      _mm_free                                      #318.3
..LN3373:
        jmp       ..B1.18       # Prob 100%                     #318.3
..LN3374:
                                # LOE r15 r12d r13d r14d
..B1.450:                       # Preds ..B1.420
                                # Execution count [1.84e-02]: Infreq
..LN3375:
	.loc    1  296  is_stmt 1
        xorl      %eax, %eax                                    #296.5
..LN3376:
        jmp       ..B1.426      # Prob 100%                     #296.5
..LN3377:
                                # LOE rbx r12 r15 eax ecx r13d r14d xmm0
..B1.451:                       # Preds ..B1.401
                                # Execution count [7.34e-04]: Infreq
..LN3378:
	.loc    1  275  is_stmt 1
        xorl      %edx, %edx                                    #275.3
..LN3379:
        jmp       ..B1.411      # Prob 100%                     #275.3
..LN3380:
                                # LOE r15 edx r12d r13d
..B1.452:                       # Preds ..B1.11
                                # Execution count [8.16e-03]: Infreq
..LN3381:
	.loc    1  213  is_stmt 1
        movq      %rbx, %rdi                                    #213.16
..LN3382:
        movq      %r15, %rsi                                    #213.16
..LN3383:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #213.16
..LN3384:
                                # LOE rax rbx r15 r12d r13d
..B1.727:                       # Preds ..B1.452
                                # Execution count [8.16e-03]: Infreq
..LN3385:
        movq      %rax, 32(%rsp)                                #213.16[spill]
..LN3386:
                                # LOE rbx r15 r12d r13d
..B1.453:                       # Preds ..B1.727
                                # Execution count [8.16e-03]: Infreq
..LN3387:
	.loc    1  214  is_stmt 1
        movq      %rbx, %rdi                                    #214.16
..LN3388:
        movq      %r15, %rsi                                    #214.16
..LN3389:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #214.16
..LN3390:
                                # LOE rax rbx r15 r12d r13d
..B1.728:                       # Preds ..B1.453
                                # Execution count [8.16e-03]: Infreq
..LN3391:
        movq      %rax, 24(%rsp)                                #214.16[spill]
..LN3392:
                                # LOE rbx r15 r12d r13d
..B1.454:                       # Preds ..B1.728
                                # Execution count [8.16e-03]: Infreq
..LN3393:
	.loc    1  215  is_stmt 1
        movq      %rbx, %rdi                                    #215.16
..LN3394:
        movq      %r15, %rsi                                    #215.16
..LN3395:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #215.16
..LN3396:
                                # LOE rax rbx r15 r12d r13d
..B1.729:                       # Preds ..B1.454
                                # Execution count [8.16e-03]: Infreq
..LN3397:
        movq      %rax, 48(%rsp)                                #215.16[spill]
..LN3398:
                                # LOE rbx r15 r12d r13d
..B1.455:                       # Preds ..B1.729
                                # Execution count [8.16e-03]: Infreq
..LN3399:
	.loc    1  216  is_stmt 1
        movq      %rbx, %rdi                                    #216.16
..LN3400:
        movq      %r15, %rsi                                    #216.16
..LN3401:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #216.16
..LN3402:
                                # LOE rax rbx r15 r12d r13d
..B1.730:                       # Preds ..B1.455
                                # Execution count [8.16e-03]: Infreq
..LN3403:
        movq      %rax, 16(%rsp)                                #216.16[spill]
..LN3404:
                                # LOE rbx r15 r12d r13d
..B1.456:                       # Preds ..B1.730
                                # Execution count [8.16e-03]: Infreq
..LN3405:
	.loc    1  217  is_stmt 1
        movq      %rbx, %rdi                                    #217.16
..LN3406:
        movq      %r15, %rsi                                    #217.16
..LN3407:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #217.16
..LN3408:
                                # LOE rax r15 r12d r13d
..B1.731:                       # Preds ..B1.456
                                # Execution count [8.16e-03]: Infreq
..LN3409:
        movq      %rax, %rbx                                    #217.16
..LN3410:
                                # LOE rbx r15 r12d r13d
..B1.457:                       # Preds ..B1.731
                                # Execution count [8.16e-03]: Infreq
..LN3411:
	.loc    1  219  is_stmt 1
        testl     %r13d, %r13d                                  #219.18
..LN3412:
        jle       ..B1.473      # Prob 50%                      #219.18
..LN3413:
                                # LOE rbx r15 r12d r13d
..B1.458:                       # Preds ..B1.457
                                # Execution count [7.34e-03]: Infreq
..LN3414:
        movq      %rbx, %rax                                    #219.3
..LN3415:
        andq      $63, %rax                                     #219.3
..LN3416:
        testl     %eax, %eax                                    #219.3
..LN3417:
        je        ..B1.461      # Prob 50%                      #219.3
..LN3418:
                                # LOE rbx r15 eax r12d r13d
..B1.459:                       # Preds ..B1.458
                                # Execution count [7.34e-03]: Infreq
..LN3419:
        testb     $7, %al                                       #219.3
..LN3420:
        jne       ..B1.508      # Prob 10%                      #219.3
..LN3421:
                                # LOE rbx r15 eax r12d r13d
..B1.460:                       # Preds ..B1.459
                                # Execution count [0.00e+00]: Infreq
..LN3422:
        negl      %eax                                          #219.3
..LN3423:
        addl      $64, %eax                                     #219.3
..LN3424:
        shrl      $3, %eax                                      #219.3
..LN3425:
        cmpl      %eax, %r13d                                   #219.3
..LN3426:
        cmovl     %r13d, %eax                                   #219.3
..LN3427:
                                # LOE rbx r15 eax r12d r13d
..B1.461:                       # Preds ..B1.460 ..B1.458
                                # Execution count [8.16e-03]: Infreq
..LN3428:
        movl      %r13d, %edx                                   #219.3
..LN3429:
        subl      %eax, %edx                                    #219.3
..LN3430:
        andl      $7, %edx                                      #219.3
..LN3431:
        negl      %edx                                          #219.3
..LN3432:
        addl      %r13d, %edx                                   #219.3
..LN3433:
        cmpl      $1, %eax                                      #219.3
..LN3434:
        jb        ..B1.465      # Prob 50%                      #219.3
..LN3435:
                                # LOE rbx r15 eax edx r12d r13d
..B1.462:                       # Preds ..B1.461
                                # Execution count [7.34e-03]: Infreq
..LN3436:
        movl      $8, %r8d                                      #219.3
..LN3437:
        vmovd     %eax, %xmm0                                   #219.3
..LN3438:
        vpbroadcastd %xmm0, %ymm0                               #219.3
..LN3439:
        movl      $255, %ecx                                    #219.3
..LN3440:
        xorl      %r10d, %r10d                                  #219.3
..LN3441:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #219.3
..LN3442:
        vmovd     %r8d, %xmm6                                   #219.3
..LN3443:
	.loc    1  220  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #220.11
..LN3444:
	.loc    1  221  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #221.11
..LN3445:
	.loc    1  222  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #222.11
..LN3446:
	.loc    1  223  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #223.11
..LN3447:
	.loc    1  219  is_stmt 1
        kmovw     %ecx, %k1                                     #219.3
..LN3448:
        vpbroadcastd %xmm6, %ymm6                               #219.3
..LN3449:
        xorl      %r8d, %r8d                                    #219.3
..LN3450:
        movslq    %eax, %r9                                     #219.3
..LN3451:
        movq      16(%rsp), %r11                                #219.3[spill]
..LN3452:
        movq      48(%rsp), %rcx                                #219.3[spill]
..LN3453:
        movq      24(%rsp), %rsi                                #219.3[spill]
..LN3454:
        movq      32(%rsp), %rdi                                #219.3[spill]
..LN3455:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.463:                       # Preds ..B1.463 ..B1.462
                                # Execution count [4.08e-02]: Infreq
..LN3456:
        addq      $8, %r10                                      #219.3
..LN3457:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #219.3
..LN3458:
        vpaddd    %ymm6, %ymm5, %ymm5                           #219.3
..LN3459:
	.loc    1  220  is_stmt 1
        vmovupd   %zmm4, (%r8,%rdi){%k2}                        #220.4
..LN3460:
	.loc    1  221  is_stmt 1
        vmovupd   %zmm3, (%r8,%rsi){%k2}                        #221.4
..LN3461:
	.loc    1  222  is_stmt 1
        vmovupd   %zmm2, (%r8,%rcx){%k2}                        #222.4
..LN3462:
	.loc    1  223  is_stmt 1
        vmovupd   %zmm1, (%r8,%r11){%k2}                        #223.4
..LN3463:
	.loc    1  224  is_stmt 1
        vmovupd   %zmm4, (%r8,%rbx){%k2}                        #224.4
..LN3464:
	.loc    1  219  is_stmt 1
        addq      $64, %r8                                      #219.3
..LN3465:
        cmpq      %r9, %r10                                     #219.3
..LN3466:
        jb        ..B1.463      # Prob 81%                      #219.3
..LN3467:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.464:                       # Preds ..B1.463
                                # Execution count [7.34e-03]: Infreq
..LN3468:
        cmpl      %eax, %r13d                                   #219.3
..LN3469:
        je        ..B1.473      # Prob 10%                      #219.3
..LN3470:
                                # LOE rbx r15 eax edx r12d r13d
..B1.465:                       # Preds ..B1.461 ..B1.464
                                # Execution count [0.00e+00]: Infreq
..LN3471:
        lea       8(%rax), %r8d                                 #219.3
..LN3472:
        cmpl      %r8d, %edx                                    #219.3
..LN3473:
        jl        ..B1.469      # Prob 50%                      #219.3
..LN3474:
                                # LOE rbx r15 eax edx r12d r13d
..B1.466:                       # Preds ..B1.465
                                # Execution count [7.34e-03]: Infreq
..LN3475:
        movslq    %eax, %rax                                    #219.3
..LN3476:
	.loc    1  220  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #220.11
..LN3477:
	.loc    1  221  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #221.11
..LN3478:
	.loc    1  222  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #222.11
..LN3479:
	.loc    1  223  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #223.11
..LN3480:
	.loc    1  219  is_stmt 1
        movslq    %edx, %r8                                     #219.3
..LN3481:
        movq      16(%rsp), %r9                                 #219.3[spill]
..LN3482:
        movq      48(%rsp), %r10                                #219.3[spill]
..LN3483:
        movq      24(%rsp), %r11                                #219.3[spill]
..LN3484:
        movq      32(%rsp), %rcx                                #219.3[spill]
..LN3485:
                                # LOE rax rcx rbx r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.467:                       # Preds ..B1.467 ..B1.466
                                # Execution count [4.08e-02]: Infreq
..LN3486:
	.loc    1  220  is_stmt 1
        vmovupd   %zmm3, (%rcx,%rax,8)                          #220.4
..LN3487:
	.loc    1  221  is_stmt 1
        vmovupd   %zmm2, (%r11,%rax,8)                          #221.4
..LN3488:
	.loc    1  222  is_stmt 1
        vmovupd   %zmm1, (%r10,%rax,8)                          #222.4
..LN3489:
	.loc    1  223  is_stmt 1
        vmovupd   %zmm0, (%r9,%rax,8)                           #223.4
..LN3490:
	.loc    1  224  is_stmt 1
        vmovntpd  %zmm3, (%rbx,%rax,8)                          #224.4
..LN3491:
	.loc    1  219  is_stmt 1
        addq      $8, %rax                                      #219.3
..LN3492:
        cmpq      %r8, %rax                                     #219.3
..LN3493:
        jb        ..B1.467      # Prob 81%                      #219.3
..LN3494:
                                # LOE rax rcx rbx r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.469:                       # Preds ..B1.467 ..B1.465 ..B1.508
                                # Execution count [8.16e-03]: Infreq
..LN3495:
        lea       1(%rdx), %r8d                                 #219.3
..LN3496:
        cmpl      %r13d, %r8d                                   #219.3
..LN3497:
        ja        ..B1.473      # Prob 50%                      #219.3
..LN3498:
                                # LOE rbx r15 edx r12d r13d
..B1.470:                       # Preds ..B1.469
                                # Execution count [7.34e-03]: Infreq
..LN3499:
        movslq    %edx, %r8                                     #219.3
..LN3500:
        negl      %edx                                          #219.3
..LN3501:
        addl      %r13d, %edx                                   #219.3
..LN3502:
        movl      $8, %r9d                                      #219.3
..LN3503:
        movl      $255, %eax                                    #219.3
..LN3504:
        xorl      %r11d, %r11d                                  #219.3
..LN3505:
        kmovw     %eax, %k1                                     #219.3
..LN3506:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #219.3
..LN3507:
        vmovd     %edx, %xmm0                                   #219.3
..LN3508:
        vmovd     %r9d, %xmm6                                   #219.3
..LN3509:
	.loc    1  220  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #220.11
..LN3510:
	.loc    1  221  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #221.11
..LN3511:
	.loc    1  222  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #222.11
..LN3512:
	.loc    1  223  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #223.11
..LN3513:
        movq      16(%rsp), %rdx                                #223.4[spill]
..LN3514:
	.loc    1  224  is_stmt 1
        lea       (%rbx,%r8,8), %r9                             #224.4
..LN3515:
	.loc    1  222  is_stmt 1
        movq      48(%rsp), %rax                                #222.4[spill]
..LN3516:
	.loc    1  221  is_stmt 1
        movq      24(%rsp), %rsi                                #221.4[spill]
..LN3517:
	.loc    1  220  is_stmt 1
        movq      32(%rsp), %rcx                                #220.4[spill]
..LN3518:
	.loc    1  223  is_stmt 1
        lea       (%rdx,%r8,8), %rdx                            #223.4
..LN3519:
	.loc    1  219  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #219.3
..LN3520:
	.loc    1  222  is_stmt 1
        lea       (%rax,%r8,8), %rax                            #222.4
..LN3521:
	.loc    1  219  is_stmt 1
        movq      112(%rsp), %r10                               #219.3[spill]
..LN3522:
	.loc    1  221  is_stmt 1
        lea       (%rsi,%r8,8), %rsi                            #221.4
..LN3523:
	.loc    1  219  is_stmt 1
        vpbroadcastd %xmm6, %ymm6                               #219.3
..LN3524:
        subq      %r8, %r10                                     #219.3
..LN3525:
	.loc    1  220  is_stmt 1
        lea       (%rcx,%r8,8), %rcx                            #220.4
..LN3526:
	.loc    1  219  is_stmt 1
        xorl      %r8d, %r8d                                    #219.3
..LN3527:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.471:                       # Preds ..B1.471 ..B1.470
                                # Execution count [4.08e-02]: Infreq
..LN3528:
        addq      $8, %r11                                      #219.3
..LN3529:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #219.3
..LN3530:
        vpaddd    %ymm6, %ymm5, %ymm5                           #219.3
..LN3531:
	.loc    1  220  is_stmt 1
        vmovupd   %zmm4, (%r8,%rcx){%k2}                        #220.4
..LN3532:
	.loc    1  221  is_stmt 1
        vmovupd   %zmm3, (%r8,%rsi){%k2}                        #221.4
..LN3533:
	.loc    1  222  is_stmt 1
        vmovupd   %zmm2, (%r8,%rax){%k2}                        #222.4
..LN3534:
	.loc    1  223  is_stmt 1
        vmovupd   %zmm1, (%r8,%rdx){%k2}                        #223.4
..LN3535:
	.loc    1  224  is_stmt 1
        vmovupd   %zmm4, (%r8,%r9){%k2}                         #224.4
..LN3536:
	.loc    1  219  is_stmt 1
        addq      $64, %r8                                      #219.3
..LN3537:
        cmpq      %r10, %r11                                    #219.3
..LN3538:
        jb        ..B1.471      # Prob 81%                      #219.3
..LN3539:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.473:                       # Preds ..B1.471 ..B1.457 ..B1.464 ..B1.469
                                # Execution count [8.16e-03]: Infreq
..LN3540:
	.loc    1  229  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #229.3
..LN3541:
	.loc    1  227  is_stmt 1
        movl      $1, %r14d                                     #227.3
..LN3542:
	.loc    1  229  is_stmt 1
        vzeroupper                                              #229.3
..___tag_value_main.87:
..LN3543:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #229.3
..___tag_value_main.88:
..LN3544:
                                # LOE rbx r15 r12d r13d r14d
..B1.474:                       # Preds ..B1.473
                                # Execution count [8.16e-03]: Infreq
..LN3545:
	.loc    1  231  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #231.11
..LN3546:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #231.24
..LN3547:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #231.15
..LN3548:
        vcomisd   %xmm1, %xmm0                                  #231.24
..LN3549:
        jbe       ..B1.500      # Prob 10%                      #231.24
..LN3550:
                                # LOE rbx r15 r12d r13d r14d
..B1.475:                       # Preds ..B1.474
                                # Execution count [7.34e-03]: Infreq
..LN3551:
	.loc    1  238  is_stmt 1
        movl      $8, %r8d                                      #238.5
..LN3552:
        movl      %r13d, %edx                                   #238.5
..LN3553:
        andl      $-64, %edx                                    #238.5
..LN3554:
	.loc    1  233  is_stmt 1
        lea       56(%rsp), %rdi                                #233.4
..LN3555:
	.loc    1  238  is_stmt 1
        movl      %edx, 72(%rdi)                                #238.5[spill]
..LN3556:
	.loc    1  233  is_stmt 1
        lea       40(%rsp), %rsi                                #233.4
..LN3557:
	.loc    1  238  is_stmt 1
        movslq    %edx, %rdx                                    #238.5
..LN3558:
        vmovd     %r8d, %xmm0                                   #238.5
..LN3559:
        vpbroadcastd %xmm0, %ymm1                               #238.5
..LN3560:
        vmovdqu   %ymm1, 24(%rsi)                               #238.5[spill]
..LN3561:
        movq      %rdx, 80(%rsi)                                #238.5[spill]
..LN3562:
	.loc    1  233  is_stmt 1
        vzeroupper                                              #233.4
..___tag_value_main.89:
..LN3563:
#       timing(double *, double *)
        call      timing                                        #233.4
..___tag_value_main.90:
..LN3564:
                                # LOE rbx r15 r12d r13d r14d
..B1.476:                       # Preds ..B1.475
                                # Execution count [6.61e-03]: Infreq
..LN3565:
	.loc    1  234  is_stmt 1
        xorl      %eax, %eax                                    #234.4
..LN3566:
        movl      %r12d, (%rsp)                                 #234.4[spill]
..LN3567:
        vxorpd    %xmm0, %xmm0, %xmm0                           #234.4
..LN3568:
        movq      %r15, 8(%rsp)                                 #234.4[spill]
..LN3569:
        movl      %r14d, 184(%rsp)                              #234.4[spill]
..LN3570:
        movl      %r13d, %r14d                                  #234.4
..LN3571:
        movq      16(%rsp), %r15                                #234.4[spill]
..LN3572:
        movl      %eax, %r13d                                   #234.4
..LN3573:
        movq      24(%rsp), %r12                                #234.4[spill]
..LN3574:
        movq      32(%rsp), %r11                                #234.4[spill]
..LN3575:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.477:                       # Preds ..B1.476 ..B1.492 ..B1.498
                                # Execution count [2.04e-01]: Infreq
..LN3576:
	.loc    1  238  is_stmt 1
        xorl      %esi, %esi                                    #238.9
..LN3577:
        testl     %r14d, %r14d                                  #238.20
..LN3578:
        jle       ..B1.490      # Prob 50%                      #238.20
..LN3579:
                                # LOE rbx r11 r12 r15 esi r13d r14d xmm0
..B1.478:                       # Preds ..B1.477
                                # Execution count [1.84e-01]: Infreq
..LN3580:
        cmpl      $64, %r14d                                    #238.5
..LN3581:
        jl        ..B1.507      # Prob 10%                      #238.5
..LN3582:
                                # LOE rbx r11 r12 r15 esi r13d r14d xmm0
..B1.479:                       # Preds ..B1.478
                                # Execution count [1.84e-01]: Infreq
..LN3583:
        movl      128(%rsp), %ecx                               #238.5[spill]
..LN3584:
                                # LOE rbx r11 r12 r15 ecx r13d r14d xmm0
..B1.481:                       # Preds ..B1.479
                                # Execution count [1.84e-01]: Infreq
..LN3585:
        movq      120(%rsp), %rsi                               #238.5[spill]
..LN3586:
        xorl      %edx, %edx                                    #238.5
..LN3587:
        movq      48(%rsp), %r8                                 #238.5[spill]
..LN3588:
                                # LOE rdx rbx rsi r8 r11 r12 r15 ecx r13d r14d xmm0
..B1.482:                       # Preds ..B1.482 ..B1.481
                                # Execution count [1.02e+00]: Infreq
..LN3589:
	.loc    1  239  is_stmt 1
        vmovups   (%r12,%rdx,8), %zmm1                          #239.13
..LN3590:
        vmovups   64(%r12,%rdx,8), %zmm2                        #239.13
..LN3591:
        vaddpd    (%r8,%rdx,8), %zmm1, %zmm3                    #239.20
..LN3592:
        vaddpd    64(%r8,%rdx,8), %zmm2, %zmm4                  #239.20
..LN3593:
        vaddpd    (%r15,%rdx,8), %zmm3, %zmm5                   #239.27
..LN3594:
        vaddpd    64(%r15,%rdx,8), %zmm4, %zmm6                 #239.27
..LN3595:
        vaddpd    (%rbx,%rdx,8), %zmm5, %zmm7                   #239.34
..LN3596:
        vaddpd    64(%rbx,%rdx,8), %zmm6, %zmm8                 #239.34
..LN3597:
        vmovntpd  %zmm7, (%r11,%rdx,8)                          #239.6
..LN3598:
        vmovntpd  %zmm8, 64(%r11,%rdx,8)                        #239.6
..LN3599:
        vmovups   128(%r12,%rdx,8), %zmm9                       #239.13
..LN3600:
        vmovups   192(%r12,%rdx,8), %zmm10                      #239.13
..LN3601:
        vaddpd    128(%r8,%rdx,8), %zmm9, %zmm11                #239.20
..LN3602:
        vaddpd    192(%r8,%rdx,8), %zmm10, %zmm12               #239.20
..LN3603:
        vaddpd    128(%r15,%rdx,8), %zmm11, %zmm13              #239.27
..LN3604:
        vaddpd    192(%r15,%rdx,8), %zmm12, %zmm14              #239.27
..LN3605:
        vaddpd    128(%rbx,%rdx,8), %zmm13, %zmm15              #239.34
..LN3606:
        vaddpd    192(%rbx,%rdx,8), %zmm14, %zmm16              #239.34
..LN3607:
        vmovntpd  %zmm15, 128(%r11,%rdx,8)                      #239.6
..LN3608:
        vmovntpd  %zmm16, 192(%r11,%rdx,8)                      #239.6
..LN3609:
        vmovups   256(%r12,%rdx,8), %zmm17                      #239.13
..LN3610:
        vmovups   320(%r12,%rdx,8), %zmm18                      #239.13
..LN3611:
        vaddpd    256(%r8,%rdx,8), %zmm17, %zmm19               #239.20
..LN3612:
        vaddpd    320(%r8,%rdx,8), %zmm18, %zmm20               #239.20
..LN3613:
        vaddpd    256(%r15,%rdx,8), %zmm19, %zmm21              #239.27
..LN3614:
        vaddpd    320(%r15,%rdx,8), %zmm20, %zmm22              #239.27
..LN3615:
        vaddpd    256(%rbx,%rdx,8), %zmm21, %zmm23              #239.34
..LN3616:
        vaddpd    320(%rbx,%rdx,8), %zmm22, %zmm24              #239.34
..LN3617:
        vmovntpd  %zmm23, 256(%r11,%rdx,8)                      #239.6
..LN3618:
        vmovntpd  %zmm24, 320(%r11,%rdx,8)                      #239.6
..LN3619:
        vmovups   384(%r12,%rdx,8), %zmm25                      #239.13
..LN3620:
        vmovups   448(%r12,%rdx,8), %zmm26                      #239.13
..LN3621:
        vaddpd    384(%r8,%rdx,8), %zmm25, %zmm27               #239.20
..LN3622:
        vaddpd    448(%r8,%rdx,8), %zmm26, %zmm28               #239.20
..LN3623:
        vaddpd    384(%r15,%rdx,8), %zmm27, %zmm29              #239.27
..LN3624:
        vaddpd    448(%r15,%rdx,8), %zmm28, %zmm30              #239.27
..LN3625:
        vaddpd    384(%rbx,%rdx,8), %zmm29, %zmm31              #239.34
..LN3626:
        vaddpd    448(%rbx,%rdx,8), %zmm30, %zmm1               #239.34
..LN3627:
        vmovntpd  %zmm31, 384(%r11,%rdx,8)                      #239.6
..LN3628:
        vmovntpd  %zmm1, 448(%r11,%rdx,8)                       #239.6
..LN3629:
	.loc    1  238  is_stmt 1
        addq      $64, %rdx                                     #238.5
..LN3630:
        cmpq      %rsi, %rdx                                    #238.5
..LN3631:
        jb        ..B1.482      # Prob 82%                      #238.5
..LN3632:
                                # LOE rdx rbx rsi r8 r11 r12 r15 ecx r13d r14d xmm0
..B1.483:                       # Preds ..B1.482
                                # Execution count [1.84e-01]: Infreq
..LN3633:
        movl      %ecx, %esi                                    #238.36
..LN3634:
                                # LOE rbx r11 r12 r15 ecx esi r13d r14d xmm0
..B1.484:                       # Preds ..B1.483 ..B1.507
                                # Execution count [2.04e-01]: Infreq
..LN3635:
        lea       1(%rcx), %edx                                 #238.5
..LN3636:
        cmpl      %r14d, %edx                                   #238.5
..LN3637:
        ja        ..B1.490      # Prob 50%                      #238.5
..LN3638:
                                # LOE rbx r11 r12 r15 ecx esi r13d r14d xmm0
..B1.485:                       # Preds ..B1.484
                                # Execution count [1.84e-01]: Infreq
..LN3639:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #238.5
..LN3640:
                                # LOE rbx r11 r12 r15 ecx r13d r14d xmm0 ymm2
..B1.487:                       # Preds ..B1.485
                                # Execution count [1.84e-01]: Infreq
..LN3641:
        movl      $255, %eax                                    #238.5
..LN3642:
        xorl      %r10d, %r10d                                  #238.5
..LN3643:
        kmovw     %eax, %k1                                     #238.5
..LN3644:
        vmovdqu   64(%rsp), %ymm7                               #238.5[spill]
..LN3645:
        movslq    %ecx, %rax                                    #238.5
..LN3646:
        negl      %ecx                                          #238.5
..LN3647:
        addl      %r14d, %ecx                                   #238.5
..LN3648:
	.loc    1  239  is_stmt 1
        movq      48(%rsp), %r9                                 #239.20[spill]
..LN3649:
	.loc    1  238  is_stmt 1
        movq      112(%rsp), %rdx                               #238.5[spill]
..LN3650:
        subq      %rax, %rdx                                    #238.5
..LN3651:
	.loc    1  239  is_stmt 1
        lea       (%rbx,%rax,8), %rsi                           #239.34
..LN3652:
	.loc    1  238  is_stmt 1
        vmovd     %ecx, %xmm1                                   #238.5
..LN3653:
	.loc    1  239  is_stmt 1
        lea       (%r11,%rax,8), %rcx                           #239.6
..LN3654:
	.loc    1  238  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #238.5
..LN3655:
	.loc    1  239  is_stmt 1
        lea       (%r15,%rax,8), %r8                            #239.27
..LN3656:
        lea       (%r9,%rax,8), %r9                             #239.20
..LN3657:
        lea       (%r12,%rax,8), %rdi                           #239.13
..LN3658:
	.loc    1  238  is_stmt 1
        xorl      %eax, %eax                                    #238.5
..LN3659:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm7 zmm1 k1
..B1.488:                       # Preds ..B1.488 ..B1.487
                                # Execution count [1.02e+00]: Infreq
..LN3660:
	.loc    1  239  is_stmt 1
        vmovups   (%rax,%rdi), %zmm3                            #239.13
..LN3661:
	.loc    1  238  is_stmt 1
        addq      $8, %r10                                      #238.5
..LN3662:
	.loc    1  239  is_stmt 1
        vaddpd    (%rax,%r9), %zmm3, %zmm4                      #239.20
..LN3663:
        vaddpd    (%rax,%r8), %zmm4, %zmm5                      #239.27
..LN3664:
        vaddpd    (%rax,%rsi), %zmm5, %zmm6                     #239.34
..LN3665:
	.loc    1  238  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #238.5
..LN3666:
        vpaddd    %ymm7, %ymm2, %ymm2                           #238.5
..LN3667:
	.loc    1  239  is_stmt 1
        vmovupd   %zmm6, (%rax,%rcx){%k2}                       #239.6
..LN3668:
	.loc    1  238  is_stmt 1
        addq      $64, %rax                                     #238.5
..LN3669:
        cmpq      %rdx, %r10                                    #238.5
..LN3670:
        jb        ..B1.488      # Prob 82%                      #238.5
..LN3671:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm7 zmm1 k1
..B1.489:                       # Preds ..B1.488
                                # Execution count [1.84e-01]: Infreq
..LN3672:
        movl      %r14d, %esi                                   #238.36
..LN3673:
                                # LOE rbx r11 r12 r15 esi r13d r14d xmm0
..B1.490:                       # Preds ..B1.489 ..B1.484 ..B1.477
                                # Execution count [2.04e-01]: Infreq
..LN3674:
	.loc    1  241  is_stmt 1
        movslq    %esi, %rsi                                    #241.8
..LN3675:
        vcomisd   (%r11,%rsi,8), %xmm0                          #241.13
..LN3676:
        jbe       ..B1.492      # Prob 78%                      #241.13
..LN3677:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.491:                       # Preds ..B1.490
                                # Execution count [4.49e-02]: Infreq
..LN3678:
        movl      $il0_peep_printf_format_6, %edi               #241.16
..LN3679:
        movq      %r11, 32(%rsp)                                #241.16[spill]
..LN3680:
        vzeroupper                                              #241.16
..LN3681:
        call      puts                                          #241.16
..LN3682:
                                # LOE rbx r12 r15 r13d r14d
..B1.744:                       # Preds ..B1.491
                                # Execution count [4.49e-02]: Infreq
..LN3683:
        movq      32(%rsp), %r11                                #[spill]
..LN3684:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3685:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.492:                       # Preds ..B1.490 ..B1.744
                                # Execution count [2.04e-01]: Infreq
..LN3686:
	.loc    1  234  is_stmt 1
        incl      %r13d                                         #234.4
..LN3687:
        cmpl      184(%rsp), %r13d                              #234.4[spill]
..LN3688:
        jb        ..B1.477      # Prob 81%                      #234.4
..LN3689:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.493:                       # Preds ..B1.492
                                # Execution count [3.74e-02]: Infreq
..LN3690:
        movl      %r14d, 192(%rsp)                              #[spill]
..LN3691:
        movq      %r11, %r13                                    #
..LN3692:
        movl      184(%rsp), %r14d                              #[spill]
..LN3693:
                                # LOE rbx r12 r13 r15 r14d
..B1.494:                       # Preds ..B1.497 ..B1.493
                                # Execution count [4.08e-02]: Infreq
..LN3694:
	.loc    1  244  is_stmt 1
        vzeroupper                                              #244.4
..LN3695:
        lea       96(%rsp), %rdi                                #244.4
..LN3696:
        lea       40(%rsp), %rsi                                #244.4
..___tag_value_main.91:
..LN3697:
#       timing(double *, double *)
        call      timing                                        #244.4
..___tag_value_main.92:
..LN3698:
                                # LOE rbx r12 r13 r15 r14d
..B1.495:                       # Preds ..B1.494
                                # Execution count [4.08e-02]: Infreq
..LN3699:
	.loc    1  231  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #231.11
..LN3700:
	.loc    1  245  is_stmt 1
        addl      %r14d, %r14d                                  #245.4
..LN3701:
	.loc    1  231  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #231.24
..LN3702:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #231.15
..LN3703:
        vcomisd   %xmm1, %xmm0                                  #231.24
..LN3704:
        jbe       ..B1.499      # Prob 18%                      #231.24
..LN3705:
                                # LOE rbx r12 r13 r15 r14d
..B1.496:                       # Preds ..B1.495
                                # Execution count [3.34e-02]: Infreq
..LN3706:
	.loc    1  233  is_stmt 1
        lea       56(%rsp), %rdi                                #233.4
..LN3707:
        lea       40(%rsp), %rsi                                #233.4
..___tag_value_main.93:
..LN3708:
#       timing(double *, double *)
        call      timing                                        #233.4
..___tag_value_main.94:
..LN3709:
                                # LOE rbx r12 r13 r15 r14d
..B1.497:                       # Preds ..B1.496
                                # Execution count [3.34e-02]: Infreq
..LN3710:
	.loc    1  234  is_stmt 1
        xorl      %eax, %eax                                    #234.4
..LN3711:
        testl     %r14d, %r14d                                  #234.19
..LN3712:
        jle       ..B1.494      # Prob 9%                       #234.19
..LN3713:
                                # LOE rbx r12 r13 r15 eax r14d
..B1.498:                       # Preds ..B1.497
                                # Execution count [3.01e-02]: Infreq
..LN3714:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN3715:
        movq      %r13, %r11                                    #
..LN3716:
        movl      192(%rsp), %r14d                              #[spill]
..LN3717:
        movl      %eax, %r13d                                   #
..LN3718:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3719:
        jmp       ..B1.477      # Prob 100%                     #
..LN3720:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.499:                       # Preds ..B1.495
                                # Execution count [7.34e-03]: Infreq
..LN3721:
        movq      %r13, 32(%rsp)                                #[spill]
..LN3722:
        movl      (%rsp), %r12d                                 #[spill]
..LN3723:
        movq      8(%rsp), %r15                                 #[spill]
..LN3724:
        movl      192(%rsp), %r13d                              #[spill]
..LN3725:
                                # LOE rbx r15 r12d r13d r14d
..B1.500:                       # Preds ..B1.499 ..B1.474
                                # Execution count [8.16e-03]: Infreq
..LN3726:
	.loc    1  248  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #248.3
..___tag_value_main.95:
..LN3727:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #248.3
..___tag_value_main.96:
..LN3728:
                                # LOE rbx r15 r12d r13d r14d
..B1.501:                       # Preds ..B1.500
                                # Execution count [8.16e-03]: Infreq
..LN3729:
	.loc    1  250  is_stmt 1
        movl      %r14d, %edx                                   #250.3
..LN3730:
        shrl      $31, %edx                                     #250.3
..LN3731:
        addl      %edx, %r14d                                   #250.3
..LN3732:
        sarl      $1, %r14d                                     #250.3
..___tag_value_main.97:
..LN3733:
	.loc    1  253  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #253.3
..___tag_value_main.98:
..LN3734:
                                # LOE rbx r15 r12d r13d r14d
..B1.502:                       # Preds ..B1.501
                                # Execution count [8.16e-03]: Infreq
..LN3735:
	.loc    1  255  is_stmt 1
        movq      32(%rsp), %rdi                                #255.3[spill]
..LN3736:
#       _mm_free(void *)
        call      _mm_free                                      #255.3
..LN3737:
                                # LOE rbx r15 r12d r13d r14d
..B1.503:                       # Preds ..B1.502
                                # Execution count [8.16e-03]: Infreq
..LN3738:
	.loc    1  256  is_stmt 1
        movq      24(%rsp), %rdi                                #256.3[spill]
..LN3739:
#       _mm_free(void *)
        call      _mm_free                                      #256.3
..LN3740:
                                # LOE rbx r15 r12d r13d r14d
..B1.504:                       # Preds ..B1.503
                                # Execution count [8.16e-03]: Infreq
..LN3741:
	.loc    1  257  is_stmt 1
        movq      48(%rsp), %rdi                                #257.3[spill]
..LN3742:
#       _mm_free(void *)
        call      _mm_free                                      #257.3
..LN3743:
                                # LOE rbx r15 r12d r13d r14d
..B1.505:                       # Preds ..B1.504
                                # Execution count [8.16e-03]: Infreq
..LN3744:
	.loc    1  258  is_stmt 1
        movq      16(%rsp), %rdi                                #258.3[spill]
..LN3745:
#       _mm_free(void *)
        call      _mm_free                                      #258.3
..LN3746:
                                # LOE rbx r15 r12d r13d r14d
..B1.506:                       # Preds ..B1.505
                                # Execution count [8.16e-03]: Infreq
..LN3747:
	.loc    1  259  is_stmt 1
        movq      %rbx, %rdi                                    #259.3
..LN3748:
#       _mm_free(void *)
        call      _mm_free                                      #259.3
..LN3749:
        jmp       ..B1.18       # Prob 100%                     #259.3
..LN3750:
                                # LOE r15 r12d r13d r14d
..B1.507:                       # Preds ..B1.478
                                # Execution count [1.84e-02]: Infreq
..LN3751:
	.loc    1  238  is_stmt 1
        xorl      %ecx, %ecx                                    #238.5
..LN3752:
        jmp       ..B1.484      # Prob 100%                     #238.5
..LN3753:
                                # LOE rbx r11 r12 r15 ecx esi r13d r14d xmm0
..B1.508:                       # Preds ..B1.459
                                # Execution count [7.34e-04]: Infreq
..LN3754:
	.loc    1  219  is_stmt 1
        xorl      %edx, %edx                                    #219.3
..LN3755:
        jmp       ..B1.469      # Prob 100%                     #219.3
..LN3756:
                                # LOE rbx r15 edx r12d r13d
..B1.509:                       # Preds ..B1.10
                                # Execution count [8.16e-03]: Infreq
..LN3757:
	.loc    1  162  is_stmt 1
        movq      %rbx, %rdi                                    #162.16
..LN3758:
        movq      %r15, %rsi                                    #162.16
..LN3759:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #162.16
..LN3760:
                                # LOE rax rbx r15 r12d r13d
..B1.732:                       # Preds ..B1.509
                                # Execution count [8.16e-03]: Infreq
..LN3761:
        movq      %rax, 16(%rsp)                                #162.16[spill]
..LN3762:
                                # LOE rbx r15 r12d r13d
..B1.510:                       # Preds ..B1.732
                                # Execution count [8.16e-03]: Infreq
..LN3763:
	.loc    1  163  is_stmt 1
        movq      %rbx, %rdi                                    #163.16
..LN3764:
        movq      %r15, %rsi                                    #163.16
..LN3765:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #163.16
..LN3766:
                                # LOE rax rbx r15 r12d r13d
..B1.733:                       # Preds ..B1.510
                                # Execution count [8.16e-03]: Infreq
..LN3767:
        movq      %rax, 32(%rsp)                                #163.16[spill]
..LN3768:
                                # LOE rbx r15 r12d r13d
..B1.511:                       # Preds ..B1.733
                                # Execution count [8.16e-03]: Infreq
..LN3769:
	.loc    1  164  is_stmt 1
        movq      %rbx, %rdi                                    #164.16
..LN3770:
        movq      %r15, %rsi                                    #164.16
..LN3771:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #164.16
..LN3772:
                                # LOE rax rbx r15 r12d r13d
..B1.734:                       # Preds ..B1.511
                                # Execution count [8.16e-03]: Infreq
..LN3773:
        movq      %rax, 24(%rsp)                                #164.16[spill]
..LN3774:
                                # LOE rbx r15 r12d r13d
..B1.512:                       # Preds ..B1.734
                                # Execution count [8.16e-03]: Infreq
..LN3775:
	.loc    1  165  is_stmt 1
        movq      %rbx, %rdi                                    #165.16
..LN3776:
        movq      %r15, %rsi                                    #165.16
..LN3777:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #165.16
..LN3778:
                                # LOE rax r15 r12d r13d
..B1.735:                       # Preds ..B1.512
                                # Execution count [8.16e-03]: Infreq
..LN3779:
        movq      %rax, %rbx                                    #165.16
..LN3780:
                                # LOE rbx r15 r12d r13d
..B1.513:                       # Preds ..B1.735
                                # Execution count [8.16e-03]: Infreq
..LN3781:
	.loc    1  167  is_stmt 1
        testl     %r13d, %r13d                                  #167.18
..LN3782:
        jle       ..B1.529      # Prob 50%                      #167.18
..LN3783:
                                # LOE rbx r15 r12d r13d
..B1.514:                       # Preds ..B1.513
                                # Execution count [7.34e-03]: Infreq
..LN3784:
        movq      %rbx, %r11                                    #167.3
..LN3785:
        andq      $63, %r11                                     #167.3
..LN3786:
        testl     %r11d, %r11d                                  #167.3
..LN3787:
        je        ..B1.517      # Prob 50%                      #167.3
..LN3788:
                                # LOE rbx r15 r11d r12d r13d
..B1.515:                       # Preds ..B1.514
                                # Execution count [7.34e-03]: Infreq
..LN3789:
        testl     $7, %r11d                                     #167.3
..LN3790:
        jne       ..B1.563      # Prob 10%                      #167.3
..LN3791:
                                # LOE rbx r15 r11d r12d r13d
..B1.516:                       # Preds ..B1.515
                                # Execution count [0.00e+00]: Infreq
..LN3792:
        negl      %r11d                                         #167.3
..LN3793:
        addl      $64, %r11d                                    #167.3
..LN3794:
        shrl      $3, %r11d                                     #167.3
..LN3795:
        cmpl      %r11d, %r13d                                  #167.3
..LN3796:
        cmovl     %r13d, %r11d                                  #167.3
..LN3797:
                                # LOE rbx r15 r11d r12d r13d
..B1.517:                       # Preds ..B1.516 ..B1.514
                                # Execution count [8.16e-03]: Infreq
..LN3798:
        movl      %r13d, %eax                                   #167.3
..LN3799:
        subl      %r11d, %eax                                   #167.3
..LN3800:
        andl      $7, %eax                                      #167.3
..LN3801:
        negl      %eax                                          #167.3
..LN3802:
        addl      %r13d, %eax                                   #167.3
..LN3803:
        cmpl      $1, %r11d                                     #167.3
..LN3804:
        jb        ..B1.521      # Prob 50%                      #167.3
..LN3805:
                                # LOE rbx r15 eax r11d r12d r13d
..B1.518:                       # Preds ..B1.517
                                # Execution count [7.34e-03]: Infreq
..LN3806:
        movl      $8, %r8d                                      #167.3
..LN3807:
        vmovd     %r11d, %xmm0                                  #167.3
..LN3808:
        vpbroadcastd %xmm0, %ymm0                               #167.3
..LN3809:
        movl      $255, %edx                                    #167.3
..LN3810:
        xorl      %r10d, %r10d                                  #167.3
..LN3811:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #167.3
..LN3812:
        vmovd     %r8d, %xmm6                                   #167.3
..LN3813:
	.loc    1  168  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #168.11
..LN3814:
	.loc    1  169  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #169.11
..LN3815:
	.loc    1  170  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #170.11
..LN3816:
	.loc    1  171  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #171.11
..LN3817:
	.loc    1  167  is_stmt 1
        kmovw     %edx, %k1                                     #167.3
..LN3818:
        vpbroadcastd %xmm6, %ymm6                               #167.3
..LN3819:
        xorl      %r8d, %r8d                                    #167.3
..LN3820:
        movslq    %r11d, %r9                                    #167.3
..LN3821:
        movq      24(%rsp), %rdx                                #167.3[spill]
..LN3822:
        movq      32(%rsp), %rcx                                #167.3[spill]
..LN3823:
        movq      16(%rsp), %rsi                                #167.3[spill]
..LN3824:
                                # LOE rdx rcx rbx rsi r8 r9 r10 r15 eax r11d r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.519:                       # Preds ..B1.519 ..B1.518
                                # Execution count [4.08e-02]: Infreq
..LN3825:
        addq      $8, %r10                                      #167.3
..LN3826:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #167.3
..LN3827:
        vpaddd    %ymm6, %ymm5, %ymm5                           #167.3
..LN3828:
	.loc    1  168  is_stmt 1
        vmovupd   %zmm4, (%r8,%rsi){%k2}                        #168.4
..LN3829:
	.loc    1  169  is_stmt 1
        vmovupd   %zmm3, (%r8,%rcx){%k2}                        #169.4
..LN3830:
	.loc    1  170  is_stmt 1
        vmovupd   %zmm2, (%r8,%rdx){%k2}                        #170.4
..LN3831:
	.loc    1  171  is_stmt 1
        vmovupd   %zmm1, (%r8,%rbx){%k2}                        #171.4
..LN3832:
	.loc    1  167  is_stmt 1
        addq      $64, %r8                                      #167.3
..LN3833:
        cmpq      %r9, %r10                                     #167.3
..LN3834:
        jb        ..B1.519      # Prob 81%                      #167.3
..LN3835:
                                # LOE rdx rcx rbx rsi r8 r9 r10 r15 eax r11d r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.520:                       # Preds ..B1.519
                                # Execution count [7.34e-03]: Infreq
..LN3836:
        cmpl      %r11d, %r13d                                  #167.3
..LN3837:
        je        ..B1.529      # Prob 10%                      #167.3
..LN3838:
                                # LOE rbx r15 eax r11d r12d r13d
..B1.521:                       # Preds ..B1.517 ..B1.520
                                # Execution count [0.00e+00]: Infreq
..LN3839:
        lea       8(%r11), %r8d                                 #167.3
..LN3840:
        cmpl      %r8d, %eax                                    #167.3
..LN3841:
        jl        ..B1.525      # Prob 50%                      #167.3
..LN3842:
                                # LOE rbx r15 eax r11d r12d r13d
..B1.522:                       # Preds ..B1.521
                                # Execution count [7.34e-03]: Infreq
..LN3843:
        movslq    %r11d, %r11                                   #167.3
..LN3844:
	.loc    1  168  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #168.11
..LN3845:
	.loc    1  169  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #169.11
..LN3846:
	.loc    1  170  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #170.11
..LN3847:
	.loc    1  171  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #171.11
..LN3848:
	.loc    1  167  is_stmt 1
        movslq    %eax, %r8                                     #167.3
..LN3849:
        movq      24(%rsp), %r9                                 #167.3[spill]
..LN3850:
        movq      32(%rsp), %r10                                #167.3[spill]
..LN3851:
        movq      16(%rsp), %rdx                                #167.3[spill]
..LN3852:
                                # LOE rdx rbx r8 r9 r10 r11 r15 eax r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.523:                       # Preds ..B1.523 ..B1.522
                                # Execution count [4.08e-02]: Infreq
..LN3853:
	.loc    1  168  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r11,8)                          #168.4
..LN3854:
	.loc    1  169  is_stmt 1
        vmovupd   %zmm2, (%r10,%r11,8)                          #169.4
..LN3855:
	.loc    1  170  is_stmt 1
        vmovupd   %zmm1, (%r9,%r11,8)                           #170.4
..LN3856:
	.loc    1  171  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r11,8)                          #171.4
..LN3857:
	.loc    1  167  is_stmt 1
        addq      $8, %r11                                      #167.3
..LN3858:
        cmpq      %r8, %r11                                     #167.3
..LN3859:
        jb        ..B1.523      # Prob 81%                      #167.3
..LN3860:
                                # LOE rdx rbx r8 r9 r10 r11 r15 eax r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.525:                       # Preds ..B1.523 ..B1.521 ..B1.563
                                # Execution count [8.16e-03]: Infreq
..LN3861:
        lea       1(%rax), %r8d                                 #167.3
..LN3862:
        cmpl      %r13d, %r8d                                   #167.3
..LN3863:
        ja        ..B1.529      # Prob 50%                      #167.3
..LN3864:
                                # LOE rbx r15 eax r12d r13d
..B1.526:                       # Preds ..B1.525
                                # Execution count [7.34e-03]: Infreq
..LN3865:
        movslq    %eax, %rsi                                    #167.3
..LN3866:
        negl      %eax                                          #167.3
..LN3867:
        addl      %r13d, %eax                                   #167.3
..LN3868:
        movl      $8, %r8d                                      #167.3
..LN3869:
	.loc    1  170  is_stmt 1
        movq      24(%rsp), %r11                                #170.4[spill]
..LN3870:
	.loc    1  167  is_stmt 1
        movl      $255, %edx                                    #167.3
..LN3871:
	.loc    1  169  is_stmt 1
        movq      32(%rsp), %r9                                 #169.4[spill]
..LN3872:
	.loc    1  168  is_stmt 1
        movq      16(%rsp), %r10                                #168.4[spill]
..LN3873:
	.loc    1  167  is_stmt 1
        vmovd     %eax, %xmm0                                   #167.3
..LN3874:
        vmovd     %r8d, %xmm6                                   #167.3
..LN3875:
        vpbroadcastd %xmm0, %ymm0                               #167.3
..LN3876:
        xorl      %r8d, %r8d                                    #167.3
..LN3877:
        movq      112(%rsp), %rax                               #167.3[spill]
..LN3878:
	.loc    1  170  is_stmt 1
        lea       (%r11,%rsi,8), %rcx                           #170.4
..LN3879:
	.loc    1  167  is_stmt 1
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #167.3
..LN3880:
        subq      %rsi, %rax                                    #167.3
..LN3881:
	.loc    1  168  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #168.11
..LN3882:
	.loc    1  169  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #169.11
..LN3883:
	.loc    1  170  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #170.11
..LN3884:
	.loc    1  171  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #171.11
..LN3885:
	.loc    1  167  is_stmt 1
        kmovw     %edx, %k1                                     #167.3
..LN3886:
        vpbroadcastd %xmm6, %ymm6                               #167.3
..LN3887:
	.loc    1  171  is_stmt 1
        lea       (%rbx,%rsi,8), %rdx                           #171.4
..LN3888:
	.loc    1  169  is_stmt 1
        lea       (%r9,%rsi,8), %r11                            #169.4
..LN3889:
	.loc    1  167  is_stmt 1
        xorl      %r9d, %r9d                                    #167.3
..LN3890:
	.loc    1  168  is_stmt 1
        lea       (%r10,%rsi,8), %r10                           #168.4
..LN3891:
                                # LOE rax rdx rcx rbx r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.527:                       # Preds ..B1.527 ..B1.526
                                # Execution count [4.08e-02]: Infreq
..LN3892:
	.loc    1  167  is_stmt 1
        addq      $8, %r8                                       #167.3
..LN3893:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #167.3
..LN3894:
        vpaddd    %ymm6, %ymm5, %ymm5                           #167.3
..LN3895:
	.loc    1  168  is_stmt 1
        vmovupd   %zmm4, (%r9,%r10){%k2}                        #168.4
..LN3896:
	.loc    1  169  is_stmt 1
        vmovupd   %zmm3, (%r9,%r11){%k2}                        #169.4
..LN3897:
	.loc    1  170  is_stmt 1
        vmovupd   %zmm2, (%r9,%rcx){%k2}                        #170.4
..LN3898:
	.loc    1  171  is_stmt 1
        vmovupd   %zmm1, (%r9,%rdx){%k2}                        #171.4
..LN3899:
	.loc    1  167  is_stmt 1
        addq      $64, %r9                                      #167.3
..LN3900:
        cmpq      %rax, %r8                                     #167.3
..LN3901:
        jb        ..B1.527      # Prob 81%                      #167.3
..LN3902:
                                # LOE rax rdx rcx rbx r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.529:                       # Preds ..B1.527 ..B1.513 ..B1.520 ..B1.525
                                # Execution count [8.16e-03]: Infreq
..LN3903:
	.loc    1  176  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #176.3
..LN3904:
	.loc    1  174  is_stmt 1
        movl      $1, %r14d                                     #174.3
..LN3905:
	.loc    1  176  is_stmt 1
        vzeroupper                                              #176.3
..___tag_value_main.99:
..LN3906:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #176.3
..___tag_value_main.100:
..LN3907:
                                # LOE rbx r15 r12d r13d r14d
..B1.530:                       # Preds ..B1.529
                                # Execution count [8.16e-03]: Infreq
..LN3908:
	.loc    1  178  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #178.11
..LN3909:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #178.24
..LN3910:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #178.15
..LN3911:
        vcomisd   %xmm1, %xmm0                                  #178.24
..LN3912:
        jbe       ..B1.556      # Prob 10%                      #178.24
..LN3913:
                                # LOE rbx r15 r12d r13d r14d
..B1.531:                       # Preds ..B1.530
                                # Execution count [7.34e-03]: Infreq
..LN3914:
	.loc    1  185  is_stmt 1
        movl      $8, %r9d                                      #185.5
..LN3915:
        movl      %r13d, %r8d                                   #185.5
..LN3916:
        andl      $-64, %r8d                                    #185.5
..LN3917:
	.loc    1  180  is_stmt 1
        lea       56(%rsp), %rdi                                #180.4
..LN3918:
	.loc    1  185  is_stmt 1
        movl      %r8d, 72(%rdi)                                #185.5[spill]
..LN3919:
	.loc    1  180  is_stmt 1
        lea       40(%rsp), %rsi                                #180.4
..LN3920:
	.loc    1  185  is_stmt 1
        movslq    %r8d, %r8                                     #185.5
..LN3921:
        vmovd     %r9d, %xmm0                                   #185.5
..LN3922:
        vpbroadcastd %xmm0, %ymm1                               #185.5
..LN3923:
        vmovdqu   %ymm1, 24(%rsi)                               #185.5[spill]
..LN3924:
        movq      %r8, 80(%rsi)                                 #185.5[spill]
..LN3925:
	.loc    1  180  is_stmt 1
        vzeroupper                                              #180.4
..___tag_value_main.101:
..LN3926:
#       timing(double *, double *)
        call      timing                                        #180.4
..___tag_value_main.102:
..LN3927:
                                # LOE rbx r15 r12d r13d r14d
..B1.532:                       # Preds ..B1.531
                                # Execution count [6.61e-03]: Infreq
..LN3928:
	.loc    1  181  is_stmt 1
        xorl      %eax, %eax                                    #181.4
..LN3929:
        movq      %rbx, %rdx                                    #181.4
..LN3930:
        movl      %r14d, 184(%rsp)                              #181.4[spill]
..LN3931:
        movl      %eax, %ebx                                    #181.4
..LN3932:
        movl      %r12d, (%rsp)                                 #181.4[spill]
..LN3933:
        vxorpd    %xmm0, %xmm0, %xmm0                           #181.4
..LN3934:
        movq      %r15, 8(%rsp)                                 #181.4[spill]
..LN3935:
        movq      24(%rsp), %r12                                #181.4[spill]
..LN3936:
        movq      32(%rsp), %r14                                #181.4[spill]
..LN3937:
        movq      16(%rsp), %r15                                #181.4[spill]
..LN3938:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.533:                       # Preds ..B1.532 ..B1.548 ..B1.554
                                # Execution count [2.04e-01]: Infreq
..LN3939:
	.loc    1  185  is_stmt 1
        xorl      %edi, %edi                                    #185.9
..LN3940:
        testl     %r13d, %r13d                                  #185.20
..LN3941:
        jle       ..B1.546      # Prob 50%                      #185.20
..LN3942:
                                # LOE rdx r12 r14 r15 ebx edi r13d xmm0
..B1.534:                       # Preds ..B1.533
                                # Execution count [1.84e-01]: Infreq
..LN3943:
        cmpl      $64, %r13d                                    #185.5
..LN3944:
        jl        ..B1.562      # Prob 10%                      #185.5
..LN3945:
                                # LOE rdx r12 r14 r15 ebx edi r13d xmm0
..B1.535:                       # Preds ..B1.534
                                # Execution count [1.84e-01]: Infreq
..LN3946:
        movl      128(%rsp), %esi                               #185.5[spill]
..LN3947:
                                # LOE rdx r12 r14 r15 ebx esi r13d xmm0
..B1.537:                       # Preds ..B1.535
                                # Execution count [1.84e-01]: Infreq
..LN3948:
        movq      120(%rsp), %rdi                               #185.5[spill]
..LN3949:
        xorl      %ecx, %ecx                                    #185.5
..LN3950:
                                # LOE rdx rcx rdi r12 r14 r15 ebx esi r13d xmm0
..B1.538:                       # Preds ..B1.538 ..B1.537
                                # Execution count [1.02e+00]: Infreq
..LN3951:
	.loc    1  186  is_stmt 1
        vmovups   (%r14,%rcx,8), %zmm1                          #186.13
..LN3952:
        vmovups   64(%r14,%rcx,8), %zmm2                        #186.13
..LN3953:
        vaddpd    (%r12,%rcx,8), %zmm1, %zmm3                   #186.20
..LN3954:
        vaddpd    64(%r12,%rcx,8), %zmm2, %zmm4                 #186.20
..LN3955:
        vaddpd    (%rdx,%rcx,8), %zmm3, %zmm5                   #186.27
..LN3956:
        vaddpd    64(%rdx,%rcx,8), %zmm4, %zmm6                 #186.27
..LN3957:
        vmovntpd  %zmm5, (%r15,%rcx,8)                          #186.6
..LN3958:
        vmovntpd  %zmm6, 64(%r15,%rcx,8)                        #186.6
..LN3959:
        vmovups   128(%r14,%rcx,8), %zmm7                       #186.13
..LN3960:
        vmovups   192(%r14,%rcx,8), %zmm8                       #186.13
..LN3961:
        vaddpd    128(%r12,%rcx,8), %zmm7, %zmm9                #186.20
..LN3962:
        vaddpd    192(%r12,%rcx,8), %zmm8, %zmm10               #186.20
..LN3963:
        vaddpd    128(%rdx,%rcx,8), %zmm9, %zmm11               #186.27
..LN3964:
        vaddpd    192(%rdx,%rcx,8), %zmm10, %zmm12              #186.27
..LN3965:
        vmovntpd  %zmm11, 128(%r15,%rcx,8)                      #186.6
..LN3966:
        vmovntpd  %zmm12, 192(%r15,%rcx,8)                      #186.6
..LN3967:
        vmovups   256(%r14,%rcx,8), %zmm13                      #186.13
..LN3968:
        vmovups   320(%r14,%rcx,8), %zmm14                      #186.13
..LN3969:
        vaddpd    256(%r12,%rcx,8), %zmm13, %zmm15              #186.20
..LN3970:
        vaddpd    320(%r12,%rcx,8), %zmm14, %zmm16              #186.20
..LN3971:
        vaddpd    256(%rdx,%rcx,8), %zmm15, %zmm17              #186.27
..LN3972:
        vaddpd    320(%rdx,%rcx,8), %zmm16, %zmm18              #186.27
..LN3973:
        vmovntpd  %zmm17, 256(%r15,%rcx,8)                      #186.6
..LN3974:
        vmovntpd  %zmm18, 320(%r15,%rcx,8)                      #186.6
..LN3975:
        vmovups   384(%r14,%rcx,8), %zmm19                      #186.13
..LN3976:
        vmovups   448(%r14,%rcx,8), %zmm20                      #186.13
..LN3977:
        vaddpd    384(%r12,%rcx,8), %zmm19, %zmm21              #186.20
..LN3978:
        vaddpd    448(%r12,%rcx,8), %zmm20, %zmm22              #186.20
..LN3979:
        vaddpd    384(%rdx,%rcx,8), %zmm21, %zmm23              #186.27
..LN3980:
        vaddpd    448(%rdx,%rcx,8), %zmm22, %zmm24              #186.27
..LN3981:
        vmovntpd  %zmm23, 384(%r15,%rcx,8)                      #186.6
..LN3982:
        vmovntpd  %zmm24, 448(%r15,%rcx,8)                      #186.6
..LN3983:
	.loc    1  185  is_stmt 1
        addq      $64, %rcx                                     #185.5
..LN3984:
        cmpq      %rdi, %rcx                                    #185.5
..LN3985:
        jb        ..B1.538      # Prob 82%                      #185.5
..LN3986:
                                # LOE rdx rcx rdi r12 r14 r15 ebx esi r13d xmm0
..B1.539:                       # Preds ..B1.538
                                # Execution count [1.84e-01]: Infreq
..LN3987:
        movl      %esi, %edi                                    #185.36
..LN3988:
                                # LOE rdx r12 r14 r15 ebx esi edi r13d xmm0
..B1.540:                       # Preds ..B1.539 ..B1.562
                                # Execution count [2.04e-01]: Infreq
..LN3989:
        lea       1(%rsi), %ecx                                 #185.5
..LN3990:
        cmpl      %r13d, %ecx                                   #185.5
..LN3991:
        ja        ..B1.546      # Prob 50%                      #185.5
..LN3992:
                                # LOE rdx r12 r14 r15 ebx esi edi r13d xmm0
..B1.541:                       # Preds ..B1.540
                                # Execution count [1.84e-01]: Infreq
..LN3993:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #185.5
..LN3994:
                                # LOE rdx r12 r14 r15 ebx esi r13d xmm0 ymm2
..B1.543:                       # Preds ..B1.541
                                # Execution count [1.84e-01]: Infreq
..LN3995:
        movslq    %esi, %rcx                                    #185.5
..LN3996:
        negl      %esi                                          #185.5
..LN3997:
        addl      %r13d, %esi                                   #185.5
..LN3998:
        movl      $255, %eax                                    #185.5
..LN3999:
        kmovw     %eax, %k1                                     #185.5
..LN4000:
        xorl      %eax, %eax                                    #185.5
..LN4001:
        vmovdqu   64(%rsp), %ymm6                               #185.5[spill]
..LN4002:
        vmovd     %esi, %xmm1                                   #185.5
..LN4003:
        vpbroadcastd %xmm1, %ymm1                               #185.5
..LN4004:
	.loc    1  186  is_stmt 1
        lea       (%r15,%rcx,8), %r9                            #186.6
..LN4005:
	.loc    1  185  is_stmt 1
        movq      112(%rsp), %r10                               #185.5[spill]
..LN4006:
	.loc    1  186  is_stmt 1
        lea       (%rdx,%rcx,8), %r8                            #186.27
..LN4007:
	.loc    1  185  is_stmt 1
        subq      %rcx, %r10                                    #185.5
..LN4008:
	.loc    1  186  is_stmt 1
        lea       (%r12,%rcx,8), %rdi                           #186.20
..LN4009:
        lea       (%r14,%rcx,8), %rsi                           #186.13
..LN4010:
	.loc    1  185  is_stmt 1
        xorl      %ecx, %ecx                                    #185.5
..LN4011:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r12 r14 r15 ebx r13d xmm0 ymm2 ymm6 zmm1 k1
..B1.544:                       # Preds ..B1.544 ..B1.543
                                # Execution count [1.02e+00]: Infreq
..LN4012:
	.loc    1  186  is_stmt 1
        vmovups   (%rcx,%rsi), %zmm3                            #186.13
..LN4013:
	.loc    1  185  is_stmt 1
        addq      $8, %rax                                      #185.5
..LN4014:
	.loc    1  186  is_stmt 1
        vaddpd    (%rcx,%rdi), %zmm3, %zmm4                     #186.20
..LN4015:
        vaddpd    (%rcx,%r8), %zmm4, %zmm5                      #186.27
..LN4016:
	.loc    1  185  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #185.5
..LN4017:
        vpaddd    %ymm6, %ymm2, %ymm2                           #185.5
..LN4018:
	.loc    1  186  is_stmt 1
        vmovupd   %zmm5, (%rcx,%r9){%k2}                        #186.6
..LN4019:
	.loc    1  185  is_stmt 1
        addq      $64, %rcx                                     #185.5
..LN4020:
        cmpq      %r10, %rax                                    #185.5
..LN4021:
        jb        ..B1.544      # Prob 82%                      #185.5
..LN4022:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r12 r14 r15 ebx r13d xmm0 ymm2 ymm6 zmm1 k1
..B1.545:                       # Preds ..B1.544
                                # Execution count [1.84e-01]: Infreq
..LN4023:
        movl      %r13d, %edi                                   #185.36
..LN4024:
                                # LOE rdx r12 r14 r15 ebx edi r13d xmm0
..B1.546:                       # Preds ..B1.545 ..B1.540 ..B1.533
                                # Execution count [2.04e-01]: Infreq
..LN4025:
	.loc    1  188  is_stmt 1
        movslq    %edi, %rdi                                    #188.8
..LN4026:
        vcomisd   (%r15,%rdi,8), %xmm0                          #188.13
..LN4027:
        jbe       ..B1.548      # Prob 78%                      #188.13
..LN4028:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.547:                       # Preds ..B1.546
                                # Execution count [4.49e-02]: Infreq
..LN4029:
        movl      $il0_peep_printf_format_7, %edi               #188.16
..LN4030:
        movq      %rdx, 48(%rsp)                                #188.16[spill]
..LN4031:
        vzeroupper                                              #188.16
..LN4032:
        call      puts                                          #188.16
..LN4033:
                                # LOE r12 r14 r15 ebx r13d
..B1.743:                       # Preds ..B1.547
                                # Execution count [4.49e-02]: Infreq
..LN4034:
        movq      48(%rsp), %rdx                                #[spill]
..LN4035:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4036:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.548:                       # Preds ..B1.546 ..B1.743
                                # Execution count [2.04e-01]: Infreq
..LN4037:
	.loc    1  181  is_stmt 1
        incl      %ebx                                          #181.4
..LN4038:
        cmpl      184(%rsp), %ebx                               #181.4[spill]
..LN4039:
        jb        ..B1.533      # Prob 81%                      #181.4
..LN4040:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.549:                       # Preds ..B1.548
                                # Execution count [3.74e-02]: Infreq
..LN4041:
        movl      %r13d, 192(%rsp)                              #[spill]
..LN4042:
        movq      %rdx, %rbx                                    #
..LN4043:
        movq      %r12, %r13                                    #
..LN4044:
        movq      %r14, %r12                                    #
..LN4045:
        movl      184(%rsp), %r14d                              #[spill]
..LN4046:
                                # LOE rbx r12 r13 r15 r14d
..B1.550:                       # Preds ..B1.553 ..B1.549
                                # Execution count [4.08e-02]: Infreq
..LN4047:
	.loc    1  191  is_stmt 1
        vzeroupper                                              #191.4
..LN4048:
        lea       96(%rsp), %rdi                                #191.4
..LN4049:
        lea       40(%rsp), %rsi                                #191.4
..___tag_value_main.103:
..LN4050:
#       timing(double *, double *)
        call      timing                                        #191.4
..___tag_value_main.104:
..LN4051:
                                # LOE rbx r12 r13 r15 r14d
..B1.551:                       # Preds ..B1.550
                                # Execution count [4.08e-02]: Infreq
..LN4052:
	.loc    1  178  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #178.11
..LN4053:
	.loc    1  192  is_stmt 1
        addl      %r14d, %r14d                                  #192.4
..LN4054:
	.loc    1  178  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #178.24
..LN4055:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #178.15
..LN4056:
        vcomisd   %xmm1, %xmm0                                  #178.24
..LN4057:
        jbe       ..B1.555      # Prob 18%                      #178.24
..LN4058:
                                # LOE rbx r12 r13 r15 r14d
..B1.552:                       # Preds ..B1.551
                                # Execution count [3.34e-02]: Infreq
..LN4059:
	.loc    1  180  is_stmt 1
        lea       56(%rsp), %rdi                                #180.4
..LN4060:
        lea       40(%rsp), %rsi                                #180.4
..___tag_value_main.105:
..LN4061:
#       timing(double *, double *)
        call      timing                                        #180.4
..___tag_value_main.106:
..LN4062:
                                # LOE rbx r12 r13 r15 r14d
..B1.553:                       # Preds ..B1.552
                                # Execution count [3.34e-02]: Infreq
..LN4063:
	.loc    1  181  is_stmt 1
        xorl      %eax, %eax                                    #181.4
..LN4064:
        testl     %r14d, %r14d                                  #181.19
..LN4065:
        jle       ..B1.550      # Prob 9%                       #181.19
..LN4066:
                                # LOE rbx r12 r13 r15 eax r14d
..B1.554:                       # Preds ..B1.553
                                # Execution count [3.01e-02]: Infreq
..LN4067:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN4068:
        movq      %rbx, %rdx                                    #
..LN4069:
        movl      %eax, %ebx                                    #
..LN4070:
        movq      %r12, %r14                                    #
..LN4071:
        movq      %r13, %r12                                    #
..LN4072:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4073:
        movl      192(%rsp), %r13d                              #[spill]
..LN4074:
        jmp       ..B1.533      # Prob 100%                     #
..LN4075:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.555:                       # Preds ..B1.551
                                # Execution count [7.34e-03]: Infreq
..LN4076:
        movq      %r13, 24(%rsp)                                #[spill]
..LN4077:
        movq      %r12, 32(%rsp)                                #[spill]
..LN4078:
        movq      %r15, 16(%rsp)                                #[spill]
..LN4079:
        movl      (%rsp), %r12d                                 #[spill]
..LN4080:
        movq      8(%rsp), %r15                                 #[spill]
..LN4081:
        movl      192(%rsp), %r13d                              #[spill]
..LN4082:
                                # LOE rbx r15 r12d r13d r14d
..B1.556:                       # Preds ..B1.555 ..B1.530
                                # Execution count [8.16e-03]: Infreq
..LN4083:
	.loc    1  195  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #195.3
..___tag_value_main.107:
..LN4084:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #195.3
..___tag_value_main.108:
..LN4085:
                                # LOE rbx r15 r12d r13d r14d
..B1.557:                       # Preds ..B1.556
                                # Execution count [8.16e-03]: Infreq
..LN4086:
	.loc    1  197  is_stmt 1
        movl      %r14d, %r8d                                   #197.3
..LN4087:
        shrl      $31, %r8d                                     #197.3
..LN4088:
        addl      %r8d, %r14d                                   #197.3
..LN4089:
        sarl      $1, %r14d                                     #197.3
..___tag_value_main.109:
..LN4090:
	.loc    1  200  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #200.3
..___tag_value_main.110:
..LN4091:
                                # LOE rbx r15 r12d r13d r14d
..B1.558:                       # Preds ..B1.557
                                # Execution count [8.16e-03]: Infreq
..LN4092:
	.loc    1  202  is_stmt 1
        movq      16(%rsp), %rdi                                #202.3[spill]
..LN4093:
#       _mm_free(void *)
        call      _mm_free                                      #202.3
..LN4094:
                                # LOE rbx r15 r12d r13d r14d
..B1.559:                       # Preds ..B1.558
                                # Execution count [8.16e-03]: Infreq
..LN4095:
	.loc    1  203  is_stmt 1
        movq      32(%rsp), %rdi                                #203.3[spill]
..LN4096:
#       _mm_free(void *)
        call      _mm_free                                      #203.3
..LN4097:
                                # LOE rbx r15 r12d r13d r14d
..B1.560:                       # Preds ..B1.559
                                # Execution count [8.16e-03]: Infreq
..LN4098:
	.loc    1  204  is_stmt 1
        movq      24(%rsp), %rdi                                #204.3[spill]
..LN4099:
#       _mm_free(void *)
        call      _mm_free                                      #204.3
..LN4100:
                                # LOE rbx r15 r12d r13d r14d
..B1.561:                       # Preds ..B1.560
                                # Execution count [8.16e-03]: Infreq
..LN4101:
	.loc    1  205  is_stmt 1
        movq      %rbx, %rdi                                    #205.3
..LN4102:
#       _mm_free(void *)
        call      _mm_free                                      #205.3
..LN4103:
        jmp       ..B1.18       # Prob 100%                     #205.3
..LN4104:
                                # LOE r15 r12d r13d r14d
..B1.562:                       # Preds ..B1.534
                                # Execution count [1.84e-02]: Infreq
..LN4105:
	.loc    1  185  is_stmt 1
        xorl      %esi, %esi                                    #185.5
..LN4106:
        jmp       ..B1.540      # Prob 100%                     #185.5
..LN4107:
                                # LOE rdx r12 r14 r15 ebx esi edi r13d xmm0
..B1.563:                       # Preds ..B1.515
                                # Execution count [7.34e-04]: Infreq
..LN4108:
	.loc    1  167  is_stmt 1
        xorl      %eax, %eax                                    #167.3
..LN4109:
        jmp       ..B1.525      # Prob 100%                     #167.3
..LN4110:
                                # LOE rbx r15 eax r12d r13d
..B1.564:                       # Preds ..B1.9
                                # Execution count [8.16e-03]: Infreq
..LN4111:
	.loc    1  114  is_stmt 1
        movq      %rbx, %rdi                                    #114.16
..LN4112:
        movq      %r15, %rsi                                    #114.16
..LN4113:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #114.16
..LN4114:
                                # LOE rax rbx r15 r12d r13d
..B1.736:                       # Preds ..B1.564
                                # Execution count [8.16e-03]: Infreq
..LN4115:
        movq      %rax, 16(%rsp)                                #114.16[spill]
..LN4116:
                                # LOE rbx r15 r12d r13d
..B1.565:                       # Preds ..B1.736
                                # Execution count [8.16e-03]: Infreq
..LN4117:
	.loc    1  115  is_stmt 1
        movq      %rbx, %rdi                                    #115.16
..LN4118:
        movq      %r15, %rsi                                    #115.16
..LN4119:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #115.16
..LN4120:
                                # LOE rax rbx r15 r12d r13d
..B1.737:                       # Preds ..B1.565
                                # Execution count [8.16e-03]: Infreq
..LN4121:
        movq      %rax, 24(%rsp)                                #115.16[spill]
..LN4122:
                                # LOE rbx r15 r12d r13d
..B1.566:                       # Preds ..B1.737
                                # Execution count [8.16e-03]: Infreq
..LN4123:
	.loc    1  116  is_stmt 1
        movq      %rbx, %rdi                                    #116.16
..LN4124:
        movq      %r15, %rsi                                    #116.16
..LN4125:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #116.16
..LN4126:
                                # LOE rax r15 r12d r13d
..B1.738:                       # Preds ..B1.566
                                # Execution count [8.16e-03]: Infreq
..LN4127:
        movq      %rax, %rbx                                    #116.16
..LN4128:
                                # LOE rbx r15 r12d r13d
..B1.567:                       # Preds ..B1.738
                                # Execution count [8.16e-03]: Infreq
..LN4129:
	.loc    1  118  is_stmt 1
        testl     %r13d, %r13d                                  #118.18
..LN4130:
        jle       ..B1.583      # Prob 50%                      #118.18
..LN4131:
                                # LOE rbx r15 r12d r13d
..B1.568:                       # Preds ..B1.567
                                # Execution count [7.34e-03]: Infreq
..LN4132:
        movq      %rbx, %r10                                    #118.3
..LN4133:
        andq      $63, %r10                                     #118.3
..LN4134:
        testl     %r10d, %r10d                                  #118.3
..LN4135:
        je        ..B1.571      # Prob 50%                      #118.3
..LN4136:
                                # LOE rbx r15 r10d r12d r13d
..B1.569:                       # Preds ..B1.568
                                # Execution count [7.34e-03]: Infreq
..LN4137:
        testl     $7, %r10d                                     #118.3
..LN4138:
        jne       ..B1.616      # Prob 10%                      #118.3
..LN4139:
                                # LOE rbx r15 r10d r12d r13d
..B1.570:                       # Preds ..B1.569
                                # Execution count [0.00e+00]: Infreq
..LN4140:
        negl      %r10d                                         #118.3
..LN4141:
        addl      $64, %r10d                                    #118.3
..LN4142:
        shrl      $3, %r10d                                     #118.3
..LN4143:
        cmpl      %r10d, %r13d                                  #118.3
..LN4144:
        cmovl     %r13d, %r10d                                  #118.3
..LN4145:
                                # LOE rbx r15 r10d r12d r13d
..B1.571:                       # Preds ..B1.570 ..B1.568
                                # Execution count [8.16e-03]: Infreq
..LN4146:
        movl      %r13d, %eax                                   #118.3
..LN4147:
        subl      %r10d, %eax                                   #118.3
..LN4148:
        andl      $7, %eax                                      #118.3
..LN4149:
        negl      %eax                                          #118.3
..LN4150:
        addl      %r13d, %eax                                   #118.3
..LN4151:
        cmpl      $1, %r10d                                     #118.3
..LN4152:
        jb        ..B1.575      # Prob 50%                      #118.3
..LN4153:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.572:                       # Preds ..B1.571
                                # Execution count [7.34e-03]: Infreq
..LN4154:
        movl      $255, %edx                                    #118.3
..LN4155:
        vmovd     %r10d, %xmm0                                  #118.3
..LN4156:
        kmovw     %edx, %k1                                     #118.3
..LN4157:
        movl      $8, %edx                                      #118.3
..LN4158:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #118.3
..LN4159:
	.loc    1  119  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #119.11
..LN4160:
	.loc    1  120  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #120.11
..LN4161:
	.loc    1  118  is_stmt 1
        vmovd     %edx, %xmm5                                   #118.3
..LN4162:
	.loc    1  121  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #121.11
..LN4163:
	.loc    1  118  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #118.3
..LN4164:
        xorl      %r9d, %r9d                                    #118.3
..LN4165:
        vpbroadcastd %xmm5, %ymm5                               #118.3
..LN4166:
        xorl      %edx, %edx                                    #118.3
..LN4167:
        movslq    %r10d, %r8                                    #118.3
..LN4168:
        movq      24(%rsp), %r11                                #118.3[spill]
..LN4169:
        movq      16(%rsp), %rcx                                #118.3[spill]
..LN4170:
                                # LOE rdx rcx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.573:                       # Preds ..B1.573 ..B1.572
                                # Execution count [4.08e-02]: Infreq
..LN4171:
        addq      $8, %r9                                       #118.3
..LN4172:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #118.3
..LN4173:
        vpaddd    %ymm5, %ymm4, %ymm4                           #118.3
..LN4174:
	.loc    1  119  is_stmt 1
        vmovupd   %zmm3, (%rdx,%rcx){%k2}                       #119.4
..LN4175:
	.loc    1  120  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r11){%k2}                       #120.4
..LN4176:
	.loc    1  121  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rbx){%k2}                       #121.4
..LN4177:
	.loc    1  118  is_stmt 1
        addq      $64, %rdx                                     #118.3
..LN4178:
        cmpq      %r8, %r9                                      #118.3
..LN4179:
        jb        ..B1.573      # Prob 81%                      #118.3
..LN4180:
                                # LOE rdx rcx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.574:                       # Preds ..B1.573
                                # Execution count [7.34e-03]: Infreq
..LN4181:
        cmpl      %r10d, %r13d                                  #118.3
..LN4182:
        je        ..B1.583      # Prob 10%                      #118.3
..LN4183:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.575:                       # Preds ..B1.574 ..B1.571
                                # Execution count [0.00e+00]: Infreq
..LN4184:
        lea       8(%r10), %edx                                 #118.3
..LN4185:
        cmpl      %edx, %eax                                    #118.3
..LN4186:
        jl        ..B1.579      # Prob 50%                      #118.3
..LN4187:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.576:                       # Preds ..B1.575
                                # Execution count [7.34e-03]: Infreq
..LN4188:
        movslq    %r10d, %r10                                   #118.3
..LN4189:
	.loc    1  119  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #119.11
..LN4190:
	.loc    1  120  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #120.11
..LN4191:
	.loc    1  121  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm0             #121.11
..LN4192:
	.loc    1  118  is_stmt 1
        movslq    %eax, %rdx                                    #118.3
..LN4193:
        movq      24(%rsp), %r8                                 #118.3[spill]
..LN4194:
        movq      16(%rsp), %r9                                 #118.3[spill]
..LN4195:
                                # LOE rdx rbx r8 r9 r10 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.577:                       # Preds ..B1.577 ..B1.576
                                # Execution count [4.08e-02]: Infreq
..LN4196:
	.loc    1  119  is_stmt 1
        vmovupd   %zmm2, (%r9,%r10,8)                           #119.4
..LN4197:
	.loc    1  120  is_stmt 1
        vmovupd   %zmm1, (%r8,%r10,8)                           #120.4
..LN4198:
	.loc    1  121  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r10,8)                          #121.4
..LN4199:
	.loc    1  118  is_stmt 1
        addq      $8, %r10                                      #118.3
..LN4200:
        cmpq      %rdx, %r10                                    #118.3
..LN4201:
        jb        ..B1.577      # Prob 81%                      #118.3
..LN4202:
                                # LOE rdx rbx r8 r9 r10 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.579:                       # Preds ..B1.577 ..B1.575 ..B1.616
                                # Execution count [8.16e-03]: Infreq
..LN4203:
        lea       1(%rax), %edx                                 #118.3
..LN4204:
        cmpl      %r13d, %edx                                   #118.3
..LN4205:
        ja        ..B1.583      # Prob 50%                      #118.3
..LN4206:
                                # LOE rbx r15 eax r12d r13d
..B1.580:                       # Preds ..B1.579
                                # Execution count [7.34e-03]: Infreq
..LN4207:
        movslq    %eax, %rcx                                    #118.3
..LN4208:
        negl      %eax                                          #118.3
..LN4209:
        addl      %r13d, %eax                                   #118.3
..LN4210:
        movl      $8, %r9d                                      #118.3
..LN4211:
        movl      $255, %edx                                    #118.3
..LN4212:
        xorl      %r11d, %r11d                                  #118.3
..LN4213:
        kmovw     %edx, %k1                                     #118.3
..LN4214:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #118.3
..LN4215:
        vmovd     %eax, %xmm0                                   #118.3
..LN4216:
        vmovd     %r9d, %xmm5                                   #118.3
..LN4217:
	.loc    1  119  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #119.11
..LN4218:
	.loc    1  120  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #120.11
..LN4219:
	.loc    1  121  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #121.11
..LN4220:
	.loc    1  120  is_stmt 1
        movq      24(%rsp), %r8                                 #120.4[spill]
..LN4221:
	.loc    1  121  is_stmt 1
        lea       (%rbx,%rcx,8), %r9                            #121.4
..LN4222:
	.loc    1  119  is_stmt 1
        movq      16(%rsp), %rdx                                #119.4[spill]
..LN4223:
	.loc    1  118  is_stmt 1
        xorl      %eax, %eax                                    #118.3
..LN4224:
        vpbroadcastd %xmm0, %ymm0                               #118.3
..LN4225:
        movq      112(%rsp), %r10                               #118.3[spill]
..LN4226:
	.loc    1  120  is_stmt 1
        lea       (%r8,%rcx,8), %r8                             #120.4
..LN4227:
	.loc    1  118  is_stmt 1
        vpbroadcastd %xmm5, %ymm5                               #118.3
..LN4228:
        subq      %rcx, %r10                                    #118.3
..LN4229:
	.loc    1  119  is_stmt 1
        lea       (%rdx,%rcx,8), %rdx                           #119.4
..LN4230:
                                # LOE rax rdx rbx r8 r9 r10 r11 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.581:                       # Preds ..B1.581 ..B1.580
                                # Execution count [4.08e-02]: Infreq
..LN4231:
	.loc    1  118  is_stmt 1
        addq      $8, %r11                                      #118.3
..LN4232:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #118.3
..LN4233:
        vpaddd    %ymm5, %ymm4, %ymm4                           #118.3
..LN4234:
	.loc    1  119  is_stmt 1
        vmovupd   %zmm3, (%rax,%rdx){%k2}                       #119.4
..LN4235:
	.loc    1  120  is_stmt 1
        vmovupd   %zmm2, (%rax,%r8){%k2}                        #120.4
..LN4236:
	.loc    1  121  is_stmt 1
        vmovupd   %zmm1, (%rax,%r9){%k2}                        #121.4
..LN4237:
	.loc    1  118  is_stmt 1
        addq      $64, %rax                                     #118.3
..LN4238:
        cmpq      %r10, %r11                                    #118.3
..LN4239:
        jb        ..B1.581      # Prob 81%                      #118.3
..LN4240:
                                # LOE rax rdx rbx r8 r9 r10 r11 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.583:                       # Preds ..B1.581 ..B1.574 ..B1.567 ..B1.579
                                # Execution count [8.16e-03]: Infreq
..LN4241:
	.loc    1  126  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #126.3
..LN4242:
	.loc    1  124  is_stmt 1
        movl      $1, %r14d                                     #124.3
..LN4243:
	.loc    1  126  is_stmt 1
        vzeroupper                                              #126.3
..___tag_value_main.111:
..LN4244:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #126.3
..___tag_value_main.112:
..LN4245:
                                # LOE rbx r15 r12d r13d r14d
..B1.584:                       # Preds ..B1.583
                                # Execution count [8.16e-03]: Infreq
..LN4246:
	.loc    1  128  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #128.11
..LN4247:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #128.24
..LN4248:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #128.15
..LN4249:
        vcomisd   %xmm1, %xmm0                                  #128.24
..LN4250:
        jbe       ..B1.610      # Prob 10%                      #128.24
..LN4251:
                                # LOE rbx r15 r12d r13d r14d
..B1.585:                       # Preds ..B1.584
                                # Execution count [7.34e-03]: Infreq
..LN4252:
	.loc    1  135  is_stmt 1
        movl      $8, %r8d                                      #135.5
..LN4253:
        movl      %r13d, %edx                                   #135.5
..LN4254:
        andl      $-64, %edx                                    #135.5
..LN4255:
	.loc    1  130  is_stmt 1
        lea       56(%rsp), %rdi                                #130.4
..LN4256:
	.loc    1  135  is_stmt 1
        movl      %edx, -8(%rdi)                                #135.5[spill]
..LN4257:
	.loc    1  130  is_stmt 1
        lea       40(%rsp), %rsi                                #130.4
..LN4258:
	.loc    1  135  is_stmt 1
        movslq    %edx, %rdx                                    #135.5
..LN4259:
        vmovd     %r8d, %xmm0                                   #135.5
..LN4260:
        vpbroadcastd %xmm0, %ymm1                               #135.5
..LN4261:
        vmovdqu   %ymm1, 24(%rsi)                               #135.5[spill]
..LN4262:
        movq      %rdx, -8(%rsi)                                #135.5[spill]
..LN4263:
	.loc    1  130  is_stmt 1
        vzeroupper                                              #130.4
..___tag_value_main.113:
..LN4264:
#       timing(double *, double *)
        call      timing                                        #130.4
..___tag_value_main.114:
..LN4265:
                                # LOE rbx r15 r12d r13d r14d
..B1.586:                       # Preds ..B1.585
                                # Execution count [6.61e-03]: Infreq
..LN4266:
	.loc    1  131  is_stmt 1
        xorl      %eax, %eax                                    #131.4
..LN4267:
        movl      %r12d, (%rsp)                                 #131.4[spill]
..LN4268:
        vxorpd    %xmm0, %xmm0, %xmm0                           #131.4
..LN4269:
        movq      %r15, 8(%rsp)                                 #131.4[spill]
..LN4270:
        movl      %r14d, 184(%rsp)                              #131.4[spill]
..LN4271:
        movl      %eax, %r14d                                   #131.4
..LN4272:
        movq      24(%rsp), %r15                                #131.4[spill]
..LN4273:
        movq      16(%rsp), %r12                                #131.4[spill]
..LN4274:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.587:                       # Preds ..B1.586 ..B1.602 ..B1.608
                                # Execution count [2.04e-01]: Infreq
..LN4275:
	.loc    1  135  is_stmt 1
        xorl      %r8d, %r8d                                    #135.9
..LN4276:
        testl     %r13d, %r13d                                  #135.20
..LN4277:
        jle       ..B1.600      # Prob 50%                      #135.20
..LN4278:
                                # LOE rbx r12 r15 r8d r13d r14d xmm0
..B1.588:                       # Preds ..B1.587
                                # Execution count [1.84e-01]: Infreq
..LN4279:
        cmpl      $64, %r13d                                    #135.5
..LN4280:
        jl        ..B1.615      # Prob 10%                      #135.5
..LN4281:
                                # LOE rbx r12 r15 r8d r13d r14d xmm0
..B1.589:                       # Preds ..B1.588
                                # Execution count [1.84e-01]: Infreq
..LN4282:
        movl      48(%rsp), %ecx                                #135.5[spill]
..LN4283:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.591:                       # Preds ..B1.589
                                # Execution count [1.84e-01]: Infreq
..LN4284:
        movq      32(%rsp), %r8                                 #135.5[spill]
..LN4285:
        xorl      %edx, %edx                                    #135.5
..LN4286:
                                # LOE rdx rbx r8 r12 r15 ecx r13d r14d xmm0
..B1.592:                       # Preds ..B1.592 ..B1.591
                                # Execution count [1.02e+00]: Infreq
..LN4287:
	.loc    1  136  is_stmt 1
        vmovups   (%r15,%rdx,8), %zmm1                          #136.13
..LN4288:
        vmovups   64(%r15,%rdx,8), %zmm2                        #136.13
..LN4289:
        vaddpd    (%rbx,%rdx,8), %zmm1, %zmm3                   #136.20
..LN4290:
        vaddpd    64(%rbx,%rdx,8), %zmm2, %zmm4                 #136.20
..LN4291:
        vmovntpd  %zmm3, (%r12,%rdx,8)                          #136.6
..LN4292:
        vmovntpd  %zmm4, 64(%r12,%rdx,8)                        #136.6
..LN4293:
        vmovups   128(%r15,%rdx,8), %zmm5                       #136.13
..LN4294:
        vmovups   192(%r15,%rdx,8), %zmm6                       #136.13
..LN4295:
        vaddpd    128(%rbx,%rdx,8), %zmm5, %zmm7                #136.20
..LN4296:
        vaddpd    192(%rbx,%rdx,8), %zmm6, %zmm8                #136.20
..LN4297:
        vmovntpd  %zmm7, 128(%r12,%rdx,8)                       #136.6
..LN4298:
        vmovntpd  %zmm8, 192(%r12,%rdx,8)                       #136.6
..LN4299:
        vmovups   256(%r15,%rdx,8), %zmm9                       #136.13
..LN4300:
        vmovups   320(%r15,%rdx,8), %zmm10                      #136.13
..LN4301:
        vaddpd    256(%rbx,%rdx,8), %zmm9, %zmm11               #136.20
..LN4302:
        vaddpd    320(%rbx,%rdx,8), %zmm10, %zmm12              #136.20
..LN4303:
        vmovntpd  %zmm11, 256(%r12,%rdx,8)                      #136.6
..LN4304:
        vmovntpd  %zmm12, 320(%r12,%rdx,8)                      #136.6
..LN4305:
        vmovups   384(%r15,%rdx,8), %zmm13                      #136.13
..LN4306:
        vmovups   448(%r15,%rdx,8), %zmm14                      #136.13
..LN4307:
        vaddpd    384(%rbx,%rdx,8), %zmm13, %zmm15              #136.20
..LN4308:
        vaddpd    448(%rbx,%rdx,8), %zmm14, %zmm16              #136.20
..LN4309:
        vmovntpd  %zmm15, 384(%r12,%rdx,8)                      #136.6
..LN4310:
        vmovntpd  %zmm16, 448(%r12,%rdx,8)                      #136.6
..LN4311:
	.loc    1  135  is_stmt 1
        addq      $64, %rdx                                     #135.5
..LN4312:
        cmpq      %r8, %rdx                                     #135.5
..LN4313:
        jb        ..B1.592      # Prob 82%                      #135.5
..LN4314:
                                # LOE rdx rbx r8 r12 r15 ecx r13d r14d xmm0
..B1.593:                       # Preds ..B1.592
                                # Execution count [1.84e-01]: Infreq
..LN4315:
        movl      %ecx, %r8d                                    #135.36
..LN4316:
                                # LOE rbx r12 r15 ecx r8d r13d r14d xmm0
..B1.594:                       # Preds ..B1.593 ..B1.615
                                # Execution count [2.04e-01]: Infreq
..LN4317:
        lea       1(%rcx), %edx                                 #135.5
..LN4318:
        cmpl      %r13d, %edx                                   #135.5
..LN4319:
        ja        ..B1.600      # Prob 50%                      #135.5
..LN4320:
                                # LOE rbx r12 r15 ecx r8d r13d r14d xmm0
..B1.595:                       # Preds ..B1.594
                                # Execution count [1.84e-01]: Infreq
..LN4321:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #135.5
..LN4322:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0 ymm2
..B1.597:                       # Preds ..B1.595
                                # Execution count [1.84e-01]: Infreq
..LN4323:
        movslq    %ecx, %rdx                                    #135.5
..LN4324:
        negl      %ecx                                          #135.5
..LN4325:
        addl      %r13d, %ecx                                   #135.5
..LN4326:
        movl      $255, %eax                                    #135.5
..LN4327:
        xorl      %r11d, %r11d                                  #135.5
..LN4328:
        movq      112(%rsp), %r10                               #135.5[spill]
..LN4329:
        vmovdqu   64(%rsp), %ymm5                               #135.5[spill]
..LN4330:
        subq      %rdx, %r10                                    #135.5
..LN4331:
        vmovd     %ecx, %xmm1                                   #135.5
..LN4332:
        kmovw     %eax, %k1                                     #135.5
..LN4333:
        vpbroadcastd %xmm1, %ymm1                               #135.5
..LN4334:
	.loc    1  136  is_stmt 1
        lea       (%r12,%rdx,8), %r9                            #136.6
..LN4335:
        lea       (%rbx,%rdx,8), %r8                            #136.20
..LN4336:
        lea       (%r15,%rdx,8), %rcx                           #136.13
..LN4337:
	.loc    1  135  is_stmt 1
        xorl      %edx, %edx                                    #135.5
..LN4338:
                                # LOE rdx rcx rbx r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm5 zmm1 k1
..B1.598:                       # Preds ..B1.598 ..B1.597
                                # Execution count [1.02e+00]: Infreq
..LN4339:
	.loc    1  136  is_stmt 1
        vmovups   (%rdx,%rcx), %zmm3                            #136.13
..LN4340:
	.loc    1  135  is_stmt 1
        addq      $8, %r11                                      #135.5
..LN4341:
	.loc    1  136  is_stmt 1
        vaddpd    (%rdx,%r8), %zmm3, %zmm4                      #136.20
..LN4342:
	.loc    1  135  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #135.5
..LN4343:
        vpaddd    %ymm5, %ymm2, %ymm2                           #135.5
..LN4344:
	.loc    1  136  is_stmt 1
        vmovupd   %zmm4, (%rdx,%r9){%k2}                        #136.6
..LN4345:
	.loc    1  135  is_stmt 1
        addq      $64, %rdx                                     #135.5
..LN4346:
        cmpq      %r10, %r11                                    #135.5
..LN4347:
        jb        ..B1.598      # Prob 82%                      #135.5
..LN4348:
                                # LOE rdx rcx rbx r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm5 zmm1 k1
..B1.599:                       # Preds ..B1.598
                                # Execution count [1.84e-01]: Infreq
..LN4349:
        movl      %r13d, %r8d                                   #135.36
..LN4350:
                                # LOE rbx r12 r15 r8d r13d r14d xmm0
..B1.600:                       # Preds ..B1.599 ..B1.594 ..B1.587
                                # Execution count [2.04e-01]: Infreq
..LN4351:
	.loc    1  138  is_stmt 1
        movslq    %r8d, %r8                                     #138.8
..LN4352:
        vcomisd   (%r12,%r8,8), %xmm0                           #138.13
..LN4353:
        jbe       ..B1.602      # Prob 78%                      #138.13
..LN4354:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.601:                       # Preds ..B1.600
                                # Execution count [4.49e-02]: Infreq
..LN4355:
        movl      $il0_peep_printf_format_8, %edi               #138.16
..LN4356:
        vzeroupper                                              #138.16
..LN4357:
        call      puts                                          #138.16
..LN4358:
                                # LOE rbx r12 r15 r13d r14d
..B1.742:                       # Preds ..B1.601
                                # Execution count [4.49e-02]: Infreq
..LN4359:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4360:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.602:                       # Preds ..B1.600 ..B1.742
                                # Execution count [2.04e-01]: Infreq
..LN4361:
	.loc    1  131  is_stmt 1
        incl      %r14d                                         #131.4
..LN4362:
        cmpl      184(%rsp), %r14d                              #131.4[spill]
..LN4363:
        jb        ..B1.587      # Prob 81%                      #131.4
..LN4364:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.603:                       # Preds ..B1.602
                                # Execution count [3.74e-02]: Infreq
..LN4365:
        movl      184(%rsp), %r14d                              #[spill]
..LN4366:
                                # LOE rbx r12 r15 r13d r14d
..B1.604:                       # Preds ..B1.607 ..B1.603
                                # Execution count [4.08e-02]: Infreq
..LN4367:
	.loc    1  141  is_stmt 1
        vzeroupper                                              #141.4
..LN4368:
        lea       96(%rsp), %rdi                                #141.4
..LN4369:
        lea       40(%rsp), %rsi                                #141.4
..___tag_value_main.115:
..LN4370:
#       timing(double *, double *)
        call      timing                                        #141.4
..___tag_value_main.116:
..LN4371:
                                # LOE rbx r12 r15 r13d r14d
..B1.605:                       # Preds ..B1.604
                                # Execution count [4.08e-02]: Infreq
..LN4372:
	.loc    1  128  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #128.11
..LN4373:
	.loc    1  142  is_stmt 1
        addl      %r14d, %r14d                                  #142.4
..LN4374:
	.loc    1  128  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #128.24
..LN4375:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #128.15
..LN4376:
        vcomisd   %xmm1, %xmm0                                  #128.24
..LN4377:
        jbe       ..B1.609      # Prob 18%                      #128.24
..LN4378:
                                # LOE rbx r12 r15 r13d r14d
..B1.606:                       # Preds ..B1.605
                                # Execution count [3.34e-02]: Infreq
..LN4379:
	.loc    1  130  is_stmt 1
        lea       56(%rsp), %rdi                                #130.4
..LN4380:
        lea       40(%rsp), %rsi                                #130.4
..___tag_value_main.117:
..LN4381:
#       timing(double *, double *)
        call      timing                                        #130.4
..___tag_value_main.118:
..LN4382:
                                # LOE rbx r12 r15 r13d r14d
..B1.607:                       # Preds ..B1.606
                                # Execution count [3.34e-02]: Infreq
..LN4383:
	.loc    1  131  is_stmt 1
        xorl      %eax, %eax                                    #131.4
..LN4384:
        testl     %r14d, %r14d                                  #131.19
..LN4385:
        jle       ..B1.604      # Prob 9%                       #131.19
..LN4386:
                                # LOE rbx r12 r15 eax r13d r14d
..B1.608:                       # Preds ..B1.607
                                # Execution count [3.01e-02]: Infreq
..LN4387:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN4388:
        movl      %eax, %r14d                                   #
..LN4389:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4390:
        jmp       ..B1.587      # Prob 100%                     #
..LN4391:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.609:                       # Preds ..B1.605
                                # Execution count [7.34e-03]: Infreq
..LN4392:
        movl      (%rsp), %r12d                                 #[spill]
..LN4393:
        movq      8(%rsp), %r15                                 #[spill]
..LN4394:
                                # LOE rbx r15 r12d r13d r14d
..B1.610:                       # Preds ..B1.609 ..B1.584
                                # Execution count [8.16e-03]: Infreq
..LN4395:
	.loc    1  145  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #145.3
..___tag_value_main.119:
..LN4396:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #145.3
..___tag_value_main.120:
..LN4397:
                                # LOE rbx r15 r12d r13d r14d
..B1.611:                       # Preds ..B1.610
                                # Execution count [8.16e-03]: Infreq
..LN4398:
	.loc    1  147  is_stmt 1
        movl      %r14d, %edx                                   #147.3
..LN4399:
        shrl      $31, %edx                                     #147.3
..LN4400:
        addl      %edx, %r14d                                   #147.3
..LN4401:
        sarl      $1, %r14d                                     #147.3
..___tag_value_main.121:
..LN4402:
	.loc    1  150  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #150.3
..___tag_value_main.122:
..LN4403:
                                # LOE rbx r15 r12d r13d r14d
..B1.612:                       # Preds ..B1.611
                                # Execution count [8.16e-03]: Infreq
..LN4404:
	.loc    1  152  is_stmt 1
        movq      16(%rsp), %rdi                                #152.3[spill]
..LN4405:
#       _mm_free(void *)
        call      _mm_free                                      #152.3
..LN4406:
                                # LOE rbx r15 r12d r13d r14d
..B1.613:                       # Preds ..B1.612
                                # Execution count [8.16e-03]: Infreq
..LN4407:
	.loc    1  153  is_stmt 1
        movq      24(%rsp), %rdi                                #153.3[spill]
..LN4408:
#       _mm_free(void *)
        call      _mm_free                                      #153.3
..LN4409:
                                # LOE rbx r15 r12d r13d r14d
..B1.614:                       # Preds ..B1.613
                                # Execution count [8.16e-03]: Infreq
..LN4410:
	.loc    1  154  is_stmt 1
        movq      %rbx, %rdi                                    #154.3
..LN4411:
#       _mm_free(void *)
        call      _mm_free                                      #154.3
..LN4412:
        jmp       ..B1.18       # Prob 100%                     #154.3
..LN4413:
                                # LOE r15 r12d r13d r14d
..B1.615:                       # Preds ..B1.588
                                # Execution count [1.84e-02]: Infreq
..LN4414:
	.loc    1  135  is_stmt 1
        xorl      %ecx, %ecx                                    #135.5
..LN4415:
        jmp       ..B1.594      # Prob 100%                     #135.5
..LN4416:
                                # LOE rbx r12 r15 ecx r8d r13d r14d xmm0
..B1.616:                       # Preds ..B1.569
                                # Execution count [7.34e-04]: Infreq
..LN4417:
	.loc    1  118  is_stmt 1
        xorl      %eax, %eax                                    #118.3
..LN4418:
        jmp       ..B1.579      # Prob 100%                     #118.3
..LN4419:
                                # LOE rbx r15 eax r12d r13d
..B1.617:                       # Preds ..B1.8
                                # Execution count [8.16e-03]: Infreq
..LN4420:
	.loc    1  67  is_stmt 1
        movq      %rbx, %rdi                                    #67.16
..LN4421:
        movq      %r15, %rsi                                    #67.16
..LN4422:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #67.16
..LN4423:
                                # LOE rax rbx r15 r12d r13d
..B1.739:                       # Preds ..B1.617
                                # Execution count [8.16e-03]: Infreq
..LN4424:
        movq      %rax, 16(%rsp)                                #67.16[spill]
..LN4425:
                                # LOE rbx r15 r12d r13d
..B1.618:                       # Preds ..B1.739
                                # Execution count [8.16e-03]: Infreq
..LN4426:
	.loc    1  68  is_stmt 1
        movq      %rbx, %rdi                                    #68.16
..LN4427:
        movq      %r15, %rsi                                    #68.16
..LN4428:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #68.16
..LN4429:
                                # LOE rax r15 r12d r13d
..B1.740:                       # Preds ..B1.618
                                # Execution count [8.16e-03]: Infreq
..LN4430:
        movq      %rax, %rbx                                    #68.16
..LN4431:
                                # LOE rbx r15 r12d r13d
..B1.619:                       # Preds ..B1.740
                                # Execution count [8.16e-03]: Infreq
..LN4432:
	.loc    1  70  is_stmt 1
        testl     %r13d, %r13d                                  #70.18
..LN4433:
        jle       ..B1.635      # Prob 50%                      #70.18
..LN4434:
                                # LOE rbx r15 r12d r13d
..B1.620:                       # Preds ..B1.619
                                # Execution count [7.34e-03]: Infreq
..LN4435:
        movq      %rbx, %r10                                    #70.3
..LN4436:
        andq      $63, %r10                                     #70.3
..LN4437:
        testl     %r10d, %r10d                                  #70.3
..LN4438:
        je        ..B1.623      # Prob 50%                      #70.3
..LN4439:
                                # LOE rbx r15 r10d r12d r13d
..B1.621:                       # Preds ..B1.620
                                # Execution count [7.34e-03]: Infreq
..LN4440:
        testl     $7, %r10d                                     #70.3
..LN4441:
        jne       ..B1.667      # Prob 10%                      #70.3
..LN4442:
                                # LOE rbx r15 r10d r12d r13d
..B1.622:                       # Preds ..B1.621
                                # Execution count [0.00e+00]: Infreq
..LN4443:
        negl      %r10d                                         #70.3
..LN4444:
        addl      $64, %r10d                                    #70.3
..LN4445:
        shrl      $3, %r10d                                     #70.3
..LN4446:
        cmpl      %r10d, %r13d                                  #70.3
..LN4447:
        cmovl     %r13d, %r10d                                  #70.3
..LN4448:
                                # LOE rbx r15 r10d r12d r13d
..B1.623:                       # Preds ..B1.622 ..B1.620
                                # Execution count [8.16e-03]: Infreq
..LN4449:
        movl      %r13d, %eax                                   #70.3
..LN4450:
        subl      %r10d, %eax                                   #70.3
..LN4451:
        andl      $7, %eax                                      #70.3
..LN4452:
        negl      %eax                                          #70.3
..LN4453:
        addl      %r13d, %eax                                   #70.3
..LN4454:
        cmpl      $1, %r10d                                     #70.3
..LN4455:
        jb        ..B1.627      # Prob 50%                      #70.3
..LN4456:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.624:                       # Preds ..B1.623
                                # Execution count [7.34e-03]: Infreq
..LN4457:
        movl      $255, %edx                                    #70.3
..LN4458:
        vmovd     %r10d, %xmm0                                  #70.3
..LN4459:
        kmovw     %edx, %k1                                     #70.3
..LN4460:
        movl      $8, %edx                                      #70.3
..LN4461:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #70.3
..LN4462:
	.loc    1  71  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #71.11
..LN4463:
	.loc    1  72  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #72.11
..LN4464:
	.loc    1  70  is_stmt 1
        vmovd     %edx, %xmm4                                   #70.3
..LN4465:
        vpbroadcastd %xmm0, %ymm0                               #70.3
..LN4466:
        xorl      %r9d, %r9d                                    #70.3
..LN4467:
        vpbroadcastd %xmm4, %ymm4                               #70.3
..LN4468:
        xorl      %edx, %edx                                    #70.3
..LN4469:
        movslq    %r10d, %r8                                    #70.3
..LN4470:
        movq      16(%rsp), %r11                                #70.3[spill]
..LN4471:
                                # LOE rdx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.625:                       # Preds ..B1.625 ..B1.624
                                # Execution count [4.08e-02]: Infreq
..LN4472:
        addq      $8, %r9                                       #70.3
..LN4473:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #70.3
..LN4474:
        vpaddd    %ymm4, %ymm3, %ymm3                           #70.3
..LN4475:
	.loc    1  71  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r11){%k2}                       #71.4
..LN4476:
	.loc    1  72  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rbx){%k2}                       #72.4
..LN4477:
	.loc    1  70  is_stmt 1
        addq      $64, %rdx                                     #70.3
..LN4478:
        cmpq      %r8, %r9                                      #70.3
..LN4479:
        jb        ..B1.625      # Prob 81%                      #70.3
..LN4480:
                                # LOE rdx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.626:                       # Preds ..B1.625
                                # Execution count [7.34e-03]: Infreq
..LN4481:
        cmpl      %r10d, %r13d                                  #70.3
..LN4482:
        je        ..B1.635      # Prob 10%                      #70.3
..LN4483:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.627:                       # Preds ..B1.623 ..B1.626
                                # Execution count [0.00e+00]: Infreq
..LN4484:
        lea       8(%r10), %edx                                 #70.3
..LN4485:
        cmpl      %edx, %eax                                    #70.3
..LN4486:
        jl        ..B1.631      # Prob 50%                      #70.3
..LN4487:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.628:                       # Preds ..B1.627
                                # Execution count [7.34e-03]: Infreq
..LN4488:
        movslq    %r10d, %r10                                   #70.3
..LN4489:
	.loc    1  71  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #71.11
..LN4490:
	.loc    1  72  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm0             #72.11
..LN4491:
	.loc    1  70  is_stmt 1
        movslq    %eax, %rdx                                    #70.3
..LN4492:
        movq      16(%rsp), %r8                                 #70.3[spill]
..LN4493:
                                # LOE rdx rbx r8 r10 r15 eax r12d r13d zmm0 zmm1
..B1.629:                       # Preds ..B1.629 ..B1.628
                                # Execution count [4.08e-02]: Infreq
..LN4494:
	.loc    1  71  is_stmt 1
        vmovupd   %zmm1, (%r8,%r10,8)                           #71.4
..LN4495:
	.loc    1  72  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r10,8)                          #72.4
..LN4496:
	.loc    1  70  is_stmt 1
        addq      $8, %r10                                      #70.3
..LN4497:
        cmpq      %rdx, %r10                                    #70.3
..LN4498:
        jb        ..B1.629      # Prob 81%                      #70.3
..LN4499:
                                # LOE rdx rbx r8 r10 r15 eax r12d r13d zmm0 zmm1
..B1.631:                       # Preds ..B1.629 ..B1.627 ..B1.667
                                # Execution count [8.16e-03]: Infreq
..LN4500:
        lea       1(%rax), %edx                                 #70.3
..LN4501:
        cmpl      %r13d, %edx                                   #70.3
..LN4502:
        ja        ..B1.635      # Prob 50%                      #70.3
..LN4503:
                                # LOE rbx r15 eax r12d r13d
..B1.632:                       # Preds ..B1.631
                                # Execution count [7.34e-03]: Infreq
..LN4504:
        movslq    %eax, %r11                                    #70.3
..LN4505:
        negl      %eax                                          #70.3
..LN4506:
        addl      %r13d, %eax                                   #70.3
..LN4507:
        movl      $8, %r8d                                      #70.3
..LN4508:
        movl      $255, %edx                                    #70.3
..LN4509:
        xorl      %r10d, %r10d                                  #70.3
..LN4510:
        kmovw     %edx, %k1                                     #70.3
..LN4511:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #70.3
..LN4512:
        vmovd     %eax, %xmm0                                   #70.3
..LN4513:
        vmovd     %r8d, %xmm4                                   #70.3
..LN4514:
	.loc    1  71  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #71.11
..LN4515:
	.loc    1  72  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #72.11
..LN4516:
	.loc    1  71  is_stmt 1
        movq      16(%rsp), %rdx                                #71.4[spill]
..LN4517:
	.loc    1  72  is_stmt 1
        lea       (%rbx,%r11,8), %r8                            #72.4
..LN4518:
	.loc    1  70  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #70.3
..LN4519:
        xorl      %eax, %eax                                    #70.3
..LN4520:
        movq      112(%rsp), %r9                                #70.3[spill]
..LN4521:
        vpbroadcastd %xmm4, %ymm4                               #70.3
..LN4522:
        subq      %r11, %r9                                     #70.3
..LN4523:
	.loc    1  71  is_stmt 1
        lea       (%rdx,%r11,8), %rdx                           #71.4
..LN4524:
                                # LOE rax rdx rbx r8 r9 r10 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.633:                       # Preds ..B1.633 ..B1.632
                                # Execution count [4.08e-02]: Infreq
..LN4525:
	.loc    1  70  is_stmt 1
        addq      $8, %r10                                      #70.3
..LN4526:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #70.3
..LN4527:
        vpaddd    %ymm4, %ymm3, %ymm3                           #70.3
..LN4528:
	.loc    1  71  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #71.4
..LN4529:
	.loc    1  72  is_stmt 1
        vmovupd   %zmm1, (%rax,%r8){%k2}                        #72.4
..LN4530:
	.loc    1  70  is_stmt 1
        addq      $64, %rax                                     #70.3
..LN4531:
        cmpq      %r9, %r10                                     #70.3
..LN4532:
        jb        ..B1.633      # Prob 81%                      #70.3
..LN4533:
                                # LOE rax rdx rbx r8 r9 r10 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.635:                       # Preds ..B1.633 ..B1.619 ..B1.626 ..B1.631
                                # Execution count [8.16e-03]: Infreq
..LN4534:
	.loc    1  77  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #77.3
..LN4535:
	.loc    1  75  is_stmt 1
        movl      $1, %r14d                                     #75.3
..LN4536:
	.loc    1  77  is_stmt 1
        vzeroupper                                              #77.3
..___tag_value_main.123:
..LN4537:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #77.3
..___tag_value_main.124:
..LN4538:
                                # LOE rbx r15 r12d r13d r14d
..B1.636:                       # Preds ..B1.635
                                # Execution count [8.16e-03]: Infreq
..LN4539:
	.loc    1  79  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #79.11
..LN4540:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #79.24
..LN4541:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #79.15
..LN4542:
        vcomisd   %xmm1, %xmm0                                  #79.24
..LN4543:
        jbe       ..B1.662      # Prob 10%                      #79.24
..LN4544:
                                # LOE rbx r15 r12d r13d r14d
..B1.637:                       # Preds ..B1.636
                                # Execution count [7.34e-03]: Infreq
..LN4545:
	.loc    1  86  is_stmt 1
        movl      $8, %r8d                                      #86.5
..LN4546:
        movl      %r13d, %edx                                   #86.5
..LN4547:
        andl      $-64, %edx                                    #86.5
..LN4548:
	.loc    1  81  is_stmt 1
        lea       56(%rsp), %rdi                                #81.4
..LN4549:
	.loc    1  86  is_stmt 1
        movl      %edx, -24(%rdi)                               #86.5[spill]
..LN4550:
	.loc    1  81  is_stmt 1
        lea       40(%rsp), %rsi                                #81.4
..LN4551:
	.loc    1  86  is_stmt 1
        movslq    %edx, %rdx                                    #86.5
..LN4552:
        vmovd     %r8d, %xmm0                                   #86.5
..LN4553:
        vpbroadcastd %xmm0, %ymm1                               #86.5
..LN4554:
        vmovdqu   %ymm1, 24(%rsi)                               #86.5[spill]
..LN4555:
        movq      %rdx, -16(%rsi)                               #86.5[spill]
..LN4556:
	.loc    1  81  is_stmt 1
        vzeroupper                                              #81.4
..___tag_value_main.125:
..LN4557:
#       timing(double *, double *)
        call      timing                                        #81.4
..___tag_value_main.126:
..LN4558:
                                # LOE rbx r15 r12d r13d r14d
..B1.638:                       # Preds ..B1.637
                                # Execution count [6.61e-03]: Infreq
..LN4559:
	.loc    1  82  is_stmt 1
        xorl      %eax, %eax                                    #82.4
..LN4560:
        movq      %r15, 8(%rsp)                                 #82.4[spill]
..LN4561:
        vxorpd    %xmm0, %xmm0, %xmm0                           #82.4
..LN4562:
        movl      %r12d, (%rsp)                                 #82.4[spill]
..LN4563:
        movl      %eax, %r12d                                   #82.4
..LN4564:
        movq      16(%rsp), %r15                                #82.4[spill]
..LN4565:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.639:                       # Preds ..B1.638 ..B1.654 ..B1.660
                                # Execution count [2.04e-01]: Infreq
..LN4566:
	.loc    1  86  is_stmt 1
        xorl      %r8d, %r8d                                    #86.9
..LN4567:
        testl     %r13d, %r13d                                  #86.20
..LN4568:
        jle       ..B1.652      # Prob 50%                      #86.20
..LN4569:
                                # LOE rbx r15 r8d r12d r13d r14d xmm0
..B1.640:                       # Preds ..B1.639
                                # Execution count [1.84e-01]: Infreq
..LN4570:
        cmpl      $64, %r13d                                    #86.5
..LN4571:
        jl        ..B1.666      # Prob 10%                      #86.5
..LN4572:
                                # LOE rbx r15 r8d r12d r13d r14d xmm0
..B1.641:                       # Preds ..B1.640
                                # Execution count [1.84e-01]: Infreq
..LN4573:
        movl      32(%rsp), %ecx                                #86.5[spill]
..LN4574:
                                # LOE rbx r15 ecx r12d r13d r14d xmm0
..B1.643:                       # Preds ..B1.641
                                # Execution count [1.84e-01]: Infreq
..LN4575:
        vmovups   .L_2il0floatpacket.5(%rip), %zmm9             #86.5
..LN4576:
        xorl      %edx, %edx                                    #86.5
..LN4577:
        movq      24(%rsp), %r8                                 #86.5[spill]
..LN4578:
                                # LOE rdx rbx r8 r15 ecx r12d r13d r14d xmm0 zmm9
..B1.644:                       # Preds ..B1.644 ..B1.643
                                # Execution count [1.02e+00]: Infreq
..LN4579:
	.loc    1  87  is_stmt 1
        vmulpd    (%rbx,%rdx,8), %zmm9, %zmm1                   #87.18
..LN4580:
        vmulpd    64(%rbx,%rdx,8), %zmm9, %zmm2                 #87.18
..LN4581:
        vmovntpd  %zmm1, (%r15,%rdx,8)                          #87.6
..LN4582:
        vmovntpd  %zmm2, 64(%r15,%rdx,8)                        #87.6
..LN4583:
        vmulpd    128(%rbx,%rdx,8), %zmm9, %zmm3                #87.18
..LN4584:
        vmulpd    192(%rbx,%rdx,8), %zmm9, %zmm4                #87.18
..LN4585:
        vmovntpd  %zmm3, 128(%r15,%rdx,8)                       #87.6
..LN4586:
        vmovntpd  %zmm4, 192(%r15,%rdx,8)                       #87.6
..LN4587:
        vmulpd    256(%rbx,%rdx,8), %zmm9, %zmm5                #87.18
..LN4588:
        vmulpd    320(%rbx,%rdx,8), %zmm9, %zmm6                #87.18
..LN4589:
        vmovntpd  %zmm5, 256(%r15,%rdx,8)                       #87.6
..LN4590:
        vmovntpd  %zmm6, 320(%r15,%rdx,8)                       #87.6
..LN4591:
        vmulpd    384(%rbx,%rdx,8), %zmm9, %zmm7                #87.18
..LN4592:
        vmulpd    448(%rbx,%rdx,8), %zmm9, %zmm8                #87.18
..LN4593:
        vmovntpd  %zmm7, 384(%r15,%rdx,8)                       #87.6
..LN4594:
        vmovntpd  %zmm8, 448(%r15,%rdx,8)                       #87.6
..LN4595:
	.loc    1  86  is_stmt 1
        addq      $64, %rdx                                     #86.5
..LN4596:
        cmpq      %r8, %rdx                                     #86.5
..LN4597:
        jb        ..B1.644      # Prob 82%                      #86.5
..LN4598:
                                # LOE rdx rbx r8 r15 ecx r12d r13d r14d xmm0 zmm9
..B1.645:                       # Preds ..B1.644
                                # Execution count [1.84e-01]: Infreq
..LN4599:
        movl      %ecx, %r8d                                    #86.36
..LN4600:
                                # LOE rbx r15 ecx r8d r12d r13d r14d xmm0
..B1.646:                       # Preds ..B1.645 ..B1.666
                                # Execution count [2.04e-01]: Infreq
..LN4601:
        lea       1(%rcx), %edx                                 #86.5
..LN4602:
        cmpl      %r13d, %edx                                   #86.5
..LN4603:
        ja        ..B1.652      # Prob 50%                      #86.5
..LN4604:
                                # LOE rbx r15 ecx r8d r12d r13d r14d xmm0
..B1.647:                       # Preds ..B1.646
                                # Execution count [1.84e-01]: Infreq
..LN4605:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #86.5
..LN4606:
                                # LOE rbx r15 ecx r12d r13d r14d xmm0 ymm2
..B1.649:                       # Preds ..B1.647
                                # Execution count [1.84e-01]: Infreq
..LN4607:
        movslq    %ecx, %rdx                                    #86.5
..LN4608:
        negl      %ecx                                          #86.5
..LN4609:
        addl      %r13d, %ecx                                   #86.5
..LN4610:
        movl      $255, %eax                                    #86.5
..LN4611:
        xorl      %r10d, %r10d                                  #86.5
..LN4612:
        movq      112(%rsp), %r9                                #86.5[spill]
..LN4613:
        vmovdqu   64(%rsp), %ymm5                               #86.5[spill]
..LN4614:
        subq      %rdx, %r9                                     #86.5
..LN4615:
        vmovd     %ecx, %xmm1                                   #86.5
..LN4616:
        vmovups   .L_2il0floatpacket.5(%rip), %zmm4             #86.5
..LN4617:
        kmovw     %eax, %k1                                     #86.5
..LN4618:
        vpbroadcastd %xmm1, %ymm1                               #86.5
..LN4619:
	.loc    1  87  is_stmt 1
        lea       (%r15,%rdx,8), %r8                            #87.6
..LN4620:
        lea       (%rbx,%rdx,8), %rcx                           #87.18
..LN4621:
	.loc    1  86  is_stmt 1
        xorl      %edx, %edx                                    #86.5
..LN4622:
                                # LOE rdx rcx rbx r8 r9 r10 r15 r12d r13d r14d xmm0 ymm2 ymm5 zmm1 zmm4 k1
..B1.650:                       # Preds ..B1.650 ..B1.649
                                # Execution count [1.02e+00]: Infreq
..LN4623:
	.loc    1  87  is_stmt 1
        vmulpd    (%rdx,%rcx), %zmm4, %zmm3                     #87.18
..LN4624:
	.loc    1  86  is_stmt 1
        addq      $8, %r10                                      #86.5
..LN4625:
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #86.5
..LN4626:
        vpaddd    %ymm5, %ymm2, %ymm2                           #86.5
..LN4627:
	.loc    1  87  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r8){%k2}                        #87.6
..LN4628:
	.loc    1  86  is_stmt 1
        addq      $64, %rdx                                     #86.5
..LN4629:
        cmpq      %r9, %r10                                     #86.5
..LN4630:
        jb        ..B1.650      # Prob 82%                      #86.5
..LN4631:
                                # LOE rdx rcx rbx r8 r9 r10 r15 r12d r13d r14d xmm0 ymm2 ymm5 zmm1 zmm4 k1
..B1.651:                       # Preds ..B1.650
                                # Execution count [1.84e-01]: Infreq
..LN4632:
        movl      %r13d, %r8d                                   #86.36
..LN4633:
                                # LOE rbx r15 r8d r12d r13d r14d xmm0
..B1.652:                       # Preds ..B1.651 ..B1.646 ..B1.639
                                # Execution count [2.04e-01]: Infreq
..LN4634:
	.loc    1  89  is_stmt 1
        movslq    %r8d, %r8                                     #89.8
..LN4635:
        vcomisd   (%r15,%r8,8), %xmm0                           #89.13
..LN4636:
        jbe       ..B1.654      # Prob 78%                      #89.13
..LN4637:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.653:                       # Preds ..B1.652
                                # Execution count [4.49e-02]: Infreq
..LN4638:
        movl      $il0_peep_printf_format_9, %edi               #89.16
..LN4639:
        vzeroupper                                              #89.16
..LN4640:
        call      puts                                          #89.16
..LN4641:
                                # LOE rbx r15 r12d r13d r14d
..B1.741:                       # Preds ..B1.653
                                # Execution count [4.49e-02]: Infreq
..LN4642:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4643:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.654:                       # Preds ..B1.652 ..B1.741
                                # Execution count [2.04e-01]: Infreq
..LN4644:
	.loc    1  82  is_stmt 1
        incl      %r12d                                         #82.4
..LN4645:
        cmpl      %r14d, %r12d                                  #82.4
..LN4646:
        jb        ..B1.639      # Prob 81%                      #82.4
..LN4647:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.656:                       # Preds ..B1.654 ..B1.659
                                # Execution count [4.08e-02]: Infreq
..LN4648:
	.loc    1  92  is_stmt 1
        vzeroupper                                              #92.4
..LN4649:
        lea       96(%rsp), %rdi                                #92.4
..LN4650:
        lea       40(%rsp), %rsi                                #92.4
..___tag_value_main.127:
..LN4651:
#       timing(double *, double *)
        call      timing                                        #92.4
..___tag_value_main.128:
..LN4652:
                                # LOE rbx r15 r13d r14d
..B1.657:                       # Preds ..B1.656
                                # Execution count [4.08e-02]: Infreq
..LN4653:
	.loc    1  79  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #79.11
..LN4654:
	.loc    1  93  is_stmt 1
        addl      %r14d, %r14d                                  #93.4
..LN4655:
	.loc    1  79  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #79.24
..LN4656:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #79.15
..LN4657:
        vcomisd   %xmm1, %xmm0                                  #79.24
..LN4658:
        jbe       ..B1.661      # Prob 18%                      #79.24
..LN4659:
                                # LOE rbx r15 r13d r14d
..B1.658:                       # Preds ..B1.657
                                # Execution count [3.34e-02]: Infreq
..LN4660:
	.loc    1  81  is_stmt 1
        lea       56(%rsp), %rdi                                #81.4
..LN4661:
        lea       40(%rsp), %rsi                                #81.4
..___tag_value_main.129:
..LN4662:
#       timing(double *, double *)
        call      timing                                        #81.4
..___tag_value_main.130:
..LN4663:
                                # LOE rbx r15 r13d r14d
..B1.659:                       # Preds ..B1.658
                                # Execution count [3.34e-02]: Infreq
..LN4664:
	.loc    1  82  is_stmt 1
        xorl      %r12d, %r12d                                  #82.4
..LN4665:
        testl     %r14d, %r14d                                  #82.19
..LN4666:
        jle       ..B1.656      # Prob 9%                       #82.19
..LN4667:
                                # LOE rbx r15 r12d r13d r14d
..B1.660:                       # Preds ..B1.659
                                # Execution count [3.01e-02]: Infreq
..LN4668:
        .byte     15                                            #
..LN4669:
        .byte     31                                            #
..LN4670:
        .byte     0                                             #
..LN4671:
        .byte     15                                            #
..LN4672:
        .byte     31                                            #
..LN4673:
        .byte     128                                           #
..LN4674:
        .byte     0                                             #
..LN4675:
        .byte     0                                             #
..LN4676:
        .byte     0                                             #
..LN4677:
        .byte     0                                             #
..LN4678:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4679:
        jmp       ..B1.639      # Prob 100%                     #
..LN4680:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.661:                       # Preds ..B1.657
                                # Execution count [7.34e-03]: Infreq
..LN4681:
        movl      (%rsp), %r12d                                 #[spill]
..LN4682:
        movq      8(%rsp), %r15                                 #[spill]
..LN4683:
                                # LOE rbx r15 r12d r13d r14d
..B1.662:                       # Preds ..B1.661 ..B1.636
                                # Execution count [8.16e-03]: Infreq
..LN4684:
	.loc    1  96  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #96.3
..___tag_value_main.131:
..LN4685:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #96.3
..___tag_value_main.132:
..LN4686:
                                # LOE rbx r15 r12d r13d r14d
..B1.663:                       # Preds ..B1.662
                                # Execution count [8.16e-03]: Infreq
..LN4687:
	.loc    1  98  is_stmt 1
        movl      %r14d, %edx                                   #98.3
..LN4688:
        shrl      $31, %edx                                     #98.3
..LN4689:
        addl      %edx, %r14d                                   #98.3
..LN4690:
        sarl      $1, %r14d                                     #98.3
..___tag_value_main.133:
..LN4691:
	.loc    1  102  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #102.3
..___tag_value_main.134:
..LN4692:
                                # LOE rbx r15 r12d r13d r14d
..B1.664:                       # Preds ..B1.663
                                # Execution count [8.16e-03]: Infreq
..LN4693:
	.loc    1  104  is_stmt 1
        movq      16(%rsp), %rdi                                #104.3[spill]
..LN4694:
#       _mm_free(void *)
        call      _mm_free                                      #104.3
..LN4695:
                                # LOE rbx r15 r12d r13d r14d
..B1.665:                       # Preds ..B1.664
                                # Execution count [8.16e-03]: Infreq
..LN4696:
	.loc    1  105  is_stmt 1
        movq      %rbx, %rdi                                    #105.3
..LN4697:
#       _mm_free(void *)
        call      _mm_free                                      #105.3
..LN4698:
        jmp       ..B1.18       # Prob 100%                     #105.3
..LN4699:
                                # LOE r15 r12d r13d r14d
..B1.666:                       # Preds ..B1.640
                                # Execution count [1.84e-02]: Infreq
..LN4700:
	.loc    1  86  is_stmt 1
        xorl      %ecx, %ecx                                    #86.5
..LN4701:
        jmp       ..B1.646      # Prob 100%                     #86.5
..LN4702:
                                # LOE rbx r15 ecx r8d r12d r13d r14d xmm0
..B1.667:                       # Preds ..B1.621
                                # Execution count [7.34e-04]: Infreq
..LN4703:
	.loc    1  70  is_stmt 1
        xorl      %eax, %eax                                    #70.3
..LN4704:
        jmp       ..B1.631      # Prob 100%                     #70.3
        .align    16,0x90
..LN4705:
                                # LOE rbx r15 eax r12d r13d
..LN4706:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.4707:
.LNmain:
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
il0_peep_printf_format_0:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_1:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_2:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_3:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_4:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_5:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_6:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_7:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_8:
	.long	1886352499
	.byte	0
	.space 3, 0x00 	# pad
	.align 4
il0_peep_printf_format_9:
	.long	1886352499
	.byte	0
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
il0_peep_printf_format_10:
	.long	1634036848
	.long	1663067507
	.long	543976545
	.long	1752459639
	.long	1919902496
	.long	1952671090
	.long	1735549216
	.long	1852140917
	.long	773878644
	.long	1634038319
	.long	1851465828
	.long	1700752757
	.long	1701668204
	.long	544437358
	.long	1696624233
	.long	543712097
	.long	1634890337
	.long	1528847737
	.long	1734962273
	.long	1852140910
	.long	1852383348
	.long	1954112032
	.long	542995301
	.long	1836412507
	.long	1634038304
	.long	6124388
	.data
# -- End  main
	.text
.L_2__routine_start_timing_1:
# -- Begin  timing
	.text
# mark_begin;
       .align    16,0x90
	.globl timing
# --- timing(double *, double *)
timing:
# parameter 1(wcTime): %rdi
# parameter 2(cpuTime): %rsi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]

### {

	.cfi_startproc
..___tag_value_timing.136:
..L137:
                                                        #22.1
..LN4708:
	.loc    1  22  is_stmt 1
        pushq     %r15                                          #22.1
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
..LN4709:
        pushq     %rbx                                          #22.1
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
..LN4710:
        subq      $168, %rsp                                    #22.1
	.cfi_def_cfa_offset 192
..LN4711:
        movq      %rsi, %r15                                    #22.1
..LN4712:
        movq      %rdi, %rbx                                    #22.1
..LN4713:
	.loc    1  26  is_stmt 1

### 	struct timeval tp;
### 	struct rusage ruse;
### 	
### 	gettimeofday(&tp, NULL);

        lea       144(%rsp), %rdi                               #26.2
..LN4714:
        xorl      %esi, %esi                                    #26.2
..LN4715:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #26.2
..LN4716:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [1.00e+00]
..LN4717:
	.loc    1  27  is_stmt 1

### 	*wcTime=(double) (tp.tv_sec + tp.tv_usec/1000000.0);

        vxorpd    %xmm1, %xmm1, %xmm1                           #27.32
..LN4718:
        vxorpd    %xmm0, %xmm0, %xmm0                           #27.20
..LN4719:
        vcvtsi2sdq 152(%rsp), %xmm1, %xmm1                      #27.32
..LN4720:
        vcvtsi2sdq 144(%rsp), %xmm0, %xmm0                      #27.20
..LN4721:
        vfmadd132sd .L_2il0floatpacket.7(%rip), %xmm0, %xmm1    #27.3
..LN4722:
	.loc    1  29  is_stmt 1

### 	
### 	getrusage(RUSAGE_SELF, &ruse);

        xorl      %edi, %edi                                    #29.2
..LN4723:
	.loc    1  27  is_stmt 1
        vmovsd    %xmm1, (%rbx)                                 #27.3
..LN4724:
	.loc    1  29  is_stmt 1
        lea       (%rsp), %rsi                                  #29.2
..LN4725:
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #29.2
..LN4726:
                                # LOE rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
                                # Execution count [1.00e+00]
..LN4727:
	.loc    1  30  is_stmt 1

### 	*cpuTime=(double)(ruse.ru_utime.tv_sec+ruse.ru_utime.tv_usec / 1000000.0);

        vxorpd    %xmm1, %xmm1, %xmm1                           #30.41
..LN4728:
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.20
..LN4729:
        vcvtsi2sdq 8(%rsp), %xmm1, %xmm1                        #30.41
..LN4730:
        vcvtsi2sdq (%rsp), %xmm0, %xmm0                         #30.20
..LN4731:
        vfmadd132sd .L_2il0floatpacket.7(%rip), %xmm0, %xmm1    #30.3
..LN4732:
        vmovsd    %xmm1, (%r15)                                 #30.3
..LN4733:
	.loc    1  31  is_stmt 1

### }

        addq      $168, %rsp                                    #31.1
	.cfi_def_cfa_offset 24
	.cfi_restore 3
..LN4734:
        popq      %rbx                                          #31.1
	.cfi_def_cfa_offset 16
	.cfi_restore 15
..LN4735:
        popq      %r15                                          #31.1
	.cfi_def_cfa_offset 8
..LN4736:
        ret                                                     #31.1
        .align    16,0x90
..LN4737:
                                # LOE
..LN4738:
	.cfi_endproc
# mark_end;
	.type	timing,@function
	.size	timing,.-timing
..LNtiming.4739:
.LNtiming:
	.data
# -- End  timing
	.section .rodata, "a"
	.align 64
	.align 64
.L_2il0floatpacket.3:
	.long	0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,64
	.align 64
.L_2il0floatpacket.4:
	.long	0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,64
	.align 64
.L_2il0floatpacket.5:
	.long	0x851eb852,0x3ff051eb,0x851eb852,0x3ff051eb,0x851eb852,0x3ff051eb,0x851eb852,0x3ff051eb,0x851eb852,0x3ff051eb,0x851eb852,0x3ff051eb,0x851eb852,0x3ff051eb,0x851eb852,0x3ff051eb
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,64
	.align 64
.L_2il0floatpacket.6:
	.long	0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,64
	.align 64
.L_2il0floatpacket.8:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,64
	.align 32
.L_2il0floatpacket.9:
	.long	0x00000000,0x00000001,0x00000002,0x00000003,0x00000004,0x00000005,0x00000006,0x00000007
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,32
	.align 8
.L_2il0floatpacket.2:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.7:
	.long	0xa0b5ed8d,0x3eb0c6f7
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,8
	.align 8
.L_2il0floatpacket.10:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.3:
	.long	622879781
	.long	622879852
	.long	1680154724
	.long	174466336
	.byte	0
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,17
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1145128274
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,5
	.data
	.section .note.GNU-stack, ""
# End
