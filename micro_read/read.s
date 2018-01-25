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
### 	const int unroll = 8;
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
        andl      $-2147483585, %edx                            #49.46
..LN35:
        jge       ..B1.670      # Prob 50%                      #49.46
..LN36:
                                # LOE r12 edx r13d
..B1.671:                       # Preds ..B1.6
                                # Execution count [1.60e-01]: Infreq
..LN37:
        subl      $1, %edx                                      #49.46
..LN38:
        orl       $-64, %edx                                    #49.46
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
### 	printf("%d %ld %d %d %f %ld \n", num_elements, bytes_total, num_reads, alignment, (bytes_total*((double)repeat))/(end-start)/1000000.0, (end-start));

        movq      104(%rsp), %rdx                               #652.2[spill]
..LN95:
        movl      $.L_2__STRING.3, %edi                         #652.2
..LN96:
        vcvtsi2sdq %rdx, %xmm17, %xmm17                         #652.2
..LN97:
        vcvtsi2sd %r14d, %xmm19, %xmm19                         #652.2
..LN98:
        vmulsd    .L_2il0floatpacket.7(%rip), %xmm17, %xmm18    #652.2
..LN99:
        vmovsd    96(%rsp), %xmm16                              #652.116
..LN100:
        movl      %r13d, %esi                                   #652.2
..LN101:
        vmulsd    %xmm19, %xmm18, %xmm20                        #652.2
..LN102:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #652.120
..LN103:
        movl      %r12d, %ecx                                   #652.2
..LN104:
        movl      %r15d, %r8d                                   #652.2
..LN105:
        movl      $2, %eax                                      #652.2
..LN106:
        vdivsd    %xmm1, %xmm20, %xmm0                          #652.2
..___tag_value_main.13:
..LN107:
#       printf(const char *__restrict__, ...)
        call      printf                                        #652.2
..___tag_value_main.14:
..LN108:
                                # LOE
..B1.19:                        # Preds ..B1.18
                                # Execution count [1.60e-01]: Infreq
..LN109:
	.loc    1  654  is_stmt 1

### 	
### 	exit(EXIT_SUCCESS);

        xorl      %edi, %edi                                    #654.2
..LN110:
#       exit(int)
        call      exit                                          #654.2
..LN111:
                                # LOE
..B1.20:                        # Preds ..B1.17
                                # Execution count [8.16e-03]: Infreq
..LN112:
	.loc    1  584  is_stmt 1
        movq      %rbx, %rdi                                    #584.16
..LN113:
        movq      %r15, %rsi                                    #584.16
..LN114:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #584.16
..LN115:
                                # LOE rax rbx r15 r12d r13d
..B1.676:                       # Preds ..B1.20
                                # Execution count [8.16e-03]: Infreq
..LN116:
        movq      %rax, 208(%rsp)                               #584.16[spill]
..LN117:
                                # LOE rbx r15 r12d r13d
..B1.21:                        # Preds ..B1.676
                                # Execution count [8.16e-03]: Infreq
..LN118:
	.loc    1  585  is_stmt 1
        movq      %rbx, %rdi                                    #585.16
..LN119:
        movq      %r15, %rsi                                    #585.16
..LN120:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #585.16
..LN121:
                                # LOE rax rbx r15 r12d r13d
..B1.677:                       # Preds ..B1.21
                                # Execution count [8.16e-03]: Infreq
..LN122:
        movq      %rax, 24(%rsp)                                #585.16[spill]
..LN123:
                                # LOE rbx r15 r12d r13d
..B1.22:                        # Preds ..B1.677
                                # Execution count [8.16e-03]: Infreq
..LN124:
	.loc    1  586  is_stmt 1
        movq      %rbx, %rdi                                    #586.16
..LN125:
        movq      %r15, %rsi                                    #586.16
..LN126:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #586.16
..LN127:
                                # LOE rax rbx r15 r12d r13d
..B1.678:                       # Preds ..B1.22
                                # Execution count [8.16e-03]: Infreq
..LN128:
        movq      %rax, 32(%rsp)                                #586.16[spill]
..LN129:
                                # LOE rbx r15 r12d r13d
..B1.23:                        # Preds ..B1.678
                                # Execution count [8.16e-03]: Infreq
..LN130:
	.loc    1  587  is_stmt 1
        movq      %rbx, %rdi                                    #587.16
..LN131:
        movq      %r15, %rsi                                    #587.16
..LN132:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #587.16
..LN133:
                                # LOE rax rbx r15 r12d r13d
..B1.679:                       # Preds ..B1.23
                                # Execution count [8.16e-03]: Infreq
..LN134:
        movq      %rax, 48(%rsp)                                #587.16[spill]
..LN135:
                                # LOE rbx r15 r12d r13d
..B1.24:                        # Preds ..B1.679
                                # Execution count [8.16e-03]: Infreq
..LN136:
	.loc    1  588  is_stmt 1
        movq      %rbx, %rdi                                    #588.16
..LN137:
        movq      %r15, %rsi                                    #588.16
..LN138:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #588.16
..LN139:
                                # LOE rax rbx r15 r12d r13d
..B1.680:                       # Preds ..B1.24
                                # Execution count [8.16e-03]: Infreq
..LN140:
        movq      %rax, 120(%rsp)                               #588.16[spill]
..LN141:
                                # LOE rbx r15 r12d r13d
..B1.25:                        # Preds ..B1.680
                                # Execution count [8.16e-03]: Infreq
..LN142:
	.loc    1  589  is_stmt 1
        movq      %rbx, %rdi                                    #589.16
..LN143:
        movq      %r15, %rsi                                    #589.16
..LN144:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #589.16
..LN145:
                                # LOE rax rbx r15 r12d r13d
..B1.681:                       # Preds ..B1.25
                                # Execution count [8.16e-03]: Infreq
..LN146:
        movq      %rax, 128(%rsp)                               #589.16[spill]
..LN147:
                                # LOE rbx r15 r12d r13d
..B1.26:                        # Preds ..B1.681
                                # Execution count [8.16e-03]: Infreq
..LN148:
	.loc    1  590  is_stmt 1
        movq      %rbx, %rdi                                    #590.16
..LN149:
        movq      %r15, %rsi                                    #590.16
..LN150:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #590.16
..LN151:
                                # LOE rax rbx r15 r12d r13d
..B1.682:                       # Preds ..B1.26
                                # Execution count [8.16e-03]: Infreq
..LN152:
        movq      %rax, 136(%rsp)                               #590.16[spill]
..LN153:
                                # LOE rbx r15 r12d r13d
..B1.27:                        # Preds ..B1.682
                                # Execution count [8.16e-03]: Infreq
..LN154:
	.loc    1  591  is_stmt 1
        movq      %rbx, %rdi                                    #591.16
..LN155:
        movq      %r15, %rsi                                    #591.16
..LN156:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #591.16
..LN157:
                                # LOE rax rbx r15 r12d r13d
..B1.683:                       # Preds ..B1.27
                                # Execution count [8.16e-03]: Infreq
..LN158:
        movq      %rax, 144(%rsp)                               #591.16[spill]
..LN159:
                                # LOE rbx r15 r12d r13d
..B1.28:                        # Preds ..B1.683
                                # Execution count [8.16e-03]: Infreq
..LN160:
	.loc    1  592  is_stmt 1
        movq      %rbx, %rdi                                    #592.16
..LN161:
        movq      %r15, %rsi                                    #592.16
..LN162:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #592.16
..LN163:
                                # LOE rax rbx r15 r12d r13d
..B1.684:                       # Preds ..B1.28
                                # Execution count [8.16e-03]: Infreq
..LN164:
        movq      %rax, 152(%rsp)                               #592.16[spill]
..LN165:
                                # LOE rbx r15 r12d r13d
..B1.29:                        # Preds ..B1.684
                                # Execution count [8.16e-03]: Infreq
..LN166:
	.loc    1  593  is_stmt 1
        movq      %rbx, %rdi                                    #593.16
..LN167:
        movq      %r15, %rsi                                    #593.16
..LN168:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #593.16
..LN169:
                                # LOE rax rbx r15 r12d r13d
..B1.685:                       # Preds ..B1.29
                                # Execution count [8.16e-03]: Infreq
..LN170:
        movq      %rax, 160(%rsp)                               #593.16[spill]
..LN171:
                                # LOE rbx r15 r12d r13d
..B1.30:                        # Preds ..B1.685
                                # Execution count [8.16e-03]: Infreq
..LN172:
	.loc    1  594  is_stmt 1
        movq      %rbx, %rdi                                    #594.16
..LN173:
        movq      %r15, %rsi                                    #594.16
..LN174:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #594.16
..LN175:
                                # LOE rax r15 r12d r13d
..B1.686:                       # Preds ..B1.30
                                # Execution count [8.16e-03]: Infreq
..LN176:
        movq      %rax, 168(%rsp)                               #594.16[spill]
..LN177:
                                # LOE r15 r12d r13d
..B1.31:                        # Preds ..B1.686
                                # Execution count [8.16e-03]: Infreq
..LN178:
	.loc    1  596  is_stmt 1
        testl     %r13d, %r13d                                  #596.18
..LN179:
        jle       ..B1.62       # Prob 50%                      #596.18
..LN180:
                                # LOE r15 r12d r13d
..B1.32:                        # Preds ..B1.31
                                # Execution count [7.34e-03]: Infreq
..LN181:
        movq      144(%rsp), %rdx                               #596.3[spill]
..LN182:
        andq      $63, %rdx                                     #596.3
..LN183:
        testl     %edx, %edx                                    #596.3
..LN184:
        je        ..B1.35       # Prob 50%                      #596.3
..LN185:
                                # LOE r15 edx r12d r13d
..B1.33:                        # Preds ..B1.32
                                # Execution count [7.34e-03]: Infreq
..LN186:
        testb     $7, %dl                                       #596.3
..LN187:
        jne       ..B1.104      # Prob 10%                      #596.3
..LN188:
                                # LOE r15 edx r12d r13d
..B1.34:                        # Preds ..B1.33
                                # Execution count [0.00e+00]: Infreq
..LN189:
        negl      %edx                                          #596.3
..LN190:
        addl      $64, %edx                                     #596.3
..LN191:
        shrl      $3, %edx                                      #596.3
..LN192:
        cmpl      %edx, %r13d                                   #596.3
..LN193:
        cmovl     %r13d, %edx                                   #596.3
..LN194:
                                # LOE r15 edx r12d r13d
..B1.35:                        # Preds ..B1.34 ..B1.32
                                # Execution count [8.16e-03]: Infreq
..LN195:
        movl      %r13d, %r8d                                   #596.3
..LN196:
        subl      %edx, %r8d                                    #596.3
..LN197:
        andl      $7, %r8d                                      #596.3
..LN198:
        negl      %r8d                                          #596.3
..LN199:
        addl      %r13d, %r8d                                   #596.3
..LN200:
        cmpl      $1, %edx                                      #596.3
..LN201:
        jb        ..B1.39       # Prob 50%                      #596.3
..LN202:
                                # LOE r15 edx r8d r12d r13d
..B1.36:                        # Preds ..B1.35
                                # Execution count [7.34e-03]: Infreq
..LN203:
        movl      $8, %ebx                                      #596.3
..LN204:
        vmovd     %edx, %xmm0                                   #596.3
..LN205:
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN206:
        movl      $255, %eax                                    #596.3
..LN207:
        movq      %r15, 8(%rsp)                                 #596.3[spill]
..LN208:
        movl      %r13d, 192(%rsp)                              #596.3[spill]
..LN209:
        vmovd     %ebx, %xmm6                                   #596.3
..LN210:
        xorl      %ebx, %ebx                                    #596.3
..LN211:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #596.3
..LN212:
	.loc    1  597  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #597.11
..LN213:
	.loc    1  598  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #598.11
..LN214:
	.loc    1  599  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #599.11
..LN215:
	.loc    1  600  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #600.11
..LN216:
	.loc    1  596  is_stmt 1
        kmovw     %eax, %k1                                     #596.3
..LN217:
        vpbroadcastd %xmm6, %ymm6                               #596.3
..LN218:
        xorl      %eax, %eax                                    #596.3
..LN219:
        movslq    %edx, %rdi                                    #596.3
..LN220:
        movq      144(%rsp), %rsi                               #596.3[spill]
..LN221:
        movq      136(%rsp), %r9                                #596.3[spill]
..LN222:
        movq      128(%rsp), %r10                               #596.3[spill]
..LN223:
        movq      120(%rsp), %r11                               #596.3[spill]
..LN224:
        movq      48(%rsp), %r13                                #596.3[spill]
..LN225:
        movq      32(%rsp), %r14                                #596.3[spill]
..LN226:
        movq      24(%rsp), %r15                                #596.3[spill]
..LN227:
        movq      208(%rsp), %rcx                               #596.3[spill]
        .align    16,0x90
..LN228:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.37:                        # Preds ..B1.37 ..B1.36
                                # Execution count [4.08e-02]: Infreq
..LN229:
        addq      $8, %rbx                                      #596.3
..LN230:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #596.3
..LN231:
        vpaddd    %ymm6, %ymm5, %ymm5                           #596.3
..LN232:
	.loc    1  597  is_stmt 1
        vmovupd   %zmm4, (%rax,%rcx){%k2}                       #597.4
..LN233:
	.loc    1  598  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #598.4
..LN234:
	.loc    1  599  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #599.4
..LN235:
	.loc    1  600  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #600.4
..LN236:
	.loc    1  601  is_stmt 1
        vmovupd   %zmm4, (%rax,%r11){%k2}                       #601.4
..LN237:
	.loc    1  602  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #602.4
..LN238:
	.loc    1  603  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #603.4
..LN239:
	.loc    1  604  is_stmt 1
        vmovupd   %zmm1, (%rax,%rsi){%k2}                       #604.4
..LN240:
	.loc    1  596  is_stmt 1
        addq      $64, %rax                                     #596.3
..LN241:
        cmpq      %rdi, %rbx                                    #596.3
..LN242:
        jb        ..B1.37       # Prob 81%                      #596.3
..LN243:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.38:                        # Preds ..B1.37
                                # Execution count [7.34e-03]: Infreq
..LN244:
        movl      192(%rsp), %r13d                              #[spill]
..LN245:
        movq      8(%rsp), %r15                                 #[spill]
..LN246:
        cmpl      %edx, %r13d                                   #596.3
..LN247:
        je        ..B1.47       # Prob 10%                      #596.3
..LN248:
                                # LOE r15 edx r8d r12d r13d
..B1.39:                        # Preds ..B1.35 ..B1.38
                                # Execution count [0.00e+00]: Infreq
..LN249:
        lea       8(%rdx), %ebx                                 #596.3
..LN250:
        cmpl      %ebx, %r8d                                    #596.3
..LN251:
        jl        ..B1.43       # Prob 50%                      #596.3
..LN252:
                                # LOE r15 edx r8d r12d r13d
..B1.40:                        # Preds ..B1.39
                                # Execution count [7.34e-03]: Infreq
..LN253:
        movslq    %edx, %rdx                                    #596.3
..LN254:
	.loc    1  597  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #597.11
..LN255:
	.loc    1  598  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #598.11
..LN256:
	.loc    1  599  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #599.11
..LN257:
	.loc    1  600  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #600.11
..LN258:
	.loc    1  596  is_stmt 1
        movslq    %r8d, %rax                                    #596.3
..LN259:
        movq      144(%rsp), %rbx                               #596.3[spill]
..LN260:
        movq      136(%rsp), %rdi                               #596.3[spill]
..LN261:
        movq      128(%rsp), %r9                                #596.3[spill]
..LN262:
        movq      120(%rsp), %r10                               #596.3[spill]
..LN263:
        movq      48(%rsp), %r11                                #596.3[spill]
..LN264:
        movq      32(%rsp), %rcx                                #596.3[spill]
..LN265:
        movq      24(%rsp), %rsi                                #596.3[spill]
..LN266:
        movq      208(%rsp), %r14                               #596.3[spill]
        .align    16,0x90
..LN267:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.41:                        # Preds ..B1.41 ..B1.40
                                # Execution count [4.08e-02]: Infreq
..LN268:
	.loc    1  597  is_stmt 1
        vmovupd   %zmm3, (%r14,%rdx,8)                          #597.4
..LN269:
	.loc    1  598  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #598.4
..LN270:
	.loc    1  599  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #599.4
..LN271:
	.loc    1  600  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #600.4
..LN272:
	.loc    1  601  is_stmt 1
        vmovupd   %zmm3, (%r10,%rdx,8)                          #601.4
..LN273:
	.loc    1  602  is_stmt 1
        vmovupd   %zmm2, (%r9,%rdx,8)                           #602.4
..LN274:
	.loc    1  603  is_stmt 1
        vmovupd   %zmm1, (%rdi,%rdx,8)                          #603.4
..LN275:
	.loc    1  604  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%rdx,8)                          #604.4
..LN276:
	.loc    1  596  is_stmt 1
        addq      $8, %rdx                                      #596.3
..LN277:
        cmpq      %rax, %rdx                                    #596.3
..LN278:
        jb        ..B1.41       # Prob 81%                      #596.3
..LN279:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.43:                        # Preds ..B1.41 ..B1.39 ..B1.104
                                # Execution count [8.16e-03]: Infreq
..LN280:
        lea       1(%r8), %edx                                  #596.3
..LN281:
        cmpl      %r13d, %edx                                   #596.3
..LN282:
        ja        ..B1.47       # Prob 50%                      #596.3
..LN283:
                                # LOE r15 r8d r12d r13d
..B1.44:                        # Preds ..B1.43
                                # Execution count [7.34e-03]: Infreq
..LN284:
        movl      $255, %eax                                    #596.3
..LN285:
        movl      $8, %r11d                                     #596.3
..LN286:
        kmovw     %eax, %k1                                     #596.3
..LN287:
        xorl      %ecx, %ecx                                    #596.3
..LN288:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #596.3
..LN289:
	.loc    1  597  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #597.11
..LN290:
	.loc    1  596  is_stmt 1
        vmovd     %r11d, %xmm6                                  #596.3
..LN291:
	.loc    1  598  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #598.11
..LN292:
	.loc    1  599  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #599.11
..LN293:
	.loc    1  600  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #600.11
..LN294:
	.loc    1  596  is_stmt 1
        movslq    %r8d, %rax                                    #596.3
..LN295:
        negl      %r8d                                          #596.3
..LN296:
        addl      %r13d, %r8d                                   #596.3
..LN297:
	.loc    1  598  is_stmt 1
        movq      24(%rsp), %rsi                                #598.4[spill]
..LN298:
	.loc    1  604  is_stmt 1
        movq      144(%rsp), %r10                               #604.4[spill]
..LN299:
	.loc    1  603  is_stmt 1
        movq      136(%rsp), %r9                                #603.4[spill]
..LN300:
	.loc    1  601  is_stmt 1
        movq      120(%rsp), %rdi                               #601.4[spill]
..LN301:
	.loc    1  598  is_stmt 1
        lea       (%rsi,%rax,8), %r14                           #598.4
..LN302:
	.loc    1  600  is_stmt 1
        movq      48(%rsp), %rbx                                #600.4[spill]
..LN303:
	.loc    1  596  is_stmt 1
        vmovd     %r8d, %xmm0                                   #596.3
..LN304:
	.loc    1  602  is_stmt 1
        movq      128(%rsp), %r8                                #602.4[spill]
..LN305:
	.loc    1  604  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #604.4
..LN306:
	.loc    1  599  is_stmt 1
        movq      32(%rsp), %rdx                                #599.4[spill]
..LN307:
	.loc    1  603  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #603.4
..LN308:
	.loc    1  597  is_stmt 1
        movq      208(%rsp), %rsi                               #597.4[spill]
..LN309:
	.loc    1  601  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #601.4
..LN310:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN311:
	.loc    1  602  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #602.4
..LN312:
	.loc    1  600  is_stmt 1
        lea       (%rbx,%rax,8), %rbx                           #600.4
..LN313:
	.loc    1  596  is_stmt 1
        movq      112(%rsp), %r11                               #596.3[spill]
..LN314:
	.loc    1  599  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #599.4
..LN315:
	.loc    1  596  is_stmt 1
        subq      %rax, %r11                                    #596.3
..LN316:
        vpbroadcastd %xmm6, %ymm6                               #596.3
..LN317:
	.loc    1  597  is_stmt 1
        lea       (%rsi,%rax,8), %rsi                           #597.4
..LN318:
	.loc    1  596  is_stmt 1
        xorl      %eax, %eax                                    #596.3
        .align    16,0x90
..LN319:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.45:                        # Preds ..B1.45 ..B1.44
                                # Execution count [4.08e-02]: Infreq
..LN320:
        addq      $8, %rcx                                      #596.3
..LN321:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #596.3
..LN322:
        vpaddd    %ymm6, %ymm5, %ymm5                           #596.3
..LN323:
	.loc    1  597  is_stmt 1
        vmovupd   %zmm4, (%rax,%rsi){%k2}                       #597.4
..LN324:
	.loc    1  598  is_stmt 1
        vmovupd   %zmm3, (%rax,%r14){%k2}                       #598.4
..LN325:
	.loc    1  599  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #599.4
..LN326:
	.loc    1  600  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #600.4
..LN327:
	.loc    1  601  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #601.4
..LN328:
	.loc    1  602  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #602.4
..LN329:
	.loc    1  603  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #603.4
..LN330:
	.loc    1  604  is_stmt 1
        vmovupd   %zmm1, (%rax,%r10){%k2}                       #604.4
..LN331:
	.loc    1  596  is_stmt 1
        addq      $64, %rax                                     #596.3
..LN332:
        cmpq      %r11, %rcx                                    #596.3
..LN333:
        jb        ..B1.45       # Prob 81%                      #596.3
..LN334:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.47:                        # Preds ..B1.45 ..B1.38 ..B1.43
                                # Execution count [7.34e-03]: Infreq
..LN335:
        movq      168(%rsp), %r8                                #596.3[spill]
..LN336:
        andq      $63, %r8                                      #596.3
..LN337:
        testl     %r8d, %r8d                                    #596.3
..LN338:
        je        ..B1.50       # Prob 50%                      #596.3
..LN339:
                                # LOE r15 r8d r12d r13d
..B1.48:                        # Preds ..B1.47
                                # Execution count [7.34e-03]: Infreq
..LN340:
        testl     $7, %r8d                                      #596.3
..LN341:
        jne       ..B1.103      # Prob 10%                      #596.3
..LN342:
                                # LOE r15 r8d r12d r13d
..B1.49:                        # Preds ..B1.48
                                # Execution count [0.00e+00]: Infreq
..LN343:
        negl      %r8d                                          #596.3
..LN344:
        addl      $64, %r8d                                     #596.3
..LN345:
        shrl      $3, %r8d                                      #596.3
..LN346:
        cmpl      %r8d, %r13d                                   #596.3
..LN347:
        cmovl     %r13d, %r8d                                   #596.3
..LN348:
                                # LOE r15 r8d r12d r13d
..B1.50:                        # Preds ..B1.49 ..B1.47
                                # Execution count [8.16e-03]: Infreq
..LN349:
        movl      %r13d, %eax                                   #596.3
..LN350:
        subl      %r8d, %eax                                    #596.3
..LN351:
        andl      $7, %eax                                      #596.3
..LN352:
        negl      %eax                                          #596.3
..LN353:
        addl      %r13d, %eax                                   #596.3
..LN354:
        cmpl      $1, %r8d                                      #596.3
..LN355:
        jb        ..B1.54       # Prob 50%                      #596.3
..LN356:
                                # LOE r15 eax r8d r12d r13d
..B1.51:                        # Preds ..B1.50
                                # Execution count [7.34e-03]: Infreq
..LN357:
        movl      $255, %edx                                    #596.3
..LN358:
        vmovd     %r8d, %xmm0                                   #596.3
..LN359:
        kmovw     %edx, %k1                                     #596.3
..LN360:
        movl      $8, %edx                                      #596.3
..LN361:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #596.3
..LN362:
	.loc    1  605  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #605.11
..LN363:
	.loc    1  606  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #606.11
..LN364:
	.loc    1  596  is_stmt 1
        vmovd     %edx, %xmm5                                   #596.3
..LN365:
	.loc    1  607  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #607.11
..LN366:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN367:
        xorl      %edi, %edi                                    #596.3
..LN368:
        vpbroadcastd %xmm5, %ymm5                               #596.3
..LN369:
        xorl      %edx, %edx                                    #596.3
..LN370:
        movslq    %r8d, %rbx                                    #596.3
..LN371:
        movq      168(%rsp), %r9                                #596.3[spill]
..LN372:
        movq      160(%rsp), %r10                               #596.3[spill]
..LN373:
        movq      152(%rsp), %r11                               #596.3[spill]
..LN374:
                                # LOE rdx rbx rdi r9 r10 r11 r15 eax r8d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.52:                        # Preds ..B1.52 ..B1.51
                                # Execution count [4.08e-02]: Infreq
..LN375:
        addq      $8, %rdi                                      #596.3
..LN376:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #596.3
..LN377:
        vpaddd    %ymm5, %ymm4, %ymm4                           #596.3
..LN378:
	.loc    1  605  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r11){%k2}                       #605.4
..LN379:
	.loc    1  606  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r10){%k2}                       #606.4
..LN380:
	.loc    1  607  is_stmt 1
        vmovupd   %zmm1, (%rdx,%r9){%k2}                        #607.4
..LN381:
	.loc    1  596  is_stmt 1
        addq      $64, %rdx                                     #596.3
..LN382:
        cmpq      %rbx, %rdi                                    #596.3
..LN383:
        jb        ..B1.52       # Prob 81%                      #596.3
..LN384:
                                # LOE rdx rbx rdi r9 r10 r11 r15 eax r8d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.53:                        # Preds ..B1.52
                                # Execution count [7.34e-03]: Infreq
..LN385:
        cmpl      %r8d, %r13d                                   #596.3
..LN386:
        je        ..B1.62       # Prob 10%                      #596.3
..LN387:
                                # LOE r15 eax r8d r12d r13d
..B1.54:                        # Preds ..B1.50 ..B1.53
                                # Execution count [0.00e+00]: Infreq
..LN388:
        lea       8(%r8), %edx                                  #596.3
..LN389:
        cmpl      %edx, %eax                                    #596.3
..LN390:
        jl        ..B1.58       # Prob 50%                      #596.3
..LN391:
                                # LOE r15 eax r8d r12d r13d
..B1.55:                        # Preds ..B1.54
                                # Execution count [7.34e-03]: Infreq
..LN392:
        movslq    %r8d, %r8                                     #596.3
..LN393:
	.loc    1  605  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #605.11
..LN394:
	.loc    1  606  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #606.11
..LN395:
	.loc    1  607  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm0             #607.11
..LN396:
	.loc    1  596  is_stmt 1
        movslq    %eax, %rdx                                    #596.3
..LN397:
        movq      168(%rsp), %rbx                               #596.3[spill]
..LN398:
        movq      160(%rsp), %rdi                               #596.3[spill]
..LN399:
        movq      152(%rsp), %r9                                #596.3[spill]
..LN400:
                                # LOE rdx rbx rdi r8 r9 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.56:                        # Preds ..B1.56 ..B1.55
                                # Execution count [4.08e-02]: Infreq
..LN401:
	.loc    1  605  is_stmt 1
        vmovupd   %zmm2, (%r9,%r8,8)                            #605.4
..LN402:
	.loc    1  606  is_stmt 1
        vmovupd   %zmm1, (%rdi,%r8,8)                           #606.4
..LN403:
	.loc    1  607  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r8,8)                           #607.4
..LN404:
	.loc    1  596  is_stmt 1
        addq      $8, %r8                                       #596.3
..LN405:
        cmpq      %rdx, %r8                                     #596.3
..LN406:
        jb        ..B1.56       # Prob 81%                      #596.3
..LN407:
                                # LOE rdx rbx rdi r8 r9 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.58:                        # Preds ..B1.56 ..B1.54 ..B1.103
                                # Execution count [8.16e-03]: Infreq
..LN408:
        lea       1(%rax), %edx                                 #596.3
..LN409:
        cmpl      %r13d, %edx                                   #596.3
..LN410:
        ja        ..B1.62       # Prob 50%                      #596.3
..LN411:
                                # LOE r15 eax r12d r13d
..B1.59:                        # Preds ..B1.58
                                # Execution count [7.34e-03]: Infreq
..LN412:
        movslq    %eax, %r10                                    #596.3
..LN413:
        negl      %eax                                          #596.3
..LN414:
        addl      %r13d, %eax                                   #596.3
..LN415:
        movl      $8, %r8d                                      #596.3
..LN416:
        movl      $255, %edx                                    #596.3
..LN417:
        xorl      %r9d, %r9d                                    #596.3
..LN418:
        kmovw     %edx, %k1                                     #596.3
..LN419:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #596.3
..LN420:
        vmovd     %eax, %xmm0                                   #596.3
..LN421:
        vmovd     %r8d, %xmm5                                   #596.3
..LN422:
	.loc    1  605  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #605.11
..LN423:
	.loc    1  606  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #606.11
..LN424:
	.loc    1  607  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #607.11
..LN425:
        movq      168(%rsp), %rdi                               #607.4[spill]
..LN426:
	.loc    1  596  is_stmt 1
        xorl      %eax, %eax                                    #596.3
..LN427:
	.loc    1  606  is_stmt 1
        movq      160(%rsp), %rbx                               #606.4[spill]
..LN428:
	.loc    1  605  is_stmt 1
        movq      152(%rsp), %rdx                               #605.4[spill]
..LN429:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #596.3
..LN430:
	.loc    1  607  is_stmt 1
        lea       (%rdi,%r10,8), %rdi                           #607.4
..LN431:
	.loc    1  596  is_stmt 1
        movq      112(%rsp), %r8                                #596.3[spill]
..LN432:
	.loc    1  606  is_stmt 1
        lea       (%rbx,%r10,8), %rbx                           #606.4
..LN433:
	.loc    1  596  is_stmt 1
        vpbroadcastd %xmm5, %ymm5                               #596.3
..LN434:
        subq      %r10, %r8                                     #596.3
..LN435:
	.loc    1  605  is_stmt 1
        lea       (%rdx,%r10,8), %rdx                           #605.4
..LN436:
                                # LOE rax rdx rbx rdi r8 r9 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.60:                        # Preds ..B1.60 ..B1.59
                                # Execution count [4.08e-02]: Infreq
..LN437:
	.loc    1  596  is_stmt 1
        addq      $8, %r9                                       #596.3
..LN438:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #596.3
..LN439:
        vpaddd    %ymm5, %ymm4, %ymm4                           #596.3
..LN440:
	.loc    1  605  is_stmt 1
        vmovupd   %zmm3, (%rax,%rdx){%k2}                       #605.4
..LN441:
	.loc    1  606  is_stmt 1
        vmovupd   %zmm2, (%rax,%rbx){%k2}                       #606.4
..LN442:
	.loc    1  607  is_stmt 1
        vmovupd   %zmm1, (%rax,%rdi){%k2}                       #607.4
..LN443:
	.loc    1  596  is_stmt 1
        addq      $64, %rax                                     #596.3
..LN444:
        cmpq      %r8, %r9                                      #596.3
..LN445:
        jb        ..B1.60       # Prob 81%                      #596.3
..LN446:
                                # LOE rax rdx rbx rdi r8 r9 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.62:                        # Preds ..B1.60 ..B1.31 ..B1.53 ..B1.58
                                # Execution count [8.16e-03]: Infreq
..LN447:
	.loc    1  612  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #612.3
..LN448:
	.loc    1  610  is_stmt 1
        movl      $1, %r14d                                     #610.3
..LN449:
	.loc    1  612  is_stmt 1
        vzeroupper                                              #612.3
..___tag_value_main.15:
..LN450:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #612.3
..___tag_value_main.16:
..LN451:
                                # LOE r15 r12d r13d r14d
..B1.63:                        # Preds ..B1.62
                                # Execution count [8.16e-03]: Infreq
..LN452:
	.loc    1  614  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #614.11
..LN453:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #614.24
..LN454:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #614.15
..LN455:
        vcomisd   %xmm1, %xmm0                                  #614.24
..LN456:
        jbe       ..B1.89       # Prob 10%                      #614.24
..LN457:
                                # LOE r15 r12d r13d r14d
..B1.64:                        # Preds ..B1.63
                                # Execution count [7.34e-03]: Infreq
..LN458:
	.loc    1  621  is_stmt 1
        movl      $8, %edx                                      #621.5
..LN459:
        movl      %r13d, %ebx                                   #621.5
..LN460:
        andl      $-64, %ebx                                    #621.5
..LN461:
	.loc    1  616  is_stmt 1
        lea       56(%rsp), %rdi                                #616.4
..LN462:
	.loc    1  621  is_stmt 1
        movslq    %ebx, %rbx                                    #621.5
..LN463:
	.loc    1  616  is_stmt 1
        lea       40(%rsp), %rsi                                #616.4
..LN464:
	.loc    1  621  is_stmt 1
        movq      %rbx, 136(%rsi)                               #621.5[spill]
..LN465:
        vmovd     %edx, %xmm0                                   #621.5
..LN466:
        vpbroadcastd %xmm0, %ymm1                               #621.5
..LN467:
        vmovdqu   %ymm1, 24(%rsi)                               #621.5[spill]
..LN468:
	.loc    1  616  is_stmt 1
        vzeroupper                                              #616.4
..___tag_value_main.17:
..LN469:
#       timing(double *, double *)
        call      timing                                        #616.4
..___tag_value_main.18:
..LN470:
                                # LOE r15 ebx r12d r13d r14d
..B1.65:                        # Preds ..B1.64
                                # Execution count [6.61e-03]: Infreq
..LN471:
	.loc    1  617  is_stmt 1
        xorl      %edx, %edx                                    #617.4
..LN472:
        movl      %edx, 200(%rsp)                               #617.4[spill]
..LN473:
        vxorpd    %xmm2, %xmm2, %xmm2                           #617.4
..LN474:
        movl      %ebx, 16(%rsp)                                #617.4[spill]
..LN475:
        movl      %r14d, 184(%rsp)                              #617.4[spill]
..LN476:
        movl      %r12d, (%rsp)                                 #617.4[spill]
..LN477:
        movq      %r15, 8(%rsp)                                 #617.4[spill]
..LN478:
        movl      %r13d, 192(%rsp)                              #617.4[spill]
..LN479:
                                # LOE xmm2
..B1.66:                        # Preds ..B1.65 ..B1.81 ..B1.87
                                # Execution count [2.04e-01]: Infreq
..LN480:
	.loc    1  621  is_stmt 1
        xorl      %ecx, %ecx                                    #621.9
..LN481:
        cmpl      $0, 192(%rsp)                                 #621.20[spill]
..LN482:
        jle       ..B1.79       # Prob 50%                      #621.20
..LN483:
                                # LOE ecx xmm2
..B1.67:                        # Preds ..B1.66
                                # Execution count [1.84e-01]: Infreq
..LN484:
        cmpl      $64, 192(%rsp)                                #621.5[spill]
..LN485:
        jl        ..B1.102      # Prob 10%                      #621.5
..LN486:
                                # LOE ecx xmm2
..B1.68:                        # Preds ..B1.67
                                # Execution count [1.84e-01]: Infreq
..LN487:
        movl      16(%rsp), %edx                                #621.5[spill]
..LN488:
                                # LOE edx xmm2
..B1.70:                        # Preds ..B1.68
                                # Execution count [1.84e-01]: Infreq
..LN489:
        movq      176(%rsp), %rcx                               #621.5[spill]
..LN490:
        xorl      %eax, %eax                                    #621.5
..LN491:
        movq      168(%rsp), %rbx                               #621.5[spill]
..LN492:
        movq      160(%rsp), %rsi                               #621.5[spill]
..LN493:
        movq      152(%rsp), %rdi                               #621.5[spill]
..LN494:
        movq      144(%rsp), %r8                                #621.5[spill]
..LN495:
        movq      136(%rsp), %r9                                #621.5[spill]
..LN496:
        movq      128(%rsp), %r10                               #621.5[spill]
..LN497:
        movq      120(%rsp), %r11                               #621.5[spill]
..LN498:
        movq      48(%rsp), %r12                                #621.5[spill]
..LN499:
        movq      32(%rsp), %r13                                #621.5[spill]
..LN500:
        movq      24(%rsp), %r14                                #621.5[spill]
..LN501:
        movq      208(%rsp), %r15                               #621.5[spill]
..LN502:
                                # LOE rax rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 edx xmm2
..B1.71:                        # Preds ..B1.71 ..B1.70
                                # Execution count [1.02e+00]: Infreq
..LN503:
	.loc    1  622  is_stmt 1
        vmovups   (%r14,%rax,8), %zmm0                          #622.13
..LN504:
        vmovups   (%r12,%rax,8), %zmm1                          #622.27
..LN505:
        vmovups   (%r10,%rax,8), %zmm5                          #622.41
..LN506:
        vmovups   (%r8,%rax,8), %zmm6                           #622.55
..LN507:
        vmovups   64(%r8,%rax,8), %zmm19                        #622.55
..LN508:
        vmovups   64(%r14,%rax,8), %zmm14                       #622.13
..LN509:
        vmovups   64(%r12,%rax,8), %zmm15                       #622.27
..LN510:
        vmovups   64(%r10,%rax,8), %zmm18                       #622.41
..LN511:
        vmovups   (%rdi,%rax,8), %zmm11                         #622.69
..LN512:
        vmovups   64(%rdi,%rax,8), %zmm24                       #622.69
..LN513:
        vaddpd    (%r13,%rax,8), %zmm0, %zmm3                   #622.76
..LN514:
        vaddpd    (%r11,%rax,8), %zmm1, %zmm4                   #622.76
..LN515:
        vaddpd    (%r9,%rax,8), %zmm5, %zmm7                    #622.76
..LN516:
        vaddpd    (%rsi,%rax,8), %zmm6, %zmm8                   #622.76
..LN517:
        vaddpd    64(%rsi,%rax,8), %zmm19, %zmm21               #622.76
..LN518:
        vaddpd    64(%r13,%rax,8), %zmm14, %zmm16               #622.76
..LN519:
        vaddpd    64(%r11,%rax,8), %zmm15, %zmm17               #622.76
..LN520:
        vaddpd    64(%r9,%rax,8), %zmm18, %zmm20                #622.76
..LN521:
        vaddpd    %zmm4, %zmm3, %zmm9                           #622.76
..LN522:
        vaddpd    %zmm8, %zmm7, %zmm10                          #622.76
..LN523:
        vaddpd    %zmm17, %zmm16, %zmm22                        #622.76
..LN524:
        vaddpd    %zmm21, %zmm20, %zmm23                        #622.76
..LN525:
        vaddpd    %zmm10, %zmm9, %zmm12                         #622.76
..LN526:
        vaddpd    (%rbx,%rax,8), %zmm11, %zmm13                 #622.76
..LN527:
        vaddpd    64(%rbx,%rax,8), %zmm24, %zmm26               #622.76
..LN528:
        vaddpd    %zmm23, %zmm22, %zmm25                        #622.76
..LN529:
        vaddpd    %zmm13, %zmm12, %zmm27                        #622.76
..LN530:
        vaddpd    %zmm26, %zmm25, %zmm28                        #622.76
..LN531:
        vmovntpd  %zmm27, (%r15,%rax,8)                         #622.6
..LN532:
        vmovntpd  %zmm28, 64(%r15,%rax,8)                       #622.6
..LN533:
        vmovups   128(%r14,%rax,8), %zmm29                      #622.13
..LN534:
        vmovups   128(%r12,%rax,8), %zmm30                      #622.27
..LN535:
        vmovups   128(%r10,%rax,8), %zmm0                       #622.41
..LN536:
        vmovups   128(%r8,%rax,8), %zmm1                        #622.55
..LN537:
        vmovups   192(%r8,%rax,8), %zmm13                       #622.55
..LN538:
        vmovups   192(%r14,%rax,8), %zmm8                       #622.13
..LN539:
        vmovups   192(%r12,%rax,8), %zmm9                       #622.27
..LN540:
        .byte     15                                            #622.41
..LN541:
        .byte     31                                            #622.41
..LN542:
        .byte     0                                             #622.41
..LN543:
        vmovups   192(%r10,%rax,8), %zmm12                      #622.41
..LN544:
        vmovups   128(%rdi,%rax,8), %zmm5                       #622.69
..LN545:
        vmovups   192(%rdi,%rax,8), %zmm18                      #622.69
..LN546:
        vaddpd    128(%r13,%rax,8), %zmm29, %zmm31              #622.76
..LN547:
        vaddpd    128(%r11,%rax,8), %zmm30, %zmm29              #622.76
..LN548:
        vaddpd    128(%r9,%rax,8), %zmm0, %zmm30                #622.76
..LN549:
        vaddpd    192(%r9,%rax,8), %zmm12, %zmm14               #622.76
..LN550:
        vaddpd    %zmm29, %zmm31, %zmm3                         #622.76
..LN551:
        vaddpd    128(%rsi,%rax,8), %zmm1, %zmm31               #622.76
..LN552:
        vaddpd    192(%rsi,%rax,8), %zmm13, %zmm15              #622.76
..LN553:
        vaddpd    192(%r13,%rax,8), %zmm8, %zmm10               #622.76
..LN554:
        vaddpd    192(%r11,%rax,8), %zmm9, %zmm11               #622.76
..LN555:
        vaddpd    %zmm31, %zmm30, %zmm4                         #622.76
..LN556:
        vaddpd    %zmm15, %zmm14, %zmm17                        #622.76
..LN557:
        vaddpd    %zmm11, %zmm10, %zmm16                        #622.76
..LN558:
        vaddpd    %zmm4, %zmm3, %zmm6                           #622.76
..LN559:
        vaddpd    128(%rbx,%rax,8), %zmm5, %zmm7                #622.76
..LN560:
        vaddpd    192(%rbx,%rax,8), %zmm18, %zmm20              #622.76
..LN561:
        vaddpd    %zmm17, %zmm16, %zmm19                        #622.76
..LN562:
        vaddpd    %zmm7, %zmm6, %zmm21                          #622.76
..LN563:
        vaddpd    %zmm20, %zmm19, %zmm22                        #622.76
..LN564:
        vmovntpd  %zmm21, 128(%r15,%rax,8)                      #622.6
..LN565:
        vmovntpd  %zmm22, 192(%r15,%rax,8)                      #622.6
..LN566:
        vmovups   256(%r14,%rax,8), %zmm23                      #622.13
..LN567:
        vmovups   256(%r12,%rax,8), %zmm24                      #622.27
..LN568:
        vmovups   256(%r10,%rax,8), %zmm27                      #622.41
..LN569:
        vmovups   256(%r8,%rax,8), %zmm28                       #622.55
..LN570:
        vmovups   320(%r8,%rax,8), %zmm7                        #622.55
..LN571:
        vmovups   320(%r14,%rax,8), %zmm1                       #622.13
..LN572:
        vmovups   320(%r12,%rax,8), %zmm3                       #622.27
..LN573:
        vmovups   320(%r10,%rax,8), %zmm6                       #622.41
..LN574:
        vmovups   256(%rdi,%rax,8), %zmm0                       #622.69
..LN575:
        vmovups   320(%rdi,%rax,8), %zmm12                      #622.69
..LN576:
        vaddpd    256(%r13,%rax,8), %zmm23, %zmm25              #622.76
..LN577:
        vaddpd    256(%r11,%rax,8), %zmm24, %zmm26              #622.76
..LN578:
        .byte     144                                           #622.76
..LN579:
        vaddpd    256(%r9,%rax,8), %zmm27, %zmm27               #622.76
..LN580:
        vaddpd    256(%rsi,%rax,8), %zmm28, %zmm28              #622.76
..LN581:
        vaddpd    320(%rsi,%rax,8), %zmm7, %zmm9                #622.76
..LN582:
        vaddpd    320(%r13,%rax,8), %zmm1, %zmm4                #622.76
..LN583:
        vaddpd    320(%r11,%rax,8), %zmm3, %zmm5                #622.76
..LN584:
        vaddpd    320(%r9,%rax,8), %zmm6, %zmm8                 #622.76
..LN585:
        vaddpd    %zmm26, %zmm25, %zmm23                        #622.76
..LN586:
        vaddpd    %zmm28, %zmm27, %zmm24                        #622.76
..LN587:
        vaddpd    %zmm5, %zmm4, %zmm10                          #622.76
..LN588:
        vaddpd    %zmm9, %zmm8, %zmm11                          #622.76
..LN589:
        vaddpd    %zmm24, %zmm23, %zmm25                        #622.76
..LN590:
        .byte     102                                           #622.76
..LN591:
        .byte     144                                           #622.76
..LN592:
        vaddpd    256(%rbx,%rax,8), %zmm0, %zmm26               #622.76
..LN593:
        vaddpd    320(%rbx,%rax,8), %zmm12, %zmm14              #622.76
..LN594:
        vaddpd    %zmm11, %zmm10, %zmm13                        #622.76
..LN595:
        vaddpd    %zmm26, %zmm25, %zmm15                        #622.76
..LN596:
        vaddpd    %zmm14, %zmm13, %zmm16                        #622.76
..LN597:
        vmovntpd  %zmm15, 256(%r15,%rax,8)                      #622.6
..LN598:
        vmovntpd  %zmm16, 320(%r15,%rax,8)                      #622.6
..LN599:
        vmovups   384(%r14,%rax,8), %zmm17                      #622.13
..LN600:
        vmovups   384(%r12,%rax,8), %zmm18                      #622.27
..LN601:
        vmovups   384(%r10,%rax,8), %zmm21                      #622.41
..LN602:
        vmovups   384(%r8,%rax,8), %zmm22                       #622.55
..LN603:
        vmovups   448(%r8,%rax,8), %zmm5                        #622.55
..LN604:
        vmovups   448(%r14,%rax,8), %zmm1                       #622.13
..LN605:
        vmovups   448(%r12,%rax,8), %zmm3                       #622.27
..LN606:
        vmovups   448(%r10,%rax,8), %zmm4                       #622.41
..LN607:
        vmovups   384(%rdi,%rax,8), %zmm0                       #622.69
..LN608:
        vmovups   448(%rdi,%rax,8), %zmm6                       #622.69
..LN609:
        vaddpd    384(%r13,%rax,8), %zmm17, %zmm19              #622.76
..LN610:
        vaddpd    384(%r11,%rax,8), %zmm18, %zmm20              #622.76
..LN611:
        vaddpd    384(%r9,%rax,8), %zmm21, %zmm29               #622.76
..LN612:
        vaddpd    384(%rsi,%rax,8), %zmm22, %zmm30              #622.76
..LN613:
        vaddpd    %zmm20, %zmm19, %zmm31                        #622.76
..LN614:
        vaddpd    448(%r13,%rax,8), %zmm1, %zmm20               #622.76
..LN615:
        vaddpd    %zmm30, %zmm29, %zmm17                        #622.76
..LN616:
        vaddpd    448(%r11,%rax,8), %zmm3, %zmm21               #622.76
..LN617:
        vaddpd    448(%r9,%rax,8), %zmm4, %zmm22                #622.76
..LN618:
        vaddpd    448(%rsi,%rax,8), %zmm5, %zmm29               #622.76
..LN619:
        vaddpd    %zmm17, %zmm31, %zmm18                        #622.76
..LN620:
        vaddpd    %zmm21, %zmm20, %zmm30                        #622.76
..LN621:
        vaddpd    %zmm29, %zmm22, %zmm31                        #622.76
..LN622:
        vaddpd    384(%rbx,%rax,8), %zmm0, %zmm19               #622.76
..LN623:
        vaddpd    448(%rbx,%rax,8), %zmm6, %zmm8                #622.76
..LN624:
        vaddpd    %zmm31, %zmm30, %zmm7                         #622.76
..LN625:
        vaddpd    %zmm19, %zmm18, %zmm9                         #622.76
..LN626:
        vaddpd    %zmm8, %zmm7, %zmm10                          #622.76
..LN627:
        vmovntpd  %zmm9, 384(%r15,%rax,8)                       #622.6
..LN628:
        vmovntpd  %zmm10, 448(%r15,%rax,8)                      #622.6
..LN629:
	.loc    1  621  is_stmt 1
        addq      $64, %rax                                     #621.5
..LN630:
        cmpq      %rcx, %rax                                    #621.5
..LN631:
        jb        ..B1.71       # Prob 82%                      #621.5
..LN632:
                                # LOE rax rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 edx xmm2
..B1.72:                        # Preds ..B1.71
                                # Execution count [1.84e-01]: Infreq
..LN633:
        movl      %edx, %ecx                                    #621.36
..LN634:
                                # LOE edx ecx xmm2
..B1.73:                        # Preds ..B1.72 ..B1.102
                                # Execution count [2.04e-01]: Infreq
..LN635:
        lea       1(%rdx), %eax                                 #621.5
..LN636:
        cmpl      192(%rsp), %eax                               #621.5[spill]
..LN637:
        ja        ..B1.79       # Prob 50%                      #621.5
..LN638:
                                # LOE edx ecx xmm2
..B1.74:                        # Preds ..B1.73
                                # Execution count [1.84e-01]: Infreq
..LN639:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm0             #621.5
..LN640:
                                # LOE edx xmm2 ymm0
..B1.76:                        # Preds ..B1.74
                                # Execution count [1.84e-01]: Infreq
..LN641:
        movl      $255, %eax                                    #621.5
..LN642:
        xorl      %r14d, %r14d                                  #621.5
..LN643:
        kmovw     %eax, %k1                                     #621.5
..LN644:
        movslq    %edx, %rax                                    #621.5
..LN645:
        negl      %edx                                          #621.5
..LN646:
        addl      192(%rsp), %edx                               #621.5[spill]
..LN647:
	.loc    1  622  is_stmt 1
        movq      208(%rsp), %rbx                               #622.6[spill]
..LN648:
        movq      168(%rsp), %rcx                               #622.76[spill]
..LN649:
        movq      160(%rsp), %r13                               #622.62[spill]
..LN650:
        movq      144(%rsp), %rdi                               #622.55[spill]
..LN651:
	.loc    1  621  is_stmt 1
        vmovd     %edx, %xmm1                                   #621.5
..LN652:
	.loc    1  622  is_stmt 1
        movq      152(%rsp), %rdx                               #622.69[spill]
..LN653:
        lea       (%rbx,%rax,8), %rbx                           #622.6
..LN654:
        movq      136(%rsp), %r8                                #622.48[spill]
..LN655:
        lea       (%rcx,%rax,8), %rcx                           #622.76
..LN656:
        movq      128(%rsp), %r9                                #622.41[spill]
..LN657:
        lea       (%r13,%rax,8), %r13                           #622.62
..LN658:
        movq      120(%rsp), %r10                               #622.34[spill]
..LN659:
        lea       (%rdx,%rax,8), %rdx                           #622.69
..LN660:
        movq      48(%rsp), %r11                                #622.27[spill]
..LN661:
        lea       (%rdi,%rax,8), %rdi                           #622.55
..LN662:
        movq      32(%rsp), %r12                                #622.20[spill]
..LN663:
        lea       (%r8,%rax,8), %r8                             #622.48
..LN664:
        movq      24(%rsp), %r15                                #622.13[spill]
..LN665:
        lea       (%r9,%rax,8), %r9                             #622.41
..LN666:
	.loc    1  621  is_stmt 1
        vpbroadcastd %xmm1, %ymm3                               #621.5
..LN667:
	.loc    1  622  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #622.34
..LN668:
	.loc    1  621  is_stmt 1
        movq      112(%rsp), %rsi                               #621.5[spill]
..LN669:
	.loc    1  622  is_stmt 1
        lea       (%r11,%rax,8), %r11                           #622.27
..LN670:
	.loc    1  621  is_stmt 1
        vmovdqu   64(%rsp), %ymm1                               #621.5[spill]
..LN671:
        subq      %rax, %rsi                                    #621.5
..LN672:
	.loc    1  622  is_stmt 1
        lea       (%r12,%rax,8), %r12                           #622.20
..LN673:
        lea       (%r15,%rax,8), %r15                           #622.13
..LN674:
	.loc    1  621  is_stmt 1
        xorl      %eax, %eax                                    #621.5
        .align    16,0x90
..LN675:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm2 ymm0 ymm1 zmm3 k1
..B1.77:                        # Preds ..B1.77 ..B1.76
                                # Execution count [1.02e+00]: Infreq
..LN676:
	.loc    1  622  is_stmt 1
        vmovups   (%rax,%r15), %zmm4                            #622.13
..LN677:
	.loc    1  621  is_stmt 1
        addq      $8, %r14                                      #621.5
..LN678:
	.loc    1  622  is_stmt 1
        vmovups   (%rax,%r11), %zmm5                            #622.27
..LN679:
        vmovups   (%rax,%r9), %zmm8                             #622.41
..LN680:
        vmovups   (%rax,%rdi), %zmm9                            #622.55
..LN681:
        vmovups   (%rax,%rdx), %zmm14                           #622.69
..LN682:
        vaddpd    (%rax,%r12), %zmm4, %zmm6                     #622.76
..LN683:
        vaddpd    (%rax,%r10), %zmm5, %zmm7                     #622.76
..LN684:
        vaddpd    (%rax,%r8), %zmm8, %zmm10                     #622.76
..LN685:
        vaddpd    (%rax,%r13), %zmm9, %zmm11                    #622.76
..LN686:
        vaddpd    %zmm7, %zmm6, %zmm12                          #622.76
..LN687:
        vaddpd    (%rax,%rcx), %zmm14, %zmm16                   #622.76
..LN688:
        vaddpd    %zmm11, %zmm10, %zmm13                        #622.76
..LN689:
        vaddpd    %zmm13, %zmm12, %zmm15                        #622.76
..LN690:
        vaddpd    %zmm16, %zmm15, %zmm17                        #622.76
..LN691:
	.loc    1  621  is_stmt 1
        vpcmpgtd  %zmm0, %zmm3, %k2{%k1}                        #621.5
..LN692:
        vpaddd    %ymm1, %ymm0, %ymm0                           #621.5
..LN693:
	.loc    1  622  is_stmt 1
        vmovupd   %zmm17, (%rax,%rbx){%k2}                      #622.6
..LN694:
	.loc    1  621  is_stmt 1
        addq      $64, %rax                                     #621.5
..LN695:
        cmpq      %rsi, %r14                                    #621.5
..LN696:
        jb        ..B1.77       # Prob 82%                      #621.5
..LN697:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 xmm2 ymm0 ymm1 zmm3 k1
..B1.78:                        # Preds ..B1.77
                                # Execution count [1.84e-01]: Infreq
..LN698:
        movl      192(%rsp), %ecx                               #621.36[spill]
..LN699:
                                # LOE ecx xmm2
..B1.79:                        # Preds ..B1.78 ..B1.73 ..B1.66
                                # Execution count [2.04e-01]: Infreq
..LN700:
	.loc    1  624  is_stmt 1
        movslq    %ecx, %rcx                                    #624.8
..LN701:
        movq      208(%rsp), %rax                               #624.13[spill]
..LN702:
        vcomisd   (%rax,%rcx,8), %xmm2                          #624.13
..LN703:
        jbe       ..B1.81       # Prob 78%                      #624.13
..LN704:
                                # LOE xmm2
..B1.80:                        # Preds ..B1.79
                                # Execution count [4.49e-02]: Infreq
..LN705:
        movl      $il0_peep_printf_format_0, %edi               #624.16
..LN706:
        vzeroupper                                              #624.16
..LN707:
        call      puts                                          #624.16
..LN708:
                                # LOE
..B1.750:                       # Preds ..B1.80
                                # Execution count [4.49e-02]: Infreq
..LN709:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN710:
                                # LOE xmm2
..B1.81:                        # Preds ..B1.79 ..B1.750
                                # Execution count [2.04e-01]: Infreq
..LN711:
	.loc    1  617  is_stmt 1
        movl      200(%rsp), %eax                               #617.4[spill]
..LN712:
        incl      %eax                                          #617.4
..LN713:
        movl      %eax, 200(%rsp)                               #617.4[spill]
..LN714:
        cmpl      184(%rsp), %eax                               #617.4[spill]
..LN715:
        jb        ..B1.66       # Prob 81%                      #617.4
..LN716:
                                # LOE xmm2
..B1.82:                        # Preds ..B1.81
                                # Execution count [3.74e-02]: Infreq
..LN717:
        movl      184(%rsp), %r14d                              #[spill]
..LN718:
                                # LOE r14d
..B1.83:                        # Preds ..B1.86 ..B1.82
                                # Execution count [4.08e-02]: Infreq
..LN719:
	.loc    1  627  is_stmt 1
        vzeroupper                                              #627.4
..LN720:
        lea       96(%rsp), %rdi                                #627.4
..LN721:
        lea       40(%rsp), %rsi                                #627.4
..___tag_value_main.19:
..LN722:
#       timing(double *, double *)
        call      timing                                        #627.4
..___tag_value_main.20:
..LN723:
                                # LOE r14d
..B1.84:                        # Preds ..B1.83
                                # Execution count [4.08e-02]: Infreq
..LN724:
	.loc    1  614  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #614.11
..LN725:
	.loc    1  628  is_stmt 1
        addl      %r14d, %r14d                                  #628.4
..LN726:
	.loc    1  614  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #614.24
..LN727:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #614.15
..LN728:
        vcomisd   %xmm1, %xmm0                                  #614.24
..LN729:
        jbe       ..B1.88       # Prob 18%                      #614.24
..LN730:
                                # LOE r14d
..B1.85:                        # Preds ..B1.84
                                # Execution count [3.34e-02]: Infreq
..LN731:
	.loc    1  616  is_stmt 1
        lea       56(%rsp), %rdi                                #616.4
..LN732:
        lea       40(%rsp), %rsi                                #616.4
..___tag_value_main.21:
..LN733:
#       timing(double *, double *)
        call      timing                                        #616.4
..___tag_value_main.22:
..LN734:
                                # LOE r14d
..B1.86:                        # Preds ..B1.85
                                # Execution count [3.34e-02]: Infreq
..LN735:
	.loc    1  617  is_stmt 1
        xorl      %eax, %eax                                    #617.4
..LN736:
        testl     %r14d, %r14d                                  #617.19
..LN737:
        jle       ..B1.83       # Prob 9%                       #617.19
..LN738:
                                # LOE eax r14d
..B1.87:                        # Preds ..B1.86
                                # Execution count [3.01e-02]: Infreq
..LN739:
        movl      %eax, 200(%rsp)                               #[spill]
..LN740:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN741:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN742:
        jmp       ..B1.66       # Prob 100%                     #
..LN743:
                                # LOE xmm2
..B1.88:                        # Preds ..B1.84
                                # Execution count [7.34e-03]: Infreq
..LN744:
        movl      (%rsp), %r12d                                 #[spill]
..LN745:
        movq      8(%rsp), %r15                                 #[spill]
..LN746:
        movl      192(%rsp), %r13d                              #[spill]
..LN747:
                                # LOE r15 r12d r13d r14d
..B1.89:                        # Preds ..B1.88 ..B1.63
                                # Execution count [8.16e-03]: Infreq
..LN748:
	.loc    1  631  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #631.3
..___tag_value_main.23:
..LN749:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #631.3
..___tag_value_main.24:
..LN750:
                                # LOE r15 r12d r13d r14d
..B1.90:                        # Preds ..B1.89
                                # Execution count [8.16e-03]: Infreq
..LN751:
	.loc    1  633  is_stmt 1
        movl      %r14d, %edx                                   #633.3
..LN752:
        shrl      $31, %edx                                     #633.3
..LN753:
        addl      %edx, %r14d                                   #633.3
..LN754:
        sarl      $1, %r14d                                     #633.3
..___tag_value_main.25:
..LN755:
	.loc    1  636  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #636.3
..___tag_value_main.26:
..LN756:
                                # LOE r15 r12d r13d r14d
..B1.91:                        # Preds ..B1.90
                                # Execution count [8.16e-03]: Infreq
..LN757:
	.loc    1  638  is_stmt 1
        movq      208(%rsp), %rdi                               #638.3[spill]
..LN758:
#       _mm_free(void *)
        call      _mm_free                                      #638.3
..LN759:
                                # LOE r15 r12d r13d r14d
..B1.92:                        # Preds ..B1.91
                                # Execution count [8.16e-03]: Infreq
..LN760:
	.loc    1  639  is_stmt 1
        movq      24(%rsp), %rdi                                #639.3[spill]
..LN761:
#       _mm_free(void *)
        call      _mm_free                                      #639.3
..LN762:
                                # LOE r15 r12d r13d r14d
..B1.93:                        # Preds ..B1.92
                                # Execution count [8.16e-03]: Infreq
..LN763:
	.loc    1  640  is_stmt 1
        movq      32(%rsp), %rdi                                #640.3[spill]
..LN764:
#       _mm_free(void *)
        call      _mm_free                                      #640.3
..LN765:
                                # LOE r15 r12d r13d r14d
..B1.94:                        # Preds ..B1.93
                                # Execution count [8.16e-03]: Infreq
..LN766:
	.loc    1  641  is_stmt 1
        movq      48(%rsp), %rdi                                #641.3[spill]
..LN767:
#       _mm_free(void *)
        call      _mm_free                                      #641.3
..LN768:
                                # LOE r15 r12d r13d r14d
..B1.95:                        # Preds ..B1.94
                                # Execution count [8.16e-03]: Infreq
..LN769:
	.loc    1  642  is_stmt 1
        movq      120(%rsp), %rdi                               #642.3[spill]
..LN770:
#       _mm_free(void *)
        call      _mm_free                                      #642.3
..LN771:
                                # LOE r15 r12d r13d r14d
..B1.96:                        # Preds ..B1.95
                                # Execution count [8.16e-03]: Infreq
..LN772:
	.loc    1  643  is_stmt 1
        movq      128(%rsp), %rdi                               #643.3[spill]
..LN773:
#       _mm_free(void *)
        call      _mm_free                                      #643.3
..LN774:
                                # LOE r15 r12d r13d r14d
..B1.97:                        # Preds ..B1.96
                                # Execution count [8.16e-03]: Infreq
..LN775:
	.loc    1  644  is_stmt 1
        movq      136(%rsp), %rdi                               #644.3[spill]
..LN776:
#       _mm_free(void *)
        call      _mm_free                                      #644.3
..LN777:
                                # LOE r15 r12d r13d r14d
..B1.98:                        # Preds ..B1.97
                                # Execution count [8.16e-03]: Infreq
..LN778:
	.loc    1  645  is_stmt 1
        movq      144(%rsp), %rdi                               #645.3[spill]
..LN779:
#       _mm_free(void *)
        call      _mm_free                                      #645.3
..LN780:
                                # LOE r15 r12d r13d r14d
..B1.99:                        # Preds ..B1.98
                                # Execution count [8.16e-03]: Infreq
..LN781:
	.loc    1  646  is_stmt 1
        movq      152(%rsp), %rdi                               #646.3[spill]
..LN782:
#       _mm_free(void *)
        call      _mm_free                                      #646.3
..LN783:
                                # LOE r15 r12d r13d r14d
..B1.100:                       # Preds ..B1.99
                                # Execution count [8.16e-03]: Infreq
..LN784:
	.loc    1  647  is_stmt 1
        movq      160(%rsp), %rdi                               #647.3[spill]
..LN785:
#       _mm_free(void *)
        call      _mm_free                                      #647.3
..LN786:
                                # LOE r15 r12d r13d r14d
..B1.101:                       # Preds ..B1.100
                                # Execution count [8.16e-03]: Infreq
..LN787:
	.loc    1  648  is_stmt 1
        movq      168(%rsp), %rdi                               #648.3[spill]
..LN788:
#       _mm_free(void *)
        call      _mm_free                                      #648.3
..LN789:
        jmp       ..B1.18       # Prob 100%                     #648.3
..LN790:
                                # LOE r15 r12d r13d r14d
..B1.102:                       # Preds ..B1.67
                                # Execution count [1.84e-02]: Infreq
..LN791:
	.loc    1  621  is_stmt 1
        xorl      %edx, %edx                                    #621.5
..LN792:
        jmp       ..B1.73       # Prob 100%                     #621.5
..LN793:
                                # LOE edx ecx xmm2
..B1.103:                       # Preds ..B1.48
                                # Execution count [7.34e-04]: Infreq
..LN794:
	.loc    1  596  is_stmt 1
        xorl      %eax, %eax                                    #596.3
..LN795:
        jmp       ..B1.58       # Prob 100%                     #596.3
..LN796:
                                # LOE r15 eax r12d r13d
..B1.104:                       # Preds ..B1.33
                                # Execution count [7.34e-04]: Infreq
..LN797:
        xorl      %r8d, %r8d                                    #596.3
..LN798:
        jmp       ..B1.43       # Prob 100%                     #596.3
..LN799:
                                # LOE r15 r8d r12d r13d
..B1.105:                       # Preds ..B1.16
                                # Execution count [8.16e-03]: Infreq
..LN800:
	.loc    1  516  is_stmt 1
        movq      %rbx, %rdi                                    #516.16
..LN801:
        movq      %r15, %rsi                                    #516.16
..LN802:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #516.16
..LN803:
                                # LOE rax rbx r15 r12d r13d
..B1.687:                       # Preds ..B1.105
                                # Execution count [8.16e-03]: Infreq
..LN804:
        movq      %rax, 176(%rsp)                               #516.16[spill]
..LN805:
                                # LOE rbx r15 r12d r13d
..B1.106:                       # Preds ..B1.687
                                # Execution count [8.16e-03]: Infreq
..LN806:
	.loc    1  517  is_stmt 1
        movq      %rbx, %rdi                                    #517.16
..LN807:
        movq      %r15, %rsi                                    #517.16
..LN808:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #517.16
..LN809:
                                # LOE rax rbx r15 r12d r13d
..B1.688:                       # Preds ..B1.106
                                # Execution count [8.16e-03]: Infreq
..LN810:
        movq      %rax, 24(%rsp)                                #517.16[spill]
..LN811:
                                # LOE rbx r15 r12d r13d
..B1.107:                       # Preds ..B1.688
                                # Execution count [8.16e-03]: Infreq
..LN812:
	.loc    1  518  is_stmt 1
        movq      %rbx, %rdi                                    #518.16
..LN813:
        movq      %r15, %rsi                                    #518.16
..LN814:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #518.16
..LN815:
                                # LOE rax rbx r15 r12d r13d
..B1.689:                       # Preds ..B1.107
                                # Execution count [8.16e-03]: Infreq
..LN816:
        movq      %rax, 32(%rsp)                                #518.16[spill]
..LN817:
                                # LOE rbx r15 r12d r13d
..B1.108:                       # Preds ..B1.689
                                # Execution count [8.16e-03]: Infreq
..LN818:
	.loc    1  519  is_stmt 1
        movq      %rbx, %rdi                                    #519.16
..LN819:
        movq      %r15, %rsi                                    #519.16
..LN820:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #519.16
..LN821:
                                # LOE rax rbx r15 r12d r13d
..B1.690:                       # Preds ..B1.108
                                # Execution count [8.16e-03]: Infreq
..LN822:
        movq      %rax, 48(%rsp)                                #519.16[spill]
..LN823:
                                # LOE rbx r15 r12d r13d
..B1.109:                       # Preds ..B1.690
                                # Execution count [8.16e-03]: Infreq
..LN824:
	.loc    1  520  is_stmt 1
        movq      %rbx, %rdi                                    #520.16
..LN825:
        movq      %r15, %rsi                                    #520.16
..LN826:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #520.16
..LN827:
                                # LOE rax rbx r15 r12d r13d
..B1.691:                       # Preds ..B1.109
                                # Execution count [8.16e-03]: Infreq
..LN828:
        movq      %rax, 120(%rsp)                               #520.16[spill]
..LN829:
                                # LOE rbx r15 r12d r13d
..B1.110:                       # Preds ..B1.691
                                # Execution count [8.16e-03]: Infreq
..LN830:
	.loc    1  521  is_stmt 1
        movq      %rbx, %rdi                                    #521.16
..LN831:
        movq      %r15, %rsi                                    #521.16
..LN832:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #521.16
..LN833:
                                # LOE rax rbx r15 r12d r13d
..B1.692:                       # Preds ..B1.110
                                # Execution count [8.16e-03]: Infreq
..LN834:
        movq      %rax, 128(%rsp)                               #521.16[spill]
..LN835:
                                # LOE rbx r15 r12d r13d
..B1.111:                       # Preds ..B1.692
                                # Execution count [8.16e-03]: Infreq
..LN836:
	.loc    1  522  is_stmt 1
        movq      %rbx, %rdi                                    #522.16
..LN837:
        movq      %r15, %rsi                                    #522.16
..LN838:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #522.16
..LN839:
                                # LOE rax rbx r15 r12d r13d
..B1.693:                       # Preds ..B1.111
                                # Execution count [8.16e-03]: Infreq
..LN840:
        movq      %rax, 136(%rsp)                               #522.16[spill]
..LN841:
                                # LOE rbx r15 r12d r13d
..B1.112:                       # Preds ..B1.693
                                # Execution count [8.16e-03]: Infreq
..LN842:
	.loc    1  523  is_stmt 1
        movq      %rbx, %rdi                                    #523.16
..LN843:
        movq      %r15, %rsi                                    #523.16
..LN844:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #523.16
..LN845:
                                # LOE rax rbx r15 r12d r13d
..B1.694:                       # Preds ..B1.112
                                # Execution count [8.16e-03]: Infreq
..LN846:
        movq      %rax, 144(%rsp)                               #523.16[spill]
..LN847:
                                # LOE rbx r15 r12d r13d
..B1.113:                       # Preds ..B1.694
                                # Execution count [8.16e-03]: Infreq
..LN848:
	.loc    1  524  is_stmt 1
        movq      %rbx, %rdi                                    #524.16
..LN849:
        movq      %r15, %rsi                                    #524.16
..LN850:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #524.16
..LN851:
                                # LOE rax rbx r15 r12d r13d
..B1.695:                       # Preds ..B1.113
                                # Execution count [8.16e-03]: Infreq
..LN852:
        movq      %rax, 152(%rsp)                               #524.16[spill]
..LN853:
                                # LOE rbx r15 r12d r13d
..B1.114:                       # Preds ..B1.695
                                # Execution count [8.16e-03]: Infreq
..LN854:
	.loc    1  525  is_stmt 1
        movq      %rbx, %rdi                                    #525.16
..LN855:
        movq      %r15, %rsi                                    #525.16
..LN856:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #525.16
..LN857:
                                # LOE rax r15 r12d r13d
..B1.696:                       # Preds ..B1.114
                                # Execution count [8.16e-03]: Infreq
..LN858:
        movq      %rax, 160(%rsp)                               #525.16[spill]
..LN859:
                                # LOE r15 r12d r13d
..B1.115:                       # Preds ..B1.696
                                # Execution count [8.16e-03]: Infreq
..LN860:
	.loc    1  527  is_stmt 1
        testl     %r13d, %r13d                                  #527.18
..LN861:
        jle       ..B1.146      # Prob 50%                      #527.18
..LN862:
                                # LOE r15 r12d r13d
..B1.116:                       # Preds ..B1.115
                                # Execution count [7.34e-03]: Infreq
..LN863:
        movq      144(%rsp), %rdx                               #527.3[spill]
..LN864:
        andq      $63, %rdx                                     #527.3
..LN865:
        testl     %edx, %edx                                    #527.3
..LN866:
        je        ..B1.119      # Prob 50%                      #527.3
..LN867:
                                # LOE r15 edx r12d r13d
..B1.117:                       # Preds ..B1.116
                                # Execution count [7.34e-03]: Infreq
..LN868:
        testb     $7, %dl                                       #527.3
..LN869:
        jne       ..B1.187      # Prob 10%                      #527.3
..LN870:
                                # LOE r15 edx r12d r13d
..B1.118:                       # Preds ..B1.117
                                # Execution count [0.00e+00]: Infreq
..LN871:
        negl      %edx                                          #527.3
..LN872:
        addl      $64, %edx                                     #527.3
..LN873:
        shrl      $3, %edx                                      #527.3
..LN874:
        cmpl      %edx, %r13d                                   #527.3
..LN875:
        cmovl     %r13d, %edx                                   #527.3
..LN876:
                                # LOE r15 edx r12d r13d
..B1.119:                       # Preds ..B1.118 ..B1.116
                                # Execution count [8.16e-03]: Infreq
..LN877:
        movl      %r13d, %r8d                                   #527.3
..LN878:
        subl      %edx, %r8d                                    #527.3
..LN879:
        andl      $7, %r8d                                      #527.3
..LN880:
        negl      %r8d                                          #527.3
..LN881:
        addl      %r13d, %r8d                                   #527.3
..LN882:
        cmpl      $1, %edx                                      #527.3
..LN883:
        jb        ..B1.123      # Prob 50%                      #527.3
..LN884:
                                # LOE r15 edx r8d r12d r13d
..B1.120:                       # Preds ..B1.119
                                # Execution count [7.34e-03]: Infreq
..LN885:
        movl      $8, %ebx                                      #527.3
..LN886:
        vmovd     %edx, %xmm0                                   #527.3
..LN887:
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN888:
        movl      $255, %eax                                    #527.3
..LN889:
        movq      %r15, 8(%rsp)                                 #527.3[spill]
..LN890:
        movl      %r13d, 192(%rsp)                              #527.3[spill]
..LN891:
        vmovd     %ebx, %xmm6                                   #527.3
..LN892:
        xorl      %ebx, %ebx                                    #527.3
..LN893:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #527.3
..LN894:
	.loc    1  528  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #528.11
..LN895:
	.loc    1  529  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #529.11
..LN896:
	.loc    1  530  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #530.11
..LN897:
	.loc    1  531  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #531.11
..LN898:
	.loc    1  527  is_stmt 1
        kmovw     %eax, %k1                                     #527.3
..LN899:
        vpbroadcastd %xmm6, %ymm6                               #527.3
..LN900:
        xorl      %eax, %eax                                    #527.3
..LN901:
        movslq    %edx, %rdi                                    #527.3
..LN902:
        movq      144(%rsp), %rsi                               #527.3[spill]
..LN903:
        movq      136(%rsp), %r9                                #527.3[spill]
..LN904:
        movq      128(%rsp), %r10                               #527.3[spill]
..LN905:
        movq      120(%rsp), %r11                               #527.3[spill]
..LN906:
        movq      48(%rsp), %r13                                #527.3[spill]
..LN907:
        movq      32(%rsp), %r14                                #527.3[spill]
..LN908:
        movq      24(%rsp), %r15                                #527.3[spill]
..LN909:
        movq      176(%rsp), %rcx                               #527.3[spill]
        .align    16,0x90
..LN910:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.121:                       # Preds ..B1.121 ..B1.120
                                # Execution count [4.08e-02]: Infreq
..LN911:
        addq      $8, %rbx                                      #527.3
..LN912:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #527.3
..LN913:
        vpaddd    %ymm6, %ymm5, %ymm5                           #527.3
..LN914:
	.loc    1  528  is_stmt 1
        vmovupd   %zmm4, (%rax,%rcx){%k2}                       #528.4
..LN915:
	.loc    1  529  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #529.4
..LN916:
	.loc    1  530  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #530.4
..LN917:
	.loc    1  531  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #531.4
..LN918:
	.loc    1  532  is_stmt 1
        vmovupd   %zmm4, (%rax,%r11){%k2}                       #532.4
..LN919:
	.loc    1  533  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #533.4
..LN920:
	.loc    1  534  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #534.4
..LN921:
	.loc    1  535  is_stmt 1
        vmovupd   %zmm1, (%rax,%rsi){%k2}                       #535.4
..LN922:
	.loc    1  527  is_stmt 1
        addq      $64, %rax                                     #527.3
..LN923:
        cmpq      %rdi, %rbx                                    #527.3
..LN924:
        jb        ..B1.121      # Prob 81%                      #527.3
..LN925:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.122:                       # Preds ..B1.121
                                # Execution count [7.34e-03]: Infreq
..LN926:
        movl      192(%rsp), %r13d                              #[spill]
..LN927:
        movq      8(%rsp), %r15                                 #[spill]
..LN928:
        cmpl      %edx, %r13d                                   #527.3
..LN929:
        je        ..B1.131      # Prob 10%                      #527.3
..LN930:
                                # LOE r15 edx r8d r12d r13d
..B1.123:                       # Preds ..B1.119 ..B1.122
                                # Execution count [0.00e+00]: Infreq
..LN931:
        lea       8(%rdx), %ebx                                 #527.3
..LN932:
        cmpl      %ebx, %r8d                                    #527.3
..LN933:
        jl        ..B1.127      # Prob 50%                      #527.3
..LN934:
                                # LOE r15 edx r8d r12d r13d
..B1.124:                       # Preds ..B1.123
                                # Execution count [7.34e-03]: Infreq
..LN935:
        movslq    %edx, %rdx                                    #527.3
..LN936:
	.loc    1  528  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #528.11
..LN937:
	.loc    1  529  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #529.11
..LN938:
	.loc    1  530  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #530.11
..LN939:
	.loc    1  531  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #531.11
..LN940:
	.loc    1  527  is_stmt 1
        movslq    %r8d, %rax                                    #527.3
..LN941:
        movq      144(%rsp), %rbx                               #527.3[spill]
..LN942:
        movq      136(%rsp), %rdi                               #527.3[spill]
..LN943:
        movq      128(%rsp), %r9                                #527.3[spill]
..LN944:
        movq      120(%rsp), %r10                               #527.3[spill]
..LN945:
        movq      48(%rsp), %r11                                #527.3[spill]
..LN946:
        movq      32(%rsp), %rcx                                #527.3[spill]
..LN947:
        movq      24(%rsp), %rsi                                #527.3[spill]
..LN948:
        movq      176(%rsp), %r14                               #527.3[spill]
        .align    16,0x90
..LN949:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.125:                       # Preds ..B1.125 ..B1.124
                                # Execution count [4.08e-02]: Infreq
..LN950:
	.loc    1  528  is_stmt 1
        vmovupd   %zmm3, (%r14,%rdx,8)                          #528.4
..LN951:
	.loc    1  529  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #529.4
..LN952:
	.loc    1  530  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #530.4
..LN953:
	.loc    1  531  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #531.4
..LN954:
	.loc    1  532  is_stmt 1
        vmovupd   %zmm3, (%r10,%rdx,8)                          #532.4
..LN955:
	.loc    1  533  is_stmt 1
        vmovupd   %zmm2, (%r9,%rdx,8)                           #533.4
..LN956:
	.loc    1  534  is_stmt 1
        vmovupd   %zmm1, (%rdi,%rdx,8)                          #534.4
..LN957:
	.loc    1  535  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%rdx,8)                          #535.4
..LN958:
	.loc    1  527  is_stmt 1
        addq      $8, %rdx                                      #527.3
..LN959:
        cmpq      %rax, %rdx                                    #527.3
..LN960:
        jb        ..B1.125      # Prob 81%                      #527.3
..LN961:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.127:                       # Preds ..B1.125 ..B1.123 ..B1.187
                                # Execution count [8.16e-03]: Infreq
..LN962:
        lea       1(%r8), %edx                                  #527.3
..LN963:
        cmpl      %r13d, %edx                                   #527.3
..LN964:
        ja        ..B1.131      # Prob 50%                      #527.3
..LN965:
                                # LOE r15 r8d r12d r13d
..B1.128:                       # Preds ..B1.127
                                # Execution count [7.34e-03]: Infreq
..LN966:
        movl      $255, %eax                                    #527.3
..LN967:
        movl      $8, %r11d                                     #527.3
..LN968:
        kmovw     %eax, %k1                                     #527.3
..LN969:
        xorl      %ecx, %ecx                                    #527.3
..LN970:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #527.3
..LN971:
	.loc    1  528  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #528.11
..LN972:
	.loc    1  527  is_stmt 1
        vmovd     %r11d, %xmm6                                  #527.3
..LN973:
	.loc    1  529  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #529.11
..LN974:
	.loc    1  530  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #530.11
..LN975:
	.loc    1  531  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #531.11
..LN976:
	.loc    1  527  is_stmt 1
        movslq    %r8d, %rax                                    #527.3
..LN977:
        negl      %r8d                                          #527.3
..LN978:
        addl      %r13d, %r8d                                   #527.3
..LN979:
	.loc    1  529  is_stmt 1
        movq      24(%rsp), %rsi                                #529.4[spill]
..LN980:
	.loc    1  535  is_stmt 1
        movq      144(%rsp), %r10                               #535.4[spill]
..LN981:
	.loc    1  534  is_stmt 1
        movq      136(%rsp), %r9                                #534.4[spill]
..LN982:
	.loc    1  532  is_stmt 1
        movq      120(%rsp), %rdi                               #532.4[spill]
..LN983:
	.loc    1  529  is_stmt 1
        lea       (%rsi,%rax,8), %r14                           #529.4
..LN984:
	.loc    1  531  is_stmt 1
        movq      48(%rsp), %rbx                                #531.4[spill]
..LN985:
	.loc    1  527  is_stmt 1
        vmovd     %r8d, %xmm0                                   #527.3
..LN986:
	.loc    1  533  is_stmt 1
        movq      128(%rsp), %r8                                #533.4[spill]
..LN987:
	.loc    1  535  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #535.4
..LN988:
	.loc    1  530  is_stmt 1
        movq      32(%rsp), %rdx                                #530.4[spill]
..LN989:
	.loc    1  534  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #534.4
..LN990:
	.loc    1  528  is_stmt 1
        movq      176(%rsp), %rsi                               #528.4[spill]
..LN991:
	.loc    1  532  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #532.4
..LN992:
	.loc    1  527  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN993:
	.loc    1  533  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #533.4
..LN994:
	.loc    1  531  is_stmt 1
        lea       (%rbx,%rax,8), %rbx                           #531.4
..LN995:
	.loc    1  527  is_stmt 1
        movq      112(%rsp), %r11                               #527.3[spill]
..LN996:
	.loc    1  530  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #530.4
..LN997:
	.loc    1  527  is_stmt 1
        subq      %rax, %r11                                    #527.3
..LN998:
        vpbroadcastd %xmm6, %ymm6                               #527.3
..LN999:
	.loc    1  528  is_stmt 1
        lea       (%rsi,%rax,8), %rsi                           #528.4
..LN1000:
	.loc    1  527  is_stmt 1
        xorl      %eax, %eax                                    #527.3
        .align    16,0x90
..LN1001:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.129:                       # Preds ..B1.129 ..B1.128
                                # Execution count [4.08e-02]: Infreq
..LN1002:
        addq      $8, %rcx                                      #527.3
..LN1003:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #527.3
..LN1004:
        vpaddd    %ymm6, %ymm5, %ymm5                           #527.3
..LN1005:
	.loc    1  528  is_stmt 1
        vmovupd   %zmm4, (%rax,%rsi){%k2}                       #528.4
..LN1006:
	.loc    1  529  is_stmt 1
        vmovupd   %zmm3, (%rax,%r14){%k2}                       #529.4
..LN1007:
	.loc    1  530  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #530.4
..LN1008:
	.loc    1  531  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #531.4
..LN1009:
	.loc    1  532  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #532.4
..LN1010:
	.loc    1  533  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #533.4
..LN1011:
	.loc    1  534  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #534.4
..LN1012:
	.loc    1  535  is_stmt 1
        vmovupd   %zmm1, (%rax,%r10){%k2}                       #535.4
..LN1013:
	.loc    1  527  is_stmt 1
        addq      $64, %rax                                     #527.3
..LN1014:
        cmpq      %r11, %rcx                                    #527.3
..LN1015:
        jb        ..B1.129      # Prob 81%                      #527.3
..LN1016:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.131:                       # Preds ..B1.129 ..B1.122 ..B1.127
                                # Execution count [7.34e-03]: Infreq
..LN1017:
        movq      160(%rsp), %r8                                #527.3[spill]
..LN1018:
        andq      $63, %r8                                      #527.3
..LN1019:
        testl     %r8d, %r8d                                    #527.3
..LN1020:
        je        ..B1.134      # Prob 50%                      #527.3
..LN1021:
                                # LOE r15 r8d r12d r13d
..B1.132:                       # Preds ..B1.131
                                # Execution count [7.34e-03]: Infreq
..LN1022:
        testl     $7, %r8d                                      #527.3
..LN1023:
        jne       ..B1.186      # Prob 10%                      #527.3
..LN1024:
                                # LOE r15 r8d r12d r13d
..B1.133:                       # Preds ..B1.132
                                # Execution count [0.00e+00]: Infreq
..LN1025:
        negl      %r8d                                          #527.3
..LN1026:
        addl      $64, %r8d                                     #527.3
..LN1027:
        shrl      $3, %r8d                                      #527.3
..LN1028:
        cmpl      %r8d, %r13d                                   #527.3
..LN1029:
        cmovl     %r13d, %r8d                                   #527.3
..LN1030:
                                # LOE r15 r8d r12d r13d
..B1.134:                       # Preds ..B1.133 ..B1.131
                                # Execution count [8.16e-03]: Infreq
..LN1031:
        movl      %r13d, %eax                                   #527.3
..LN1032:
        subl      %r8d, %eax                                    #527.3
..LN1033:
        andl      $7, %eax                                      #527.3
..LN1034:
        negl      %eax                                          #527.3
..LN1035:
        addl      %r13d, %eax                                   #527.3
..LN1036:
        cmpl      $1, %r8d                                      #527.3
..LN1037:
        jb        ..B1.138      # Prob 50%                      #527.3
..LN1038:
                                # LOE r15 eax r8d r12d r13d
..B1.135:                       # Preds ..B1.134
                                # Execution count [7.34e-03]: Infreq
..LN1039:
        movl      $255, %edx                                    #527.3
..LN1040:
        vmovd     %r8d, %xmm0                                   #527.3
..LN1041:
        kmovw     %edx, %k1                                     #527.3
..LN1042:
        movl      $8, %edx                                      #527.3
..LN1043:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #527.3
..LN1044:
	.loc    1  536  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #536.11
..LN1045:
	.loc    1  537  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #537.11
..LN1046:
	.loc    1  527  is_stmt 1
        vmovd     %edx, %xmm4                                   #527.3
..LN1047:
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN1048:
        xorl      %edi, %edi                                    #527.3
..LN1049:
        vpbroadcastd %xmm4, %ymm4                               #527.3
..LN1050:
        xorl      %edx, %edx                                    #527.3
..LN1051:
        movslq    %r8d, %rbx                                    #527.3
..LN1052:
        movq      160(%rsp), %r9                                #527.3[spill]
..LN1053:
        movq      152(%rsp), %r10                               #527.3[spill]
..LN1054:
                                # LOE rdx rbx rdi r9 r10 r15 eax r8d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.136:                       # Preds ..B1.136 ..B1.135
                                # Execution count [4.08e-02]: Infreq
..LN1055:
        addq      $8, %rdi                                      #527.3
..LN1056:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #527.3
..LN1057:
        vpaddd    %ymm4, %ymm3, %ymm3                           #527.3
..LN1058:
	.loc    1  536  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r10){%k2}                       #536.4
..LN1059:
	.loc    1  537  is_stmt 1
        vmovupd   %zmm1, (%rdx,%r9){%k2}                        #537.4
..LN1060:
	.loc    1  527  is_stmt 1
        addq      $64, %rdx                                     #527.3
..LN1061:
        cmpq      %rbx, %rdi                                    #527.3
..LN1062:
        jb        ..B1.136      # Prob 81%                      #527.3
..LN1063:
                                # LOE rdx rbx rdi r9 r10 r15 eax r8d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.137:                       # Preds ..B1.136
                                # Execution count [7.34e-03]: Infreq
..LN1064:
        cmpl      %r8d, %r13d                                   #527.3
..LN1065:
        je        ..B1.146      # Prob 10%                      #527.3
..LN1066:
                                # LOE r15 eax r8d r12d r13d
..B1.138:                       # Preds ..B1.134 ..B1.137
                                # Execution count [0.00e+00]: Infreq
..LN1067:
        lea       8(%r8), %edx                                  #527.3
..LN1068:
        cmpl      %edx, %eax                                    #527.3
..LN1069:
        jl        ..B1.142      # Prob 50%                      #527.3
..LN1070:
                                # LOE r15 eax r8d r12d r13d
..B1.139:                       # Preds ..B1.138
                                # Execution count [7.34e-03]: Infreq
..LN1071:
        movslq    %r8d, %r8                                     #527.3
..LN1072:
	.loc    1  536  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #536.11
..LN1073:
	.loc    1  537  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm0             #537.11
..LN1074:
	.loc    1  527  is_stmt 1
        movslq    %eax, %rdx                                    #527.3
..LN1075:
        movq      160(%rsp), %rbx                               #527.3[spill]
..LN1076:
        movq      152(%rsp), %rdi                               #527.3[spill]
..LN1077:
                                # LOE rdx rbx rdi r8 r15 eax r12d r13d zmm0 zmm1
..B1.140:                       # Preds ..B1.140 ..B1.139
                                # Execution count [4.08e-02]: Infreq
..LN1078:
	.loc    1  536  is_stmt 1
        vmovupd   %zmm1, (%rdi,%r8,8)                           #536.4
..LN1079:
	.loc    1  537  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r8,8)                           #537.4
..LN1080:
	.loc    1  527  is_stmt 1
        addq      $8, %r8                                       #527.3
..LN1081:
        cmpq      %rdx, %r8                                     #527.3
..LN1082:
        jb        ..B1.140      # Prob 81%                      #527.3
..LN1083:
                                # LOE rdx rbx rdi r8 r15 eax r12d r13d zmm0 zmm1
..B1.142:                       # Preds ..B1.140 ..B1.138 ..B1.186
                                # Execution count [8.16e-03]: Infreq
..LN1084:
        lea       1(%rax), %edx                                 #527.3
..LN1085:
        cmpl      %r13d, %edx                                   #527.3
..LN1086:
        ja        ..B1.146      # Prob 50%                      #527.3
..LN1087:
                                # LOE r15 eax r12d r13d
..B1.143:                       # Preds ..B1.142
                                # Execution count [7.34e-03]: Infreq
..LN1088:
        movslq    %eax, %r9                                     #527.3
..LN1089:
        negl      %eax                                          #527.3
..LN1090:
        addl      %r13d, %eax                                   #527.3
..LN1091:
        movl      $8, %edi                                      #527.3
..LN1092:
        movl      $255, %edx                                    #527.3
..LN1093:
        xorl      %r8d, %r8d                                    #527.3
..LN1094:
        kmovw     %edx, %k1                                     #527.3
..LN1095:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #527.3
..LN1096:
        vmovd     %eax, %xmm0                                   #527.3
..LN1097:
        vmovd     %edi, %xmm4                                   #527.3
..LN1098:
	.loc    1  536  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #536.11
..LN1099:
	.loc    1  537  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #537.11
..LN1100:
        movq      160(%rsp), %rbx                               #537.4[spill]
..LN1101:
	.loc    1  527  is_stmt 1
        xorl      %eax, %eax                                    #527.3
..LN1102:
	.loc    1  536  is_stmt 1
        movq      152(%rsp), %rdx                               #536.4[spill]
..LN1103:
	.loc    1  527  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #527.3
..LN1104:
        movq      112(%rsp), %rdi                               #527.3[spill]
..LN1105:
	.loc    1  537  is_stmt 1
        lea       (%rbx,%r9,8), %rbx                            #537.4
..LN1106:
	.loc    1  527  is_stmt 1
        vpbroadcastd %xmm4, %ymm4                               #527.3
..LN1107:
        subq      %r9, %rdi                                     #527.3
..LN1108:
	.loc    1  536  is_stmt 1
        lea       (%rdx,%r9,8), %rdx                            #536.4
..LN1109:
                                # LOE rax rdx rbx rdi r8 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.144:                       # Preds ..B1.144 ..B1.143
                                # Execution count [4.08e-02]: Infreq
..LN1110:
	.loc    1  527  is_stmt 1
        addq      $8, %r8                                       #527.3
..LN1111:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #527.3
..LN1112:
        vpaddd    %ymm4, %ymm3, %ymm3                           #527.3
..LN1113:
	.loc    1  536  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #536.4
..LN1114:
	.loc    1  537  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #537.4
..LN1115:
	.loc    1  527  is_stmt 1
        addq      $64, %rax                                     #527.3
..LN1116:
        cmpq      %rdi, %r8                                     #527.3
..LN1117:
        jb        ..B1.144      # Prob 81%                      #527.3
..LN1118:
                                # LOE rax rdx rbx rdi r8 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.146:                       # Preds ..B1.144 ..B1.115 ..B1.137 ..B1.142
                                # Execution count [8.16e-03]: Infreq
..LN1119:
	.loc    1  542  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #542.3
..LN1120:
	.loc    1  540  is_stmt 1
        movl      $1, %r14d                                     #540.3
..LN1121:
	.loc    1  542  is_stmt 1
        vzeroupper                                              #542.3
..___tag_value_main.27:
..LN1122:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #542.3
..___tag_value_main.28:
..LN1123:
                                # LOE r15 r12d r13d r14d
..B1.147:                       # Preds ..B1.146
                                # Execution count [8.16e-03]: Infreq
..LN1124:
	.loc    1  544  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #544.11
..LN1125:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #544.24
..LN1126:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #544.15
..LN1127:
        vcomisd   %xmm1, %xmm0                                  #544.24
..LN1128:
        jbe       ..B1.173      # Prob 10%                      #544.24
..LN1129:
                                # LOE r15 r12d r13d r14d
..B1.148:                       # Preds ..B1.147
                                # Execution count [7.34e-03]: Infreq
..LN1130:
	.loc    1  551  is_stmt 1
        movl      $8, %edx                                      #551.5
..LN1131:
        movl      %r13d, %ebx                                   #551.5
..LN1132:
        andl      $-64, %ebx                                    #551.5
..LN1133:
	.loc    1  546  is_stmt 1
        lea       56(%rsp), %rdi                                #546.4
..LN1134:
	.loc    1  551  is_stmt 1
        movslq    %ebx, %rbx                                    #551.5
..LN1135:
	.loc    1  546  is_stmt 1
        lea       40(%rsp), %rsi                                #546.4
..LN1136:
	.loc    1  551  is_stmt 1
        movq      %rbx, 128(%rsi)                               #551.5[spill]
..LN1137:
        vmovd     %edx, %xmm0                                   #551.5
..LN1138:
        vpbroadcastd %xmm0, %ymm1                               #551.5
..LN1139:
        vmovdqu   %ymm1, 24(%rsi)                               #551.5[spill]
..LN1140:
	.loc    1  546  is_stmt 1
        vzeroupper                                              #546.4
..___tag_value_main.29:
..LN1141:
#       timing(double *, double *)
        call      timing                                        #546.4
..___tag_value_main.30:
..LN1142:
                                # LOE r15 ebx r12d r13d r14d
..B1.149:                       # Preds ..B1.148
                                # Execution count [6.61e-03]: Infreq
..LN1143:
	.loc    1  547  is_stmt 1
        xorl      %eax, %eax                                    #547.4
..LN1144:
        movl      %ebx, 16(%rsp)                                #547.4[spill]
..LN1145:
        movl      %eax, %ebx                                    #547.4
..LN1146:
        movl      %r14d, 184(%rsp)                              #547.4[spill]
..LN1147:
        vxorpd    %xmm2, %xmm2, %xmm2                           #547.4
..LN1148:
        movl      %r12d, (%rsp)                                 #547.4[spill]
..LN1149:
        movq      %r15, 8(%rsp)                                 #547.4[spill]
..LN1150:
        movl      %r13d, 192(%rsp)                              #547.4[spill]
..LN1151:
                                # LOE ebx xmm2
..B1.150:                       # Preds ..B1.149 ..B1.165 ..B1.171
                                # Execution count [2.04e-01]: Infreq
..LN1152:
	.loc    1  551  is_stmt 1
        xorl      %ecx, %ecx                                    #551.9
..LN1153:
        cmpl      $0, 192(%rsp)                                 #551.20[spill]
..LN1154:
        jle       ..B1.163      # Prob 50%                      #551.20
..LN1155:
                                # LOE ecx ebx xmm2
..B1.151:                       # Preds ..B1.150
                                # Execution count [1.84e-01]: Infreq
..LN1156:
        cmpl      $64, 192(%rsp)                                #551.5[spill]
..LN1157:
        jl        ..B1.185      # Prob 10%                      #551.5
..LN1158:
                                # LOE ecx ebx xmm2
..B1.152:                       # Preds ..B1.151
                                # Execution count [1.84e-01]: Infreq
..LN1159:
        movl      16(%rsp), %eax                                #551.5[spill]
..LN1160:
                                # LOE eax ebx xmm2
..B1.154:                       # Preds ..B1.152
                                # Execution count [1.84e-01]: Infreq
..LN1161:
        movq      168(%rsp), %rcx                               #551.5[spill]
..LN1162:
        xorl      %edx, %edx                                    #551.5
..LN1163:
        movq      160(%rsp), %rsi                               #551.5[spill]
..LN1164:
        movq      152(%rsp), %rdi                               #551.5[spill]
..LN1165:
        movq      144(%rsp), %r8                                #551.5[spill]
..LN1166:
        movq      136(%rsp), %r9                                #551.5[spill]
..LN1167:
        movq      128(%rsp), %r10                               #551.5[spill]
..LN1168:
        movq      120(%rsp), %r11                               #551.5[spill]
..LN1169:
        movq      48(%rsp), %r12                                #551.5[spill]
..LN1170:
        movq      32(%rsp), %r13                                #551.5[spill]
..LN1171:
        movq      24(%rsp), %r14                                #551.5[spill]
..LN1172:
        movq      176(%rsp), %r15                               #551.5[spill]
..LN1173:
                                # LOE rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 eax ebx xmm2
..B1.155:                       # Preds ..B1.155 ..B1.154
                                # Execution count [1.02e+00]: Infreq
..LN1174:
	.loc    1  552  is_stmt 1
        vmovups   (%r14,%rdx,8), %zmm0                          #552.13
..LN1175:
        vmovups   (%r12,%rdx,8), %zmm1                          #552.27
..LN1176:
        vmovups   (%r10,%rdx,8), %zmm5                          #552.41
..LN1177:
        vmovups   (%r8,%rdx,8), %zmm6                           #552.55
..LN1178:
        vmovups   64(%r8,%rdx,8), %zmm17                        #552.55
..LN1179:
        vmovups   64(%r14,%rdx,8), %zmm12                       #552.13
..LN1180:
        vmovups   64(%r12,%rdx,8), %zmm13                       #552.27
..LN1181:
        vmovups   64(%r10,%rdx,8), %zmm16                       #552.41
..LN1182:
        vaddpd    (%r13,%rdx,8), %zmm0, %zmm3                   #552.69
..LN1183:
        vaddpd    (%r11,%rdx,8), %zmm1, %zmm4                   #552.69
..LN1184:
        vaddpd    (%r9,%rdx,8), %zmm5, %zmm7                    #552.69
..LN1185:
        vaddpd    (%rsi,%rdx,8), %zmm6, %zmm8                   #552.69
..LN1186:
        vaddpd    64(%rsi,%rdx,8), %zmm17, %zmm19               #552.69
..LN1187:
        vaddpd    64(%r13,%rdx,8), %zmm12, %zmm14               #552.69
..LN1188:
        vaddpd    64(%r11,%rdx,8), %zmm13, %zmm15               #552.69
..LN1189:
        vaddpd    64(%r9,%rdx,8), %zmm16, %zmm18                #552.69
..LN1190:
        vaddpd    %zmm4, %zmm3, %zmm9                           #552.69
..LN1191:
        vaddpd    %zmm8, %zmm7, %zmm10                          #552.69
..LN1192:
        vaddpd    %zmm15, %zmm14, %zmm20                        #552.69
..LN1193:
        vaddpd    %zmm19, %zmm18, %zmm21                        #552.69
..LN1194:
        vaddpd    %zmm10, %zmm9, %zmm11                         #552.69
..LN1195:
        vaddpd    %zmm21, %zmm20, %zmm22                        #552.69
..LN1196:
        vaddpd    (%rdi,%rdx,8), %zmm11, %zmm23                 #552.69
..LN1197:
        vaddpd    64(%rdi,%rdx,8), %zmm22, %zmm24               #552.69
..LN1198:
        vmovntpd  %zmm23, (%r15,%rdx,8)                         #552.6
..LN1199:
        vmovntpd  %zmm24, 64(%r15,%rdx,8)                       #552.6
..LN1200:
        vmovups   128(%r14,%rdx,8), %zmm25                      #552.13
..LN1201:
        vmovups   128(%r12,%rdx,8), %zmm26                      #552.27
..LN1202:
        vmovups   128(%r10,%rdx,8), %zmm29                      #552.41
..LN1203:
        vmovups   128(%r8,%rdx,8), %zmm30                       #552.55
..LN1204:
        vmovups   192(%r8,%rdx,8), %zmm4                        #552.55
..LN1205:
        vmovups   192(%r14,%rdx,8), %zmm0                       #552.13
..LN1206:
        vmovups   192(%r12,%rdx,8), %zmm1                       #552.27
..LN1207:
        vmovups   192(%r10,%rdx,8), %zmm3                       #552.41
..LN1208:
        vaddpd    128(%r13,%rdx,8), %zmm25, %zmm27              #552.69
..LN1209:
        vaddpd    128(%r11,%rdx,8), %zmm26, %zmm28              #552.69
..LN1210:
        vaddpd    128(%r9,%rdx,8), %zmm29, %zmm31               #552.69
..LN1211:
        vaddpd    128(%rsi,%rdx,8), %zmm30, %zmm29              #552.69
..LN1212:
        vaddpd    192(%rsi,%rdx,8), %zmm4, %zmm6                #552.69
..LN1213:
        vaddpd    %zmm28, %zmm27, %zmm25                        #552.69
..LN1214:
        vaddpd    192(%r13,%rdx,8), %zmm0, %zmm28               #552.69
..LN1215:
        vaddpd    192(%r11,%rdx,8), %zmm1, %zmm30               #552.69
..LN1216:
        vaddpd    192(%r9,%rdx,8), %zmm3, %zmm5                 #552.69
..LN1217:
        vaddpd    %zmm29, %zmm31, %zmm26                        #552.69
..LN1218:
        vaddpd    %zmm30, %zmm28, %zmm7                         #552.69
..LN1219:
        vaddpd    %zmm6, %zmm5, %zmm8                           #552.69
..LN1220:
        vaddpd    %zmm26, %zmm25, %zmm27                        #552.69
..LN1221:
        vaddpd    %zmm8, %zmm7, %zmm9                           #552.69
..LN1222:
        vaddpd    128(%rdi,%rdx,8), %zmm27, %zmm10              #552.69
..LN1223:
        vaddpd    192(%rdi,%rdx,8), %zmm9, %zmm11               #552.69
..LN1224:
        vmovntpd  %zmm10, 128(%r15,%rdx,8)                      #552.6
..LN1225:
        vmovntpd  %zmm11, 192(%r15,%rdx,8)                      #552.6
..LN1226:
        vmovups   320(%r14,%rdx,8), %zmm23                      #552.13
..LN1227:
        vmovups   320(%r12,%rdx,8), %zmm24                      #552.27
..LN1228:
        vmovups   256(%r12,%rdx,8), %zmm13                      #552.27
..LN1229:
        vmovups   256(%r14,%rdx,8), %zmm12                      #552.13
..LN1230:
        vmovups   256(%r10,%rdx,8), %zmm16                      #552.41
..LN1231:
        vmovups   256(%r8,%rdx,8), %zmm17                       #552.55
..LN1232:
        vmovups   320(%r8,%rdx,8), %zmm1                        #552.55
..LN1233:
        vmovups   320(%r10,%rdx,8), %zmm0                       #552.41
..LN1234:
        vaddpd    320(%r13,%rdx,8), %zmm23, %zmm31              #552.69
..LN1235:
        vaddpd    320(%r11,%rdx,8), %zmm24, %zmm23              #552.69
..LN1236:
        vaddpd    256(%r11,%rdx,8), %zmm13, %zmm15              #552.69
..LN1237:
        vaddpd    256(%r13,%rdx,8), %zmm12, %zmm14              #552.69
..LN1238:
        vaddpd    256(%r9,%rdx,8), %zmm16, %zmm18               #552.69
..LN1239:
        vaddpd    256(%rsi,%rdx,8), %zmm17, %zmm19              #552.69
..LN1240:
        vaddpd    %zmm23, %zmm31, %zmm3                         #552.69
..LN1241:
        vaddpd    320(%rsi,%rdx,8), %zmm1, %zmm31               #552.69
..LN1242:
        vaddpd    320(%r9,%rdx,8), %zmm0, %zmm24                #552.69
..LN1243:
        vaddpd    %zmm15, %zmm14, %zmm20                        #552.69
..LN1244:
        vaddpd    %zmm19, %zmm18, %zmm21                        #552.69
..LN1245:
        vaddpd    %zmm31, %zmm24, %zmm4                         #552.69
..LN1246:
        vaddpd    %zmm21, %zmm20, %zmm22                        #552.69
..LN1247:
        vaddpd    %zmm4, %zmm3, %zmm5                           #552.69
..LN1248:
        vaddpd    256(%rdi,%rdx,8), %zmm22, %zmm6               #552.69
..LN1249:
        vaddpd    320(%rdi,%rdx,8), %zmm5, %zmm7                #552.69
..LN1250:
        vmovntpd  %zmm6, 256(%r15,%rdx,8)                       #552.6
..LN1251:
        vmovntpd  %zmm7, 320(%r15,%rdx,8)                       #552.6
..LN1252:
        vmovups   384(%r14,%rdx,8), %zmm8                       #552.13
..LN1253:
        .byte     15                                            #552.27
..LN1254:
        .byte     31                                            #552.27
..LN1255:
        .byte     0                                             #552.27
..LN1256:
        vmovups   384(%r12,%rdx,8), %zmm9                       #552.27
..LN1257:
        vmovups   384(%r10,%rdx,8), %zmm12                      #552.41
..LN1258:
        vmovups   384(%r8,%rdx,8), %zmm13                       #552.55
..LN1259:
        vmovups   448(%r8,%rdx,8), %zmm26                       #552.55
..LN1260:
        vmovups   448(%r14,%rdx,8), %zmm19                      #552.13
..LN1261:
        vmovups   448(%r12,%rdx,8), %zmm20                      #552.27
..LN1262:
        vmovups   448(%r10,%rdx,8), %zmm25                      #552.41
..LN1263:
        vaddpd    384(%r13,%rdx,8), %zmm8, %zmm10               #552.69
..LN1264:
        vaddpd    384(%r11,%rdx,8), %zmm9, %zmm11               #552.69
..LN1265:
        vaddpd    384(%r9,%rdx,8), %zmm12, %zmm14               #552.69
..LN1266:
        vaddpd    384(%rsi,%rdx,8), %zmm13, %zmm15              #552.69
..LN1267:
        vaddpd    448(%rsi,%rdx,8), %zmm26, %zmm28              #552.69
..LN1268:
        vaddpd    448(%r13,%rdx,8), %zmm19, %zmm21              #552.69
..LN1269:
        vaddpd    448(%r11,%rdx,8), %zmm20, %zmm22              #552.69
..LN1270:
        vaddpd    448(%r9,%rdx,8), %zmm25, %zmm27               #552.69
..LN1271:
        vaddpd    %zmm11, %zmm10, %zmm16                        #552.69
..LN1272:
        vaddpd    %zmm15, %zmm14, %zmm17                        #552.69
..LN1273:
        vaddpd    %zmm22, %zmm21, %zmm29                        #552.69
..LN1274:
        vaddpd    %zmm28, %zmm27, %zmm30                        #552.69
..LN1275:
        vaddpd    %zmm17, %zmm16, %zmm18                        #552.69
..LN1276:
        vaddpd    %zmm30, %zmm29, %zmm19                        #552.69
..LN1277:
        vaddpd    384(%rdi,%rdx,8), %zmm18, %zmm0               #552.69
..LN1278:
        vaddpd    448(%rdi,%rdx,8), %zmm19, %zmm1               #552.69
..LN1279:
        vmovntpd  %zmm0, 384(%r15,%rdx,8)                       #552.6
..LN1280:
        vmovntpd  %zmm1, 448(%r15,%rdx,8)                       #552.6
..LN1281:
	.loc    1  551  is_stmt 1
        addq      $64, %rdx                                     #551.5
..LN1282:
        cmpq      %rcx, %rdx                                    #551.5
..LN1283:
        jb        ..B1.155      # Prob 82%                      #551.5
..LN1284:
                                # LOE rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 eax ebx xmm2
..B1.156:                       # Preds ..B1.155
                                # Execution count [1.84e-01]: Infreq
..LN1285:
        movl      %eax, %ecx                                    #551.36
..LN1286:
                                # LOE eax ecx ebx xmm2
..B1.157:                       # Preds ..B1.156 ..B1.185
                                # Execution count [2.04e-01]: Infreq
..LN1287:
        lea       1(%rax), %edx                                 #551.5
..LN1288:
        cmpl      192(%rsp), %edx                               #551.5[spill]
..LN1289:
        ja        ..B1.163      # Prob 50%                      #551.5
..LN1290:
                                # LOE eax ecx ebx xmm2
..B1.158:                       # Preds ..B1.157
                                # Execution count [1.84e-01]: Infreq
..LN1291:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm0             #551.5
..LN1292:
                                # LOE eax ebx xmm2 ymm0
..B1.160:                       # Preds ..B1.158
                                # Execution count [1.84e-01]: Infreq
..LN1293:
	.loc    1  552  is_stmt 1
        movslq    %eax, %r13                                    #552.13
..LN1294:
	.loc    1  551  is_stmt 1
        negl      %eax                                          #551.5
..LN1295:
        addl      192(%rsp), %eax                               #551.5[spill]
..LN1296:
        movl      $255, %edx                                    #551.5
..LN1297:
	.loc    1  552  is_stmt 1
        movq      176(%rsp), %r11                               #552.6[spill]
..LN1298:
	.loc    1  551  is_stmt 1
        xorl      %r12d, %r12d                                  #551.5
..LN1299:
	.loc    1  552  is_stmt 1
        movq      152(%rsp), %r10                               #552.69[spill]
..LN1300:
        movq      160(%rsp), %r9                                #552.62[spill]
..LN1301:
        movq      144(%rsp), %r8                                #552.55[spill]
..LN1302:
	.loc    1  551  is_stmt 1
        vmovd     %eax, %xmm1                                   #551.5
..LN1303:
	.loc    1  552  is_stmt 1
        movq      136(%rsp), %rdi                               #552.48[spill]
..LN1304:
        lea       (%r11,%r13,8), %r11                           #552.6
..LN1305:
        movq      128(%rsp), %rsi                               #552.41[spill]
..LN1306:
        lea       (%r10,%r13,8), %r10                           #552.69
..LN1307:
        movq      120(%rsp), %rcx                               #552.34[spill]
..LN1308:
        lea       (%r9,%r13,8), %r9                             #552.62
..LN1309:
        movq      32(%rsp), %r14                                #552.20[spill]
..LN1310:
        lea       (%r8,%r13,8), %r8                             #552.55
..LN1311:
        movq      24(%rsp), %r15                                #552.13[spill]
..LN1312:
        lea       (%rdi,%r13,8), %rdi                           #552.48
..LN1313:
	.loc    1  551  is_stmt 1
        kmovw     %edx, %k1                                     #551.5
..LN1314:
	.loc    1  552  is_stmt 1
        lea       (%rsi,%r13,8), %rsi                           #552.41
..LN1315:
        movq      48(%rsp), %rdx                                #552.27[spill]
..LN1316:
        lea       (%rcx,%r13,8), %rcx                           #552.34
..LN1317:
	.loc    1  551  is_stmt 1
        vpbroadcastd %xmm1, %ymm3                               #551.5
..LN1318:
	.loc    1  552  is_stmt 1
        lea       (%r14,%r13,8), %rax                           #552.20
..LN1319:
	.loc    1  551  is_stmt 1
        vmovdqu   64(%rsp), %ymm1                               #551.5[spill]
..LN1320:
	.loc    1  552  is_stmt 1
        lea       (%r15,%r13,8), %r15                           #552.13
..LN1321:
	.loc    1  551  is_stmt 1
        xorl      %r14d, %r14d                                  #551.5
..LN1322:
	.loc    1  552  is_stmt 1
        lea       (%rdx,%r13,8), %rdx                           #552.27
..LN1323:
	.loc    1  551  is_stmt 1
        negq      %r13                                          #551.5
..LN1324:
        addq      112(%rsp), %r13                               #551.5[spill]
        .align    16,0x90
..LN1325:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx xmm2 ymm0 ymm1 zmm3 k1
..B1.161:                       # Preds ..B1.161 ..B1.160
                                # Execution count [1.02e+00]: Infreq
..LN1326:
	.loc    1  552  is_stmt 1
        vmovups   (%r14,%r15), %zmm4                            #552.13
..LN1327:
	.loc    1  551  is_stmt 1
        addq      $8, %r12                                      #551.5
..LN1328:
	.loc    1  552  is_stmt 1
        vmovups   (%r14,%rdx), %zmm5                            #552.27
..LN1329:
        vmovups   (%r14,%rsi), %zmm8                            #552.41
..LN1330:
        vmovups   (%r14,%r8), %zmm9                             #552.55
..LN1331:
        vaddpd    (%r14,%rax), %zmm4, %zmm6                     #552.69
..LN1332:
        vaddpd    (%r14,%rcx), %zmm5, %zmm7                     #552.69
..LN1333:
        vaddpd    (%r14,%rdi), %zmm8, %zmm10                    #552.69
..LN1334:
        vaddpd    (%r14,%r9), %zmm9, %zmm11                     #552.69
..LN1335:
        vaddpd    %zmm7, %zmm6, %zmm12                          #552.69
..LN1336:
        vaddpd    %zmm11, %zmm10, %zmm13                        #552.69
..LN1337:
        vaddpd    %zmm13, %zmm12, %zmm14                        #552.69
..LN1338:
        vaddpd    (%r14,%r10), %zmm14, %zmm15                   #552.69
..LN1339:
	.loc    1  551  is_stmt 1
        vpcmpgtd  %zmm0, %zmm3, %k2{%k1}                        #551.5
..LN1340:
        vpaddd    %ymm1, %ymm0, %ymm0                           #551.5
..LN1341:
	.loc    1  552  is_stmt 1
        vmovupd   %zmm15, (%r14,%r11){%k2}                      #552.6
..LN1342:
	.loc    1  551  is_stmt 1
        addq      $64, %r14                                     #551.5
..LN1343:
        cmpq      %r13, %r12                                    #551.5
..LN1344:
        jb        ..B1.161      # Prob 82%                      #551.5
..LN1345:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx xmm2 ymm0 ymm1 zmm3 k1
..B1.162:                       # Preds ..B1.161
                                # Execution count [1.84e-01]: Infreq
..LN1346:
        movl      192(%rsp), %ecx                               #551.36[spill]
..LN1347:
                                # LOE ecx ebx xmm2
..B1.163:                       # Preds ..B1.162 ..B1.157 ..B1.150
                                # Execution count [2.04e-01]: Infreq
..LN1348:
	.loc    1  554  is_stmt 1
        movslq    %ecx, %rcx                                    #554.8
..LN1349:
        movq      176(%rsp), %rdx                               #554.13[spill]
..LN1350:
        vcomisd   (%rdx,%rcx,8), %xmm2                          #554.13
..LN1351:
        jbe       ..B1.165      # Prob 78%                      #554.13
..LN1352:
                                # LOE ebx xmm2
..B1.164:                       # Preds ..B1.163
                                # Execution count [4.49e-02]: Infreq
..LN1353:
        movl      $il0_peep_printf_format_1, %edi               #554.16
..LN1354:
        vzeroupper                                              #554.16
..LN1355:
        call      puts                                          #554.16
..LN1356:
                                # LOE ebx
..B1.749:                       # Preds ..B1.164
                                # Execution count [4.49e-02]: Infreq
..LN1357:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN1358:
                                # LOE ebx xmm2
..B1.165:                       # Preds ..B1.163 ..B1.749
                                # Execution count [2.04e-01]: Infreq
..LN1359:
	.loc    1  547  is_stmt 1
        incl      %ebx                                          #547.4
..LN1360:
        cmpl      184(%rsp), %ebx                               #547.4[spill]
..LN1361:
        jb        ..B1.150      # Prob 81%                      #547.4
..LN1362:
                                # LOE ebx xmm2
..B1.166:                       # Preds ..B1.165
                                # Execution count [3.74e-02]: Infreq
..LN1363:
        movl      184(%rsp), %r14d                              #[spill]
..LN1364:
                                # LOE r14d
..B1.167:                       # Preds ..B1.170 ..B1.166
                                # Execution count [4.08e-02]: Infreq
..LN1365:
	.loc    1  557  is_stmt 1
        vzeroupper                                              #557.4
..LN1366:
        lea       96(%rsp), %rdi                                #557.4
..LN1367:
        lea       40(%rsp), %rsi                                #557.4
..___tag_value_main.31:
..LN1368:
#       timing(double *, double *)
        call      timing                                        #557.4
..___tag_value_main.32:
..LN1369:
                                # LOE r14d
..B1.168:                       # Preds ..B1.167
                                # Execution count [4.08e-02]: Infreq
..LN1370:
	.loc    1  544  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #544.11
..LN1371:
	.loc    1  558  is_stmt 1
        addl      %r14d, %r14d                                  #558.4
..LN1372:
	.loc    1  544  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #544.24
..LN1373:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #544.15
..LN1374:
        vcomisd   %xmm1, %xmm0                                  #544.24
..LN1375:
        jbe       ..B1.172      # Prob 18%                      #544.24
..LN1376:
                                # LOE r14d
..B1.169:                       # Preds ..B1.168
                                # Execution count [3.34e-02]: Infreq
..LN1377:
	.loc    1  546  is_stmt 1
        lea       56(%rsp), %rdi                                #546.4
..LN1378:
        lea       40(%rsp), %rsi                                #546.4
..___tag_value_main.33:
..LN1379:
#       timing(double *, double *)
        call      timing                                        #546.4
..___tag_value_main.34:
..LN1380:
                                # LOE r14d
..B1.170:                       # Preds ..B1.169
                                # Execution count [3.34e-02]: Infreq
..LN1381:
	.loc    1  547  is_stmt 1
        xorl      %ebx, %ebx                                    #547.4
..LN1382:
        testl     %r14d, %r14d                                  #547.19
..LN1383:
        jle       ..B1.167      # Prob 9%                       #547.19
..LN1384:
                                # LOE ebx r14d
..B1.171:                       # Preds ..B1.170
                                # Execution count [3.01e-02]: Infreq
..LN1385:
        .byte     102                                           #
..LN1386:
        .byte     144                                           #
..LN1387:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN1388:
        vxorpd    %xmm2, %xmm2, %xmm2                           #
..LN1389:
        jmp       ..B1.150      # Prob 100%                     #
..LN1390:
                                # LOE ebx xmm2
..B1.172:                       # Preds ..B1.168
                                # Execution count [7.34e-03]: Infreq
..LN1391:
        movl      (%rsp), %r12d                                 #[spill]
..LN1392:
        movq      8(%rsp), %r15                                 #[spill]
..LN1393:
        movl      192(%rsp), %r13d                              #[spill]
..LN1394:
                                # LOE r15 r12d r13d r14d
..B1.173:                       # Preds ..B1.172 ..B1.147
                                # Execution count [8.16e-03]: Infreq
..LN1395:
	.loc    1  561  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #561.3
..___tag_value_main.35:
..LN1396:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #561.3
..___tag_value_main.36:
..LN1397:
                                # LOE r15 r12d r13d r14d
..B1.174:                       # Preds ..B1.173
                                # Execution count [8.16e-03]: Infreq
..LN1398:
	.loc    1  563  is_stmt 1
        movl      %r14d, %edx                                   #563.3
..LN1399:
        shrl      $31, %edx                                     #563.3
..LN1400:
        addl      %edx, %r14d                                   #563.3
..LN1401:
        sarl      $1, %r14d                                     #563.3
..___tag_value_main.37:
..LN1402:
	.loc    1  566  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #566.3
..___tag_value_main.38:
..LN1403:
                                # LOE r15 r12d r13d r14d
..B1.175:                       # Preds ..B1.174
                                # Execution count [8.16e-03]: Infreq
..LN1404:
	.loc    1  568  is_stmt 1
        movq      176(%rsp), %rdi                               #568.3[spill]
..LN1405:
#       _mm_free(void *)
        call      _mm_free                                      #568.3
..LN1406:
                                # LOE r15 r12d r13d r14d
..B1.176:                       # Preds ..B1.175
                                # Execution count [8.16e-03]: Infreq
..LN1407:
	.loc    1  569  is_stmt 1
        movq      24(%rsp), %rdi                                #569.3[spill]
..LN1408:
#       _mm_free(void *)
        call      _mm_free                                      #569.3
..LN1409:
                                # LOE r15 r12d r13d r14d
..B1.177:                       # Preds ..B1.176
                                # Execution count [8.16e-03]: Infreq
..LN1410:
	.loc    1  570  is_stmt 1
        movq      32(%rsp), %rdi                                #570.3[spill]
..LN1411:
#       _mm_free(void *)
        call      _mm_free                                      #570.3
..LN1412:
                                # LOE r15 r12d r13d r14d
..B1.178:                       # Preds ..B1.177
                                # Execution count [8.16e-03]: Infreq
..LN1413:
	.loc    1  571  is_stmt 1
        movq      48(%rsp), %rdi                                #571.3[spill]
..LN1414:
#       _mm_free(void *)
        call      _mm_free                                      #571.3
..LN1415:
                                # LOE r15 r12d r13d r14d
..B1.179:                       # Preds ..B1.178
                                # Execution count [8.16e-03]: Infreq
..LN1416:
	.loc    1  572  is_stmt 1
        movq      120(%rsp), %rdi                               #572.3[spill]
..LN1417:
#       _mm_free(void *)
        call      _mm_free                                      #572.3
..LN1418:
                                # LOE r15 r12d r13d r14d
..B1.180:                       # Preds ..B1.179
                                # Execution count [8.16e-03]: Infreq
..LN1419:
	.loc    1  573  is_stmt 1
        movq      128(%rsp), %rdi                               #573.3[spill]
..LN1420:
#       _mm_free(void *)
        call      _mm_free                                      #573.3
..LN1421:
                                # LOE r15 r12d r13d r14d
..B1.181:                       # Preds ..B1.180
                                # Execution count [8.16e-03]: Infreq
..LN1422:
	.loc    1  574  is_stmt 1
        movq      136(%rsp), %rdi                               #574.3[spill]
..LN1423:
#       _mm_free(void *)
        call      _mm_free                                      #574.3
..LN1424:
                                # LOE r15 r12d r13d r14d
..B1.182:                       # Preds ..B1.181
                                # Execution count [8.16e-03]: Infreq
..LN1425:
	.loc    1  575  is_stmt 1
        movq      144(%rsp), %rdi                               #575.3[spill]
..LN1426:
#       _mm_free(void *)
        call      _mm_free                                      #575.3
..LN1427:
                                # LOE r15 r12d r13d r14d
..B1.183:                       # Preds ..B1.182
                                # Execution count [8.16e-03]: Infreq
..LN1428:
	.loc    1  576  is_stmt 1
        movq      152(%rsp), %rdi                               #576.3[spill]
..LN1429:
#       _mm_free(void *)
        call      _mm_free                                      #576.3
..LN1430:
                                # LOE r15 r12d r13d r14d
..B1.184:                       # Preds ..B1.183
                                # Execution count [8.16e-03]: Infreq
..LN1431:
	.loc    1  577  is_stmt 1
        movq      160(%rsp), %rdi                               #577.3[spill]
..LN1432:
#       _mm_free(void *)
        call      _mm_free                                      #577.3
..LN1433:
        jmp       ..B1.18       # Prob 100%                     #577.3
..LN1434:
                                # LOE r15 r12d r13d r14d
..B1.185:                       # Preds ..B1.151
                                # Execution count [1.84e-02]: Infreq
..LN1435:
	.loc    1  551  is_stmt 1
        xorl      %eax, %eax                                    #551.5
..LN1436:
        jmp       ..B1.157      # Prob 100%                     #551.5
..LN1437:
                                # LOE eax ecx ebx xmm2
..B1.186:                       # Preds ..B1.132
                                # Execution count [7.34e-04]: Infreq
..LN1438:
	.loc    1  527  is_stmt 1
        xorl      %eax, %eax                                    #527.3
..LN1439:
        jmp       ..B1.142      # Prob 100%                     #527.3
..LN1440:
                                # LOE r15 eax r12d r13d
..B1.187:                       # Preds ..B1.117
                                # Execution count [7.34e-04]: Infreq
..LN1441:
        xorl      %r8d, %r8d                                    #527.3
..LN1442:
        jmp       ..B1.127      # Prob 100%                     #527.3
..LN1443:
                                # LOE r15 r8d r12d r13d
..B1.188:                       # Preds ..B1.15
                                # Execution count [8.16e-03]: Infreq
..LN1444:
	.loc    1  449  is_stmt 1
        movq      %rbx, %rdi                                    #449.16
..LN1445:
        movq      %r15, %rsi                                    #449.16
..LN1446:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #449.16
..LN1447:
                                # LOE rax rbx r15 r12d r13d
..B1.697:                       # Preds ..B1.188
                                # Execution count [8.16e-03]: Infreq
..LN1448:
        movq      %rax, 168(%rsp)                               #449.16[spill]
..LN1449:
                                # LOE rbx r15 r12d r13d
..B1.189:                       # Preds ..B1.697
                                # Execution count [8.16e-03]: Infreq
..LN1450:
	.loc    1  450  is_stmt 1
        movq      %rbx, %rdi                                    #450.16
..LN1451:
        movq      %r15, %rsi                                    #450.16
..LN1452:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #450.16
..LN1453:
                                # LOE rax rbx r15 r12d r13d
..B1.698:                       # Preds ..B1.189
                                # Execution count [8.16e-03]: Infreq
..LN1454:
        movq      %rax, 152(%rsp)                               #450.16[spill]
..LN1455:
                                # LOE rbx r15 r12d r13d
..B1.190:                       # Preds ..B1.698
                                # Execution count [8.16e-03]: Infreq
..LN1456:
	.loc    1  451  is_stmt 1
        movq      %rbx, %rdi                                    #451.16
..LN1457:
        movq      %r15, %rsi                                    #451.16
..LN1458:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #451.16
..LN1459:
                                # LOE rax rbx r15 r12d r13d
..B1.699:                       # Preds ..B1.190
                                # Execution count [8.16e-03]: Infreq
..LN1460:
        movq      %rax, 144(%rsp)                               #451.16[spill]
..LN1461:
                                # LOE rbx r15 r12d r13d
..B1.191:                       # Preds ..B1.699
                                # Execution count [8.16e-03]: Infreq
..LN1462:
	.loc    1  452  is_stmt 1
        movq      %rbx, %rdi                                    #452.16
..LN1463:
        movq      %r15, %rsi                                    #452.16
..LN1464:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #452.16
..LN1465:
                                # LOE rax rbx r15 r12d r13d
..B1.700:                       # Preds ..B1.191
                                # Execution count [8.16e-03]: Infreq
..LN1466:
        movq      %rax, 128(%rsp)                               #452.16[spill]
..LN1467:
                                # LOE rbx r15 r12d r13d
..B1.192:                       # Preds ..B1.700
                                # Execution count [8.16e-03]: Infreq
..LN1468:
	.loc    1  453  is_stmt 1
        movq      %rbx, %rdi                                    #453.16
..LN1469:
        movq      %r15, %rsi                                    #453.16
..LN1470:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #453.16
..LN1471:
                                # LOE rax rbx r15 r12d r13d
..B1.701:                       # Preds ..B1.192
                                # Execution count [8.16e-03]: Infreq
..LN1472:
        movq      %rax, 136(%rsp)                               #453.16[spill]
..LN1473:
                                # LOE rbx r15 r12d r13d
..B1.193:                       # Preds ..B1.701
                                # Execution count [8.16e-03]: Infreq
..LN1474:
	.loc    1  454  is_stmt 1
        movq      %rbx, %rdi                                    #454.16
..LN1475:
        movq      %r15, %rsi                                    #454.16
..LN1476:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #454.16
..LN1477:
                                # LOE rax rbx r15 r12d r13d
..B1.702:                       # Preds ..B1.193
                                # Execution count [8.16e-03]: Infreq
..LN1478:
        movq      %rax, 120(%rsp)                               #454.16[spill]
..LN1479:
                                # LOE rbx r15 r12d r13d
..B1.194:                       # Preds ..B1.702
                                # Execution count [8.16e-03]: Infreq
..LN1480:
	.loc    1  455  is_stmt 1
        movq      %rbx, %rdi                                    #455.16
..LN1481:
        movq      %r15, %rsi                                    #455.16
..LN1482:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #455.16
..LN1483:
                                # LOE rax rbx r15 r12d r13d
..B1.703:                       # Preds ..B1.194
                                # Execution count [8.16e-03]: Infreq
..LN1484:
        movq      %rax, 48(%rsp)                                #455.16[spill]
..LN1485:
                                # LOE rbx r15 r12d r13d
..B1.195:                       # Preds ..B1.703
                                # Execution count [8.16e-03]: Infreq
..LN1486:
	.loc    1  456  is_stmt 1
        movq      %rbx, %rdi                                    #456.16
..LN1487:
        movq      %r15, %rsi                                    #456.16
..LN1488:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #456.16
..LN1489:
                                # LOE rax rbx r15 r12d r13d
..B1.704:                       # Preds ..B1.195
                                # Execution count [8.16e-03]: Infreq
..LN1490:
        movq      %rax, 32(%rsp)                                #456.16[spill]
..LN1491:
                                # LOE rbx r15 r12d r13d
..B1.196:                       # Preds ..B1.704
                                # Execution count [8.16e-03]: Infreq
..LN1492:
	.loc    1  457  is_stmt 1
        movq      %rbx, %rdi                                    #457.16
..LN1493:
        movq      %r15, %rsi                                    #457.16
..LN1494:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #457.16
..LN1495:
                                # LOE rax r15 r12d r13d
..B1.705:                       # Preds ..B1.196
                                # Execution count [8.16e-03]: Infreq
..LN1496:
        movq      %rax, %rbx                                    #457.16
..LN1497:
                                # LOE rbx r15 r12d r13d
..B1.197:                       # Preds ..B1.705
                                # Execution count [8.16e-03]: Infreq
..LN1498:
	.loc    1  459  is_stmt 1
        testl     %r13d, %r13d                                  #459.18
..LN1499:
        jle       ..B1.228      # Prob 50%                      #459.18
..LN1500:
                                # LOE rbx r15 r12d r13d
..B1.198:                       # Preds ..B1.197
                                # Execution count [7.34e-03]: Infreq
..LN1501:
        movq      32(%rsp), %rdx                                #459.3[spill]
..LN1502:
        andq      $63, %rdx                                     #459.3
..LN1503:
        testl     %edx, %edx                                    #459.3
..LN1504:
        je        ..B1.201      # Prob 50%                      #459.3
..LN1505:
                                # LOE rbx r15 edx r12d r13d
..B1.199:                       # Preds ..B1.198
                                # Execution count [7.34e-03]: Infreq
..LN1506:
        testb     $7, %dl                                       #459.3
..LN1507:
        jne       ..B1.268      # Prob 10%                      #459.3
..LN1508:
                                # LOE rbx r15 edx r12d r13d
..B1.200:                       # Preds ..B1.199
                                # Execution count [0.00e+00]: Infreq
..LN1509:
        negl      %edx                                          #459.3
..LN1510:
        addl      $64, %edx                                     #459.3
..LN1511:
        shrl      $3, %edx                                      #459.3
..LN1512:
        cmpl      %edx, %r13d                                   #459.3
..LN1513:
        cmovl     %r13d, %edx                                   #459.3
..LN1514:
                                # LOE rbx r15 edx r12d r13d
..B1.201:                       # Preds ..B1.200 ..B1.198
                                # Execution count [8.16e-03]: Infreq
..LN1515:
        movl      %r13d, %r10d                                  #459.3
..LN1516:
        subl      %edx, %r10d                                   #459.3
..LN1517:
        andl      $7, %r10d                                     #459.3
..LN1518:
        negl      %r10d                                         #459.3
..LN1519:
        addl      %r13d, %r10d                                  #459.3
..LN1520:
        cmpl      $1, %edx                                      #459.3
..LN1521:
        jb        ..B1.205      # Prob 50%                      #459.3
..LN1522:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.202:                       # Preds ..B1.201
                                # Execution count [7.34e-03]: Infreq
..LN1523:
        movl      $8, %r8d                                      #459.3
..LN1524:
        vmovd     %edx, %xmm0                                   #459.3
..LN1525:
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1526:
        movl      $255, %eax                                    #459.3
..LN1527:
        movl      %r12d, (%rsp)                                 #459.3[spill]
..LN1528:
        movq      %r15, 8(%rsp)                                 #459.3[spill]
..LN1529:
        vmovd     %r8d, %xmm6                                   #459.3
..LN1530:
        xorl      %r8d, %r8d                                    #459.3
..LN1531:
        movl      %r13d, 192(%rsp)                              #459.3[spill]
..LN1532:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #459.3
..LN1533:
	.loc    1  460  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #460.11
..LN1534:
	.loc    1  461  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #461.11
..LN1535:
	.loc    1  462  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #462.11
..LN1536:
	.loc    1  463  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #463.11
..LN1537:
	.loc    1  459  is_stmt 1
        kmovw     %eax, %k1                                     #459.3
..LN1538:
        vpbroadcastd %xmm6, %ymm6                               #459.3
..LN1539:
        xorl      %eax, %eax                                    #459.3
..LN1540:
        movslq    %edx, %r9                                     #459.3
..LN1541:
        movq      32(%rsp), %rcx                                #459.3[spill]
..LN1542:
        movq      48(%rsp), %rsi                                #459.3[spill]
..LN1543:
        movq      120(%rsp), %r11                               #459.3[spill]
..LN1544:
        movq      136(%rsp), %r12                               #459.3[spill]
..LN1545:
        movq      128(%rsp), %r13                               #459.3[spill]
..LN1546:
        movq      144(%rsp), %r14                               #459.3[spill]
..LN1547:
        movq      152(%rsp), %r15                               #459.3[spill]
..LN1548:
        movq      168(%rsp), %rdi                               #459.3[spill]
        .align    16,0x90
..LN1549:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 edx r10d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.203:                       # Preds ..B1.203 ..B1.202
                                # Execution count [4.08e-02]: Infreq
..LN1550:
        addq      $8, %r8                                       #459.3
..LN1551:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #459.3
..LN1552:
        vpaddd    %ymm6, %ymm5, %ymm5                           #459.3
..LN1553:
	.loc    1  460  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #460.4
..LN1554:
	.loc    1  461  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #461.4
..LN1555:
	.loc    1  462  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #462.4
..LN1556:
	.loc    1  463  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #463.4
..LN1557:
	.loc    1  464  is_stmt 1
        vmovupd   %zmm4, (%rax,%r12){%k2}                       #464.4
..LN1558:
	.loc    1  465  is_stmt 1
        vmovupd   %zmm3, (%rax,%r11){%k2}                       #465.4
..LN1559:
	.loc    1  466  is_stmt 1
        vmovupd   %zmm2, (%rax,%rsi){%k2}                       #466.4
..LN1560:
	.loc    1  467  is_stmt 1
        vmovupd   %zmm1, (%rax,%rcx){%k2}                       #467.4
..LN1561:
	.loc    1  459  is_stmt 1
        addq      $64, %rax                                     #459.3
..LN1562:
        cmpq      %r9, %r8                                      #459.3
..LN1563:
        jb        ..B1.203      # Prob 81%                      #459.3
..LN1564:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r12 r13 r14 r15 edx r10d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.204:                       # Preds ..B1.203
                                # Execution count [7.34e-03]: Infreq
..LN1565:
        movl      192(%rsp), %r13d                              #[spill]
..LN1566:
        movl      (%rsp), %r12d                                 #[spill]
..LN1567:
        movq      8(%rsp), %r15                                 #[spill]
..LN1568:
        cmpl      %edx, %r13d                                   #459.3
..LN1569:
        je        ..B1.213      # Prob 10%                      #459.3
..LN1570:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.205:                       # Preds ..B1.204 ..B1.201
                                # Execution count [0.00e+00]: Infreq
..LN1571:
        lea       8(%rdx), %r8d                                 #459.3
..LN1572:
        cmpl      %r8d, %r10d                                   #459.3
..LN1573:
        jl        ..B1.209      # Prob 50%                      #459.3
..LN1574:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.206:                       # Preds ..B1.205
                                # Execution count [7.34e-03]: Infreq
..LN1575:
        movl      %r13d, 192(%rsp)                              #459.3[spill]
..LN1576:
        movslq    %edx, %rdx                                    #459.3
..LN1577:
	.loc    1  460  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #460.11
..LN1578:
	.loc    1  461  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #461.11
..LN1579:
	.loc    1  462  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #462.11
..LN1580:
	.loc    1  463  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #463.11
..LN1581:
	.loc    1  459  is_stmt 1
        movslq    %r10d, %rax                                   #459.3
..LN1582:
        movq      32(%rsp), %r8                                 #459.3[spill]
..LN1583:
        movq      48(%rsp), %r9                                 #459.3[spill]
..LN1584:
        movq      120(%rsp), %r11                               #459.3[spill]
..LN1585:
        movq      136(%rsp), %r13                               #459.3[spill]
..LN1586:
        movq      128(%rsp), %r14                               #459.3[spill]
..LN1587:
        movq      144(%rsp), %rcx                               #459.3[spill]
..LN1588:
        movq      152(%rsp), %rsi                               #459.3[spill]
..LN1589:
        movq      168(%rsp), %rdi                               #459.3[spill]
        .align    16,0x90
..LN1590:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d zmm0 zmm1 zmm2 zmm3
..B1.207:                       # Preds ..B1.207 ..B1.206
                                # Execution count [4.08e-02]: Infreq
..LN1591:
	.loc    1  460  is_stmt 1
        vmovupd   %zmm3, (%rdi,%rdx,8)                          #460.4
..LN1592:
	.loc    1  461  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #461.4
..LN1593:
	.loc    1  462  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #462.4
..LN1594:
	.loc    1  463  is_stmt 1
        vmovupd   %zmm0, (%r14,%rdx,8)                          #463.4
..LN1595:
	.loc    1  464  is_stmt 1
        vmovupd   %zmm3, (%r13,%rdx,8)                          #464.4
..LN1596:
	.loc    1  465  is_stmt 1
        vmovupd   %zmm2, (%r11,%rdx,8)                          #465.4
..LN1597:
	.loc    1  466  is_stmt 1
        vmovupd   %zmm1, (%r9,%rdx,8)                           #466.4
..LN1598:
	.loc    1  467  is_stmt 1
        vmovntpd  %zmm0, (%r8,%rdx,8)                           #467.4
..LN1599:
	.loc    1  459  is_stmt 1
        addq      $8, %rdx                                      #459.3
..LN1600:
        cmpq      %rax, %rdx                                    #459.3
..LN1601:
        jb        ..B1.207      # Prob 81%                      #459.3
..LN1602:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 r10d r12d zmm0 zmm1 zmm2 zmm3
..B1.208:                       # Preds ..B1.207
                                # Execution count [7.34e-03]: Infreq
..LN1603:
        movl      192(%rsp), %r13d                              #[spill]
..LN1604:
                                # LOE rbx r15 r10d r12d r13d
..B1.209:                       # Preds ..B1.208 ..B1.205 ..B1.268
                                # Execution count [8.16e-03]: Infreq
..LN1605:
        lea       1(%r10), %edx                                 #459.3
..LN1606:
        cmpl      %r13d, %edx                                   #459.3
..LN1607:
        ja        ..B1.213      # Prob 50%                      #459.3
..LN1608:
                                # LOE rbx r15 r10d r12d r13d
..B1.210:                       # Preds ..B1.209
                                # Execution count [7.34e-03]: Infreq
..LN1609:
        movslq    %r10d, %rdx                                   #459.3
..LN1610:
        movl      $8, %r11d                                     #459.3
..LN1611:
	.loc    1  465  is_stmt 1
        movq      120(%rsp), %r8                                #465.4[spill]
..LN1612:
	.loc    1  459  is_stmt 1
        negl      %r10d                                         #459.3
..LN1613:
        addl      %r13d, %r10d                                  #459.3
..LN1614:
        movl      $255, %eax                                    #459.3
..LN1615:
	.loc    1  466  is_stmt 1
        movq      48(%rsp), %r9                                 #466.4[spill]
..LN1616:
	.loc    1  459  is_stmt 1
        vmovd     %r11d, %xmm6                                  #459.3
..LN1617:
	.loc    1  465  is_stmt 1
        lea       (%r8,%rdx,8), %r11                            #465.4
..LN1618:
	.loc    1  462  is_stmt 1
        movq      144(%rsp), %r8                                #462.4[spill]
..LN1619:
	.loc    1  459  is_stmt 1
        vmovd     %r10d, %xmm0                                  #459.3
..LN1620:
	.loc    1  466  is_stmt 1
        lea       (%r9,%rdx,8), %rcx                            #466.4
..LN1621:
	.loc    1  467  is_stmt 1
        movq      32(%rsp), %r10                                #467.4[spill]
..LN1622:
	.loc    1  463  is_stmt 1
        movq      128(%rsp), %r9                                #463.4[spill]
..LN1623:
	.loc    1  462  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #462.4
..LN1624:
        movq      %r8, 24(%rsp)                                 #462.4[spill]
..LN1625:
	.loc    1  461  is_stmt 1
        movq      152(%rsp), %r8                                #461.4[spill]
..LN1626:
	.loc    1  467  is_stmt 1
        lea       (%r10,%rdx,8), %rsi                           #467.4
..LN1627:
	.loc    1  464  is_stmt 1
        movq      136(%rsp), %r10                               #464.4[spill]
..LN1628:
	.loc    1  463  is_stmt 1
        lea       (%r9,%rdx,8), %r9                             #463.4
..LN1629:
	.loc    1  459  is_stmt 1
        kmovw     %eax, %k1                                     #459.3
..LN1630:
        xorl      %eax, %eax                                    #459.3
..LN1631:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #459.3
..LN1632:
	.loc    1  460  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #460.11
..LN1633:
	.loc    1  461  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #461.11
..LN1634:
	.loc    1  462  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #462.11
..LN1635:
	.loc    1  463  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #463.11
..LN1636:
	.loc    1  459  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1637:
	.loc    1  461  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #461.4
..LN1638:
        movq      %r8, 16(%rsp)                                 #461.4[spill]
..LN1639:
	.loc    1  464  is_stmt 1
        lea       (%r10,%rdx,8), %r10                           #464.4
..LN1640:
	.loc    1  460  is_stmt 1
        movq      168(%rsp), %r8                                #460.4[spill]
..LN1641:
	.loc    1  459  is_stmt 1
        movq      112(%rsp), %rdi                               #459.3[spill]
..LN1642:
        movl      %r13d, 192(%rsp)                              #459.3[spill]
..LN1643:
        subq      %rdx, %rdi                                    #459.3
..LN1644:
        vpbroadcastd %xmm6, %ymm6                               #459.3
..LN1645:
	.loc    1  460  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #460.4
..LN1646:
	.loc    1  459  is_stmt 1
        movq      16(%rsp), %r13                                #459.3[spill]
..LN1647:
        xorl      %edx, %edx                                    #459.3
..LN1648:
        movq      24(%rsp), %r14                                #459.3[spill]
        .align    16,0x90
..LN1649:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r13 r14 r15 r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.211:                       # Preds ..B1.211 ..B1.210
                                # Execution count [4.08e-02]: Infreq
..LN1650:
        addq      $8, %rax                                      #459.3
..LN1651:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #459.3
..LN1652:
        vpaddd    %ymm6, %ymm5, %ymm5                           #459.3
..LN1653:
	.loc    1  460  is_stmt 1
        vmovupd   %zmm4, (%rdx,%r8){%k2}                        #460.4
..LN1654:
	.loc    1  461  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r13){%k2}                       #461.4
..LN1655:
	.loc    1  462  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r14){%k2}                       #462.4
..LN1656:
	.loc    1  463  is_stmt 1
        vmovupd   %zmm1, (%rdx,%r9){%k2}                        #463.4
..LN1657:
	.loc    1  464  is_stmt 1
        vmovupd   %zmm4, (%rdx,%r10){%k2}                       #464.4
..LN1658:
	.loc    1  465  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r11){%k2}                       #465.4
..LN1659:
	.loc    1  466  is_stmt 1
        vmovupd   %zmm2, (%rdx,%rcx){%k2}                       #466.4
..LN1660:
	.loc    1  467  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rsi){%k2}                       #467.4
..LN1661:
	.loc    1  459  is_stmt 1
        addq      $64, %rdx                                     #459.3
..LN1662:
        cmpq      %rdi, %rax                                    #459.3
..LN1663:
        jb        ..B1.211      # Prob 81%                      #459.3
..LN1664:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r13 r14 r15 r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.212:                       # Preds ..B1.211
                                # Execution count [7.34e-03]: Infreq
..LN1665:
        movl      192(%rsp), %r13d                              #[spill]
..LN1666:
                                # LOE rbx r15 r12d r13d
..B1.213:                       # Preds ..B1.204 ..B1.209 ..B1.212
                                # Execution count [7.34e-03]: Infreq
..LN1667:
        movq      %rbx, %r10                                    #459.3
..LN1668:
        andq      $63, %r10                                     #459.3
..LN1669:
        testl     %r10d, %r10d                                  #459.3
..LN1670:
        je        ..B1.216      # Prob 50%                      #459.3
..LN1671:
                                # LOE rbx r15 r10d r12d r13d
..B1.214:                       # Preds ..B1.213
                                # Execution count [7.34e-03]: Infreq
..LN1672:
        testl     $7, %r10d                                     #459.3
..LN1673:
        jne       ..B1.267      # Prob 10%                      #459.3
..LN1674:
                                # LOE rbx r15 r10d r12d r13d
..B1.215:                       # Preds ..B1.214
                                # Execution count [0.00e+00]: Infreq
..LN1675:
        negl      %r10d                                         #459.3
..LN1676:
        addl      $64, %r10d                                    #459.3
..LN1677:
        shrl      $3, %r10d                                     #459.3
..LN1678:
        cmpl      %r10d, %r13d                                  #459.3
..LN1679:
        cmovl     %r13d, %r10d                                  #459.3
..LN1680:
                                # LOE rbx r15 r10d r12d r13d
..B1.216:                       # Preds ..B1.215 ..B1.213
                                # Execution count [8.16e-03]: Infreq
..LN1681:
        movl      %r13d, %eax                                   #459.3
..LN1682:
        subl      %r10d, %eax                                   #459.3
..LN1683:
        andl      $7, %eax                                      #459.3
..LN1684:
        negl      %eax                                          #459.3
..LN1685:
        addl      %r13d, %eax                                   #459.3
..LN1686:
        cmpl      $1, %r10d                                     #459.3
..LN1687:
        jb        ..B1.220      # Prob 50%                      #459.3
..LN1688:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.217:                       # Preds ..B1.216
                                # Execution count [7.34e-03]: Infreq
..LN1689:
        movl      $255, %edx                                    #459.3
..LN1690:
        vmovd     %r10d, %xmm0                                  #459.3
..LN1691:
        kmovw     %edx, %k1                                     #459.3
..LN1692:
        movl      $8, %edx                                      #459.3
..LN1693:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #459.3
..LN1694:
	.loc    1  468  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #468.11
..LN1695:
	.loc    1  459  is_stmt 1
        vmovd     %edx, %xmm3                                   #459.3
..LN1696:
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1697:
        xorl      %r9d, %r9d                                    #459.3
..LN1698:
        vpbroadcastd %xmm3, %ymm3                               #459.3
..LN1699:
        xorl      %edx, %edx                                    #459.3
..LN1700:
        movslq    %r10d, %r8                                    #459.3
..LN1701:
                                # LOE rdx rbx r8 r9 r15 eax r10d r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.218:                       # Preds ..B1.218 ..B1.217
                                # Execution count [4.08e-02]: Infreq
..LN1702:
        addq      $8, %r9                                       #459.3
..LN1703:
        vpcmpgtd  %zmm2, %zmm0, %k2{%k1}                        #459.3
..LN1704:
        vpaddd    %ymm3, %ymm2, %ymm2                           #459.3
..LN1705:
	.loc    1  468  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rbx){%k2}                       #468.4
..LN1706:
	.loc    1  459  is_stmt 1
        addq      $64, %rdx                                     #459.3
..LN1707:
        cmpq      %r8, %r9                                      #459.3
..LN1708:
        jb        ..B1.218      # Prob 81%                      #459.3
..LN1709:
                                # LOE rdx rbx r8 r9 r15 eax r10d r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.219:                       # Preds ..B1.218
                                # Execution count [7.34e-03]: Infreq
..LN1710:
        cmpl      %r10d, %r13d                                  #459.3
..LN1711:
        je        ..B1.228      # Prob 10%                      #459.3
..LN1712:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.220:                       # Preds ..B1.216 ..B1.219
                                # Execution count [0.00e+00]: Infreq
..LN1713:
        lea       8(%r10), %edx                                 #459.3
..LN1714:
        cmpl      %edx, %eax                                    #459.3
..LN1715:
        jl        ..B1.224      # Prob 50%                      #459.3
..LN1716:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.221:                       # Preds ..B1.220
                                # Execution count [7.34e-03]: Infreq
..LN1717:
        movslq    %r10d, %r10                                   #459.3
..LN1718:
	.loc    1  468  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm0             #468.11
..LN1719:
	.loc    1  459  is_stmt 1
        movslq    %eax, %rdx                                    #459.3
..LN1720:
                                # LOE rdx rbx r10 r15 eax r12d r13d zmm0
..B1.222:                       # Preds ..B1.222 ..B1.221
                                # Execution count [4.08e-02]: Infreq
..LN1721:
	.loc    1  468  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r10,8)                          #468.4
..LN1722:
	.loc    1  459  is_stmt 1
        addq      $8, %r10                                      #459.3
..LN1723:
        cmpq      %rdx, %r10                                    #459.3
..LN1724:
        jb        ..B1.222      # Prob 81%                      #459.3
..LN1725:
                                # LOE rdx rbx r10 r15 eax r12d r13d zmm0
..B1.224:                       # Preds ..B1.222 ..B1.220 ..B1.267
                                # Execution count [8.16e-03]: Infreq
..LN1726:
        lea       1(%rax), %edx                                 #459.3
..LN1727:
        cmpl      %r13d, %edx                                   #459.3
..LN1728:
        ja        ..B1.228      # Prob 50%                      #459.3
..LN1729:
                                # LOE rbx r15 eax r12d r13d
..B1.225:                       # Preds ..B1.224
                                # Execution count [7.34e-03]: Infreq
..LN1730:
        movl      $255, %edx                                    #459.3
..LN1731:
        movl      $8, %r8d                                      #459.3
..LN1732:
        kmovw     %edx, %k1                                     #459.3
..LN1733:
        xorl      %r9d, %r9d                                    #459.3
..LN1734:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #459.3
..LN1735:
	.loc    1  468  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #468.11
..LN1736:
	.loc    1  459  is_stmt 1
        vmovd     %r8d, %xmm3                                   #459.3
..LN1737:
        movslq    %eax, %rdx                                    #459.3
..LN1738:
        negl      %eax                                          #459.3
..LN1739:
        addl      %r13d, %eax                                   #459.3
..LN1740:
        movq      112(%rsp), %r8                                #459.3[spill]
..LN1741:
        vpbroadcastd %xmm3, %ymm3                               #459.3
..LN1742:
        subq      %rdx, %r8                                     #459.3
..LN1743:
	.loc    1  468  is_stmt 1
        lea       (%rbx,%rdx,8), %rdx                           #468.4
..LN1744:
	.loc    1  459  is_stmt 1
        vmovd     %eax, %xmm0                                   #459.3
..LN1745:
        xorl      %eax, %eax                                    #459.3
..LN1746:
        vpbroadcastd %xmm0, %ymm0                               #459.3
..LN1747:
                                # LOE rax rdx rbx r8 r9 r15 r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.226:                       # Preds ..B1.226 ..B1.225
                                # Execution count [4.08e-02]: Infreq
..LN1748:
        addq      $8, %r9                                       #459.3
..LN1749:
        vpcmpgtd  %zmm2, %zmm0, %k2{%k1}                        #459.3
..LN1750:
        vpaddd    %ymm3, %ymm2, %ymm2                           #459.3
..LN1751:
	.loc    1  468  is_stmt 1
        vmovupd   %zmm1, (%rax,%rdx){%k2}                       #468.4
..LN1752:
	.loc    1  459  is_stmt 1
        addq      $64, %rax                                     #459.3
..LN1753:
        cmpq      %r8, %r9                                      #459.3
..LN1754:
        jb        ..B1.226      # Prob 81%                      #459.3
..LN1755:
                                # LOE rax rdx rbx r8 r9 r15 r12d r13d ymm2 ymm3 zmm0 zmm1 k1
..B1.228:                       # Preds ..B1.226 ..B1.219 ..B1.224 ..B1.197
                                # Execution count [8.16e-03]: Infreq
..LN1756:
	.loc    1  473  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #473.3
..LN1757:
	.loc    1  471  is_stmt 1
        movl      $1, %r14d                                     #471.3
..LN1758:
	.loc    1  473  is_stmt 1
        vzeroupper                                              #473.3
..___tag_value_main.39:
..LN1759:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #473.3
..___tag_value_main.40:
..LN1760:
                                # LOE rbx r15 r12d r13d r14d
..B1.229:                       # Preds ..B1.228
                                # Execution count [8.16e-03]: Infreq
..LN1761:
	.loc    1  475  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #475.11
..LN1762:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #475.24
..LN1763:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #475.15
..LN1764:
        vcomisd   %xmm1, %xmm0                                  #475.24
..LN1765:
        jbe       ..B1.255      # Prob 10%                      #475.24
..LN1766:
                                # LOE rbx r15 r12d r13d r14d
..B1.230:                       # Preds ..B1.229
                                # Execution count [7.34e-03]: Infreq
..LN1767:
	.loc    1  482  is_stmt 1
        movl      $8, %r8d                                      #482.5
..LN1768:
        movl      %r13d, %edx                                   #482.5
..LN1769:
        andl      $-64, %edx                                    #482.5
..LN1770:
	.loc    1  477  is_stmt 1
        lea       56(%rsp), %rdi                                #477.4
..LN1771:
	.loc    1  482  is_stmt 1
        movl      %edx, 104(%rdi)                               #482.5[spill]
..LN1772:
	.loc    1  477  is_stmt 1
        lea       40(%rsp), %rsi                                #477.4
..LN1773:
	.loc    1  482  is_stmt 1
        movslq    %edx, %rdx                                    #482.5
..LN1774:
        vmovd     %r8d, %xmm0                                   #482.5
..LN1775:
        vpbroadcastd %xmm0, %ymm1                               #482.5
..LN1776:
        vmovdqu   %ymm1, 24(%rsi)                               #482.5[spill]
..LN1777:
        movq      %rdx, -16(%rsi)                               #482.5[spill]
..LN1778:
	.loc    1  477  is_stmt 1
        vzeroupper                                              #477.4
..___tag_value_main.41:
..LN1779:
#       timing(double *, double *)
        call      timing                                        #477.4
..___tag_value_main.42:
..LN1780:
                                # LOE rbx r15 r12d r13d r14d
..B1.231:                       # Preds ..B1.230
                                # Execution count [6.61e-03]: Infreq
..LN1781:
	.loc    1  478  is_stmt 1
        xorl      %eax, %eax                                    #478.4
..LN1782:
        movq      %rbx, 16(%rsp)                                #478.4[spill]
..LN1783:
        movl      %eax, %ebx                                    #478.4
..LN1784:
        movl      %r14d, 184(%rsp)                              #478.4[spill]
..LN1785:
        vxorpd    %xmm1, %xmm1, %xmm1                           #478.4
..LN1786:
        movl      %r12d, (%rsp)                                 #478.4[spill]
..LN1787:
        movq      %r15, 8(%rsp)                                 #478.4[spill]
..LN1788:
                                # LOE ebx r13d xmm1
..B1.232:                       # Preds ..B1.231 ..B1.247 ..B1.253
                                # Execution count [2.04e-01]: Infreq
..LN1789:
	.loc    1  482  is_stmt 1
        xorl      %edi, %edi                                    #482.9
..LN1790:
        testl     %r13d, %r13d                                  #482.20
..LN1791:
        jle       ..B1.245      # Prob 50%                      #482.20
..LN1792:
                                # LOE ebx edi r13d xmm1
..B1.233:                       # Preds ..B1.232
                                # Execution count [1.84e-01]: Infreq
..LN1793:
        cmpl      $64, %r13d                                    #482.5
..LN1794:
        jl        ..B1.266      # Prob 10%                      #482.5
..LN1795:
                                # LOE ebx edi r13d xmm1
..B1.234:                       # Preds ..B1.233
                                # Execution count [1.84e-01]: Infreq
..LN1796:
        movl      160(%rsp), %edx                               #482.5[spill]
..LN1797:
                                # LOE edx ebx r13d xmm1
..B1.236:                       # Preds ..B1.234
                                # Execution count [1.84e-01]: Infreq
..LN1798:
        movq      24(%rsp), %rdi                                #482.5[spill]
..LN1799:
        xorl      %ecx, %ecx                                    #482.5
..LN1800:
        movq      16(%rsp), %r8                                 #482.5[spill]
..LN1801:
        movq      32(%rsp), %r9                                 #482.5[spill]
..LN1802:
        movq      48(%rsp), %r10                                #482.5[spill]
..LN1803:
        movq      120(%rsp), %r11                               #482.5[spill]
..LN1804:
        movq      136(%rsp), %r12                               #482.5[spill]
..LN1805:
        movq      128(%rsp), %r15                               #482.5[spill]
..LN1806:
        movq      144(%rsp), %rax                               #482.5[spill]
..LN1807:
        movq      152(%rsp), %rsi                               #482.5[spill]
..LN1808:
        movq      168(%rsp), %r14                               #482.5[spill]
..LN1809:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 edx ebx r13d xmm1
..B1.237:                       # Preds ..B1.237 ..B1.236
                                # Execution count [1.02e+00]: Infreq
..LN1810:
	.loc    1  483  is_stmt 1
        vmovups   (%rsi,%rcx,8), %zmm0                          #483.13
..LN1811:
        vmovups   (%r15,%rcx,8), %zmm2                          #483.27
..LN1812:
        vmovups   (%r11,%rcx,8), %zmm5                          #483.41
..LN1813:
        vmovups   (%r9,%rcx,8), %zmm6                           #483.55
..LN1814:
        vmovups   64(%r9,%rcx,8), %zmm16                        #483.55
..LN1815:
        vmovups   64(%rsi,%rcx,8), %zmm11                       #483.13
..LN1816:
        vmovups   64(%r15,%rcx,8), %zmm12                       #483.27
..LN1817:
        vmovups   64(%r11,%rcx,8), %zmm15                       #483.41
..LN1818:
        vaddpd    (%rax,%rcx,8), %zmm0, %zmm3                   #483.62
..LN1819:
        vaddpd    (%r12,%rcx,8), %zmm2, %zmm4                   #483.62
..LN1820:
        vaddpd    (%r10,%rcx,8), %zmm5, %zmm7                   #483.62
..LN1821:
        vaddpd    (%r8,%rcx,8), %zmm6, %zmm8                    #483.62
..LN1822:
        vaddpd    64(%r8,%rcx,8), %zmm16, %zmm18                #483.62
..LN1823:
        vaddpd    64(%rax,%rcx,8), %zmm11, %zmm13               #483.62
..LN1824:
        vaddpd    64(%r12,%rcx,8), %zmm12, %zmm14               #483.62
..LN1825:
        vaddpd    64(%r10,%rcx,8), %zmm15, %zmm17               #483.62
..LN1826:
        vaddpd    %zmm4, %zmm3, %zmm9                           #483.62
..LN1827:
        vaddpd    %zmm8, %zmm7, %zmm10                          #483.62
..LN1828:
        vaddpd    %zmm14, %zmm13, %zmm19                        #483.62
..LN1829:
        vaddpd    %zmm18, %zmm17, %zmm20                        #483.62
..LN1830:
        vaddpd    %zmm10, %zmm9, %zmm21                         #483.62
..LN1831:
        vaddpd    %zmm20, %zmm19, %zmm22                        #483.62
..LN1832:
        vmovntpd  %zmm21, (%r14,%rcx,8)                         #483.6
..LN1833:
        vmovntpd  %zmm22, 64(%r14,%rcx,8)                       #483.6
..LN1834:
        vmovups   128(%rsi,%rcx,8), %zmm23                      #483.13
..LN1835:
        vmovups   128(%r15,%rcx,8), %zmm24                      #483.27
..LN1836:
        vmovups   128(%r11,%rcx,8), %zmm27                      #483.41
..LN1837:
        vmovups   128(%r9,%rcx,8), %zmm28                       #483.55
..LN1838:
        vmovups   192(%r9,%rcx,8), %zmm4                        #483.55
..LN1839:
        vmovups   192(%rsi,%rcx,8), %zmm0                       #483.13
..LN1840:
        vmovups   192(%r15,%rcx,8), %zmm2                       #483.27
..LN1841:
        vmovups   192(%r11,%rcx,8), %zmm3                       #483.41
..LN1842:
        vaddpd    128(%rax,%rcx,8), %zmm23, %zmm25              #483.62
..LN1843:
        vaddpd    128(%r12,%rcx,8), %zmm24, %zmm26              #483.62
..LN1844:
        vaddpd    128(%r10,%rcx,8), %zmm27, %zmm29              #483.62
..LN1845:
        vaddpd    128(%r8,%rcx,8), %zmm28, %zmm30               #483.62
..LN1846:
        vaddpd    192(%r8,%rcx,8), %zmm4, %zmm6                 #483.62
..LN1847:
        vaddpd    %zmm26, %zmm25, %zmm31                        #483.62
..LN1848:
        vaddpd    192(%rax,%rcx,8), %zmm0, %zmm24               #483.62
..LN1849:
        vaddpd    192(%r12,%rcx,8), %zmm2, %zmm25               #483.62
..LN1850:
        vaddpd    192(%r10,%rcx,8), %zmm3, %zmm5                #483.62
..LN1851:
        vaddpd    %zmm30, %zmm29, %zmm23                        #483.62
..LN1852:
        vaddpd    %zmm25, %zmm24, %zmm7                         #483.62
..LN1853:
        vaddpd    %zmm6, %zmm5, %zmm8                           #483.62
..LN1854:
        vaddpd    %zmm23, %zmm31, %zmm9                         #483.62
..LN1855:
        vaddpd    %zmm8, %zmm7, %zmm10                          #483.62
..LN1856:
        vmovntpd  %zmm9, 128(%r14,%rcx,8)                       #483.6
..LN1857:
        vmovntpd  %zmm10, 192(%r14,%rcx,8)                      #483.6
..LN1858:
        vmovups   256(%rsi,%rcx,8), %zmm11                      #483.13
..LN1859:
        vmovups   256(%r15,%rcx,8), %zmm12                      #483.27
..LN1860:
        vmovups   256(%r11,%rcx,8), %zmm15                      #483.41
..LN1861:
        vmovups   256(%r9,%rcx,8), %zmm16                       #483.55
..LN1862:
        vmovups   320(%r9,%rcx,8), %zmm29                       #483.55
..LN1863:
        vmovups   320(%rsi,%rcx,8), %zmm21                      #483.13
..LN1864:
        vmovups   320(%r15,%rcx,8), %zmm22                      #483.27
..LN1865:
        vmovups   320(%r11,%rcx,8), %zmm28                      #483.41
..LN1866:
        vaddpd    256(%rax,%rcx,8), %zmm11, %zmm13              #483.62
..LN1867:
        vaddpd    256(%r12,%rcx,8), %zmm12, %zmm14              #483.62
..LN1868:
        vaddpd    256(%r10,%rcx,8), %zmm15, %zmm17              #483.62
..LN1869:
        vaddpd    256(%r8,%rcx,8), %zmm16, %zmm18               #483.62
..LN1870:
        vaddpd    320(%r8,%rcx,8), %zmm29, %zmm31               #483.62
..LN1871:
        vaddpd    320(%rax,%rcx,8), %zmm21, %zmm26              #483.62
..LN1872:
        vaddpd    320(%r12,%rcx,8), %zmm22, %zmm27              #483.62
..LN1873:
        vaddpd    320(%r10,%rcx,8), %zmm28, %zmm30              #483.62
..LN1874:
        vaddpd    %zmm14, %zmm13, %zmm19                        #483.62
..LN1875:
        vaddpd    %zmm18, %zmm17, %zmm20                        #483.62
..LN1876:
        vaddpd    %zmm27, %zmm26, %zmm21                        #483.62
..LN1877:
        vaddpd    %zmm31, %zmm30, %zmm22                        #483.62
..LN1878:
        vaddpd    %zmm20, %zmm19, %zmm0                         #483.62
..LN1879:
        vaddpd    %zmm22, %zmm21, %zmm2                         #483.62
..LN1880:
        vmovntpd  %zmm0, 256(%r14,%rcx,8)                       #483.6
..LN1881:
        vmovntpd  %zmm2, 320(%r14,%rcx,8)                       #483.6
..LN1882:
        vmovups   384(%rsi,%rcx,8), %zmm3                       #483.13
..LN1883:
        vmovups   384(%r15,%rcx,8), %zmm4                       #483.27
..LN1884:
        vmovups   384(%r11,%rcx,8), %zmm7                       #483.41
..LN1885:
        vmovups   384(%r9,%rcx,8), %zmm8                        #483.55
..LN1886:
        vmovups   448(%r9,%rcx,8), %zmm18                       #483.55
..LN1887:
        vmovups   448(%rsi,%rcx,8), %zmm13                      #483.13
..LN1888:
        .byte     144                                           #483.27
..LN1889:
        vmovups   448(%r15,%rcx,8), %zmm14                      #483.27
..LN1890:
        vmovups   448(%r11,%rcx,8), %zmm17                      #483.41
..LN1891:
        vaddpd    384(%rax,%rcx,8), %zmm3, %zmm5                #483.62
..LN1892:
        vaddpd    384(%r12,%rcx,8), %zmm4, %zmm6                #483.62
..LN1893:
        vaddpd    384(%r10,%rcx,8), %zmm7, %zmm9                #483.62
..LN1894:
        vaddpd    384(%r8,%rcx,8), %zmm8, %zmm10                #483.62
..LN1895:
        vaddpd    448(%r8,%rcx,8), %zmm18, %zmm20               #483.62
..LN1896:
        vaddpd    448(%rax,%rcx,8), %zmm13, %zmm15              #483.62
..LN1897:
        vaddpd    448(%r12,%rcx,8), %zmm14, %zmm16              #483.62
..LN1898:
        vaddpd    448(%r10,%rcx,8), %zmm17, %zmm19              #483.62
..LN1899:
        vaddpd    %zmm6, %zmm5, %zmm11                          #483.62
..LN1900:
        vaddpd    %zmm10, %zmm9, %zmm12                         #483.62
..LN1901:
        vaddpd    %zmm16, %zmm15, %zmm23                        #483.62
..LN1902:
        vaddpd    %zmm20, %zmm19, %zmm24                        #483.62
..LN1903:
        vaddpd    %zmm12, %zmm11, %zmm25                        #483.62
..LN1904:
        vaddpd    %zmm24, %zmm23, %zmm26                        #483.62
..LN1905:
        vmovntpd  %zmm25, 384(%r14,%rcx,8)                      #483.6
..LN1906:
        vmovntpd  %zmm26, 448(%r14,%rcx,8)                      #483.6
..LN1907:
	.loc    1  482  is_stmt 1
        addq      $64, %rcx                                     #482.5
..LN1908:
        cmpq      %rdi, %rcx                                    #482.5
..LN1909:
        jb        ..B1.237      # Prob 82%                      #482.5
..LN1910:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 edx ebx r13d xmm1
..B1.238:                       # Preds ..B1.237
                                # Execution count [1.84e-01]: Infreq
..LN1911:
        movl      %edx, %edi                                    #482.36
..LN1912:
                                # LOE edx ebx edi r13d xmm1
..B1.239:                       # Preds ..B1.238 ..B1.266
                                # Execution count [2.04e-01]: Infreq
..LN1913:
        lea       1(%rdx), %ecx                                 #482.5
..LN1914:
        cmpl      %r13d, %ecx                                   #482.5
..LN1915:
        ja        ..B1.245      # Prob 50%                      #482.5
..LN1916:
                                # LOE edx ebx edi r13d xmm1
..B1.240:                       # Preds ..B1.239
                                # Execution count [1.84e-01]: Infreq
..LN1917:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm0             #482.5
..LN1918:
                                # LOE edx ebx r13d xmm1 ymm0
..B1.242:                       # Preds ..B1.240
                                # Execution count [1.84e-01]: Infreq
..LN1919:
        movl      $255, %eax                                    #482.5
..LN1920:
        xorl      %esi, %esi                                    #482.5
..LN1921:
        kmovw     %eax, %k1                                     #482.5
..LN1922:
        vmovdqu   64(%rsp), %ymm14                              #482.5[spill]
..LN1923:
        movslq    %edx, %rax                                    #482.5
..LN1924:
        negl      %edx                                          #482.5
..LN1925:
        addl      %r13d, %edx                                   #482.5
..LN1926:
	.loc    1  483  is_stmt 1
        movq      168(%rsp), %rcx                               #483.6[spill]
..LN1927:
        movq      32(%rsp), %r9                                 #483.55[spill]
..LN1928:
        movq      48(%rsp), %r8                                 #483.48[spill]
..LN1929:
        movq      120(%rsp), %r10                               #483.41[spill]
..LN1930:
	.loc    1  482  is_stmt 1
        vmovd     %edx, %xmm2                                   #482.5
..LN1931:
	.loc    1  483  is_stmt 1
        movq      16(%rsp), %rdx                                #483.62[spill]
..LN1932:
        lea       (%rcx,%rax,8), %rcx                           #483.6
..LN1933:
        movq      136(%rsp), %r11                               #483.34[spill]
..LN1934:
        lea       (%r9,%rax,8), %r9                             #483.55
..LN1935:
        movq      128(%rsp), %r12                               #483.27[spill]
..LN1936:
        lea       (%r8,%rax,8), %r8                             #483.48
..LN1937:
        movq      144(%rsp), %r15                               #483.20[spill]
..LN1938:
        lea       (%rdx,%rax,8), %rdx                           #483.62
..LN1939:
        movq      152(%rsp), %r14                               #483.13[spill]
..LN1940:
        lea       (%r10,%rax,8), %r10                           #483.41
..LN1941:
	.loc    1  482  is_stmt 1
        vpbroadcastd %xmm2, %ymm2                               #482.5
..LN1942:
	.loc    1  483  is_stmt 1
        lea       (%r11,%rax,8), %r11                           #483.34
..LN1943:
	.loc    1  482  is_stmt 1
        movq      112(%rsp), %rdi                               #482.5[spill]
..LN1944:
	.loc    1  483  is_stmt 1
        lea       (%r12,%rax,8), %r12                           #483.27
..LN1945:
	.loc    1  482  is_stmt 1
        subq      %rax, %rdi                                    #482.5
..LN1946:
	.loc    1  483  is_stmt 1
        lea       (%r15,%rax,8), %r15                           #483.20
..LN1947:
        lea       (%r14,%rax,8), %r14                           #483.13
..LN1948:
	.loc    1  482  is_stmt 1
        xorl      %eax, %eax                                    #482.5
        .align    16,0x90
..LN1949:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm1 ymm0 ymm14 zmm2 k1
..B1.243:                       # Preds ..B1.243 ..B1.242
                                # Execution count [1.02e+00]: Infreq
..LN1950:
	.loc    1  483  is_stmt 1
        vmovups   (%rax,%r14), %zmm3                            #483.13
..LN1951:
	.loc    1  482  is_stmt 1
        addq      $8, %rsi                                      #482.5
..LN1952:
	.loc    1  483  is_stmt 1
        vmovups   (%rax,%r12), %zmm4                            #483.27
..LN1953:
        vmovups   (%rax,%r10), %zmm7                            #483.41
..LN1954:
        vmovups   (%rax,%r9), %zmm8                             #483.55
..LN1955:
        vaddpd    (%rax,%r15), %zmm3, %zmm5                     #483.62
..LN1956:
        vaddpd    (%rax,%r11), %zmm4, %zmm6                     #483.62
..LN1957:
        vaddpd    (%rax,%r8), %zmm7, %zmm9                      #483.62
..LN1958:
        vaddpd    (%rax,%rdx), %zmm8, %zmm10                    #483.62
..LN1959:
        vaddpd    %zmm6, %zmm5, %zmm11                          #483.62
..LN1960:
        vaddpd    %zmm10, %zmm9, %zmm12                         #483.62
..LN1961:
        vaddpd    %zmm12, %zmm11, %zmm13                        #483.62
..LN1962:
	.loc    1  482  is_stmt 1
        vpcmpgtd  %zmm0, %zmm2, %k2{%k1}                        #482.5
..LN1963:
        vpaddd    %ymm14, %ymm0, %ymm0                          #482.5
..LN1964:
	.loc    1  483  is_stmt 1
        vmovupd   %zmm13, (%rax,%rcx){%k2}                      #483.6
..LN1965:
	.loc    1  482  is_stmt 1
        addq      $64, %rax                                     #482.5
..LN1966:
        cmpq      %rdi, %rsi                                    #482.5
..LN1967:
        jb        ..B1.243      # Prob 82%                      #482.5
..LN1968:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm1 ymm0 ymm14 zmm2 k1
..B1.244:                       # Preds ..B1.243
                                # Execution count [1.84e-01]: Infreq
..LN1969:
        movl      %r13d, %edi                                   #482.36
..LN1970:
                                # LOE ebx edi r13d xmm1
..B1.245:                       # Preds ..B1.244 ..B1.239 ..B1.232
                                # Execution count [2.04e-01]: Infreq
..LN1971:
	.loc    1  486  is_stmt 1
        movslq    %edi, %rdi                                    #486.8
..LN1972:
        movq      168(%rsp), %rdx                               #486.13[spill]
..LN1973:
        vcomisd   (%rdx,%rdi,8), %xmm1                          #486.13
..LN1974:
        jbe       ..B1.247      # Prob 78%                      #486.13
..LN1975:
                                # LOE ebx r13d xmm1
..B1.246:                       # Preds ..B1.245
                                # Execution count [4.49e-02]: Infreq
..LN1976:
        movl      $il0_peep_printf_format_2, %edi               #486.16
..LN1977:
        vzeroupper                                              #486.16
..LN1978:
        call      puts                                          #486.16
..LN1979:
                                # LOE ebx r13d
..B1.748:                       # Preds ..B1.246
                                # Execution count [4.49e-02]: Infreq
..LN1980:
        vxorpd    %xmm1, %xmm1, %xmm1                           #
..LN1981:
                                # LOE ebx r13d xmm1
..B1.247:                       # Preds ..B1.245 ..B1.748
                                # Execution count [2.04e-01]: Infreq
..LN1982:
	.loc    1  478  is_stmt 1
        incl      %ebx                                          #478.4
..LN1983:
        cmpl      184(%rsp), %ebx                               #478.4[spill]
..LN1984:
        jb        ..B1.232      # Prob 81%                      #478.4
..LN1985:
                                # LOE ebx r13d xmm1
..B1.248:                       # Preds ..B1.247
                                # Execution count [3.74e-02]: Infreq
..LN1986:
        movl      184(%rsp), %r14d                              #[spill]
..LN1987:
                                # LOE r13d r14d
..B1.249:                       # Preds ..B1.252 ..B1.248
                                # Execution count [4.08e-02]: Infreq
..LN1988:
	.loc    1  489  is_stmt 1
        vzeroupper                                              #489.4
..LN1989:
        lea       96(%rsp), %rdi                                #489.4
..LN1990:
        lea       40(%rsp), %rsi                                #489.4
..___tag_value_main.43:
..LN1991:
#       timing(double *, double *)
        call      timing                                        #489.4
..___tag_value_main.44:
..LN1992:
                                # LOE r13d r14d
..B1.250:                       # Preds ..B1.249
                                # Execution count [4.08e-02]: Infreq
..LN1993:
	.loc    1  475  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #475.11
..LN1994:
	.loc    1  490  is_stmt 1
        addl      %r14d, %r14d                                  #490.4
..LN1995:
	.loc    1  475  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #475.24
..LN1996:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #475.15
..LN1997:
        vcomisd   %xmm1, %xmm0                                  #475.24
..LN1998:
        jbe       ..B1.254      # Prob 18%                      #475.24
..LN1999:
                                # LOE r13d r14d
..B1.251:                       # Preds ..B1.250
                                # Execution count [3.34e-02]: Infreq
..LN2000:
	.loc    1  477  is_stmt 1
        lea       56(%rsp), %rdi                                #477.4
..LN2001:
        lea       40(%rsp), %rsi                                #477.4
..___tag_value_main.45:
..LN2002:
#       timing(double *, double *)
        call      timing                                        #477.4
..___tag_value_main.46:
..LN2003:
                                # LOE r13d r14d
..B1.252:                       # Preds ..B1.251
                                # Execution count [3.34e-02]: Infreq
..LN2004:
	.loc    1  478  is_stmt 1
        xorl      %ebx, %ebx                                    #478.4
..LN2005:
        testl     %r14d, %r14d                                  #478.19
..LN2006:
        jle       ..B1.249      # Prob 9%                       #478.19
..LN2007:
                                # LOE ebx r13d r14d
..B1.253:                       # Preds ..B1.252
                                # Execution count [3.01e-02]: Infreq
..LN2008:
        .byte     102                                           #
..LN2009:
        .byte     144                                           #
..LN2010:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN2011:
        vxorpd    %xmm1, %xmm1, %xmm1                           #
..LN2012:
        jmp       ..B1.232      # Prob 100%                     #
..LN2013:
                                # LOE ebx r13d xmm1
..B1.254:                       # Preds ..B1.250
                                # Execution count [7.34e-03]: Infreq
..LN2014:
        movq      16(%rsp), %rbx                                #[spill]
..LN2015:
        movl      (%rsp), %r12d                                 #[spill]
..LN2016:
        movq      8(%rsp), %r15                                 #[spill]
..LN2017:
                                # LOE rbx r15 r12d r13d r14d
..B1.255:                       # Preds ..B1.254 ..B1.229
                                # Execution count [8.16e-03]: Infreq
..LN2018:
	.loc    1  493  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #493.3
..___tag_value_main.47:
..LN2019:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #493.3
..___tag_value_main.48:
..LN2020:
                                # LOE rbx r15 r12d r13d r14d
..B1.256:                       # Preds ..B1.255
                                # Execution count [8.16e-03]: Infreq
..LN2021:
	.loc    1  495  is_stmt 1
        movl      %r14d, %edx                                   #495.3
..LN2022:
        shrl      $31, %edx                                     #495.3
..LN2023:
        addl      %edx, %r14d                                   #495.3
..LN2024:
        sarl      $1, %r14d                                     #495.3
..___tag_value_main.49:
..LN2025:
	.loc    1  498  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #498.3
..___tag_value_main.50:
..LN2026:
                                # LOE rbx r15 r12d r13d r14d
..B1.257:                       # Preds ..B1.256
                                # Execution count [8.16e-03]: Infreq
..LN2027:
	.loc    1  500  is_stmt 1
        movq      168(%rsp), %rdi                               #500.3[spill]
..LN2028:
#       _mm_free(void *)
        call      _mm_free                                      #500.3
..LN2029:
                                # LOE rbx r15 r12d r13d r14d
..B1.258:                       # Preds ..B1.257
                                # Execution count [8.16e-03]: Infreq
..LN2030:
	.loc    1  501  is_stmt 1
        movq      152(%rsp), %rdi                               #501.3[spill]
..LN2031:
#       _mm_free(void *)
        call      _mm_free                                      #501.3
..LN2032:
                                # LOE rbx r15 r12d r13d r14d
..B1.259:                       # Preds ..B1.258
                                # Execution count [8.16e-03]: Infreq
..LN2033:
	.loc    1  502  is_stmt 1
        movq      144(%rsp), %rdi                               #502.3[spill]
..LN2034:
#       _mm_free(void *)
        call      _mm_free                                      #502.3
..LN2035:
                                # LOE rbx r15 r12d r13d r14d
..B1.260:                       # Preds ..B1.259
                                # Execution count [8.16e-03]: Infreq
..LN2036:
	.loc    1  503  is_stmt 1
        movq      128(%rsp), %rdi                               #503.3[spill]
..LN2037:
#       _mm_free(void *)
        call      _mm_free                                      #503.3
..LN2038:
                                # LOE rbx r15 r12d r13d r14d
..B1.261:                       # Preds ..B1.260
                                # Execution count [8.16e-03]: Infreq
..LN2039:
	.loc    1  504  is_stmt 1
        movq      136(%rsp), %rdi                               #504.3[spill]
..LN2040:
#       _mm_free(void *)
        call      _mm_free                                      #504.3
..LN2041:
                                # LOE rbx r15 r12d r13d r14d
..B1.262:                       # Preds ..B1.261
                                # Execution count [8.16e-03]: Infreq
..LN2042:
	.loc    1  505  is_stmt 1
        movq      120(%rsp), %rdi                               #505.3[spill]
..LN2043:
#       _mm_free(void *)
        call      _mm_free                                      #505.3
..LN2044:
                                # LOE rbx r15 r12d r13d r14d
..B1.263:                       # Preds ..B1.262
                                # Execution count [8.16e-03]: Infreq
..LN2045:
	.loc    1  506  is_stmt 1
        movq      48(%rsp), %rdi                                #506.3[spill]
..LN2046:
#       _mm_free(void *)
        call      _mm_free                                      #506.3
..LN2047:
                                # LOE rbx r15 r12d r13d r14d
..B1.264:                       # Preds ..B1.263
                                # Execution count [8.16e-03]: Infreq
..LN2048:
	.loc    1  507  is_stmt 1
        movq      32(%rsp), %rdi                                #507.3[spill]
..LN2049:
#       _mm_free(void *)
        call      _mm_free                                      #507.3
..LN2050:
                                # LOE rbx r15 r12d r13d r14d
..B1.265:                       # Preds ..B1.264
                                # Execution count [8.16e-03]: Infreq
..LN2051:
	.loc    1  508  is_stmt 1
        movq      %rbx, %rdi                                    #508.3
..LN2052:
#       _mm_free(void *)
        call      _mm_free                                      #508.3
..LN2053:
        jmp       ..B1.18       # Prob 100%                     #508.3
..LN2054:
                                # LOE r15 r12d r13d r14d
..B1.266:                       # Preds ..B1.233
                                # Execution count [1.84e-02]: Infreq
..LN2055:
	.loc    1  482  is_stmt 1
        xorl      %edx, %edx                                    #482.5
..LN2056:
        jmp       ..B1.239      # Prob 100%                     #482.5
..LN2057:
                                # LOE edx ebx edi r13d xmm1
..B1.267:                       # Preds ..B1.214
                                # Execution count [7.34e-04]: Infreq
..LN2058:
	.loc    1  459  is_stmt 1
        xorl      %eax, %eax                                    #459.3
..LN2059:
        jmp       ..B1.224      # Prob 100%                     #459.3
..LN2060:
                                # LOE rbx r15 eax r12d r13d
..B1.268:                       # Preds ..B1.199
                                # Execution count [7.34e-04]: Infreq
..LN2061:
        xorl      %r10d, %r10d                                  #459.3
..LN2062:
        jmp       ..B1.209      # Prob 100%                     #459.3
..LN2063:
                                # LOE rbx r15 r10d r12d r13d
..B1.269:                       # Preds ..B1.14
                                # Execution count [8.16e-03]: Infreq
..LN2064:
	.loc    1  387  is_stmt 1
        movq      %rbx, %rdi                                    #387.16
..LN2065:
        movq      %r15, %rsi                                    #387.16
..LN2066:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #387.16
..LN2067:
                                # LOE rax rbx r15 r12d r13d
..B1.706:                       # Preds ..B1.269
                                # Execution count [8.16e-03]: Infreq
..LN2068:
        movq      %rax, 16(%rsp)                                #387.16[spill]
..LN2069:
                                # LOE rbx r15 r12d r13d
..B1.270:                       # Preds ..B1.706
                                # Execution count [8.16e-03]: Infreq
..LN2070:
	.loc    1  388  is_stmt 1
        movq      %rbx, %rdi                                    #388.16
..LN2071:
        movq      %r15, %rsi                                    #388.16
..LN2072:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #388.16
..LN2073:
                                # LOE rax rbx r15 r12d r13d
..B1.707:                       # Preds ..B1.270
                                # Execution count [8.16e-03]: Infreq
..LN2074:
        movq      %rax, 144(%rsp)                               #388.16[spill]
..LN2075:
                                # LOE rbx r15 r12d r13d
..B1.271:                       # Preds ..B1.707
                                # Execution count [8.16e-03]: Infreq
..LN2076:
	.loc    1  389  is_stmt 1
        movq      %rbx, %rdi                                    #389.16
..LN2077:
        movq      %r15, %rsi                                    #389.16
..LN2078:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #389.16
..LN2079:
                                # LOE rax rbx r15 r12d r13d
..B1.708:                       # Preds ..B1.271
                                # Execution count [8.16e-03]: Infreq
..LN2080:
        movq      %rax, 32(%rsp)                                #389.16[spill]
..LN2081:
                                # LOE rbx r15 r12d r13d
..B1.272:                       # Preds ..B1.708
                                # Execution count [8.16e-03]: Infreq
..LN2082:
	.loc    1  390  is_stmt 1
        movq      %rbx, %rdi                                    #390.16
..LN2083:
        movq      %r15, %rsi                                    #390.16
..LN2084:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #390.16
..LN2085:
                                # LOE rax rbx r15 r12d r13d
..B1.709:                       # Preds ..B1.272
                                # Execution count [8.16e-03]: Infreq
..LN2086:
        movq      %rax, 136(%rsp)                               #390.16[spill]
..LN2087:
                                # LOE rbx r15 r12d r13d
..B1.273:                       # Preds ..B1.709
                                # Execution count [8.16e-03]: Infreq
..LN2088:
	.loc    1  391  is_stmt 1
        movq      %rbx, %rdi                                    #391.16
..LN2089:
        movq      %r15, %rsi                                    #391.16
..LN2090:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #391.16
..LN2091:
                                # LOE rax rbx r15 r12d r13d
..B1.710:                       # Preds ..B1.273
                                # Execution count [8.16e-03]: Infreq
..LN2092:
        movq      %rax, 120(%rsp)                               #391.16[spill]
..LN2093:
                                # LOE rbx r15 r12d r13d
..B1.274:                       # Preds ..B1.710
                                # Execution count [8.16e-03]: Infreq
..LN2094:
	.loc    1  392  is_stmt 1
        movq      %rbx, %rdi                                    #392.16
..LN2095:
        movq      %r15, %rsi                                    #392.16
..LN2096:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #392.16
..LN2097:
                                # LOE rax rbx r15 r12d r13d
..B1.711:                       # Preds ..B1.274
                                # Execution count [8.16e-03]: Infreq
..LN2098:
        movq      %rax, 128(%rsp)                               #392.16[spill]
..LN2099:
                                # LOE rbx r15 r12d r13d
..B1.275:                       # Preds ..B1.711
                                # Execution count [8.16e-03]: Infreq
..LN2100:
	.loc    1  393  is_stmt 1
        movq      %rbx, %rdi                                    #393.16
..LN2101:
        movq      %r15, %rsi                                    #393.16
..LN2102:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #393.16
..LN2103:
                                # LOE rax rbx r15 r12d r13d
..B1.712:                       # Preds ..B1.275
                                # Execution count [8.16e-03]: Infreq
..LN2104:
        movq      %rax, 24(%rsp)                                #393.16[spill]
..LN2105:
                                # LOE rbx r15 r12d r13d
..B1.276:                       # Preds ..B1.712
                                # Execution count [8.16e-03]: Infreq
..LN2106:
	.loc    1  394  is_stmt 1
        movq      %rbx, %rdi                                    #394.16
..LN2107:
        movq      %r15, %rsi                                    #394.16
..LN2108:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #394.16
..LN2109:
                                # LOE rax r15 r12d r13d
..B1.713:                       # Preds ..B1.276
                                # Execution count [8.16e-03]: Infreq
..LN2110:
        movq      %rax, 48(%rsp)                                #394.16[spill]
..LN2111:
                                # LOE rax r15 r12d r13d
..B1.277:                       # Preds ..B1.713
                                # Execution count [8.16e-03]: Infreq
..LN2112:
	.loc    1  395  is_stmt 1
        testl     %r13d, %r13d                                  #395.18
..LN2113:
        jle       ..B1.293      # Prob 50%                      #395.18
..LN2114:
                                # LOE rax r15 r12d r13d
..B1.278:                       # Preds ..B1.277
                                # Execution count [7.34e-03]: Infreq
..LN2115:
        movq      %rax, %rdx                                    #395.3
..LN2116:
        andq      $63, %rdx                                     #395.3
..LN2117:
        testl     %edx, %edx                                    #395.3
..LN2118:
        je        ..B1.281      # Prob 50%                      #395.3
..LN2119:
                                # LOE rax r15 edx r12d r13d
..B1.279:                       # Preds ..B1.278
                                # Execution count [7.34e-03]: Infreq
..LN2120:
        testb     $7, %dl                                       #395.3
..LN2121:
        jne       ..B1.331      # Prob 10%                      #395.3
..LN2122:
                                # LOE rax r15 edx r12d r13d
..B1.280:                       # Preds ..B1.279
                                # Execution count [0.00e+00]: Infreq
..LN2123:
        negl      %edx                                          #395.3
..LN2124:
        addl      $64, %edx                                     #395.3
..LN2125:
        shrl      $3, %edx                                      #395.3
..LN2126:
        cmpl      %edx, %r13d                                   #395.3
..LN2127:
        cmovl     %r13d, %edx                                   #395.3
..LN2128:
                                # LOE rax r15 edx r12d r13d
..B1.281:                       # Preds ..B1.280 ..B1.278
                                # Execution count [8.16e-03]: Infreq
..LN2129:
        movl      %r13d, %r8d                                   #395.3
..LN2130:
        subl      %edx, %r8d                                    #395.3
..LN2131:
        andl      $7, %r8d                                      #395.3
..LN2132:
        negl      %r8d                                          #395.3
..LN2133:
        addl      %r13d, %r8d                                   #395.3
..LN2134:
        cmpl      $1, %edx                                      #395.3
..LN2135:
        jb        ..B1.285      # Prob 50%                      #395.3
..LN2136:
                                # LOE rax r15 edx r8d r12d r13d
..B1.282:                       # Preds ..B1.281
                                # Execution count [7.34e-03]: Infreq
..LN2137:
        movq      %rax, %rsi                                    #395.3
..LN2138:
        movl      $8, %ebx                                      #395.3
..LN2139:
        vmovd     %edx, %xmm0                                   #395.3
..LN2140:
        vpbroadcastd %xmm0, %ymm0                               #395.3
..LN2141:
        movl      $255, %eax                                    #395.3
..LN2142:
        movq      %r15, 8(%rsp)                                 #395.3[spill]
..LN2143:
        movl      %r13d, 192(%rsp)                              #395.3[spill]
..LN2144:
        vmovd     %ebx, %xmm6                                   #395.3
..LN2145:
        xorl      %ebx, %ebx                                    #395.3
..LN2146:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #395.3
..LN2147:
	.loc    1  396  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #396.11
..LN2148:
	.loc    1  397  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #397.11
..LN2149:
	.loc    1  398  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #398.11
..LN2150:
	.loc    1  399  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #399.11
..LN2151:
	.loc    1  395  is_stmt 1
        kmovw     %eax, %k1                                     #395.3
..LN2152:
        vpbroadcastd %xmm6, %ymm6                               #395.3
..LN2153:
        xorl      %eax, %eax                                    #395.3
..LN2154:
        movslq    %edx, %rdi                                    #395.3
..LN2155:
        movq      24(%rsp), %r9                                 #395.3[spill]
..LN2156:
        movq      128(%rsp), %r10                               #395.3[spill]
..LN2157:
        movq      120(%rsp), %r11                               #395.3[spill]
..LN2158:
        movq      136(%rsp), %r13                               #395.3[spill]
..LN2159:
        movq      32(%rsp), %r14                                #395.3[spill]
..LN2160:
        movq      144(%rsp), %r15                               #395.3[spill]
..LN2161:
        movq      16(%rsp), %rcx                                #395.3[spill]
        .align    16,0x90
..LN2162:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.283:                       # Preds ..B1.283 ..B1.282
                                # Execution count [4.08e-02]: Infreq
..LN2163:
        addq      $8, %rbx                                      #395.3
..LN2164:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #395.3
..LN2165:
        vpaddd    %ymm6, %ymm5, %ymm5                           #395.3
..LN2166:
	.loc    1  396  is_stmt 1
        vmovupd   %zmm4, (%rax,%rcx){%k2}                       #396.4
..LN2167:
	.loc    1  397  is_stmt 1
        vmovupd   %zmm3, (%rax,%r15){%k2}                       #397.4
..LN2168:
	.loc    1  398  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #398.4
..LN2169:
	.loc    1  399  is_stmt 1
        vmovupd   %zmm1, (%rax,%r13){%k2}                       #399.4
..LN2170:
	.loc    1  400  is_stmt 1
        vmovupd   %zmm4, (%rax,%r11){%k2}                       #400.4
..LN2171:
	.loc    1  401  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #401.4
..LN2172:
	.loc    1  402  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #402.4
..LN2173:
	.loc    1  403  is_stmt 1
        vmovupd   %zmm1, (%rax,%rsi){%k2}                       #403.4
..LN2174:
	.loc    1  395  is_stmt 1
        addq      $64, %rax                                     #395.3
..LN2175:
        cmpq      %rdi, %rbx                                    #395.3
..LN2176:
        jb        ..B1.283      # Prob 81%                      #395.3
..LN2177:
                                # LOE rax rcx rbx rsi rdi r9 r10 r11 r13 r14 r15 edx r8d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.284:                       # Preds ..B1.283
                                # Execution count [7.34e-03]: Infreq
..LN2178:
        movl      192(%rsp), %r13d                              #[spill]
..LN2179:
        movq      8(%rsp), %r15                                 #[spill]
..LN2180:
        cmpl      %edx, %r13d                                   #395.3
..LN2181:
        je        ..B1.293      # Prob 10%                      #395.3
..LN2182:
                                # LOE r15 edx r8d r12d r13d
..B1.285:                       # Preds ..B1.281 ..B1.284
                                # Execution count [0.00e+00]: Infreq
..LN2183:
        lea       8(%rdx), %ebx                                 #395.3
..LN2184:
        cmpl      %ebx, %r8d                                    #395.3
..LN2185:
        jl        ..B1.289      # Prob 50%                      #395.3
..LN2186:
                                # LOE r15 edx r8d r12d r13d
..B1.286:                       # Preds ..B1.285
                                # Execution count [7.34e-03]: Infreq
..LN2187:
        movslq    %edx, %rdx                                    #395.3
..LN2188:
	.loc    1  396  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #396.11
..LN2189:
	.loc    1  397  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #397.11
..LN2190:
	.loc    1  398  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #398.11
..LN2191:
	.loc    1  399  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #399.11
..LN2192:
	.loc    1  395  is_stmt 1
        movslq    %r8d, %rax                                    #395.3
..LN2193:
        movq      48(%rsp), %rbx                                #395.3[spill]
..LN2194:
        movq      24(%rsp), %rdi                                #395.3[spill]
..LN2195:
        movq      128(%rsp), %r9                                #395.3[spill]
..LN2196:
        movq      120(%rsp), %r10                               #395.3[spill]
..LN2197:
        movq      136(%rsp), %r11                               #395.3[spill]
..LN2198:
        movq      32(%rsp), %rcx                                #395.3[spill]
..LN2199:
        movq      144(%rsp), %rsi                               #395.3[spill]
..LN2200:
        movq      16(%rsp), %r14                                #395.3[spill]
        .align    16,0x90
..LN2201:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.287:                       # Preds ..B1.287 ..B1.286
                                # Execution count [4.08e-02]: Infreq
..LN2202:
	.loc    1  396  is_stmt 1
        vmovupd   %zmm3, (%r14,%rdx,8)                          #396.4
..LN2203:
	.loc    1  397  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #397.4
..LN2204:
	.loc    1  398  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #398.4
..LN2205:
	.loc    1  399  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #399.4
..LN2206:
	.loc    1  400  is_stmt 1
        vmovupd   %zmm3, (%r10,%rdx,8)                          #400.4
..LN2207:
	.loc    1  401  is_stmt 1
        vmovupd   %zmm2, (%r9,%rdx,8)                           #401.4
..LN2208:
	.loc    1  402  is_stmt 1
        vmovupd   %zmm1, (%rdi,%rdx,8)                          #402.4
..LN2209:
	.loc    1  403  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%rdx,8)                          #403.4
..LN2210:
	.loc    1  395  is_stmt 1
        addq      $8, %rdx                                      #395.3
..LN2211:
        cmpq      %rax, %rdx                                    #395.3
..LN2212:
        jb        ..B1.287      # Prob 81%                      #395.3
..LN2213:
                                # LOE rax rdx rcx rbx rsi rdi r9 r10 r11 r14 r15 r8d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.289:                       # Preds ..B1.287 ..B1.285 ..B1.331
                                # Execution count [8.16e-03]: Infreq
..LN2214:
        lea       1(%r8), %edx                                  #395.3
..LN2215:
        cmpl      %r13d, %edx                                   #395.3
..LN2216:
        ja        ..B1.293      # Prob 50%                      #395.3
..LN2217:
                                # LOE r15 r8d r12d r13d
..B1.290:                       # Preds ..B1.289
                                # Execution count [7.34e-03]: Infreq
..LN2218:
        movl      $255, %eax                                    #395.3
..LN2219:
        movl      $8, %r11d                                     #395.3
..LN2220:
        kmovw     %eax, %k1                                     #395.3
..LN2221:
        xorl      %ecx, %ecx                                    #395.3
..LN2222:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #395.3
..LN2223:
	.loc    1  396  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #396.11
..LN2224:
	.loc    1  395  is_stmt 1
        vmovd     %r11d, %xmm6                                  #395.3
..LN2225:
	.loc    1  397  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #397.11
..LN2226:
	.loc    1  398  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #398.11
..LN2227:
	.loc    1  399  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #399.11
..LN2228:
	.loc    1  395  is_stmt 1
        movslq    %r8d, %rax                                    #395.3
..LN2229:
        negl      %r8d                                          #395.3
..LN2230:
        addl      %r13d, %r8d                                   #395.3
..LN2231:
	.loc    1  397  is_stmt 1
        movq      144(%rsp), %rsi                               #397.4[spill]
..LN2232:
	.loc    1  403  is_stmt 1
        movq      48(%rsp), %r10                                #403.4[spill]
..LN2233:
	.loc    1  402  is_stmt 1
        movq      24(%rsp), %r9                                 #402.4[spill]
..LN2234:
	.loc    1  400  is_stmt 1
        movq      120(%rsp), %rdi                               #400.4[spill]
..LN2235:
	.loc    1  397  is_stmt 1
        lea       (%rsi,%rax,8), %r14                           #397.4
..LN2236:
	.loc    1  399  is_stmt 1
        movq      136(%rsp), %rbx                               #399.4[spill]
..LN2237:
	.loc    1  395  is_stmt 1
        vmovd     %r8d, %xmm0                                   #395.3
..LN2238:
	.loc    1  401  is_stmt 1
        movq      128(%rsp), %r8                                #401.4[spill]
..LN2239:
	.loc    1  403  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #403.4
..LN2240:
	.loc    1  398  is_stmt 1
        movq      32(%rsp), %rdx                                #398.4[spill]
..LN2241:
	.loc    1  402  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #402.4
..LN2242:
	.loc    1  396  is_stmt 1
        movq      16(%rsp), %rsi                                #396.4[spill]
..LN2243:
	.loc    1  400  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #400.4
..LN2244:
	.loc    1  395  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #395.3
..LN2245:
	.loc    1  401  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #401.4
..LN2246:
	.loc    1  399  is_stmt 1
        lea       (%rbx,%rax,8), %rbx                           #399.4
..LN2247:
	.loc    1  395  is_stmt 1
        movq      112(%rsp), %r11                               #395.3[spill]
..LN2248:
	.loc    1  398  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #398.4
..LN2249:
	.loc    1  395  is_stmt 1
        subq      %rax, %r11                                    #395.3
..LN2250:
        vpbroadcastd %xmm6, %ymm6                               #395.3
..LN2251:
	.loc    1  396  is_stmt 1
        lea       (%rsi,%rax,8), %rsi                           #396.4
..LN2252:
	.loc    1  395  is_stmt 1
        xorl      %eax, %eax                                    #395.3
        .align    16,0x90
..LN2253:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.291:                       # Preds ..B1.291 ..B1.290
                                # Execution count [4.08e-02]: Infreq
..LN2254:
        addq      $8, %rcx                                      #395.3
..LN2255:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #395.3
..LN2256:
        vpaddd    %ymm6, %ymm5, %ymm5                           #395.3
..LN2257:
	.loc    1  396  is_stmt 1
        vmovupd   %zmm4, (%rax,%rsi){%k2}                       #396.4
..LN2258:
	.loc    1  397  is_stmt 1
        vmovupd   %zmm3, (%rax,%r14){%k2}                       #397.4
..LN2259:
	.loc    1  398  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #398.4
..LN2260:
	.loc    1  399  is_stmt 1
        vmovupd   %zmm1, (%rax,%rbx){%k2}                       #399.4
..LN2261:
	.loc    1  400  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #400.4
..LN2262:
	.loc    1  401  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #401.4
..LN2263:
	.loc    1  402  is_stmt 1
        vmovupd   %zmm2, (%rax,%r9){%k2}                        #402.4
..LN2264:
	.loc    1  403  is_stmt 1
        vmovupd   %zmm1, (%rax,%r10){%k2}                       #403.4
..LN2265:
	.loc    1  395  is_stmt 1
        addq      $64, %rax                                     #395.3
..LN2266:
        cmpq      %r11, %rcx                                    #395.3
..LN2267:
        jb        ..B1.291      # Prob 81%                      #395.3
..LN2268:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.293:                       # Preds ..B1.291 ..B1.277 ..B1.284 ..B1.289
                                # Execution count [8.16e-03]: Infreq
..LN2269:
	.loc    1  408  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #408.3
..LN2270:
	.loc    1  406  is_stmt 1
        movl      $1, %r14d                                     #406.3
..LN2271:
	.loc    1  408  is_stmt 1
        vzeroupper                                              #408.3
..___tag_value_main.51:
..LN2272:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #408.3
..___tag_value_main.52:
..LN2273:
                                # LOE r15 r12d r13d r14d
..B1.294:                       # Preds ..B1.293
                                # Execution count [8.16e-03]: Infreq
..LN2274:
	.loc    1  410  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #410.11
..LN2275:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #410.24
..LN2276:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #410.15
..LN2277:
        vcomisd   %xmm1, %xmm0                                  #410.24
..LN2278:
        jbe       ..B1.320      # Prob 10%                      #410.24
..LN2279:
                                # LOE r15 r12d r13d r14d
..B1.295:                       # Preds ..B1.294
                                # Execution count [7.34e-03]: Infreq
..LN2280:
	.loc    1  417  is_stmt 1
        movl      $8, %edx                                      #417.5
..LN2281:
        movl      %r13d, %ebx                                   #417.5
..LN2282:
        andl      $-64, %ebx                                    #417.5
..LN2283:
	.loc    1  412  is_stmt 1
        lea       56(%rsp), %rdi                                #412.4
..LN2284:
	.loc    1  417  is_stmt 1
        movslq    %ebx, %rbx                                    #417.5
..LN2285:
	.loc    1  412  is_stmt 1
        lea       40(%rsp), %rsi                                #412.4
..LN2286:
	.loc    1  417  is_stmt 1
        movq      %rbx, 120(%rsi)                               #417.5[spill]
..LN2287:
        vmovd     %edx, %xmm0                                   #417.5
..LN2288:
        vpbroadcastd %xmm0, %ymm1                               #417.5
..LN2289:
        vmovdqu   %ymm1, 24(%rsi)                               #417.5[spill]
..LN2290:
	.loc    1  412  is_stmt 1
        vzeroupper                                              #412.4
..___tag_value_main.53:
..LN2291:
#       timing(double *, double *)
        call      timing                                        #412.4
..___tag_value_main.54:
..LN2292:
                                # LOE r15 ebx r12d r13d r14d
..B1.296:                       # Preds ..B1.295
                                # Execution count [6.61e-03]: Infreq
..LN2293:
	.loc    1  413  is_stmt 1
        xorl      %eax, %eax                                    #413.4
..LN2294:
        movl      %r12d, (%rsp)                                 #413.4[spill]
..LN2295:
        vxorpd    %xmm0, %xmm0, %xmm0                           #413.4
..LN2296:
        movl      %ebx, 152(%rsp)                               #413.4[spill]
..LN2297:
        movl      %eax, %ebx                                    #413.4
..LN2298:
        movl      %r14d, 184(%rsp)                              #413.4[spill]
..LN2299:
        movq      %r15, 8(%rsp)                                 #413.4[spill]
..LN2300:
        movq      16(%rsp), %r12                                #413.4[spill]
..LN2301:
                                # LOE r12 ebx r13d xmm0
..B1.297:                       # Preds ..B1.296 ..B1.312 ..B1.318
                                # Execution count [2.04e-01]: Infreq
..LN2302:
	.loc    1  417  is_stmt 1
        xorl      %edi, %edi                                    #417.9
..LN2303:
        testl     %r13d, %r13d                                  #417.20
..LN2304:
        jle       ..B1.310      # Prob 50%                      #417.20
..LN2305:
                                # LOE r12 ebx edi r13d xmm0
..B1.298:                       # Preds ..B1.297
                                # Execution count [1.84e-01]: Infreq
..LN2306:
        cmpl      $64, %r13d                                    #417.5
..LN2307:
        jl        ..B1.330      # Prob 10%                      #417.5
..LN2308:
                                # LOE r12 ebx edi r13d xmm0
..B1.299:                       # Preds ..B1.298
                                # Execution count [1.84e-01]: Infreq
..LN2309:
        movl      152(%rsp), %edx                               #417.5[spill]
..LN2310:
                                # LOE r12 edx ebx r13d xmm0
..B1.301:                       # Preds ..B1.299
                                # Execution count [1.84e-01]: Infreq
..LN2311:
        movq      160(%rsp), %rdi                               #417.5[spill]
..LN2312:
        xorl      %ecx, %ecx                                    #417.5
..LN2313:
        movq      48(%rsp), %r8                                 #417.5[spill]
..LN2314:
        movq      24(%rsp), %r9                                 #417.5[spill]
..LN2315:
        movq      128(%rsp), %r10                               #417.5[spill]
..LN2316:
        movq      120(%rsp), %r11                               #417.5[spill]
..LN2317:
        movq      136(%rsp), %r15                               #417.5[spill]
..LN2318:
        movq      32(%rsp), %rax                                #417.5[spill]
..LN2319:
        movq      144(%rsp), %rsi                               #417.5[spill]
..LN2320:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.302:                       # Preds ..B1.302 ..B1.301
                                # Execution count [1.02e+00]: Infreq
..LN2321:
	.loc    1  418  is_stmt 1
        vmovups   (%rsi,%rcx,8), %zmm1                          #418.13
..LN2322:
        vmovups   (%r15,%rcx,8), %zmm2                          #418.27
..LN2323:
        vmovups   (%r10,%rcx,8), %zmm5                          #418.41
..LN2324:
        vmovups   64(%r10,%rcx,8), %zmm13                       #418.41
..LN2325:
        vmovups   64(%rsi,%rcx,8), %zmm9                        #418.13
..LN2326:
        vmovups   64(%r15,%rcx,8), %zmm10                       #418.27
..LN2327:
        vaddpd    (%rax,%rcx,8), %zmm1, %zmm3                   #418.55
..LN2328:
        vaddpd    (%r11,%rcx,8), %zmm2, %zmm4                   #418.55
..LN2329:
        vaddpd    (%r9,%rcx,8), %zmm5, %zmm6                    #418.55
..LN2330:
        vaddpd    64(%r9,%rcx,8), %zmm13, %zmm14                #418.55
..LN2331:
        vaddpd    64(%rax,%rcx,8), %zmm9, %zmm11                #418.55
..LN2332:
        vaddpd    64(%r11,%rcx,8), %zmm10, %zmm12               #418.55
..LN2333:
        vaddpd    %zmm4, %zmm3, %zmm7                           #418.55
..LN2334:
        vaddpd    (%r8,%rcx,8), %zmm6, %zmm8                    #418.55
..LN2335:
        vaddpd    64(%r8,%rcx,8), %zmm14, %zmm16                #418.55
..LN2336:
        vaddpd    %zmm12, %zmm11, %zmm15                        #418.55
..LN2337:
        vaddpd    %zmm8, %zmm7, %zmm17                          #418.55
..LN2338:
        vaddpd    %zmm16, %zmm15, %zmm18                        #418.55
..LN2339:
        vmovntpd  %zmm17, (%r12,%rcx,8)                         #418.6
..LN2340:
        vmovntpd  %zmm18, 64(%r12,%rcx,8)                       #418.6
..LN2341:
        vmovups   128(%rsi,%rcx,8), %zmm19                      #418.13
..LN2342:
        vmovups   128(%r15,%rcx,8), %zmm20                      #418.27
..LN2343:
        vmovups   128(%r10,%rcx,8), %zmm23                      #418.41
..LN2344:
        vmovups   192(%r10,%rcx,8), %zmm31                      #418.41
..LN2345:
        vmovups   192(%rsi,%rcx,8), %zmm27                      #418.13
..LN2346:
        vmovups   192(%r15,%rcx,8), %zmm28                      #418.27
..LN2347:
        vaddpd    128(%rax,%rcx,8), %zmm19, %zmm21              #418.55
..LN2348:
        vaddpd    128(%r11,%rcx,8), %zmm20, %zmm22              #418.55
..LN2349:
        vaddpd    128(%r9,%rcx,8), %zmm23, %zmm24               #418.55
..LN2350:
        vaddpd    192(%r9,%rcx,8), %zmm31, %zmm31               #418.55
..LN2351:
        vaddpd    192(%rax,%rcx,8), %zmm27, %zmm29              #418.55
..LN2352:
        vaddpd    192(%r11,%rcx,8), %zmm28, %zmm30              #418.55
..LN2353:
        vaddpd    %zmm22, %zmm21, %zmm25                        #418.55
..LN2354:
        vaddpd    128(%r8,%rcx,8), %zmm24, %zmm26               #418.55
..LN2355:
        vaddpd    192(%r8,%rcx,8), %zmm31, %zmm28               #418.55
..LN2356:
        vaddpd    %zmm30, %zmm29, %zmm27                        #418.55
..LN2357:
        vaddpd    %zmm26, %zmm25, %zmm1                         #418.55
..LN2358:
        vaddpd    %zmm28, %zmm27, %zmm2                         #418.55
..LN2359:
        vmovntpd  %zmm1, 128(%r12,%rcx,8)                       #418.6
..LN2360:
        vmovntpd  %zmm2, 192(%r12,%rcx,8)                       #418.6
..LN2361:
        vmovups   256(%rsi,%rcx,8), %zmm3                       #418.13
..LN2362:
        vmovups   256(%r15,%rcx,8), %zmm4                       #418.27
..LN2363:
        vmovups   256(%r10,%rcx,8), %zmm7                       #418.41
..LN2364:
        vmovups   320(%r10,%rcx,8), %zmm15                      #418.41
..LN2365:
        vmovups   320(%rsi,%rcx,8), %zmm11                      #418.13
..LN2366:
        vmovups   320(%r15,%rcx,8), %zmm12                      #418.27
..LN2367:
        vaddpd    256(%rax,%rcx,8), %zmm3, %zmm5                #418.55
..LN2368:
        .byte     144                                           #418.55
..LN2369:
        vaddpd    256(%r11,%rcx,8), %zmm4, %zmm6                #418.55
..LN2370:
        vaddpd    256(%r9,%rcx,8), %zmm7, %zmm8                 #418.55
..LN2371:
        vaddpd    320(%r9,%rcx,8), %zmm15, %zmm16               #418.55
..LN2372:
        vaddpd    320(%rax,%rcx,8), %zmm11, %zmm13              #418.55
..LN2373:
        vaddpd    320(%r11,%rcx,8), %zmm12, %zmm14              #418.55
..LN2374:
        vaddpd    %zmm6, %zmm5, %zmm9                           #418.55
..LN2375:
        vaddpd    256(%r8,%rcx,8), %zmm8, %zmm10                #418.55
..LN2376:
        vaddpd    320(%r8,%rcx,8), %zmm16, %zmm18               #418.55
..LN2377:
        vaddpd    %zmm14, %zmm13, %zmm17                        #418.55
..LN2378:
        vaddpd    %zmm10, %zmm9, %zmm19                         #418.55
..LN2379:
        vaddpd    %zmm18, %zmm17, %zmm20                        #418.55
..LN2380:
        vmovntpd  %zmm19, 256(%r12,%rcx,8)                      #418.6
..LN2381:
        vmovntpd  %zmm20, 320(%r12,%rcx,8)                      #418.6
..LN2382:
        vmovups   384(%rsi,%rcx,8), %zmm21                      #418.13
..LN2383:
        vmovups   384(%r15,%rcx,8), %zmm22                      #418.27
..LN2384:
        vmovups   384(%r10,%rcx,8), %zmm25                      #418.41
..LN2385:
        vmovups   448(%r10,%rcx,8), %zmm3                       #418.41
..LN2386:
        vmovups   448(%rsi,%rcx,8), %zmm1                       #418.13
..LN2387:
        vmovups   448(%r15,%rcx,8), %zmm2                       #418.27
..LN2388:
        vaddpd    384(%rax,%rcx,8), %zmm21, %zmm23              #418.55
..LN2389:
        vaddpd    384(%r11,%rcx,8), %zmm22, %zmm24              #418.55
..LN2390:
        vaddpd    384(%r9,%rcx,8), %zmm25, %zmm26               #418.55
..LN2391:
        vaddpd    448(%r9,%rcx,8), %zmm3, %zmm4                 #418.55
..LN2392:
        vaddpd    448(%rax,%rcx,8), %zmm1, %zmm21               #418.55
..LN2393:
        vaddpd    448(%r11,%rcx,8), %zmm2, %zmm22               #418.55
..LN2394:
        vaddpd    %zmm24, %zmm23, %zmm29                        #418.55
..LN2395:
        vaddpd    384(%r8,%rcx,8), %zmm26, %zmm30               #418.55
..LN2396:
        vaddpd    448(%r8,%rcx,8), %zmm4, %zmm6                 #418.55
..LN2397:
        vaddpd    %zmm22, %zmm21, %zmm5                         #418.55
..LN2398:
        vaddpd    %zmm30, %zmm29, %zmm7                         #418.55
..LN2399:
        vaddpd    %zmm6, %zmm5, %zmm8                           #418.55
..LN2400:
        vmovntpd  %zmm7, 384(%r12,%rcx,8)                       #418.6
..LN2401:
        vmovntpd  %zmm8, 448(%r12,%rcx,8)                       #418.6
..LN2402:
	.loc    1  417  is_stmt 1
        addq      $64, %rcx                                     #417.5
..LN2403:
        cmpq      %rdi, %rcx                                    #417.5
..LN2404:
        jb        ..B1.302      # Prob 82%                      #417.5
..LN2405:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.303:                       # Preds ..B1.302
                                # Execution count [1.84e-01]: Infreq
..LN2406:
        movl      %edx, %edi                                    #417.36
..LN2407:
                                # LOE r12 edx ebx edi r13d xmm0
..B1.304:                       # Preds ..B1.303 ..B1.330
                                # Execution count [2.04e-01]: Infreq
..LN2408:
        lea       1(%rdx), %ecx                                 #417.5
..LN2409:
        cmpl      %r13d, %ecx                                   #417.5
..LN2410:
        ja        ..B1.310      # Prob 50%                      #417.5
..LN2411:
                                # LOE r12 edx ebx edi r13d xmm0
..B1.305:                       # Preds ..B1.304
                                # Execution count [1.84e-01]: Infreq
..LN2412:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #417.5
..LN2413:
                                # LOE r12 edx ebx r13d xmm0 ymm2
..B1.307:                       # Preds ..B1.305
                                # Execution count [1.84e-01]: Infreq
..LN2414:
        movl      $255, %eax                                    #417.5
..LN2415:
        xorl      %esi, %esi                                    #417.5
..LN2416:
        kmovw     %eax, %k1                                     #417.5
..LN2417:
        vmovdqu   64(%rsp), %ymm12                              #417.5[spill]
..LN2418:
        movslq    %edx, %rax                                    #417.5
..LN2419:
        negl      %edx                                          #417.5
..LN2420:
        addl      %r13d, %edx                                   #417.5
..LN2421:
	.loc    1  418  is_stmt 1
        movq      48(%rsp), %r8                                 #418.55[spill]
..LN2422:
        movq      24(%rsp), %rdi                                #418.48[spill]
..LN2423:
        movq      128(%rsp), %r9                                #418.41[spill]
..LN2424:
        movq      120(%rsp), %r10                               #418.34[spill]
..LN2425:
	.loc    1  417  is_stmt 1
        vmovd     %edx, %xmm1                                   #417.5
..LN2426:
	.loc    1  418  is_stmt 1
        movq      136(%rsp), %r11                               #418.27[spill]
..LN2427:
        lea       (%r12,%rax,8), %rdx                           #418.6
..LN2428:
        movq      32(%rsp), %r15                                #418.20[spill]
..LN2429:
        lea       (%r8,%rax,8), %r8                             #418.55
..LN2430:
        movq      144(%rsp), %r14                               #418.13[spill]
..LN2431:
        lea       (%rdi,%rax,8), %rdi                           #418.48
..LN2432:
	.loc    1  417  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #417.5
..LN2433:
	.loc    1  418  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #418.41
..LN2434:
	.loc    1  417  is_stmt 1
        movq      112(%rsp), %rcx                               #417.5[spill]
..LN2435:
	.loc    1  418  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #418.34
..LN2436:
	.loc    1  417  is_stmt 1
        subq      %rax, %rcx                                    #417.5
..LN2437:
	.loc    1  418  is_stmt 1
        lea       (%r11,%rax,8), %r11                           #418.27
..LN2438:
        lea       (%r15,%rax,8), %r15                           #418.20
..LN2439:
        lea       (%r14,%rax,8), %r14                           #418.13
..LN2440:
	.loc    1  417  is_stmt 1
        xorl      %eax, %eax                                    #417.5
        .align    16,0x90
..LN2441:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm12 zmm1 k1
..B1.308:                       # Preds ..B1.308 ..B1.307
                                # Execution count [1.02e+00]: Infreq
..LN2442:
	.loc    1  418  is_stmt 1
        vmovups   (%rax,%r14), %zmm3                            #418.13
..LN2443:
	.loc    1  417  is_stmt 1
        addq      $8, %rsi                                      #417.5
..LN2444:
	.loc    1  418  is_stmt 1
        vmovups   (%rax,%r11), %zmm4                            #418.27
..LN2445:
        vmovups   (%rax,%r9), %zmm7                             #418.41
..LN2446:
        vaddpd    (%rax,%r15), %zmm3, %zmm5                     #418.55
..LN2447:
        vaddpd    (%rax,%r10), %zmm4, %zmm6                     #418.55
..LN2448:
        vaddpd    (%rax,%rdi), %zmm7, %zmm8                     #418.55
..LN2449:
        vaddpd    %zmm6, %zmm5, %zmm9                           #418.55
..LN2450:
        vaddpd    (%rax,%r8), %zmm8, %zmm10                     #418.55
..LN2451:
        vaddpd    %zmm10, %zmm9, %zmm11                         #418.55
..LN2452:
	.loc    1  417  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #417.5
..LN2453:
        vpaddd    %ymm12, %ymm2, %ymm2                          #417.5
..LN2454:
	.loc    1  418  is_stmt 1
        vmovupd   %zmm11, (%rax,%rdx){%k2}                      #418.6
..LN2455:
	.loc    1  417  is_stmt 1
        addq      $64, %rax                                     #417.5
..LN2456:
        cmpq      %rcx, %rsi                                    #417.5
..LN2457:
        jb        ..B1.308      # Prob 82%                      #417.5
..LN2458:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm12 zmm1 k1
..B1.309:                       # Preds ..B1.308
                                # Execution count [1.84e-01]: Infreq
..LN2459:
        movl      %r13d, %edi                                   #417.36
..LN2460:
                                # LOE r12 ebx edi r13d xmm0
..B1.310:                       # Preds ..B1.309 ..B1.304 ..B1.297
                                # Execution count [2.04e-01]: Infreq
..LN2461:
	.loc    1  420  is_stmt 1
        movslq    %edi, %rdi                                    #420.8
..LN2462:
        vcomisd   (%r12,%rdi,8), %xmm0                          #420.13
..LN2463:
        jbe       ..B1.312      # Prob 78%                      #420.13
..LN2464:
                                # LOE r12 ebx r13d xmm0
..B1.311:                       # Preds ..B1.310
                                # Execution count [4.49e-02]: Infreq
..LN2465:
        movl      $il0_peep_printf_format_3, %edi               #420.16
..LN2466:
        vzeroupper                                              #420.16
..LN2467:
        call      puts                                          #420.16
..LN2468:
                                # LOE r12 ebx r13d
..B1.747:                       # Preds ..B1.311
                                # Execution count [4.49e-02]: Infreq
..LN2469:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2470:
                                # LOE r12 ebx r13d xmm0
..B1.312:                       # Preds ..B1.747 ..B1.310
                                # Execution count [2.04e-01]: Infreq
..LN2471:
	.loc    1  413  is_stmt 1
        incl      %ebx                                          #413.4
..LN2472:
        cmpl      184(%rsp), %ebx                               #413.4[spill]
..LN2473:
        jb        ..B1.297      # Prob 81%                      #413.4
..LN2474:
                                # LOE r12 ebx r13d xmm0
..B1.313:                       # Preds ..B1.312
                                # Execution count [3.74e-02]: Infreq
..LN2475:
        movl      184(%rsp), %r14d                              #[spill]
..LN2476:
                                # LOE r12 r13d r14d
..B1.314:                       # Preds ..B1.317 ..B1.313
                                # Execution count [4.08e-02]: Infreq
..LN2477:
	.loc    1  423  is_stmt 1
        vzeroupper                                              #423.4
..LN2478:
        lea       96(%rsp), %rdi                                #423.4
..LN2479:
        lea       40(%rsp), %rsi                                #423.4
..___tag_value_main.55:
..LN2480:
#       timing(double *, double *)
        call      timing                                        #423.4
..___tag_value_main.56:
..LN2481:
                                # LOE r12 r13d r14d
..B1.315:                       # Preds ..B1.314
                                # Execution count [4.08e-02]: Infreq
..LN2482:
	.loc    1  410  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #410.11
..LN2483:
	.loc    1  424  is_stmt 1
        addl      %r14d, %r14d                                  #424.4
..LN2484:
	.loc    1  410  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #410.24
..LN2485:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #410.15
..LN2486:
        vcomisd   %xmm1, %xmm0                                  #410.24
..LN2487:
        jbe       ..B1.319      # Prob 18%                      #410.24
..LN2488:
                                # LOE r12 r13d r14d
..B1.316:                       # Preds ..B1.315
                                # Execution count [3.34e-02]: Infreq
..LN2489:
	.loc    1  412  is_stmt 1
        lea       56(%rsp), %rdi                                #412.4
..LN2490:
        lea       40(%rsp), %rsi                                #412.4
..___tag_value_main.57:
..LN2491:
#       timing(double *, double *)
        call      timing                                        #412.4
..___tag_value_main.58:
..LN2492:
                                # LOE r12 r13d r14d
..B1.317:                       # Preds ..B1.316
                                # Execution count [3.34e-02]: Infreq
..LN2493:
	.loc    1  413  is_stmt 1
        xorl      %ebx, %ebx                                    #413.4
..LN2494:
        testl     %r14d, %r14d                                  #413.19
..LN2495:
        jle       ..B1.314      # Prob 9%                       #413.19
..LN2496:
                                # LOE r12 ebx r13d r14d
..B1.318:                       # Preds ..B1.317
                                # Execution count [3.01e-02]: Infreq
..LN2497:
        .byte     102                                           #
..LN2498:
        .byte     144                                           #
..LN2499:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN2500:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2501:
        jmp       ..B1.297      # Prob 100%                     #
..LN2502:
                                # LOE r12 ebx r13d xmm0
..B1.319:                       # Preds ..B1.315
                                # Execution count [7.34e-03]: Infreq
..LN2503:
        movl      (%rsp), %r12d                                 #[spill]
..LN2504:
        movq      8(%rsp), %r15                                 #[spill]
..LN2505:
                                # LOE r15 r12d r13d r14d
..B1.320:                       # Preds ..B1.319 ..B1.294
                                # Execution count [8.16e-03]: Infreq
..LN2506:
	.loc    1  427  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #427.3
..___tag_value_main.59:
..LN2507:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #427.3
..___tag_value_main.60:
..LN2508:
                                # LOE r15 r12d r13d r14d
..B1.321:                       # Preds ..B1.320
                                # Execution count [8.16e-03]: Infreq
..LN2509:
	.loc    1  429  is_stmt 1
        movl      %r14d, %edx                                   #429.3
..LN2510:
        shrl      $31, %edx                                     #429.3
..LN2511:
        addl      %edx, %r14d                                   #429.3
..LN2512:
        sarl      $1, %r14d                                     #429.3
..___tag_value_main.61:
..LN2513:
	.loc    1  432  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #432.3
..___tag_value_main.62:
..LN2514:
                                # LOE r15 r12d r13d r14d
..B1.322:                       # Preds ..B1.321
                                # Execution count [8.16e-03]: Infreq
..LN2515:
	.loc    1  434  is_stmt 1
        movq      16(%rsp), %rdi                                #434.3[spill]
..LN2516:
#       _mm_free(void *)
        call      _mm_free                                      #434.3
..LN2517:
                                # LOE r15 r12d r13d r14d
..B1.323:                       # Preds ..B1.322
                                # Execution count [8.16e-03]: Infreq
..LN2518:
	.loc    1  435  is_stmt 1
        movq      144(%rsp), %rdi                               #435.3[spill]
..LN2519:
#       _mm_free(void *)
        call      _mm_free                                      #435.3
..LN2520:
                                # LOE r15 r12d r13d r14d
..B1.324:                       # Preds ..B1.323
                                # Execution count [8.16e-03]: Infreq
..LN2521:
	.loc    1  436  is_stmt 1
        movq      32(%rsp), %rdi                                #436.3[spill]
..LN2522:
#       _mm_free(void *)
        call      _mm_free                                      #436.3
..LN2523:
                                # LOE r15 r12d r13d r14d
..B1.325:                       # Preds ..B1.324
                                # Execution count [8.16e-03]: Infreq
..LN2524:
	.loc    1  437  is_stmt 1
        movq      136(%rsp), %rdi                               #437.3[spill]
..LN2525:
#       _mm_free(void *)
        call      _mm_free                                      #437.3
..LN2526:
                                # LOE r15 r12d r13d r14d
..B1.326:                       # Preds ..B1.325
                                # Execution count [8.16e-03]: Infreq
..LN2527:
	.loc    1  438  is_stmt 1
        movq      120(%rsp), %rdi                               #438.3[spill]
..LN2528:
#       _mm_free(void *)
        call      _mm_free                                      #438.3
..LN2529:
                                # LOE r15 r12d r13d r14d
..B1.327:                       # Preds ..B1.326
                                # Execution count [8.16e-03]: Infreq
..LN2530:
	.loc    1  439  is_stmt 1
        movq      128(%rsp), %rdi                               #439.3[spill]
..LN2531:
#       _mm_free(void *)
        call      _mm_free                                      #439.3
..LN2532:
                                # LOE r15 r12d r13d r14d
..B1.328:                       # Preds ..B1.327
                                # Execution count [8.16e-03]: Infreq
..LN2533:
	.loc    1  440  is_stmt 1
        movq      24(%rsp), %rdi                                #440.3[spill]
..LN2534:
#       _mm_free(void *)
        call      _mm_free                                      #440.3
..LN2535:
                                # LOE r15 r12d r13d r14d
..B1.329:                       # Preds ..B1.328
                                # Execution count [8.16e-03]: Infreq
..LN2536:
	.loc    1  441  is_stmt 1
        movq      48(%rsp), %rdi                                #441.3[spill]
..LN2537:
#       _mm_free(void *)
        call      _mm_free                                      #441.3
..LN2538:
        jmp       ..B1.18       # Prob 100%                     #441.3
..LN2539:
                                # LOE r15 r12d r13d r14d
..B1.330:                       # Preds ..B1.298
                                # Execution count [1.84e-02]: Infreq
..LN2540:
	.loc    1  417  is_stmt 1
        xorl      %edx, %edx                                    #417.5
..LN2541:
        jmp       ..B1.304      # Prob 100%                     #417.5
..LN2542:
                                # LOE r12 edx ebx edi r13d xmm0
..B1.331:                       # Preds ..B1.279
                                # Execution count [7.34e-04]: Infreq
..LN2543:
	.loc    1  395  is_stmt 1
        xorl      %r8d, %r8d                                    #395.3
..LN2544:
        jmp       ..B1.289      # Prob 100%                     #395.3
..LN2545:
                                # LOE r15 r8d r12d r13d
..B1.332:                       # Preds ..B1.13
                                # Execution count [8.16e-03]: Infreq
..LN2546:
	.loc    1  327  is_stmt 1
        movq      %rbx, %rdi                                    #327.16
..LN2547:
        movq      %r15, %rsi                                    #327.16
..LN2548:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #327.16
..LN2549:
                                # LOE rax rbx r15 r12d r13d
..B1.714:                       # Preds ..B1.332
                                # Execution count [8.16e-03]: Infreq
..LN2550:
        movq      %rax, 24(%rsp)                                #327.16[spill]
..LN2551:
                                # LOE rbx r15 r12d r13d
..B1.333:                       # Preds ..B1.714
                                # Execution count [8.16e-03]: Infreq
..LN2552:
	.loc    1  328  is_stmt 1
        movq      %rbx, %rdi                                    #328.16
..LN2553:
        movq      %r15, %rsi                                    #328.16
..LN2554:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #328.16
..LN2555:
                                # LOE rax rbx r15 r12d r13d
..B1.715:                       # Preds ..B1.333
                                # Execution count [8.16e-03]: Infreq
..LN2556:
        movq      %rax, 120(%rsp)                               #328.16[spill]
..LN2557:
                                # LOE rbx r15 r12d r13d
..B1.334:                       # Preds ..B1.715
                                # Execution count [8.16e-03]: Infreq
..LN2558:
	.loc    1  329  is_stmt 1
        movq      %rbx, %rdi                                    #329.16
..LN2559:
        movq      %r15, %rsi                                    #329.16
..LN2560:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #329.16
..LN2561:
                                # LOE rax rbx r15 r12d r13d
..B1.716:                       # Preds ..B1.334
                                # Execution count [8.16e-03]: Infreq
..LN2562:
        movq      %rax, 16(%rsp)                                #329.16[spill]
..LN2563:
                                # LOE rbx r15 r12d r13d
..B1.335:                       # Preds ..B1.716
                                # Execution count [8.16e-03]: Infreq
..LN2564:
	.loc    1  330  is_stmt 1
        movq      %rbx, %rdi                                    #330.16
..LN2565:
        movq      %r15, %rsi                                    #330.16
..LN2566:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #330.16
..LN2567:
                                # LOE rax rbx r15 r12d r13d
..B1.717:                       # Preds ..B1.335
                                # Execution count [8.16e-03]: Infreq
..LN2568:
        movq      %rax, 32(%rsp)                                #330.16[spill]
..LN2569:
                                # LOE rbx r15 r12d r13d
..B1.336:                       # Preds ..B1.717
                                # Execution count [8.16e-03]: Infreq
..LN2570:
	.loc    1  331  is_stmt 1
        movq      %rbx, %rdi                                    #331.16
..LN2571:
        movq      %r15, %rsi                                    #331.16
..LN2572:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #331.16
..LN2573:
                                # LOE rax rbx r15 r12d r13d
..B1.718:                       # Preds ..B1.336
                                # Execution count [8.16e-03]: Infreq
..LN2574:
        movq      %rax, 128(%rsp)                               #331.16[spill]
..LN2575:
                                # LOE rbx r15 r12d r13d
..B1.337:                       # Preds ..B1.718
                                # Execution count [8.16e-03]: Infreq
..LN2576:
	.loc    1  332  is_stmt 1
        movq      %rbx, %rdi                                    #332.16
..LN2577:
        movq      %r15, %rsi                                    #332.16
..LN2578:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #332.16
..LN2579:
                                # LOE rax rbx r15 r12d r13d
..B1.719:                       # Preds ..B1.337
                                # Execution count [8.16e-03]: Infreq
..LN2580:
        movq      %rax, 48(%rsp)                                #332.16[spill]
..LN2581:
                                # LOE rbx r15 r12d r13d
..B1.338:                       # Preds ..B1.719
                                # Execution count [8.16e-03]: Infreq
..LN2582:
	.loc    1  333  is_stmt 1
        movq      %rbx, %rdi                                    #333.16
..LN2583:
        movq      %r15, %rsi                                    #333.16
..LN2584:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #333.16
..LN2585:
                                # LOE rax r15 r12d r13d
..B1.720:                       # Preds ..B1.338
                                # Execution count [8.16e-03]: Infreq
..LN2586:
        movq      %rax, %rbx                                    #333.16
..LN2587:
                                # LOE rbx r15 r12d r13d
..B1.339:                       # Preds ..B1.720
                                # Execution count [8.16e-03]: Infreq
..LN2588:
	.loc    1  335  is_stmt 1
        testl     %r13d, %r13d                                  #335.18
..LN2589:
        jle       ..B1.355      # Prob 50%                      #335.18
..LN2590:
                                # LOE rbx r15 r12d r13d
..B1.340:                       # Preds ..B1.339
                                # Execution count [7.34e-03]: Infreq
..LN2591:
        movq      %rbx, %rdx                                    #335.3
..LN2592:
        andq      $63, %rdx                                     #335.3
..LN2593:
        testl     %edx, %edx                                    #335.3
..LN2594:
        je        ..B1.343      # Prob 50%                      #335.3
..LN2595:
                                # LOE rbx r15 edx r12d r13d
..B1.341:                       # Preds ..B1.340
                                # Execution count [7.34e-03]: Infreq
..LN2596:
        testb     $7, %dl                                       #335.3
..LN2597:
        jne       ..B1.392      # Prob 10%                      #335.3
..LN2598:
                                # LOE rbx r15 edx r12d r13d
..B1.342:                       # Preds ..B1.341
                                # Execution count [0.00e+00]: Infreq
..LN2599:
        negl      %edx                                          #335.3
..LN2600:
        addl      $64, %edx                                     #335.3
..LN2601:
        shrl      $3, %edx                                      #335.3
..LN2602:
        cmpl      %edx, %r13d                                   #335.3
..LN2603:
        cmovl     %r13d, %edx                                   #335.3
..LN2604:
                                # LOE rbx r15 edx r12d r13d
..B1.343:                       # Preds ..B1.342 ..B1.340
                                # Execution count [8.16e-03]: Infreq
..LN2605:
        movl      %r13d, %r10d                                  #335.3
..LN2606:
        subl      %edx, %r10d                                   #335.3
..LN2607:
        andl      $7, %r10d                                     #335.3
..LN2608:
        negl      %r10d                                         #335.3
..LN2609:
        addl      %r13d, %r10d                                  #335.3
..LN2610:
        cmpl      $1, %edx                                      #335.3
..LN2611:
        jb        ..B1.347      # Prob 50%                      #335.3
..LN2612:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.344:                       # Preds ..B1.343
                                # Execution count [7.34e-03]: Infreq
..LN2613:
        movl      $8, %r8d                                      #335.3
..LN2614:
        vmovd     %edx, %xmm0                                   #335.3
..LN2615:
        vpbroadcastd %xmm0, %ymm0                               #335.3
..LN2616:
        movl      $255, %eax                                    #335.3
..LN2617:
        movl      %r13d, 192(%rsp)                              #335.3[spill]
..LN2618:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #335.3
..LN2619:
        vmovd     %r8d, %xmm6                                   #335.3
..LN2620:
	.loc    1  336  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #336.11
..LN2621:
	.loc    1  337  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #337.11
..LN2622:
	.loc    1  338  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #338.11
..LN2623:
	.loc    1  339  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #339.11
..LN2624:
	.loc    1  335  is_stmt 1
        kmovw     %eax, %k1                                     #335.3
..LN2625:
        xorl      %r8d, %r8d                                    #335.3
..LN2626:
        vpbroadcastd %xmm6, %ymm6                               #335.3
..LN2627:
        xorl      %eax, %eax                                    #335.3
..LN2628:
        movslq    %edx, %r9                                     #335.3
..LN2629:
        movq      48(%rsp), %r11                                #335.3[spill]
..LN2630:
        movq      128(%rsp), %r13                               #335.3[spill]
..LN2631:
        movq      32(%rsp), %r14                                #335.3[spill]
..LN2632:
        movq      16(%rsp), %rcx                                #335.3[spill]
..LN2633:
        movq      120(%rsp), %rsi                               #335.3[spill]
..LN2634:
        movq      24(%rsp), %rdi                                #335.3[spill]
        .align    16,0x90
..LN2635:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 edx r10d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.345:                       # Preds ..B1.345 ..B1.344
                                # Execution count [4.08e-02]: Infreq
..LN2636:
        addq      $8, %r8                                       #335.3
..LN2637:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #335.3
..LN2638:
        vpaddd    %ymm6, %ymm5, %ymm5                           #335.3
..LN2639:
	.loc    1  336  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #336.4
..LN2640:
	.loc    1  337  is_stmt 1
        vmovupd   %zmm3, (%rax,%rsi){%k2}                       #337.4
..LN2641:
	.loc    1  338  is_stmt 1
        vmovupd   %zmm2, (%rax,%rcx){%k2}                       #338.4
..LN2642:
	.loc    1  339  is_stmt 1
        vmovupd   %zmm1, (%rax,%r14){%k2}                       #339.4
..LN2643:
	.loc    1  340  is_stmt 1
        vmovupd   %zmm4, (%rax,%r13){%k2}                       #340.4
..LN2644:
	.loc    1  341  is_stmt 1
        vmovupd   %zmm3, (%rax,%r11){%k2}                       #341.4
..LN2645:
	.loc    1  342  is_stmt 1
        vmovupd   %zmm2, (%rax,%rbx){%k2}                       #342.4
..LN2646:
	.loc    1  335  is_stmt 1
        addq      $64, %rax                                     #335.3
..LN2647:
        cmpq      %r9, %r8                                      #335.3
..LN2648:
        jb        ..B1.345      # Prob 81%                      #335.3
..LN2649:
                                # LOE rax rcx rbx rsi rdi r8 r9 r11 r13 r14 r15 edx r10d r12d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.346:                       # Preds ..B1.345
                                # Execution count [7.34e-03]: Infreq
..LN2650:
        movl      192(%rsp), %r13d                              #[spill]
..LN2651:
        cmpl      %edx, %r13d                                   #335.3
..LN2652:
        je        ..B1.355      # Prob 10%                      #335.3
..LN2653:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.347:                       # Preds ..B1.343 ..B1.346
                                # Execution count [0.00e+00]: Infreq
..LN2654:
        lea       8(%rdx), %r8d                                 #335.3
..LN2655:
        cmpl      %r8d, %r10d                                   #335.3
..LN2656:
        jl        ..B1.351      # Prob 50%                      #335.3
..LN2657:
                                # LOE rbx r15 edx r10d r12d r13d
..B1.348:                       # Preds ..B1.347
                                # Execution count [7.34e-03]: Infreq
..LN2658:
        movslq    %edx, %rdx                                    #335.3
..LN2659:
	.loc    1  336  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #336.11
..LN2660:
	.loc    1  337  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #337.11
..LN2661:
	.loc    1  338  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #338.11
..LN2662:
	.loc    1  339  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #339.11
..LN2663:
	.loc    1  335  is_stmt 1
        movslq    %r10d, %rax                                   #335.3
..LN2664:
        movq      48(%rsp), %r8                                 #335.3[spill]
..LN2665:
        movq      128(%rsp), %r9                                #335.3[spill]
..LN2666:
        movq      32(%rsp), %r11                                #335.3[spill]
..LN2667:
        movq      16(%rsp), %rcx                                #335.3[spill]
..LN2668:
        movq      120(%rsp), %rsi                               #335.3[spill]
..LN2669:
        movq      24(%rsp), %rdi                                #335.3[spill]
..LN2670:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r15 r10d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.349:                       # Preds ..B1.349 ..B1.348
                                # Execution count [4.08e-02]: Infreq
..LN2671:
	.loc    1  336  is_stmt 1
        vmovupd   %zmm3, (%rdi,%rdx,8)                          #336.4
..LN2672:
	.loc    1  337  is_stmt 1
        vmovupd   %zmm2, (%rsi,%rdx,8)                          #337.4
..LN2673:
	.loc    1  338  is_stmt 1
        vmovupd   %zmm1, (%rcx,%rdx,8)                          #338.4
..LN2674:
	.loc    1  339  is_stmt 1
        vmovupd   %zmm0, (%r11,%rdx,8)                          #339.4
..LN2675:
	.loc    1  340  is_stmt 1
        vmovupd   %zmm3, (%r9,%rdx,8)                           #340.4
..LN2676:
	.loc    1  341  is_stmt 1
        vmovupd   %zmm2, (%r8,%rdx,8)                           #341.4
..LN2677:
	.loc    1  342  is_stmt 1
        vmovntpd  %zmm1, (%rbx,%rdx,8)                          #342.4
..LN2678:
	.loc    1  335  is_stmt 1
        addq      $8, %rdx                                      #335.3
..LN2679:
        cmpq      %rax, %rdx                                    #335.3
..LN2680:
        jb        ..B1.349      # Prob 81%                      #335.3
..LN2681:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r11 r15 r10d r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.351:                       # Preds ..B1.349 ..B1.347 ..B1.392
                                # Execution count [8.16e-03]: Infreq
..LN2682:
        lea       1(%r10), %edx                                 #335.3
..LN2683:
        cmpl      %r13d, %edx                                   #335.3
..LN2684:
        ja        ..B1.355      # Prob 50%                      #335.3
..LN2685:
                                # LOE rbx r15 r10d r12d r13d
..B1.352:                       # Preds ..B1.351
                                # Execution count [7.34e-03]: Infreq
..LN2686:
        movl      $255, %eax                                    #335.3
..LN2687:
        movl      $8, %r11d                                     #335.3
..LN2688:
        kmovw     %eax, %k1                                     #335.3
..LN2689:
        xorl      %esi, %esi                                    #335.3
..LN2690:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #335.3
..LN2691:
	.loc    1  336  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #336.11
..LN2692:
	.loc    1  335  is_stmt 1
        vmovd     %r11d, %xmm6                                  #335.3
..LN2693:
	.loc    1  337  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #337.11
..LN2694:
	.loc    1  338  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #338.11
..LN2695:
	.loc    1  339  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #339.11
..LN2696:
	.loc    1  335  is_stmt 1
        movslq    %r10d, %rax                                   #335.3
..LN2697:
        negl      %r10d                                         #335.3
..LN2698:
        addl      %r13d, %r10d                                  #335.3
..LN2699:
	.loc    1  338  is_stmt 1
        movq      16(%rsp), %r8                                 #338.4[spill]
..LN2700:
	.loc    1  340  is_stmt 1
        movq      128(%rsp), %r9                                #340.4[spill]
..LN2701:
	.loc    1  339  is_stmt 1
        movq      32(%rsp), %rdx                                #339.4[spill]
..LN2702:
	.loc    1  342  is_stmt 1
        lea       (%rbx,%rax,8), %r11                           #342.4
..LN2703:
	.loc    1  336  is_stmt 1
        movq      24(%rsp), %rdi                                #336.4[spill]
..LN2704:
	.loc    1  338  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #338.4
..LN2705:
        movq      %r8, (%rsp)                                   #338.4[spill]
..LN2706:
	.loc    1  335  is_stmt 1
        vmovd     %r10d, %xmm0                                  #335.3
..LN2707:
	.loc    1  341  is_stmt 1
        movq      48(%rsp), %r10                                #341.4[spill]
..LN2708:
	.loc    1  340  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #340.4
..LN2709:
	.loc    1  337  is_stmt 1
        movq      120(%rsp), %r8                                #337.4[spill]
..LN2710:
	.loc    1  339  is_stmt 1
        lea       (%rdx,%rax,8), %rdx                           #339.4
..LN2711:
	.loc    1  335  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #335.3
..LN2712:
	.loc    1  336  is_stmt 1
        lea       (%rdi,%rax,8), %rdi                           #336.4
..LN2713:
	.loc    1  335  is_stmt 1
        movq      112(%rsp), %rcx                               #335.3[spill]
..LN2714:
	.loc    1  341  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #341.4
..LN2715:
	.loc    1  335  is_stmt 1
        movq      (%rsp), %r14                                  #335.3[spill]
..LN2716:
        subq      %rax, %rcx                                    #335.3
..LN2717:
        vpbroadcastd %xmm6, %ymm6                               #335.3
..LN2718:
	.loc    1  337  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #337.4
..LN2719:
	.loc    1  335  is_stmt 1
        xorl      %eax, %eax                                    #335.3
        .align    16,0x90
..LN2720:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.353:                       # Preds ..B1.353 ..B1.352
                                # Execution count [4.08e-02]: Infreq
..LN2721:
        addq      $8, %rsi                                      #335.3
..LN2722:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #335.3
..LN2723:
        vpaddd    %ymm6, %ymm5, %ymm5                           #335.3
..LN2724:
	.loc    1  336  is_stmt 1
        vmovupd   %zmm4, (%rax,%rdi){%k2}                       #336.4
..LN2725:
	.loc    1  337  is_stmt 1
        vmovupd   %zmm3, (%rax,%r8){%k2}                        #337.4
..LN2726:
	.loc    1  338  is_stmt 1
        vmovupd   %zmm2, (%rax,%r14){%k2}                       #338.4
..LN2727:
	.loc    1  339  is_stmt 1
        vmovupd   %zmm1, (%rax,%rdx){%k2}                       #339.4
..LN2728:
	.loc    1  340  is_stmt 1
        vmovupd   %zmm4, (%rax,%r9){%k2}                        #340.4
..LN2729:
	.loc    1  341  is_stmt 1
        vmovupd   %zmm3, (%rax,%r10){%k2}                       #341.4
..LN2730:
	.loc    1  342  is_stmt 1
        vmovupd   %zmm2, (%rax,%r11){%k2}                       #342.4
..LN2731:
	.loc    1  335  is_stmt 1
        addq      $64, %rax                                     #335.3
..LN2732:
        cmpq      %rcx, %rsi                                    #335.3
..LN2733:
        jb        ..B1.353      # Prob 81%                      #335.3
..LN2734:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.355:                       # Preds ..B1.353 ..B1.339 ..B1.346 ..B1.351
                                # Execution count [8.16e-03]: Infreq
..LN2735:
	.loc    1  347  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #347.3
..LN2736:
	.loc    1  345  is_stmt 1
        movl      $1, %r14d                                     #345.3
..LN2737:
	.loc    1  347  is_stmt 1
        vzeroupper                                              #347.3
..___tag_value_main.63:
..LN2738:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #347.3
..___tag_value_main.64:
..LN2739:
                                # LOE rbx r15 r12d r13d r14d
..B1.356:                       # Preds ..B1.355
                                # Execution count [8.16e-03]: Infreq
..LN2740:
	.loc    1  349  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #349.11
..LN2741:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #349.24
..LN2742:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #349.15
..LN2743:
        vcomisd   %xmm1, %xmm0                                  #349.24
..LN2744:
        jbe       ..B1.382      # Prob 10%                      #349.24
..LN2745:
                                # LOE rbx r15 r12d r13d r14d
..B1.357:                       # Preds ..B1.356
                                # Execution count [7.34e-03]: Infreq
..LN2746:
	.loc    1  356  is_stmt 1
        movl      $8, %r8d                                      #356.5
..LN2747:
        movl      %r13d, %edx                                   #356.5
..LN2748:
        andl      $-64, %edx                                    #356.5
..LN2749:
	.loc    1  351  is_stmt 1
        lea       56(%rsp), %rdi                                #351.4
..LN2750:
	.loc    1  356  is_stmt 1
        movl      %edx, 96(%rdi)                                #356.5[spill]
..LN2751:
	.loc    1  351  is_stmt 1
        lea       40(%rsp), %rsi                                #351.4
..LN2752:
	.loc    1  356  is_stmt 1
        movslq    %edx, %rdx                                    #356.5
..LN2753:
        vmovd     %r8d, %xmm0                                   #356.5
..LN2754:
        vpbroadcastd %xmm0, %ymm1                               #356.5
..LN2755:
        vmovdqu   %ymm1, 24(%rsi)                               #356.5[spill]
..LN2756:
        movq      %rdx, 104(%rsi)                               #356.5[spill]
..LN2757:
	.loc    1  351  is_stmt 1
        vzeroupper                                              #351.4
..___tag_value_main.65:
..LN2758:
#       timing(double *, double *)
        call      timing                                        #351.4
..___tag_value_main.66:
..LN2759:
                                # LOE rbx r15 r12d r13d r14d
..B1.358:                       # Preds ..B1.357
                                # Execution count [6.61e-03]: Infreq
..LN2760:
	.loc    1  352  is_stmt 1
        xorl      %eax, %eax                                    #352.4
..LN2761:
        movl      %r12d, (%rsp)                                 #352.4[spill]
..LN2762:
        vxorpd    %xmm0, %xmm0, %xmm0                           #352.4
..LN2763:
        movq      %r15, 8(%rsp)                                 #352.4[spill]
..LN2764:
        movq      %rbx, 136(%rsp)                               #352.4[spill]
..LN2765:
        movl      %eax, %ebx                                    #352.4
..LN2766:
        movl      %r14d, 184(%rsp)                              #352.4[spill]
..LN2767:
        movq      16(%rsp), %r12                                #352.4[spill]
..LN2768:
        movq      24(%rsp), %r15                                #352.4[spill]
..LN2769:
                                # LOE r12 r15 ebx r13d xmm0
..B1.359:                       # Preds ..B1.358 ..B1.374 ..B1.380
                                # Execution count [2.04e-01]: Infreq
..LN2770:
	.loc    1  356  is_stmt 1
        xorl      %edi, %edi                                    #356.9
..LN2771:
        testl     %r13d, %r13d                                  #356.20
..LN2772:
        jle       ..B1.372      # Prob 50%                      #356.20
..LN2773:
                                # LOE r12 r15 ebx edi r13d xmm0
..B1.360:                       # Preds ..B1.359
                                # Execution count [1.84e-01]: Infreq
..LN2774:
        cmpl      $64, %r13d                                    #356.5
..LN2775:
        jl        ..B1.391      # Prob 10%                      #356.5
..LN2776:
                                # LOE r12 r15 ebx edi r13d xmm0
..B1.361:                       # Preds ..B1.360
                                # Execution count [1.84e-01]: Infreq
..LN2777:
        movl      152(%rsp), %edx                               #356.5[spill]
..LN2778:
                                # LOE r12 r15 edx ebx r13d xmm0
..B1.363:                       # Preds ..B1.361
                                # Execution count [1.84e-01]: Infreq
..LN2779:
        movq      144(%rsp), %rdi                               #356.5[spill]
..LN2780:
        xorl      %ecx, %ecx                                    #356.5
..LN2781:
        movq      136(%rsp), %r8                                #356.5[spill]
..LN2782:
        movq      48(%rsp), %r9                                 #356.5[spill]
..LN2783:
        movq      128(%rsp), %r10                               #356.5[spill]
..LN2784:
        movq      32(%rsp), %r11                                #356.5[spill]
..LN2785:
        movq      120(%rsp), %rax                               #356.5[spill]
..LN2786:
                                # LOE rax rcx rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.364:                       # Preds ..B1.364 ..B1.363
                                # Execution count [1.02e+00]: Infreq
..LN2787:
	.loc    1  357  is_stmt 1
        vmovups   (%rax,%rcx,8), %zmm1                          #357.13
..LN2788:
        vmovups   64(%rax,%rcx,8), %zmm2                        #357.13
..LN2789:
        vaddpd    (%r12,%rcx,8), %zmm1, %zmm3                   #357.20
..LN2790:
        vaddpd    64(%r12,%rcx,8), %zmm2, %zmm4                 #357.20
..LN2791:
        vaddpd    (%r11,%rcx,8), %zmm3, %zmm5                   #357.27
..LN2792:
        vaddpd    64(%r11,%rcx,8), %zmm4, %zmm6                 #357.27
..LN2793:
        vaddpd    (%r10,%rcx,8), %zmm5, %zmm7                   #357.34
..LN2794:
        vaddpd    64(%r10,%rcx,8), %zmm6, %zmm8                 #357.34
..LN2795:
        vaddpd    (%r9,%rcx,8), %zmm7, %zmm9                    #357.41
..LN2796:
        vaddpd    64(%r9,%rcx,8), %zmm8, %zmm10                 #357.41
..LN2797:
        vaddpd    (%r8,%rcx,8), %zmm9, %zmm11                   #357.48
..LN2798:
        vaddpd    64(%r8,%rcx,8), %zmm10, %zmm12                #357.48
..LN2799:
        vmovntpd  %zmm11, (%r15,%rcx,8)                         #357.6
..LN2800:
        vmovntpd  %zmm12, 64(%r15,%rcx,8)                       #357.6
..LN2801:
        vmovups   128(%rax,%rcx,8), %zmm13                      #357.13
..LN2802:
        vmovups   192(%rax,%rcx,8), %zmm14                      #357.13
..LN2803:
        vaddpd    128(%r12,%rcx,8), %zmm13, %zmm15              #357.20
..LN2804:
        vaddpd    192(%r12,%rcx,8), %zmm14, %zmm16              #357.20
..LN2805:
        vaddpd    128(%r11,%rcx,8), %zmm15, %zmm17              #357.27
..LN2806:
        vaddpd    192(%r11,%rcx,8), %zmm16, %zmm18              #357.27
..LN2807:
        vaddpd    128(%r10,%rcx,8), %zmm17, %zmm19              #357.34
..LN2808:
        vaddpd    192(%r10,%rcx,8), %zmm18, %zmm20              #357.34
..LN2809:
        vaddpd    128(%r9,%rcx,8), %zmm19, %zmm21               #357.41
..LN2810:
        vaddpd    192(%r9,%rcx,8), %zmm20, %zmm22               #357.41
..LN2811:
        vaddpd    128(%r8,%rcx,8), %zmm21, %zmm23               #357.48
..LN2812:
        vaddpd    192(%r8,%rcx,8), %zmm22, %zmm24               #357.48
..LN2813:
        vmovntpd  %zmm23, 128(%r15,%rcx,8)                      #357.6
..LN2814:
        vmovntpd  %zmm24, 192(%r15,%rcx,8)                      #357.6
..LN2815:
        vmovups   256(%rax,%rcx,8), %zmm25                      #357.13
..LN2816:
        vmovups   320(%rax,%rcx,8), %zmm26                      #357.13
..LN2817:
        vaddpd    256(%r12,%rcx,8), %zmm25, %zmm27              #357.20
..LN2818:
        vaddpd    320(%r12,%rcx,8), %zmm26, %zmm28              #357.20
..LN2819:
        vaddpd    256(%r11,%rcx,8), %zmm27, %zmm29              #357.27
..LN2820:
        vaddpd    320(%r11,%rcx,8), %zmm28, %zmm30              #357.27
..LN2821:
        vaddpd    256(%r10,%rcx,8), %zmm29, %zmm31              #357.34
..LN2822:
        vaddpd    320(%r10,%rcx,8), %zmm30, %zmm1               #357.34
..LN2823:
        vaddpd    256(%r9,%rcx,8), %zmm31, %zmm2                #357.41
..LN2824:
        vaddpd    320(%r9,%rcx,8), %zmm1, %zmm3                 #357.41
..LN2825:
        vaddpd    256(%r8,%rcx,8), %zmm2, %zmm4                 #357.48
..LN2826:
        vaddpd    320(%r8,%rcx,8), %zmm3, %zmm5                 #357.48
..LN2827:
        vmovntpd  %zmm4, 256(%r15,%rcx,8)                       #357.6
..LN2828:
        vmovntpd  %zmm5, 320(%r15,%rcx,8)                       #357.6
..LN2829:
        vmovups   384(%rax,%rcx,8), %zmm6                       #357.13
..LN2830:
        vmovups   448(%rax,%rcx,8), %zmm7                       #357.13
..LN2831:
        vaddpd    384(%r12,%rcx,8), %zmm6, %zmm8                #357.20
..LN2832:
        vaddpd    448(%r12,%rcx,8), %zmm7, %zmm9                #357.20
..LN2833:
        .byte     144                                           #357.27
..LN2834:
        vaddpd    384(%r11,%rcx,8), %zmm8, %zmm10               #357.27
..LN2835:
        vaddpd    448(%r11,%rcx,8), %zmm9, %zmm11               #357.27
..LN2836:
        vaddpd    384(%r10,%rcx,8), %zmm10, %zmm12              #357.34
..LN2837:
        vaddpd    448(%r10,%rcx,8), %zmm11, %zmm13              #357.34
..LN2838:
        vaddpd    384(%r9,%rcx,8), %zmm12, %zmm14               #357.41
..LN2839:
        vaddpd    448(%r9,%rcx,8), %zmm13, %zmm15               #357.41
..LN2840:
        vaddpd    384(%r8,%rcx,8), %zmm14, %zmm16               #357.48
..LN2841:
        vaddpd    448(%r8,%rcx,8), %zmm15, %zmm17               #357.48
..LN2842:
        vmovntpd  %zmm16, 384(%r15,%rcx,8)                      #357.6
..LN2843:
        vmovntpd  %zmm17, 448(%r15,%rcx,8)                      #357.6
..LN2844:
	.loc    1  356  is_stmt 1
        addq      $64, %rcx                                     #356.5
..LN2845:
        cmpq      %rdi, %rcx                                    #356.5
..LN2846:
        jb        ..B1.364      # Prob 82%                      #356.5
..LN2847:
                                # LOE rax rcx rdi r8 r9 r10 r11 r12 r15 edx ebx r13d xmm0
..B1.365:                       # Preds ..B1.364
                                # Execution count [1.84e-01]: Infreq
..LN2848:
        movl      %edx, %edi                                    #356.36
..LN2849:
                                # LOE r12 r15 edx ebx edi r13d xmm0
..B1.366:                       # Preds ..B1.365 ..B1.391
                                # Execution count [2.04e-01]: Infreq
..LN2850:
        lea       1(%rdx), %ecx                                 #356.5
..LN2851:
        cmpl      %r13d, %ecx                                   #356.5
..LN2852:
        ja        ..B1.372      # Prob 50%                      #356.5
..LN2853:
                                # LOE r12 r15 edx ebx edi r13d xmm0
..B1.367:                       # Preds ..B1.366
                                # Execution count [1.84e-01]: Infreq
..LN2854:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #356.5
..LN2855:
                                # LOE r12 r15 edx ebx r13d xmm0 ymm2
..B1.369:                       # Preds ..B1.367
                                # Execution count [1.84e-01]: Infreq
..LN2856:
        movl      $255, %eax                                    #356.5
..LN2857:
        xorl      %esi, %esi                                    #356.5
..LN2858:
        kmovw     %eax, %k1                                     #356.5
..LN2859:
        vmovdqu   64(%rsp), %ymm9                               #356.5[spill]
..LN2860:
        movslq    %edx, %rax                                    #356.5
..LN2861:
        negl      %edx                                          #356.5
..LN2862:
        addl      %r13d, %edx                                   #356.5
..LN2863:
	.loc    1  357  is_stmt 1
        movq      136(%rsp), %rcx                               #357.48[spill]
..LN2864:
        movq      48(%rsp), %r8                                 #357.41[spill]
..LN2865:
        movq      128(%rsp), %r9                                #357.34[spill]
..LN2866:
        lea       (%r15,%rax,8), %rdi                           #357.6
..LN2867:
        movq      32(%rsp), %r10                                #357.27[spill]
..LN2868:
	.loc    1  356  is_stmt 1
        vmovd     %edx, %xmm1                                   #356.5
..LN2869:
	.loc    1  357  is_stmt 1
        movq      120(%rsp), %r14                               #357.13[spill]
..LN2870:
        lea       (%rcx,%rax,8), %rcx                           #357.48
..LN2871:
	.loc    1  356  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #356.5
..LN2872:
	.loc    1  357  is_stmt 1
        lea       (%r8,%rax,8), %r8                             #357.41
..LN2873:
	.loc    1  356  is_stmt 1
        movq      112(%rsp), %rdx                               #356.5[spill]
..LN2874:
	.loc    1  357  is_stmt 1
        lea       (%r9,%rax,8), %r9                             #357.34
..LN2875:
	.loc    1  356  is_stmt 1
        subq      %rax, %rdx                                    #356.5
..LN2876:
	.loc    1  357  is_stmt 1
        lea       (%r10,%rax,8), %r10                           #357.27
..LN2877:
        lea       (%r12,%rax,8), %r11                           #357.20
..LN2878:
        lea       (%r14,%rax,8), %r14                           #357.13
..LN2879:
	.loc    1  356  is_stmt 1
        xorl      %eax, %eax                                    #356.5
        .align    16,0x90
..LN2880:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm9 zmm1 k1
..B1.370:                       # Preds ..B1.370 ..B1.369
                                # Execution count [1.02e+00]: Infreq
..LN2881:
	.loc    1  357  is_stmt 1
        vmovups   (%rax,%r14), %zmm3                            #357.13
..LN2882:
	.loc    1  356  is_stmt 1
        addq      $8, %rsi                                      #356.5
..LN2883:
	.loc    1  357  is_stmt 1
        vaddpd    (%rax,%r11), %zmm3, %zmm4                     #357.20
..LN2884:
        vaddpd    (%rax,%r10), %zmm4, %zmm5                     #357.27
..LN2885:
        vaddpd    (%rax,%r9), %zmm5, %zmm6                      #357.34
..LN2886:
        vaddpd    (%rax,%r8), %zmm6, %zmm7                      #357.41
..LN2887:
        vaddpd    (%rax,%rcx), %zmm7, %zmm8                     #357.48
..LN2888:
	.loc    1  356  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #356.5
..LN2889:
        vpaddd    %ymm9, %ymm2, %ymm2                           #356.5
..LN2890:
	.loc    1  357  is_stmt 1
        vmovupd   %zmm8, (%rax,%rdi){%k2}                       #357.6
..LN2891:
	.loc    1  356  is_stmt 1
        addq      $64, %rax                                     #356.5
..LN2892:
        cmpq      %rdx, %rsi                                    #356.5
..LN2893:
        jb        ..B1.370      # Prob 82%                      #356.5
..LN2894:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r14 r15 ebx r13d xmm0 ymm2 ymm9 zmm1 k1
..B1.371:                       # Preds ..B1.370
                                # Execution count [1.84e-01]: Infreq
..LN2895:
        movl      %r13d, %edi                                   #356.36
..LN2896:
                                # LOE r12 r15 ebx edi r13d xmm0
..B1.372:                       # Preds ..B1.371 ..B1.366 ..B1.359
                                # Execution count [2.04e-01]: Infreq
..LN2897:
	.loc    1  359  is_stmt 1
        movslq    %edi, %rdi                                    #359.8
..LN2898:
        vcomisd   (%r15,%rdi,8), %xmm0                          #359.13
..LN2899:
        jbe       ..B1.374      # Prob 78%                      #359.13
..LN2900:
                                # LOE r12 r15 ebx r13d xmm0
..B1.373:                       # Preds ..B1.372
                                # Execution count [4.49e-02]: Infreq
..LN2901:
        movl      $il0_peep_printf_format_4, %edi               #359.16
..LN2902:
        vzeroupper                                              #359.16
..LN2903:
        call      puts                                          #359.16
..LN2904:
                                # LOE r12 r15 ebx r13d
..B1.746:                       # Preds ..B1.373
                                # Execution count [4.49e-02]: Infreq
..LN2905:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2906:
                                # LOE r12 r15 ebx r13d xmm0
..B1.374:                       # Preds ..B1.372 ..B1.746
                                # Execution count [2.04e-01]: Infreq
..LN2907:
	.loc    1  352  is_stmt 1
        incl      %ebx                                          #352.4
..LN2908:
        cmpl      184(%rsp), %ebx                               #352.4[spill]
..LN2909:
        jb        ..B1.359      # Prob 81%                      #352.4
..LN2910:
                                # LOE r12 r15 ebx r13d xmm0
..B1.375:                       # Preds ..B1.374
                                # Execution count [3.74e-02]: Infreq
..LN2911:
        movl      184(%rsp), %r14d                              #[spill]
..LN2912:
                                # LOE r12 r15 r13d r14d
..B1.376:                       # Preds ..B1.379 ..B1.375
                                # Execution count [4.08e-02]: Infreq
..LN2913:
	.loc    1  362  is_stmt 1
        vzeroupper                                              #362.4
..LN2914:
        lea       96(%rsp), %rdi                                #362.4
..LN2915:
        lea       40(%rsp), %rsi                                #362.4
..___tag_value_main.67:
..LN2916:
#       timing(double *, double *)
        call      timing                                        #362.4
..___tag_value_main.68:
..LN2917:
                                # LOE r12 r15 r13d r14d
..B1.377:                       # Preds ..B1.376
                                # Execution count [4.08e-02]: Infreq
..LN2918:
	.loc    1  349  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #349.11
..LN2919:
	.loc    1  363  is_stmt 1
        addl      %r14d, %r14d                                  #363.4
..LN2920:
	.loc    1  349  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #349.24
..LN2921:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #349.15
..LN2922:
        vcomisd   %xmm1, %xmm0                                  #349.24
..LN2923:
        jbe       ..B1.381      # Prob 18%                      #349.24
..LN2924:
                                # LOE r12 r15 r13d r14d
..B1.378:                       # Preds ..B1.377
                                # Execution count [3.34e-02]: Infreq
..LN2925:
	.loc    1  351  is_stmt 1
        lea       56(%rsp), %rdi                                #351.4
..LN2926:
        lea       40(%rsp), %rsi                                #351.4
..___tag_value_main.69:
..LN2927:
#       timing(double *, double *)
        call      timing                                        #351.4
..___tag_value_main.70:
..LN2928:
                                # LOE r12 r15 r13d r14d
..B1.379:                       # Preds ..B1.378
                                # Execution count [3.34e-02]: Infreq
..LN2929:
	.loc    1  352  is_stmt 1
        xorl      %ebx, %ebx                                    #352.4
..LN2930:
        testl     %r14d, %r14d                                  #352.19
..LN2931:
        jle       ..B1.376      # Prob 9%                       #352.19
..LN2932:
                                # LOE r12 r15 ebx r13d r14d
..B1.380:                       # Preds ..B1.379
                                # Execution count [3.01e-02]: Infreq
..LN2933:
        .byte     102                                           #
..LN2934:
        .byte     144                                           #
..LN2935:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN2936:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN2937:
        jmp       ..B1.359      # Prob 100%                     #
..LN2938:
                                # LOE r12 r15 ebx r13d xmm0
..B1.381:                       # Preds ..B1.377
                                # Execution count [7.34e-03]: Infreq
..LN2939:
        movq      136(%rsp), %rbx                               #[spill]
..LN2940:
        movl      (%rsp), %r12d                                 #[spill]
..LN2941:
        movq      8(%rsp), %r15                                 #[spill]
..LN2942:
                                # LOE rbx r15 r12d r13d r14d
..B1.382:                       # Preds ..B1.381 ..B1.356
                                # Execution count [8.16e-03]: Infreq
..LN2943:
	.loc    1  366  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #366.3
..___tag_value_main.71:
..LN2944:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #366.3
..___tag_value_main.72:
..LN2945:
                                # LOE rbx r15 r12d r13d r14d
..B1.383:                       # Preds ..B1.382
                                # Execution count [8.16e-03]: Infreq
..LN2946:
	.loc    1  368  is_stmt 1
        movl      %r14d, %edx                                   #368.3
..LN2947:
        shrl      $31, %edx                                     #368.3
..LN2948:
        addl      %edx, %r14d                                   #368.3
..LN2949:
        sarl      $1, %r14d                                     #368.3
..___tag_value_main.73:
..LN2950:
	.loc    1  371  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #371.3
..___tag_value_main.74:
..LN2951:
                                # LOE rbx r15 r12d r13d r14d
..B1.384:                       # Preds ..B1.383
                                # Execution count [8.16e-03]: Infreq
..LN2952:
	.loc    1  373  is_stmt 1
        movq      24(%rsp), %rdi                                #373.3[spill]
..LN2953:
#       _mm_free(void *)
        call      _mm_free                                      #373.3
..LN2954:
                                # LOE rbx r15 r12d r13d r14d
..B1.385:                       # Preds ..B1.384
                                # Execution count [8.16e-03]: Infreq
..LN2955:
	.loc    1  374  is_stmt 1
        movq      120(%rsp), %rdi                               #374.3[spill]
..LN2956:
#       _mm_free(void *)
        call      _mm_free                                      #374.3
..LN2957:
                                # LOE rbx r15 r12d r13d r14d
..B1.386:                       # Preds ..B1.385
                                # Execution count [8.16e-03]: Infreq
..LN2958:
	.loc    1  375  is_stmt 1
        movq      16(%rsp), %rdi                                #375.3[spill]
..LN2959:
#       _mm_free(void *)
        call      _mm_free                                      #375.3
..LN2960:
                                # LOE rbx r15 r12d r13d r14d
..B1.387:                       # Preds ..B1.386
                                # Execution count [8.16e-03]: Infreq
..LN2961:
	.loc    1  376  is_stmt 1
        movq      32(%rsp), %rdi                                #376.3[spill]
..LN2962:
#       _mm_free(void *)
        call      _mm_free                                      #376.3
..LN2963:
                                # LOE rbx r15 r12d r13d r14d
..B1.388:                       # Preds ..B1.387
                                # Execution count [8.16e-03]: Infreq
..LN2964:
	.loc    1  377  is_stmt 1
        movq      128(%rsp), %rdi                               #377.3[spill]
..LN2965:
#       _mm_free(void *)
        call      _mm_free                                      #377.3
..LN2966:
                                # LOE rbx r15 r12d r13d r14d
..B1.389:                       # Preds ..B1.388
                                # Execution count [8.16e-03]: Infreq
..LN2967:
	.loc    1  378  is_stmt 1
        movq      48(%rsp), %rdi                                #378.3[spill]
..LN2968:
#       _mm_free(void *)
        call      _mm_free                                      #378.3
..LN2969:
                                # LOE rbx r15 r12d r13d r14d
..B1.390:                       # Preds ..B1.389
                                # Execution count [8.16e-03]: Infreq
..LN2970:
	.loc    1  379  is_stmt 1
        movq      %rbx, %rdi                                    #379.3
..LN2971:
#       _mm_free(void *)
        call      _mm_free                                      #379.3
..LN2972:
        jmp       ..B1.18       # Prob 100%                     #379.3
..LN2973:
                                # LOE r15 r12d r13d r14d
..B1.391:                       # Preds ..B1.360
                                # Execution count [1.84e-02]: Infreq
..LN2974:
	.loc    1  356  is_stmt 1
        xorl      %edx, %edx                                    #356.5
..LN2975:
        jmp       ..B1.366      # Prob 100%                     #356.5
..LN2976:
                                # LOE r12 r15 edx ebx edi r13d xmm0
..B1.392:                       # Preds ..B1.341
                                # Execution count [7.34e-04]: Infreq
..LN2977:
	.loc    1  335  is_stmt 1
        xorl      %r10d, %r10d                                  #335.3
..LN2978:
        jmp       ..B1.351      # Prob 100%                     #335.3
..LN2979:
                                # LOE rbx r15 r10d r12d r13d
..B1.393:                       # Preds ..B1.12
                                # Execution count [8.16e-03]: Infreq
..LN2980:
	.loc    1  268  is_stmt 1
        movq      %rbx, %rdi                                    #268.16
..LN2981:
        movq      %r15, %rsi                                    #268.16
..LN2982:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #268.16
..LN2983:
                                # LOE rax rbx r15 r12d r13d
..B1.721:                       # Preds ..B1.393
                                # Execution count [8.16e-03]: Infreq
..LN2984:
        movq      %rax, 32(%rsp)                                #268.16[spill]
..LN2985:
                                # LOE rbx r15 r12d r13d
..B1.394:                       # Preds ..B1.721
                                # Execution count [8.16e-03]: Infreq
..LN2986:
	.loc    1  269  is_stmt 1
        movq      %rbx, %rdi                                    #269.16
..LN2987:
        movq      %r15, %rsi                                    #269.16
..LN2988:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #269.16
..LN2989:
                                # LOE rax rbx r15 r12d r13d
..B1.722:                       # Preds ..B1.394
                                # Execution count [8.16e-03]: Infreq
..LN2990:
        movq      %rax, 24(%rsp)                                #269.16[spill]
..LN2991:
                                # LOE rbx r15 r12d r13d
..B1.395:                       # Preds ..B1.722
                                # Execution count [8.16e-03]: Infreq
..LN2992:
	.loc    1  270  is_stmt 1
        movq      %rbx, %rdi                                    #270.16
..LN2993:
        movq      %r15, %rsi                                    #270.16
..LN2994:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #270.16
..LN2995:
                                # LOE rax rbx r15 r12d r13d
..B1.723:                       # Preds ..B1.395
                                # Execution count [8.16e-03]: Infreq
..LN2996:
        movq      %rax, 120(%rsp)                               #270.16[spill]
..LN2997:
                                # LOE rbx r15 r12d r13d
..B1.396:                       # Preds ..B1.723
                                # Execution count [8.16e-03]: Infreq
..LN2998:
	.loc    1  271  is_stmt 1
        movq      %rbx, %rdi                                    #271.16
..LN2999:
        movq      %r15, %rsi                                    #271.16
..LN3000:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #271.16
..LN3001:
                                # LOE rax rbx r15 r12d r13d
..B1.724:                       # Preds ..B1.396
                                # Execution count [8.16e-03]: Infreq
..LN3002:
        movq      %rax, 16(%rsp)                                #271.16[spill]
..LN3003:
                                # LOE rbx r15 r12d r13d
..B1.397:                       # Preds ..B1.724
                                # Execution count [8.16e-03]: Infreq
..LN3004:
	.loc    1  272  is_stmt 1
        movq      %rbx, %rdi                                    #272.16
..LN3005:
        movq      %r15, %rsi                                    #272.16
..LN3006:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #272.16
..LN3007:
                                # LOE rax rbx r15 r12d r13d
..B1.725:                       # Preds ..B1.397
                                # Execution count [8.16e-03]: Infreq
..LN3008:
        movq      %rax, 128(%rsp)                               #272.16[spill]
..LN3009:
                                # LOE rbx r15 r12d r13d
..B1.398:                       # Preds ..B1.725
                                # Execution count [8.16e-03]: Infreq
..LN3010:
	.loc    1  273  is_stmt 1
        movq      %rbx, %rdi                                    #273.16
..LN3011:
        movq      %r15, %rsi                                    #273.16
..LN3012:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #273.16
..LN3013:
                                # LOE rax r15 r12d r13d
..B1.726:                       # Preds ..B1.398
                                # Execution count [8.16e-03]: Infreq
..LN3014:
        movq      %rax, 136(%rsp)                               #273.16[spill]
..LN3015:
                                # LOE rax r15 r12d r13d
..B1.399:                       # Preds ..B1.726
                                # Execution count [8.16e-03]: Infreq
..LN3016:
	.loc    1  275  is_stmt 1
        testl     %r13d, %r13d                                  #275.18
..LN3017:
        jle       ..B1.415      # Prob 50%                      #275.18
..LN3018:
                                # LOE rax r15 r12d r13d
..B1.400:                       # Preds ..B1.399
                                # Execution count [7.34e-03]: Infreq
..LN3019:
        andq      $63, %rax                                     #275.3
..LN3020:
        testl     %eax, %eax                                    #275.3
..LN3021:
        je        ..B1.403      # Prob 50%                      #275.3
..LN3022:
                                # LOE r15 eax r12d r13d
..B1.401:                       # Preds ..B1.400
                                # Execution count [7.34e-03]: Infreq
..LN3023:
        testb     $7, %al                                       #275.3
..LN3024:
        jne       ..B1.451      # Prob 10%                      #275.3
..LN3025:
                                # LOE r15 eax r12d r13d
..B1.402:                       # Preds ..B1.401
                                # Execution count [0.00e+00]: Infreq
..LN3026:
        negl      %eax                                          #275.3
..LN3027:
        addl      $64, %eax                                     #275.3
..LN3028:
        shrl      $3, %eax                                      #275.3
..LN3029:
        cmpl      %eax, %r13d                                   #275.3
..LN3030:
        cmovl     %r13d, %eax                                   #275.3
..LN3031:
                                # LOE r15 eax r12d r13d
..B1.403:                       # Preds ..B1.402 ..B1.400
                                # Execution count [8.16e-03]: Infreq
..LN3032:
        movl      %r13d, %edx                                   #275.3
..LN3033:
        subl      %eax, %edx                                    #275.3
..LN3034:
        andl      $7, %edx                                      #275.3
..LN3035:
        negl      %edx                                          #275.3
..LN3036:
        addl      %r13d, %edx                                   #275.3
..LN3037:
        cmpl      $1, %eax                                      #275.3
..LN3038:
        jb        ..B1.407      # Prob 50%                      #275.3
..LN3039:
                                # LOE r15 eax edx r12d r13d
..B1.404:                       # Preds ..B1.403
                                # Execution count [7.34e-03]: Infreq
..LN3040:
        movl      $8, %ebx                                      #275.3
..LN3041:
        vmovd     %eax, %xmm0                                   #275.3
..LN3042:
        vpbroadcastd %xmm0, %ymm0                               #275.3
..LN3043:
        movl      $255, %ecx                                    #275.3
..LN3044:
        xorl      %r8d, %r8d                                    #275.3
..LN3045:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #275.3
..LN3046:
        vmovd     %ebx, %xmm6                                   #275.3
..LN3047:
	.loc    1  276  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #276.11
..LN3048:
	.loc    1  277  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #277.11
..LN3049:
	.loc    1  278  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #278.11
..LN3050:
	.loc    1  279  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #279.11
..LN3051:
	.loc    1  275  is_stmt 1
        kmovw     %ecx, %k1                                     #275.3
..LN3052:
        vpbroadcastd %xmm6, %ymm6                               #275.3
..LN3053:
        xorl      %ebx, %ebx                                    #275.3
..LN3054:
        movslq    %eax, %rdi                                    #275.3
..LN3055:
        movq      136(%rsp), %r9                                #275.3[spill]
..LN3056:
        movq      128(%rsp), %r10                               #275.3[spill]
..LN3057:
        movq      16(%rsp), %r11                                #275.3[spill]
..LN3058:
        movq      120(%rsp), %rcx                               #275.3[spill]
..LN3059:
        movq      24(%rsp), %rsi                                #275.3[spill]
..LN3060:
        movq      32(%rsp), %r14                                #275.3[spill]
        .align    16,0x90
..LN3061:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.405:                       # Preds ..B1.405 ..B1.404
                                # Execution count [4.08e-02]: Infreq
..LN3062:
        addq      $8, %r8                                       #275.3
..LN3063:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #275.3
..LN3064:
        vpaddd    %ymm6, %ymm5, %ymm5                           #275.3
..LN3065:
	.loc    1  276  is_stmt 1
        vmovupd   %zmm4, (%rbx,%r14){%k2}                       #276.4
..LN3066:
	.loc    1  277  is_stmt 1
        vmovupd   %zmm3, (%rbx,%rsi){%k2}                       #277.4
..LN3067:
	.loc    1  278  is_stmt 1
        vmovupd   %zmm2, (%rbx,%rcx){%k2}                       #278.4
..LN3068:
	.loc    1  279  is_stmt 1
        vmovupd   %zmm1, (%rbx,%r11){%k2}                       #279.4
..LN3069:
	.loc    1  280  is_stmt 1
        vmovupd   %zmm4, (%rbx,%r10){%k2}                       #280.4
..LN3070:
	.loc    1  281  is_stmt 1
        vmovupd   %zmm3, (%rbx,%r9){%k2}                        #281.4
..LN3071:
	.loc    1  275  is_stmt 1
        addq      $64, %rbx                                     #275.3
..LN3072:
        cmpq      %rdi, %r8                                     #275.3
..LN3073:
        jb        ..B1.405      # Prob 81%                      #275.3
..LN3074:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.406:                       # Preds ..B1.405
                                # Execution count [7.34e-03]: Infreq
..LN3075:
        cmpl      %eax, %r13d                                   #275.3
..LN3076:
        je        ..B1.415      # Prob 10%                      #275.3
..LN3077:
                                # LOE r15 eax edx r12d r13d
..B1.407:                       # Preds ..B1.403 ..B1.406
                                # Execution count [0.00e+00]: Infreq
..LN3078:
        lea       8(%rax), %ebx                                 #275.3
..LN3079:
        cmpl      %ebx, %edx                                    #275.3
..LN3080:
        jl        ..B1.411      # Prob 50%                      #275.3
..LN3081:
                                # LOE r15 eax edx r12d r13d
..B1.408:                       # Preds ..B1.407
                                # Execution count [7.34e-03]: Infreq
..LN3082:
        movslq    %eax, %rax                                    #275.3
..LN3083:
	.loc    1  276  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #276.11
..LN3084:
	.loc    1  277  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #277.11
..LN3085:
	.loc    1  278  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #278.11
..LN3086:
	.loc    1  279  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #279.11
..LN3087:
	.loc    1  275  is_stmt 1
        movslq    %edx, %rbx                                    #275.3
..LN3088:
        movq      136(%rsp), %rdi                               #275.3[spill]
..LN3089:
        movq      128(%rsp), %r8                                #275.3[spill]
..LN3090:
        movq      16(%rsp), %r9                                 #275.3[spill]
..LN3091:
        movq      120(%rsp), %r10                               #275.3[spill]
..LN3092:
        movq      24(%rsp), %r11                                #275.3[spill]
..LN3093:
        movq      32(%rsp), %rcx                                #275.3[spill]
..LN3094:
                                # LOE rax rcx rbx rdi r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.409:                       # Preds ..B1.409 ..B1.408
                                # Execution count [4.08e-02]: Infreq
..LN3095:
	.loc    1  276  is_stmt 1
        vmovupd   %zmm3, (%rcx,%rax,8)                          #276.4
..LN3096:
	.loc    1  277  is_stmt 1
        vmovupd   %zmm2, (%r11,%rax,8)                          #277.4
..LN3097:
	.loc    1  278  is_stmt 1
        vmovupd   %zmm1, (%r10,%rax,8)                          #278.4
..LN3098:
	.loc    1  279  is_stmt 1
        vmovupd   %zmm0, (%r9,%rax,8)                           #279.4
..LN3099:
	.loc    1  280  is_stmt 1
        vmovupd   %zmm3, (%r8,%rax,8)                           #280.4
..LN3100:
	.loc    1  281  is_stmt 1
        vmovntpd  %zmm2, (%rdi,%rax,8)                          #281.4
..LN3101:
	.loc    1  275  is_stmt 1
        addq      $8, %rax                                      #275.3
..LN3102:
        cmpq      %rbx, %rax                                    #275.3
..LN3103:
        jb        ..B1.409      # Prob 81%                      #275.3
..LN3104:
                                # LOE rax rcx rbx rdi r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.411:                       # Preds ..B1.409 ..B1.407 ..B1.451
                                # Execution count [8.16e-03]: Infreq
..LN3105:
        lea       1(%rdx), %ebx                                 #275.3
..LN3106:
        cmpl      %r13d, %ebx                                   #275.3
..LN3107:
        ja        ..B1.415      # Prob 50%                      #275.3
..LN3108:
                                # LOE r15 edx r12d r13d
..B1.412:                       # Preds ..B1.411
                                # Execution count [7.34e-03]: Infreq
..LN3109:
        movslq    %edx, %r8                                     #275.3
..LN3110:
        negl      %edx                                          #275.3
..LN3111:
	.loc    1  278  is_stmt 1
        movq      120(%rsp), %r11                               #278.4[spill]
..LN3112:
	.loc    1  275  is_stmt 1
        movl      $255, %eax                                    #275.3
..LN3113:
        addl      %r13d, %edx                                   #275.3
..LN3114:
        movl      $8, %r9d                                      #275.3
..LN3115:
        kmovw     %eax, %k1                                     #275.3
..LN3116:
        xorl      %r10d, %r10d                                  #275.3
..LN3117:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #275.3
..LN3118:
	.loc    1  276  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #276.11
..LN3119:
	.loc    1  275  is_stmt 1
        vmovd     %edx, %xmm0                                   #275.3
..LN3120:
        vmovd     %r9d, %xmm6                                   #275.3
..LN3121:
	.loc    1  277  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #277.11
..LN3122:
	.loc    1  278  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #278.11
..LN3123:
	.loc    1  279  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #279.11
..LN3124:
	.loc    1  281  is_stmt 1
        movq      136(%rsp), %rdi                               #281.4[spill]
..LN3125:
	.loc    1  278  is_stmt 1
        lea       (%r11,%r8,8), %rax                            #278.4
..LN3126:
	.loc    1  277  is_stmt 1
        movq      24(%rsp), %r11                                #277.4[spill]
..LN3127:
	.loc    1  280  is_stmt 1
        movq      128(%rsp), %rbx                               #280.4[spill]
..LN3128:
	.loc    1  279  is_stmt 1
        movq      16(%rsp), %rdx                                #279.4[spill]
..LN3129:
	.loc    1  281  is_stmt 1
        lea       (%rdi,%r8,8), %rdi                            #281.4
..LN3130:
	.loc    1  275  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #275.3
..LN3131:
	.loc    1  277  is_stmt 1
        lea       (%r11,%r8,8), %rcx                            #277.4
..LN3132:
	.loc    1  276  is_stmt 1
        movq      32(%rsp), %r11                                #276.4[spill]
..LN3133:
	.loc    1  280  is_stmt 1
        lea       (%rbx,%r8,8), %rbx                            #280.4
..LN3134:
	.loc    1  275  is_stmt 1
        movq      112(%rsp), %r9                                #275.3[spill]
..LN3135:
	.loc    1  279  is_stmt 1
        lea       (%rdx,%r8,8), %rdx                            #279.4
..LN3136:
	.loc    1  275  is_stmt 1
        vpbroadcastd %xmm6, %ymm6                               #275.3
..LN3137:
        subq      %r8, %r9                                      #275.3
..LN3138:
	.loc    1  276  is_stmt 1
        lea       (%r11,%r8,8), %r11                            #276.4
..LN3139:
	.loc    1  275  is_stmt 1
        xorl      %r8d, %r8d                                    #275.3
        .align    16,0x90
..LN3140:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.413:                       # Preds ..B1.413 ..B1.412
                                # Execution count [4.08e-02]: Infreq
..LN3141:
        addq      $8, %r10                                      #275.3
..LN3142:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #275.3
..LN3143:
        vpaddd    %ymm6, %ymm5, %ymm5                           #275.3
..LN3144:
	.loc    1  276  is_stmt 1
        vmovupd   %zmm4, (%r8,%r11){%k2}                        #276.4
..LN3145:
	.loc    1  277  is_stmt 1
        vmovupd   %zmm3, (%r8,%rcx){%k2}                        #277.4
..LN3146:
	.loc    1  278  is_stmt 1
        vmovupd   %zmm2, (%r8,%rax){%k2}                        #278.4
..LN3147:
	.loc    1  279  is_stmt 1
        vmovupd   %zmm1, (%r8,%rdx){%k2}                        #279.4
..LN3148:
	.loc    1  280  is_stmt 1
        vmovupd   %zmm4, (%r8,%rbx){%k2}                        #280.4
..LN3149:
	.loc    1  281  is_stmt 1
        vmovupd   %zmm3, (%r8,%rdi){%k2}                        #281.4
..LN3150:
	.loc    1  275  is_stmt 1
        addq      $64, %r8                                      #275.3
..LN3151:
        cmpq      %r9, %r10                                     #275.3
..LN3152:
        jb        ..B1.413      # Prob 81%                      #275.3
..LN3153:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.415:                       # Preds ..B1.413 ..B1.399 ..B1.406 ..B1.411
                                # Execution count [8.16e-03]: Infreq
..LN3154:
	.loc    1  287  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #287.3
..LN3155:
	.loc    1  285  is_stmt 1
        movl      $1, %r14d                                     #285.3
..LN3156:
	.loc    1  287  is_stmt 1
        vzeroupper                                              #287.3
..___tag_value_main.75:
..LN3157:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #287.3
..___tag_value_main.76:
..LN3158:
                                # LOE r15 r12d r13d r14d
..B1.416:                       # Preds ..B1.415
                                # Execution count [8.16e-03]: Infreq
..LN3159:
	.loc    1  289  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #289.11
..LN3160:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #289.24
..LN3161:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #289.15
..LN3162:
        vcomisd   %xmm1, %xmm0                                  #289.24
..LN3163:
        jbe       ..B1.442      # Prob 10%                      #289.24
..LN3164:
                                # LOE r15 r12d r13d r14d
..B1.417:                       # Preds ..B1.416
                                # Execution count [7.34e-03]: Infreq
..LN3165:
	.loc    1  296  is_stmt 1
        movl      $8, %edx                                      #296.5
..LN3166:
        movl      %r13d, %ebx                                   #296.5
..LN3167:
        andl      $-64, %ebx                                    #296.5
..LN3168:
	.loc    1  291  is_stmt 1
        lea       56(%rsp), %rdi                                #291.4
..LN3169:
	.loc    1  296  is_stmt 1
        movslq    %ebx, %rbx                                    #296.5
..LN3170:
	.loc    1  291  is_stmt 1
        lea       40(%rsp), %rsi                                #291.4
..LN3171:
	.loc    1  296  is_stmt 1
        movq      %rbx, 104(%rsi)                               #296.5[spill]
..LN3172:
        vmovd     %edx, %xmm0                                   #296.5
..LN3173:
        vpbroadcastd %xmm0, %ymm1                               #296.5
..LN3174:
        vmovdqu   %ymm1, 24(%rsi)                               #296.5[spill]
..LN3175:
	.loc    1  291  is_stmt 1
        vzeroupper                                              #291.4
..___tag_value_main.77:
..LN3176:
#       timing(double *, double *)
        call      timing                                        #291.4
..___tag_value_main.78:
..LN3177:
                                # LOE r15 ebx r12d r13d r14d
..B1.418:                       # Preds ..B1.417
                                # Execution count [6.61e-03]: Infreq
..LN3178:
	.loc    1  292  is_stmt 1
        xorl      %eax, %eax                                    #292.4
..LN3179:
        movl      %ebx, 48(%rsp)                                #292.4[spill]
..LN3180:
        vxorpd    %xmm0, %xmm0, %xmm0                           #292.4
..LN3181:
        movl      %r12d, (%rsp)                                 #292.4[spill]
..LN3182:
        movq      %r15, 8(%rsp)                                 #292.4[spill]
..LN3183:
        movl      %r14d, 184(%rsp)                              #292.4[spill]
..LN3184:
        movl      %eax, %r14d                                   #292.4
..LN3185:
        movq      16(%rsp), %r12                                #292.4[spill]
..LN3186:
        movq      24(%rsp), %rbx                                #292.4[spill]
..LN3187:
        movq      32(%rsp), %r15                                #292.4[spill]
..LN3188:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.419:                       # Preds ..B1.418 ..B1.434 ..B1.440
                                # Execution count [2.04e-01]: Infreq
..LN3189:
	.loc    1  296  is_stmt 1
        xorl      %ecx, %ecx                                    #296.9
..LN3190:
        testl     %r13d, %r13d                                  #296.20
..LN3191:
        jle       ..B1.432      # Prob 50%                      #296.20
..LN3192:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.420:                       # Preds ..B1.419
                                # Execution count [1.84e-01]: Infreq
..LN3193:
        cmpl      $64, %r13d                                    #296.5
..LN3194:
        jl        ..B1.450      # Prob 10%                      #296.5
..LN3195:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.421:                       # Preds ..B1.420
                                # Execution count [1.84e-01]: Infreq
..LN3196:
        movl      48(%rsp), %eax                                #296.5[spill]
..LN3197:
                                # LOE rbx r12 r15 eax r13d r14d xmm0
..B1.423:                       # Preds ..B1.421
                                # Execution count [1.84e-01]: Infreq
..LN3198:
        movq      144(%rsp), %rcx                               #296.5[spill]
..LN3199:
        xorl      %edx, %edx                                    #296.5
..LN3200:
        movq      136(%rsp), %rdi                               #296.5[spill]
..LN3201:
        movq      128(%rsp), %r8                                #296.5[spill]
..LN3202:
        movq      120(%rsp), %r9                                #296.5[spill]
..LN3203:
                                # LOE rdx rcx rbx rdi r8 r9 r12 r15 eax r13d r14d xmm0
..B1.424:                       # Preds ..B1.424 ..B1.423
                                # Execution count [1.02e+00]: Infreq
..LN3204:
	.loc    1  297  is_stmt 1
        vmovups   (%rbx,%rdx,8), %zmm1                          #297.13
..LN3205:
        vmovups   64(%rbx,%rdx,8), %zmm2                        #297.13
..LN3206:
        vaddpd    (%r9,%rdx,8), %zmm1, %zmm3                    #297.20
..LN3207:
        vaddpd    64(%r9,%rdx,8), %zmm2, %zmm4                  #297.20
..LN3208:
        vaddpd    (%r12,%rdx,8), %zmm3, %zmm5                   #297.27
..LN3209:
        vaddpd    64(%r12,%rdx,8), %zmm4, %zmm6                 #297.27
..LN3210:
        vaddpd    (%r8,%rdx,8), %zmm5, %zmm7                    #297.34
..LN3211:
        vaddpd    64(%r8,%rdx,8), %zmm6, %zmm8                  #297.34
..LN3212:
        vaddpd    (%rdi,%rdx,8), %zmm7, %zmm9                   #297.41
..LN3213:
        vaddpd    64(%rdi,%rdx,8), %zmm8, %zmm10                #297.41
..LN3214:
        vmovntpd  %zmm9, (%r15,%rdx,8)                          #297.6
..LN3215:
        vmovntpd  %zmm10, 64(%r15,%rdx,8)                       #297.6
..LN3216:
        vmovups   128(%rbx,%rdx,8), %zmm11                      #297.13
..LN3217:
        vmovups   192(%rbx,%rdx,8), %zmm12                      #297.13
..LN3218:
        vaddpd    128(%r9,%rdx,8), %zmm11, %zmm13               #297.20
..LN3219:
        vaddpd    192(%r9,%rdx,8), %zmm12, %zmm14               #297.20
..LN3220:
        vaddpd    128(%r12,%rdx,8), %zmm13, %zmm15              #297.27
..LN3221:
        vaddpd    192(%r12,%rdx,8), %zmm14, %zmm16              #297.27
..LN3222:
        vaddpd    128(%r8,%rdx,8), %zmm15, %zmm17               #297.34
..LN3223:
        vaddpd    192(%r8,%rdx,8), %zmm16, %zmm18               #297.34
..LN3224:
        vaddpd    128(%rdi,%rdx,8), %zmm17, %zmm19              #297.41
..LN3225:
        vaddpd    192(%rdi,%rdx,8), %zmm18, %zmm20              #297.41
..LN3226:
        vmovntpd  %zmm19, 128(%r15,%rdx,8)                      #297.6
..LN3227:
        vmovntpd  %zmm20, 192(%r15,%rdx,8)                      #297.6
..LN3228:
        vmovups   256(%rbx,%rdx,8), %zmm21                      #297.13
..LN3229:
        vmovups   320(%rbx,%rdx,8), %zmm22                      #297.13
..LN3230:
        vaddpd    256(%r9,%rdx,8), %zmm21, %zmm23               #297.20
..LN3231:
        vaddpd    320(%r9,%rdx,8), %zmm22, %zmm24               #297.20
..LN3232:
        vaddpd    256(%r12,%rdx,8), %zmm23, %zmm25              #297.27
..LN3233:
        vaddpd    320(%r12,%rdx,8), %zmm24, %zmm26              #297.27
..LN3234:
        vaddpd    256(%r8,%rdx,8), %zmm25, %zmm27               #297.34
..LN3235:
        vaddpd    320(%r8,%rdx,8), %zmm26, %zmm28               #297.34
..LN3236:
        vaddpd    256(%rdi,%rdx,8), %zmm27, %zmm29              #297.41
..LN3237:
        vaddpd    320(%rdi,%rdx,8), %zmm28, %zmm30              #297.41
..LN3238:
        vmovntpd  %zmm29, 256(%r15,%rdx,8)                      #297.6
..LN3239:
        vmovntpd  %zmm30, 320(%r15,%rdx,8)                      #297.6
..LN3240:
        vmovups   384(%rbx,%rdx,8), %zmm31                      #297.13
..LN3241:
        vmovups   448(%rbx,%rdx,8), %zmm1                       #297.13
..LN3242:
        vaddpd    384(%r9,%rdx,8), %zmm31, %zmm2                #297.20
..LN3243:
        vaddpd    448(%r9,%rdx,8), %zmm1, %zmm3                 #297.20
..LN3244:
        vaddpd    384(%r12,%rdx,8), %zmm2, %zmm4                #297.27
..LN3245:
        vaddpd    448(%r12,%rdx,8), %zmm3, %zmm5                #297.27
..LN3246:
        vaddpd    384(%r8,%rdx,8), %zmm4, %zmm6                 #297.34
..LN3247:
        vaddpd    448(%r8,%rdx,8), %zmm5, %zmm7                 #297.34
..LN3248:
        .byte     144                                           #297.41
..LN3249:
        vaddpd    384(%rdi,%rdx,8), %zmm6, %zmm8                #297.41
..LN3250:
        vaddpd    448(%rdi,%rdx,8), %zmm7, %zmm9                #297.41
..LN3251:
        vmovntpd  %zmm8, 384(%r15,%rdx,8)                       #297.6
..LN3252:
        vmovntpd  %zmm9, 448(%r15,%rdx,8)                       #297.6
..LN3253:
	.loc    1  296  is_stmt 1
        addq      $64, %rdx                                     #296.5
..LN3254:
        cmpq      %rcx, %rdx                                    #296.5
..LN3255:
        jb        ..B1.424      # Prob 82%                      #296.5
..LN3256:
                                # LOE rdx rcx rbx rdi r8 r9 r12 r15 eax r13d r14d xmm0
..B1.425:                       # Preds ..B1.424
                                # Execution count [1.84e-01]: Infreq
..LN3257:
        movl      %eax, %ecx                                    #296.36
..LN3258:
                                # LOE rbx r12 r15 eax ecx r13d r14d xmm0
..B1.426:                       # Preds ..B1.425 ..B1.450
                                # Execution count [2.04e-01]: Infreq
..LN3259:
        lea       1(%rax), %edx                                 #296.5
..LN3260:
        cmpl      %r13d, %edx                                   #296.5
..LN3261:
        ja        ..B1.432      # Prob 50%                      #296.5
..LN3262:
                                # LOE rbx r12 r15 eax ecx r13d r14d xmm0
..B1.427:                       # Preds ..B1.426
                                # Execution count [1.84e-01]: Infreq
..LN3263:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #296.5
..LN3264:
                                # LOE rbx r12 r15 eax r13d r14d xmm0 ymm2
..B1.429:                       # Preds ..B1.427
                                # Execution count [1.84e-01]: Infreq
..LN3265:
        movl      $255, %edx                                    #296.5
..LN3266:
        xorl      %r11d, %r11d                                  #296.5
..LN3267:
        kmovw     %edx, %k1                                     #296.5
..LN3268:
        vmovdqu   64(%rsp), %ymm8                               #296.5[spill]
..LN3269:
        movslq    %eax, %rdx                                    #296.5
..LN3270:
        negl      %eax                                          #296.5
..LN3271:
        addl      %r13d, %eax                                   #296.5
..LN3272:
	.loc    1  297  is_stmt 1
        movq      136(%rsp), %rdi                               #297.41[spill]
..LN3273:
        movq      128(%rsp), %r8                                #297.34[spill]
..LN3274:
        movq      120(%rsp), %r10                               #297.20[spill]
..LN3275:
        lea       (%r12,%rdx,8), %r9                            #297.27
..LN3276:
	.loc    1  296  is_stmt 1
        vmovd     %eax, %xmm1                                   #296.5
..LN3277:
	.loc    1  297  is_stmt 1
        lea       (%r15,%rdx,8), %rax                           #297.6
..LN3278:
	.loc    1  296  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #296.5
..LN3279:
	.loc    1  297  is_stmt 1
        lea       (%rdi,%rdx,8), %rdi                           #297.41
..LN3280:
	.loc    1  296  is_stmt 1
        movq      112(%rsp), %rcx                               #296.5[spill]
..LN3281:
	.loc    1  297  is_stmt 1
        lea       (%r8,%rdx,8), %r8                             #297.34
..LN3282:
	.loc    1  296  is_stmt 1
        subq      %rdx, %rcx                                    #296.5
..LN3283:
	.loc    1  297  is_stmt 1
        lea       (%r10,%rdx,8), %r10                           #297.20
..LN3284:
        lea       (%rbx,%rdx,8), %rsi                           #297.13
..LN3285:
	.loc    1  296  is_stmt 1
        xorl      %edx, %edx                                    #296.5
        .align    16,0x90
..LN3286:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm8 zmm1 k1
..B1.430:                       # Preds ..B1.430 ..B1.429
                                # Execution count [1.02e+00]: Infreq
..LN3287:
	.loc    1  297  is_stmt 1
        vmovups   (%rdx,%rsi), %zmm3                            #297.13
..LN3288:
	.loc    1  296  is_stmt 1
        addq      $8, %r11                                      #296.5
..LN3289:
	.loc    1  297  is_stmt 1
        vaddpd    (%rdx,%r10), %zmm3, %zmm4                     #297.20
..LN3290:
        vaddpd    (%rdx,%r9), %zmm4, %zmm5                      #297.27
..LN3291:
        vaddpd    (%rdx,%r8), %zmm5, %zmm6                      #297.34
..LN3292:
        vaddpd    (%rdx,%rdi), %zmm6, %zmm7                     #297.41
..LN3293:
	.loc    1  296  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #296.5
..LN3294:
        vpaddd    %ymm8, %ymm2, %ymm2                           #296.5
..LN3295:
	.loc    1  297  is_stmt 1
        vmovupd   %zmm7, (%rdx,%rax){%k2}                       #297.6
..LN3296:
	.loc    1  296  is_stmt 1
        addq      $64, %rdx                                     #296.5
..LN3297:
        cmpq      %rcx, %r11                                    #296.5
..LN3298:
        jb        ..B1.430      # Prob 82%                      #296.5
..LN3299:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm8 zmm1 k1
..B1.431:                       # Preds ..B1.430
                                # Execution count [1.84e-01]: Infreq
..LN3300:
        movl      %r13d, %ecx                                   #296.36
..LN3301:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.432:                       # Preds ..B1.431 ..B1.426 ..B1.419
                                # Execution count [2.04e-01]: Infreq
..LN3302:
	.loc    1  299  is_stmt 1
        movslq    %ecx, %rcx                                    #299.8
..LN3303:
        vcomisd   (%r15,%rcx,8), %xmm0                          #299.13
..LN3304:
        jbe       ..B1.434      # Prob 78%                      #299.13
..LN3305:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.433:                       # Preds ..B1.432
                                # Execution count [4.49e-02]: Infreq
..LN3306:
        movl      $il0_peep_printf_format_5, %edi               #299.16
..LN3307:
        vzeroupper                                              #299.16
..LN3308:
        call      puts                                          #299.16
..LN3309:
                                # LOE rbx r12 r15 r13d r14d
..B1.745:                       # Preds ..B1.433
                                # Execution count [4.49e-02]: Infreq
..LN3310:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3311:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.434:                       # Preds ..B1.432 ..B1.745
                                # Execution count [2.04e-01]: Infreq
..LN3312:
	.loc    1  292  is_stmt 1
        incl      %r14d                                         #292.4
..LN3313:
        cmpl      184(%rsp), %r14d                              #292.4[spill]
..LN3314:
        jb        ..B1.419      # Prob 81%                      #292.4
..LN3315:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.435:                       # Preds ..B1.434
                                # Execution count [3.74e-02]: Infreq
..LN3316:
        movl      184(%rsp), %r14d                              #[spill]
..LN3317:
                                # LOE rbx r12 r15 r13d r14d
..B1.436:                       # Preds ..B1.439 ..B1.435
                                # Execution count [4.08e-02]: Infreq
..LN3318:
	.loc    1  302  is_stmt 1
        vzeroupper                                              #302.4
..LN3319:
        lea       96(%rsp), %rdi                                #302.4
..LN3320:
        lea       40(%rsp), %rsi                                #302.4
..___tag_value_main.79:
..LN3321:
#       timing(double *, double *)
        call      timing                                        #302.4
..___tag_value_main.80:
..LN3322:
                                # LOE rbx r12 r15 r13d r14d
..B1.437:                       # Preds ..B1.436
                                # Execution count [4.08e-02]: Infreq
..LN3323:
	.loc    1  289  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #289.11
..LN3324:
	.loc    1  303  is_stmt 1
        addl      %r14d, %r14d                                  #303.4
..LN3325:
	.loc    1  289  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #289.24
..LN3326:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #289.15
..LN3327:
        vcomisd   %xmm1, %xmm0                                  #289.24
..LN3328:
        jbe       ..B1.441      # Prob 18%                      #289.24
..LN3329:
                                # LOE rbx r12 r15 r13d r14d
..B1.438:                       # Preds ..B1.437
                                # Execution count [3.34e-02]: Infreq
..LN3330:
	.loc    1  291  is_stmt 1
        lea       56(%rsp), %rdi                                #291.4
..LN3331:
        lea       40(%rsp), %rsi                                #291.4
..___tag_value_main.81:
..LN3332:
#       timing(double *, double *)
        call      timing                                        #291.4
..___tag_value_main.82:
..LN3333:
                                # LOE rbx r12 r15 r13d r14d
..B1.439:                       # Preds ..B1.438
                                # Execution count [3.34e-02]: Infreq
..LN3334:
	.loc    1  292  is_stmt 1
        xorl      %eax, %eax                                    #292.4
..LN3335:
        testl     %r14d, %r14d                                  #292.19
..LN3336:
        jle       ..B1.436      # Prob 9%                       #292.19
..LN3337:
                                # LOE rbx r12 r15 eax r13d r14d
..B1.440:                       # Preds ..B1.439
                                # Execution count [3.01e-02]: Infreq
..LN3338:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN3339:
        movl      %eax, %r14d                                   #
..LN3340:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3341:
        jmp       ..B1.419      # Prob 100%                     #
..LN3342:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.441:                       # Preds ..B1.437
                                # Execution count [7.34e-03]: Infreq
..LN3343:
        movl      (%rsp), %r12d                                 #[spill]
..LN3344:
        movq      8(%rsp), %r15                                 #[spill]
..LN3345:
                                # LOE r15 r12d r13d r14d
..B1.442:                       # Preds ..B1.441 ..B1.416
                                # Execution count [8.16e-03]: Infreq
..LN3346:
	.loc    1  306  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #306.3
..___tag_value_main.83:
..LN3347:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #306.3
..___tag_value_main.84:
..LN3348:
                                # LOE r15 r12d r13d r14d
..B1.443:                       # Preds ..B1.442
                                # Execution count [8.16e-03]: Infreq
..LN3349:
	.loc    1  308  is_stmt 1
        movl      %r14d, %edx                                   #308.3
..LN3350:
        shrl      $31, %edx                                     #308.3
..LN3351:
        addl      %edx, %r14d                                   #308.3
..LN3352:
        sarl      $1, %r14d                                     #308.3
..___tag_value_main.85:
..LN3353:
	.loc    1  311  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #311.3
..___tag_value_main.86:
..LN3354:
                                # LOE r15 r12d r13d r14d
..B1.444:                       # Preds ..B1.443
                                # Execution count [8.16e-03]: Infreq
..LN3355:
	.loc    1  313  is_stmt 1
        movq      32(%rsp), %rdi                                #313.3[spill]
..LN3356:
#       _mm_free(void *)
        call      _mm_free                                      #313.3
..LN3357:
                                # LOE r15 r12d r13d r14d
..B1.445:                       # Preds ..B1.444
                                # Execution count [8.16e-03]: Infreq
..LN3358:
	.loc    1  314  is_stmt 1
        movq      24(%rsp), %rdi                                #314.3[spill]
..LN3359:
#       _mm_free(void *)
        call      _mm_free                                      #314.3
..LN3360:
                                # LOE r15 r12d r13d r14d
..B1.446:                       # Preds ..B1.445
                                # Execution count [8.16e-03]: Infreq
..LN3361:
	.loc    1  315  is_stmt 1
        movq      120(%rsp), %rdi                               #315.3[spill]
..LN3362:
#       _mm_free(void *)
        call      _mm_free                                      #315.3
..LN3363:
                                # LOE r15 r12d r13d r14d
..B1.447:                       # Preds ..B1.446
                                # Execution count [8.16e-03]: Infreq
..LN3364:
	.loc    1  316  is_stmt 1
        movq      16(%rsp), %rdi                                #316.3[spill]
..LN3365:
#       _mm_free(void *)
        call      _mm_free                                      #316.3
..LN3366:
                                # LOE r15 r12d r13d r14d
..B1.448:                       # Preds ..B1.447
                                # Execution count [8.16e-03]: Infreq
..LN3367:
	.loc    1  317  is_stmt 1
        movq      128(%rsp), %rdi                               #317.3[spill]
..LN3368:
#       _mm_free(void *)
        call      _mm_free                                      #317.3
..LN3369:
                                # LOE r15 r12d r13d r14d
..B1.449:                       # Preds ..B1.448
                                # Execution count [8.16e-03]: Infreq
..LN3370:
	.loc    1  318  is_stmt 1
        movq      136(%rsp), %rdi                               #318.3[spill]
..LN3371:
#       _mm_free(void *)
        call      _mm_free                                      #318.3
..LN3372:
        jmp       ..B1.18       # Prob 100%                     #318.3
..LN3373:
                                # LOE r15 r12d r13d r14d
..B1.450:                       # Preds ..B1.420
                                # Execution count [1.84e-02]: Infreq
..LN3374:
	.loc    1  296  is_stmt 1
        xorl      %eax, %eax                                    #296.5
..LN3375:
        jmp       ..B1.426      # Prob 100%                     #296.5
..LN3376:
                                # LOE rbx r12 r15 eax ecx r13d r14d xmm0
..B1.451:                       # Preds ..B1.401
                                # Execution count [7.34e-04]: Infreq
..LN3377:
	.loc    1  275  is_stmt 1
        xorl      %edx, %edx                                    #275.3
..LN3378:
        jmp       ..B1.411      # Prob 100%                     #275.3
..LN3379:
                                # LOE r15 edx r12d r13d
..B1.452:                       # Preds ..B1.11
                                # Execution count [8.16e-03]: Infreq
..LN3380:
	.loc    1  213  is_stmt 1
        movq      %rbx, %rdi                                    #213.16
..LN3381:
        movq      %r15, %rsi                                    #213.16
..LN3382:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #213.16
..LN3383:
                                # LOE rax rbx r15 r12d r13d
..B1.727:                       # Preds ..B1.452
                                # Execution count [8.16e-03]: Infreq
..LN3384:
        movq      %rax, 32(%rsp)                                #213.16[spill]
..LN3385:
                                # LOE rbx r15 r12d r13d
..B1.453:                       # Preds ..B1.727
                                # Execution count [8.16e-03]: Infreq
..LN3386:
	.loc    1  214  is_stmt 1
        movq      %rbx, %rdi                                    #214.16
..LN3387:
        movq      %r15, %rsi                                    #214.16
..LN3388:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #214.16
..LN3389:
                                # LOE rax rbx r15 r12d r13d
..B1.728:                       # Preds ..B1.453
                                # Execution count [8.16e-03]: Infreq
..LN3390:
        movq      %rax, 24(%rsp)                                #214.16[spill]
..LN3391:
                                # LOE rbx r15 r12d r13d
..B1.454:                       # Preds ..B1.728
                                # Execution count [8.16e-03]: Infreq
..LN3392:
	.loc    1  215  is_stmt 1
        movq      %rbx, %rdi                                    #215.16
..LN3393:
        movq      %r15, %rsi                                    #215.16
..LN3394:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #215.16
..LN3395:
                                # LOE rax rbx r15 r12d r13d
..B1.729:                       # Preds ..B1.454
                                # Execution count [8.16e-03]: Infreq
..LN3396:
        movq      %rax, 48(%rsp)                                #215.16[spill]
..LN3397:
                                # LOE rbx r15 r12d r13d
..B1.455:                       # Preds ..B1.729
                                # Execution count [8.16e-03]: Infreq
..LN3398:
	.loc    1  216  is_stmt 1
        movq      %rbx, %rdi                                    #216.16
..LN3399:
        movq      %r15, %rsi                                    #216.16
..LN3400:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #216.16
..LN3401:
                                # LOE rax rbx r15 r12d r13d
..B1.730:                       # Preds ..B1.455
                                # Execution count [8.16e-03]: Infreq
..LN3402:
        movq      %rax, 16(%rsp)                                #216.16[spill]
..LN3403:
                                # LOE rbx r15 r12d r13d
..B1.456:                       # Preds ..B1.730
                                # Execution count [8.16e-03]: Infreq
..LN3404:
	.loc    1  217  is_stmt 1
        movq      %rbx, %rdi                                    #217.16
..LN3405:
        movq      %r15, %rsi                                    #217.16
..LN3406:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #217.16
..LN3407:
                                # LOE rax r15 r12d r13d
..B1.731:                       # Preds ..B1.456
                                # Execution count [8.16e-03]: Infreq
..LN3408:
        movq      %rax, %rbx                                    #217.16
..LN3409:
                                # LOE rbx r15 r12d r13d
..B1.457:                       # Preds ..B1.731
                                # Execution count [8.16e-03]: Infreq
..LN3410:
	.loc    1  219  is_stmt 1
        testl     %r13d, %r13d                                  #219.18
..LN3411:
        jle       ..B1.473      # Prob 50%                      #219.18
..LN3412:
                                # LOE rbx r15 r12d r13d
..B1.458:                       # Preds ..B1.457
                                # Execution count [7.34e-03]: Infreq
..LN3413:
        movq      %rbx, %rax                                    #219.3
..LN3414:
        andq      $63, %rax                                     #219.3
..LN3415:
        testl     %eax, %eax                                    #219.3
..LN3416:
        je        ..B1.461      # Prob 50%                      #219.3
..LN3417:
                                # LOE rbx r15 eax r12d r13d
..B1.459:                       # Preds ..B1.458
                                # Execution count [7.34e-03]: Infreq
..LN3418:
        testb     $7, %al                                       #219.3
..LN3419:
        jne       ..B1.508      # Prob 10%                      #219.3
..LN3420:
                                # LOE rbx r15 eax r12d r13d
..B1.460:                       # Preds ..B1.459
                                # Execution count [0.00e+00]: Infreq
..LN3421:
        negl      %eax                                          #219.3
..LN3422:
        addl      $64, %eax                                     #219.3
..LN3423:
        shrl      $3, %eax                                      #219.3
..LN3424:
        cmpl      %eax, %r13d                                   #219.3
..LN3425:
        cmovl     %r13d, %eax                                   #219.3
..LN3426:
                                # LOE rbx r15 eax r12d r13d
..B1.461:                       # Preds ..B1.460 ..B1.458
                                # Execution count [8.16e-03]: Infreq
..LN3427:
        movl      %r13d, %edx                                   #219.3
..LN3428:
        subl      %eax, %edx                                    #219.3
..LN3429:
        andl      $7, %edx                                      #219.3
..LN3430:
        negl      %edx                                          #219.3
..LN3431:
        addl      %r13d, %edx                                   #219.3
..LN3432:
        cmpl      $1, %eax                                      #219.3
..LN3433:
        jb        ..B1.465      # Prob 50%                      #219.3
..LN3434:
                                # LOE rbx r15 eax edx r12d r13d
..B1.462:                       # Preds ..B1.461
                                # Execution count [7.34e-03]: Infreq
..LN3435:
        movl      $8, %r8d                                      #219.3
..LN3436:
        vmovd     %eax, %xmm0                                   #219.3
..LN3437:
        vpbroadcastd %xmm0, %ymm0                               #219.3
..LN3438:
        movl      $255, %ecx                                    #219.3
..LN3439:
        xorl      %r10d, %r10d                                  #219.3
..LN3440:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #219.3
..LN3441:
        vmovd     %r8d, %xmm6                                   #219.3
..LN3442:
	.loc    1  220  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #220.11
..LN3443:
	.loc    1  221  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #221.11
..LN3444:
	.loc    1  222  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #222.11
..LN3445:
	.loc    1  223  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #223.11
..LN3446:
	.loc    1  219  is_stmt 1
        kmovw     %ecx, %k1                                     #219.3
..LN3447:
        vpbroadcastd %xmm6, %ymm6                               #219.3
..LN3448:
        xorl      %r8d, %r8d                                    #219.3
..LN3449:
        movslq    %eax, %r9                                     #219.3
..LN3450:
        movq      16(%rsp), %r11                                #219.3[spill]
..LN3451:
        movq      48(%rsp), %rcx                                #219.3[spill]
..LN3452:
        movq      24(%rsp), %rsi                                #219.3[spill]
..LN3453:
        movq      32(%rsp), %rdi                                #219.3[spill]
..LN3454:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.463:                       # Preds ..B1.463 ..B1.462
                                # Execution count [4.08e-02]: Infreq
..LN3455:
        addq      $8, %r10                                      #219.3
..LN3456:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #219.3
..LN3457:
        vpaddd    %ymm6, %ymm5, %ymm5                           #219.3
..LN3458:
	.loc    1  220  is_stmt 1
        vmovupd   %zmm4, (%r8,%rdi){%k2}                        #220.4
..LN3459:
	.loc    1  221  is_stmt 1
        vmovupd   %zmm3, (%r8,%rsi){%k2}                        #221.4
..LN3460:
	.loc    1  222  is_stmt 1
        vmovupd   %zmm2, (%r8,%rcx){%k2}                        #222.4
..LN3461:
	.loc    1  223  is_stmt 1
        vmovupd   %zmm1, (%r8,%r11){%k2}                        #223.4
..LN3462:
	.loc    1  224  is_stmt 1
        vmovupd   %zmm4, (%r8,%rbx){%k2}                        #224.4
..LN3463:
	.loc    1  219  is_stmt 1
        addq      $64, %r8                                      #219.3
..LN3464:
        cmpq      %r9, %r10                                     #219.3
..LN3465:
        jb        ..B1.463      # Prob 81%                      #219.3
..LN3466:
                                # LOE rcx rbx rsi rdi r8 r9 r10 r11 r15 eax edx r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.464:                       # Preds ..B1.463
                                # Execution count [7.34e-03]: Infreq
..LN3467:
        cmpl      %eax, %r13d                                   #219.3
..LN3468:
        je        ..B1.473      # Prob 10%                      #219.3
..LN3469:
                                # LOE rbx r15 eax edx r12d r13d
..B1.465:                       # Preds ..B1.461 ..B1.464
                                # Execution count [0.00e+00]: Infreq
..LN3470:
        lea       8(%rax), %r8d                                 #219.3
..LN3471:
        cmpl      %r8d, %edx                                    #219.3
..LN3472:
        jl        ..B1.469      # Prob 50%                      #219.3
..LN3473:
                                # LOE rbx r15 eax edx r12d r13d
..B1.466:                       # Preds ..B1.465
                                # Execution count [7.34e-03]: Infreq
..LN3474:
        movslq    %eax, %rax                                    #219.3
..LN3475:
	.loc    1  220  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #220.11
..LN3476:
	.loc    1  221  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #221.11
..LN3477:
	.loc    1  222  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #222.11
..LN3478:
	.loc    1  223  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #223.11
..LN3479:
	.loc    1  219  is_stmt 1
        movslq    %edx, %r8                                     #219.3
..LN3480:
        movq      16(%rsp), %r9                                 #219.3[spill]
..LN3481:
        movq      48(%rsp), %r10                                #219.3[spill]
..LN3482:
        movq      24(%rsp), %r11                                #219.3[spill]
..LN3483:
        movq      32(%rsp), %rcx                                #219.3[spill]
..LN3484:
                                # LOE rax rcx rbx r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.467:                       # Preds ..B1.467 ..B1.466
                                # Execution count [4.08e-02]: Infreq
..LN3485:
	.loc    1  220  is_stmt 1
        vmovupd   %zmm3, (%rcx,%rax,8)                          #220.4
..LN3486:
	.loc    1  221  is_stmt 1
        vmovupd   %zmm2, (%r11,%rax,8)                          #221.4
..LN3487:
	.loc    1  222  is_stmt 1
        vmovupd   %zmm1, (%r10,%rax,8)                          #222.4
..LN3488:
	.loc    1  223  is_stmt 1
        vmovupd   %zmm0, (%r9,%rax,8)                           #223.4
..LN3489:
	.loc    1  224  is_stmt 1
        vmovntpd  %zmm3, (%rbx,%rax,8)                          #224.4
..LN3490:
	.loc    1  219  is_stmt 1
        addq      $8, %rax                                      #219.3
..LN3491:
        cmpq      %r8, %rax                                     #219.3
..LN3492:
        jb        ..B1.467      # Prob 81%                      #219.3
..LN3493:
                                # LOE rax rcx rbx r8 r9 r10 r11 r15 edx r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.469:                       # Preds ..B1.467 ..B1.465 ..B1.508
                                # Execution count [8.16e-03]: Infreq
..LN3494:
        lea       1(%rdx), %r8d                                 #219.3
..LN3495:
        cmpl      %r13d, %r8d                                   #219.3
..LN3496:
        ja        ..B1.473      # Prob 50%                      #219.3
..LN3497:
                                # LOE rbx r15 edx r12d r13d
..B1.470:                       # Preds ..B1.469
                                # Execution count [7.34e-03]: Infreq
..LN3498:
        movslq    %edx, %r8                                     #219.3
..LN3499:
        negl      %edx                                          #219.3
..LN3500:
        addl      %r13d, %edx                                   #219.3
..LN3501:
        movl      $8, %r9d                                      #219.3
..LN3502:
        movl      $255, %eax                                    #219.3
..LN3503:
        xorl      %r11d, %r11d                                  #219.3
..LN3504:
        kmovw     %eax, %k1                                     #219.3
..LN3505:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #219.3
..LN3506:
        vmovd     %edx, %xmm0                                   #219.3
..LN3507:
        vmovd     %r9d, %xmm6                                   #219.3
..LN3508:
	.loc    1  220  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #220.11
..LN3509:
	.loc    1  221  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #221.11
..LN3510:
	.loc    1  222  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #222.11
..LN3511:
	.loc    1  223  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #223.11
..LN3512:
        movq      16(%rsp), %rdx                                #223.4[spill]
..LN3513:
	.loc    1  224  is_stmt 1
        lea       (%rbx,%r8,8), %r9                             #224.4
..LN3514:
	.loc    1  222  is_stmt 1
        movq      48(%rsp), %rax                                #222.4[spill]
..LN3515:
	.loc    1  221  is_stmt 1
        movq      24(%rsp), %rsi                                #221.4[spill]
..LN3516:
	.loc    1  220  is_stmt 1
        movq      32(%rsp), %rcx                                #220.4[spill]
..LN3517:
	.loc    1  223  is_stmt 1
        lea       (%rdx,%r8,8), %rdx                            #223.4
..LN3518:
	.loc    1  219  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #219.3
..LN3519:
	.loc    1  222  is_stmt 1
        lea       (%rax,%r8,8), %rax                            #222.4
..LN3520:
	.loc    1  219  is_stmt 1
        movq      112(%rsp), %r10                               #219.3[spill]
..LN3521:
	.loc    1  221  is_stmt 1
        lea       (%rsi,%r8,8), %rsi                            #221.4
..LN3522:
	.loc    1  219  is_stmt 1
        vpbroadcastd %xmm6, %ymm6                               #219.3
..LN3523:
        subq      %r8, %r10                                     #219.3
..LN3524:
	.loc    1  220  is_stmt 1
        lea       (%rcx,%r8,8), %rcx                            #220.4
..LN3525:
	.loc    1  219  is_stmt 1
        xorl      %r8d, %r8d                                    #219.3
..LN3526:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.471:                       # Preds ..B1.471 ..B1.470
                                # Execution count [4.08e-02]: Infreq
..LN3527:
        addq      $8, %r11                                      #219.3
..LN3528:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #219.3
..LN3529:
        vpaddd    %ymm6, %ymm5, %ymm5                           #219.3
..LN3530:
	.loc    1  220  is_stmt 1
        vmovupd   %zmm4, (%r8,%rcx){%k2}                        #220.4
..LN3531:
	.loc    1  221  is_stmt 1
        vmovupd   %zmm3, (%r8,%rsi){%k2}                        #221.4
..LN3532:
	.loc    1  222  is_stmt 1
        vmovupd   %zmm2, (%r8,%rax){%k2}                        #222.4
..LN3533:
	.loc    1  223  is_stmt 1
        vmovupd   %zmm1, (%r8,%rdx){%k2}                        #223.4
..LN3534:
	.loc    1  224  is_stmt 1
        vmovupd   %zmm4, (%r8,%r9){%k2}                         #224.4
..LN3535:
	.loc    1  219  is_stmt 1
        addq      $64, %r8                                      #219.3
..LN3536:
        cmpq      %r10, %r11                                    #219.3
..LN3537:
        jb        ..B1.471      # Prob 81%                      #219.3
..LN3538:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.473:                       # Preds ..B1.471 ..B1.457 ..B1.464 ..B1.469
                                # Execution count [8.16e-03]: Infreq
..LN3539:
	.loc    1  229  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #229.3
..LN3540:
	.loc    1  227  is_stmt 1
        movl      $1, %r14d                                     #227.3
..LN3541:
	.loc    1  229  is_stmt 1
        vzeroupper                                              #229.3
..___tag_value_main.87:
..LN3542:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #229.3
..___tag_value_main.88:
..LN3543:
                                # LOE rbx r15 r12d r13d r14d
..B1.474:                       # Preds ..B1.473
                                # Execution count [8.16e-03]: Infreq
..LN3544:
	.loc    1  231  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #231.11
..LN3545:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #231.24
..LN3546:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #231.15
..LN3547:
        vcomisd   %xmm1, %xmm0                                  #231.24
..LN3548:
        jbe       ..B1.500      # Prob 10%                      #231.24
..LN3549:
                                # LOE rbx r15 r12d r13d r14d
..B1.475:                       # Preds ..B1.474
                                # Execution count [7.34e-03]: Infreq
..LN3550:
	.loc    1  238  is_stmt 1
        movl      $8, %r8d                                      #238.5
..LN3551:
        movl      %r13d, %edx                                   #238.5
..LN3552:
        andl      $-64, %edx                                    #238.5
..LN3553:
	.loc    1  233  is_stmt 1
        lea       56(%rsp), %rdi                                #233.4
..LN3554:
	.loc    1  238  is_stmt 1
        movl      %edx, 72(%rdi)                                #238.5[spill]
..LN3555:
	.loc    1  233  is_stmt 1
        lea       40(%rsp), %rsi                                #233.4
..LN3556:
	.loc    1  238  is_stmt 1
        movslq    %edx, %rdx                                    #238.5
..LN3557:
        vmovd     %r8d, %xmm0                                   #238.5
..LN3558:
        vpbroadcastd %xmm0, %ymm1                               #238.5
..LN3559:
        vmovdqu   %ymm1, 24(%rsi)                               #238.5[spill]
..LN3560:
        movq      %rdx, 80(%rsi)                                #238.5[spill]
..LN3561:
	.loc    1  233  is_stmt 1
        vzeroupper                                              #233.4
..___tag_value_main.89:
..LN3562:
#       timing(double *, double *)
        call      timing                                        #233.4
..___tag_value_main.90:
..LN3563:
                                # LOE rbx r15 r12d r13d r14d
..B1.476:                       # Preds ..B1.475
                                # Execution count [6.61e-03]: Infreq
..LN3564:
	.loc    1  234  is_stmt 1
        xorl      %eax, %eax                                    #234.4
..LN3565:
        movl      %r12d, (%rsp)                                 #234.4[spill]
..LN3566:
        vxorpd    %xmm0, %xmm0, %xmm0                           #234.4
..LN3567:
        movq      %r15, 8(%rsp)                                 #234.4[spill]
..LN3568:
        movl      %r14d, 184(%rsp)                              #234.4[spill]
..LN3569:
        movl      %r13d, %r14d                                  #234.4
..LN3570:
        movq      16(%rsp), %r15                                #234.4[spill]
..LN3571:
        movl      %eax, %r13d                                   #234.4
..LN3572:
        movq      24(%rsp), %r12                                #234.4[spill]
..LN3573:
        movq      32(%rsp), %r11                                #234.4[spill]
..LN3574:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.477:                       # Preds ..B1.476 ..B1.492 ..B1.498
                                # Execution count [2.04e-01]: Infreq
..LN3575:
	.loc    1  238  is_stmt 1
        xorl      %esi, %esi                                    #238.9
..LN3576:
        testl     %r14d, %r14d                                  #238.20
..LN3577:
        jle       ..B1.490      # Prob 50%                      #238.20
..LN3578:
                                # LOE rbx r11 r12 r15 esi r13d r14d xmm0
..B1.478:                       # Preds ..B1.477
                                # Execution count [1.84e-01]: Infreq
..LN3579:
        cmpl      $64, %r14d                                    #238.5
..LN3580:
        jl        ..B1.507      # Prob 10%                      #238.5
..LN3581:
                                # LOE rbx r11 r12 r15 esi r13d r14d xmm0
..B1.479:                       # Preds ..B1.478
                                # Execution count [1.84e-01]: Infreq
..LN3582:
        movl      128(%rsp), %ecx                               #238.5[spill]
..LN3583:
                                # LOE rbx r11 r12 r15 ecx r13d r14d xmm0
..B1.481:                       # Preds ..B1.479
                                # Execution count [1.84e-01]: Infreq
..LN3584:
        movq      120(%rsp), %rsi                               #238.5[spill]
..LN3585:
        xorl      %edx, %edx                                    #238.5
..LN3586:
        movq      48(%rsp), %r8                                 #238.5[spill]
..LN3587:
                                # LOE rdx rbx rsi r8 r11 r12 r15 ecx r13d r14d xmm0
..B1.482:                       # Preds ..B1.482 ..B1.481
                                # Execution count [1.02e+00]: Infreq
..LN3588:
	.loc    1  239  is_stmt 1
        vmovups   (%r12,%rdx,8), %zmm1                          #239.13
..LN3589:
        vmovups   64(%r12,%rdx,8), %zmm2                        #239.13
..LN3590:
        vaddpd    (%r8,%rdx,8), %zmm1, %zmm3                    #239.20
..LN3591:
        vaddpd    64(%r8,%rdx,8), %zmm2, %zmm4                  #239.20
..LN3592:
        vaddpd    (%r15,%rdx,8), %zmm3, %zmm5                   #239.27
..LN3593:
        vaddpd    64(%r15,%rdx,8), %zmm4, %zmm6                 #239.27
..LN3594:
        vaddpd    (%rbx,%rdx,8), %zmm5, %zmm7                   #239.34
..LN3595:
        vaddpd    64(%rbx,%rdx,8), %zmm6, %zmm8                 #239.34
..LN3596:
        vmovntpd  %zmm7, (%r11,%rdx,8)                          #239.6
..LN3597:
        vmovntpd  %zmm8, 64(%r11,%rdx,8)                        #239.6
..LN3598:
        vmovups   128(%r12,%rdx,8), %zmm9                       #239.13
..LN3599:
        vmovups   192(%r12,%rdx,8), %zmm10                      #239.13
..LN3600:
        vaddpd    128(%r8,%rdx,8), %zmm9, %zmm11                #239.20
..LN3601:
        vaddpd    192(%r8,%rdx,8), %zmm10, %zmm12               #239.20
..LN3602:
        vaddpd    128(%r15,%rdx,8), %zmm11, %zmm13              #239.27
..LN3603:
        vaddpd    192(%r15,%rdx,8), %zmm12, %zmm14              #239.27
..LN3604:
        vaddpd    128(%rbx,%rdx,8), %zmm13, %zmm15              #239.34
..LN3605:
        vaddpd    192(%rbx,%rdx,8), %zmm14, %zmm16              #239.34
..LN3606:
        vmovntpd  %zmm15, 128(%r11,%rdx,8)                      #239.6
..LN3607:
        vmovntpd  %zmm16, 192(%r11,%rdx,8)                      #239.6
..LN3608:
        vmovups   256(%r12,%rdx,8), %zmm17                      #239.13
..LN3609:
        vmovups   320(%r12,%rdx,8), %zmm18                      #239.13
..LN3610:
        vaddpd    256(%r8,%rdx,8), %zmm17, %zmm19               #239.20
..LN3611:
        vaddpd    320(%r8,%rdx,8), %zmm18, %zmm20               #239.20
..LN3612:
        vaddpd    256(%r15,%rdx,8), %zmm19, %zmm21              #239.27
..LN3613:
        vaddpd    320(%r15,%rdx,8), %zmm20, %zmm22              #239.27
..LN3614:
        vaddpd    256(%rbx,%rdx,8), %zmm21, %zmm23              #239.34
..LN3615:
        vaddpd    320(%rbx,%rdx,8), %zmm22, %zmm24              #239.34
..LN3616:
        vmovntpd  %zmm23, 256(%r11,%rdx,8)                      #239.6
..LN3617:
        vmovntpd  %zmm24, 320(%r11,%rdx,8)                      #239.6
..LN3618:
        vmovups   384(%r12,%rdx,8), %zmm25                      #239.13
..LN3619:
        vmovups   448(%r12,%rdx,8), %zmm26                      #239.13
..LN3620:
        vaddpd    384(%r8,%rdx,8), %zmm25, %zmm27               #239.20
..LN3621:
        vaddpd    448(%r8,%rdx,8), %zmm26, %zmm28               #239.20
..LN3622:
        vaddpd    384(%r15,%rdx,8), %zmm27, %zmm29              #239.27
..LN3623:
        vaddpd    448(%r15,%rdx,8), %zmm28, %zmm30              #239.27
..LN3624:
        vaddpd    384(%rbx,%rdx,8), %zmm29, %zmm31              #239.34
..LN3625:
        vaddpd    448(%rbx,%rdx,8), %zmm30, %zmm1               #239.34
..LN3626:
        vmovntpd  %zmm31, 384(%r11,%rdx,8)                      #239.6
..LN3627:
        vmovntpd  %zmm1, 448(%r11,%rdx,8)                       #239.6
..LN3628:
	.loc    1  238  is_stmt 1
        addq      $64, %rdx                                     #238.5
..LN3629:
        cmpq      %rsi, %rdx                                    #238.5
..LN3630:
        jb        ..B1.482      # Prob 82%                      #238.5
..LN3631:
                                # LOE rdx rbx rsi r8 r11 r12 r15 ecx r13d r14d xmm0
..B1.483:                       # Preds ..B1.482
                                # Execution count [1.84e-01]: Infreq
..LN3632:
        movl      %ecx, %esi                                    #238.36
..LN3633:
                                # LOE rbx r11 r12 r15 ecx esi r13d r14d xmm0
..B1.484:                       # Preds ..B1.483 ..B1.507
                                # Execution count [2.04e-01]: Infreq
..LN3634:
        lea       1(%rcx), %edx                                 #238.5
..LN3635:
        cmpl      %r14d, %edx                                   #238.5
..LN3636:
        ja        ..B1.490      # Prob 50%                      #238.5
..LN3637:
                                # LOE rbx r11 r12 r15 ecx esi r13d r14d xmm0
..B1.485:                       # Preds ..B1.484
                                # Execution count [1.84e-01]: Infreq
..LN3638:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #238.5
..LN3639:
                                # LOE rbx r11 r12 r15 ecx r13d r14d xmm0 ymm2
..B1.487:                       # Preds ..B1.485
                                # Execution count [1.84e-01]: Infreq
..LN3640:
        movl      $255, %eax                                    #238.5
..LN3641:
        xorl      %r10d, %r10d                                  #238.5
..LN3642:
        kmovw     %eax, %k1                                     #238.5
..LN3643:
        vmovdqu   64(%rsp), %ymm7                               #238.5[spill]
..LN3644:
        movslq    %ecx, %rax                                    #238.5
..LN3645:
        negl      %ecx                                          #238.5
..LN3646:
        addl      %r14d, %ecx                                   #238.5
..LN3647:
	.loc    1  239  is_stmt 1
        movq      48(%rsp), %r9                                 #239.20[spill]
..LN3648:
	.loc    1  238  is_stmt 1
        movq      112(%rsp), %rdx                               #238.5[spill]
..LN3649:
        subq      %rax, %rdx                                    #238.5
..LN3650:
	.loc    1  239  is_stmt 1
        lea       (%rbx,%rax,8), %rsi                           #239.34
..LN3651:
	.loc    1  238  is_stmt 1
        vmovd     %ecx, %xmm1                                   #238.5
..LN3652:
	.loc    1  239  is_stmt 1
        lea       (%r11,%rax,8), %rcx                           #239.6
..LN3653:
	.loc    1  238  is_stmt 1
        vpbroadcastd %xmm1, %ymm1                               #238.5
..LN3654:
	.loc    1  239  is_stmt 1
        lea       (%r15,%rax,8), %r8                            #239.27
..LN3655:
        lea       (%r9,%rax,8), %r9                             #239.20
..LN3656:
        lea       (%r12,%rax,8), %rdi                           #239.13
..LN3657:
	.loc    1  238  is_stmt 1
        xorl      %eax, %eax                                    #238.5
..LN3658:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm7 zmm1 k1
..B1.488:                       # Preds ..B1.488 ..B1.487
                                # Execution count [1.02e+00]: Infreq
..LN3659:
	.loc    1  239  is_stmt 1
        vmovups   (%rax,%rdi), %zmm3                            #239.13
..LN3660:
	.loc    1  238  is_stmt 1
        addq      $8, %r10                                      #238.5
..LN3661:
	.loc    1  239  is_stmt 1
        vaddpd    (%rax,%r9), %zmm3, %zmm4                      #239.20
..LN3662:
        vaddpd    (%rax,%r8), %zmm4, %zmm5                      #239.27
..LN3663:
        vaddpd    (%rax,%rsi), %zmm5, %zmm6                     #239.34
..LN3664:
	.loc    1  238  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #238.5
..LN3665:
        vpaddd    %ymm7, %ymm2, %ymm2                           #238.5
..LN3666:
	.loc    1  239  is_stmt 1
        vmovupd   %zmm6, (%rax,%rcx){%k2}                       #239.6
..LN3667:
	.loc    1  238  is_stmt 1
        addq      $64, %rax                                     #238.5
..LN3668:
        cmpq      %rdx, %r10                                    #238.5
..LN3669:
        jb        ..B1.488      # Prob 82%                      #238.5
..LN3670:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm7 zmm1 k1
..B1.489:                       # Preds ..B1.488
                                # Execution count [1.84e-01]: Infreq
..LN3671:
        movl      %r14d, %esi                                   #238.36
..LN3672:
                                # LOE rbx r11 r12 r15 esi r13d r14d xmm0
..B1.490:                       # Preds ..B1.489 ..B1.484 ..B1.477
                                # Execution count [2.04e-01]: Infreq
..LN3673:
	.loc    1  241  is_stmt 1
        movslq    %esi, %rsi                                    #241.8
..LN3674:
        vcomisd   (%r11,%rsi,8), %xmm0                          #241.13
..LN3675:
        jbe       ..B1.492      # Prob 78%                      #241.13
..LN3676:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.491:                       # Preds ..B1.490
                                # Execution count [4.49e-02]: Infreq
..LN3677:
        movl      $il0_peep_printf_format_6, %edi               #241.16
..LN3678:
        movq      %r11, 32(%rsp)                                #241.16[spill]
..LN3679:
        vzeroupper                                              #241.16
..LN3680:
        call      puts                                          #241.16
..LN3681:
                                # LOE rbx r12 r15 r13d r14d
..B1.744:                       # Preds ..B1.491
                                # Execution count [4.49e-02]: Infreq
..LN3682:
        movq      32(%rsp), %r11                                #[spill]
..LN3683:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3684:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.492:                       # Preds ..B1.490 ..B1.744
                                # Execution count [2.04e-01]: Infreq
..LN3685:
	.loc    1  234  is_stmt 1
        incl      %r13d                                         #234.4
..LN3686:
        cmpl      184(%rsp), %r13d                              #234.4[spill]
..LN3687:
        jb        ..B1.477      # Prob 81%                      #234.4
..LN3688:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.493:                       # Preds ..B1.492
                                # Execution count [3.74e-02]: Infreq
..LN3689:
        movl      %r14d, 192(%rsp)                              #[spill]
..LN3690:
        movq      %r11, %r13                                    #
..LN3691:
        movl      184(%rsp), %r14d                              #[spill]
..LN3692:
                                # LOE rbx r12 r13 r15 r14d
..B1.494:                       # Preds ..B1.497 ..B1.493
                                # Execution count [4.08e-02]: Infreq
..LN3693:
	.loc    1  244  is_stmt 1
        vzeroupper                                              #244.4
..LN3694:
        lea       96(%rsp), %rdi                                #244.4
..LN3695:
        lea       40(%rsp), %rsi                                #244.4
..___tag_value_main.91:
..LN3696:
#       timing(double *, double *)
        call      timing                                        #244.4
..___tag_value_main.92:
..LN3697:
                                # LOE rbx r12 r13 r15 r14d
..B1.495:                       # Preds ..B1.494
                                # Execution count [4.08e-02]: Infreq
..LN3698:
	.loc    1  231  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #231.11
..LN3699:
	.loc    1  245  is_stmt 1
        addl      %r14d, %r14d                                  #245.4
..LN3700:
	.loc    1  231  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #231.24
..LN3701:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #231.15
..LN3702:
        vcomisd   %xmm1, %xmm0                                  #231.24
..LN3703:
        jbe       ..B1.499      # Prob 18%                      #231.24
..LN3704:
                                # LOE rbx r12 r13 r15 r14d
..B1.496:                       # Preds ..B1.495
                                # Execution count [3.34e-02]: Infreq
..LN3705:
	.loc    1  233  is_stmt 1
        lea       56(%rsp), %rdi                                #233.4
..LN3706:
        lea       40(%rsp), %rsi                                #233.4
..___tag_value_main.93:
..LN3707:
#       timing(double *, double *)
        call      timing                                        #233.4
..___tag_value_main.94:
..LN3708:
                                # LOE rbx r12 r13 r15 r14d
..B1.497:                       # Preds ..B1.496
                                # Execution count [3.34e-02]: Infreq
..LN3709:
	.loc    1  234  is_stmt 1
        xorl      %eax, %eax                                    #234.4
..LN3710:
        testl     %r14d, %r14d                                  #234.19
..LN3711:
        jle       ..B1.494      # Prob 9%                       #234.19
..LN3712:
                                # LOE rbx r12 r13 r15 eax r14d
..B1.498:                       # Preds ..B1.497
                                # Execution count [3.01e-02]: Infreq
..LN3713:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN3714:
        movq      %r13, %r11                                    #
..LN3715:
        movl      192(%rsp), %r14d                              #[spill]
..LN3716:
        movl      %eax, %r13d                                   #
..LN3717:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN3718:
        jmp       ..B1.477      # Prob 100%                     #
..LN3719:
                                # LOE rbx r11 r12 r15 r13d r14d xmm0
..B1.499:                       # Preds ..B1.495
                                # Execution count [7.34e-03]: Infreq
..LN3720:
        movq      %r13, 32(%rsp)                                #[spill]
..LN3721:
        movl      (%rsp), %r12d                                 #[spill]
..LN3722:
        movq      8(%rsp), %r15                                 #[spill]
..LN3723:
        movl      192(%rsp), %r13d                              #[spill]
..LN3724:
                                # LOE rbx r15 r12d r13d r14d
..B1.500:                       # Preds ..B1.499 ..B1.474
                                # Execution count [8.16e-03]: Infreq
..LN3725:
	.loc    1  248  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #248.3
..___tag_value_main.95:
..LN3726:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #248.3
..___tag_value_main.96:
..LN3727:
                                # LOE rbx r15 r12d r13d r14d
..B1.501:                       # Preds ..B1.500
                                # Execution count [8.16e-03]: Infreq
..LN3728:
	.loc    1  250  is_stmt 1
        movl      %r14d, %edx                                   #250.3
..LN3729:
        shrl      $31, %edx                                     #250.3
..LN3730:
        addl      %edx, %r14d                                   #250.3
..LN3731:
        sarl      $1, %r14d                                     #250.3
..___tag_value_main.97:
..LN3732:
	.loc    1  253  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #253.3
..___tag_value_main.98:
..LN3733:
                                # LOE rbx r15 r12d r13d r14d
..B1.502:                       # Preds ..B1.501
                                # Execution count [8.16e-03]: Infreq
..LN3734:
	.loc    1  255  is_stmt 1
        movq      32(%rsp), %rdi                                #255.3[spill]
..LN3735:
#       _mm_free(void *)
        call      _mm_free                                      #255.3
..LN3736:
                                # LOE rbx r15 r12d r13d r14d
..B1.503:                       # Preds ..B1.502
                                # Execution count [8.16e-03]: Infreq
..LN3737:
	.loc    1  256  is_stmt 1
        movq      24(%rsp), %rdi                                #256.3[spill]
..LN3738:
#       _mm_free(void *)
        call      _mm_free                                      #256.3
..LN3739:
                                # LOE rbx r15 r12d r13d r14d
..B1.504:                       # Preds ..B1.503
                                # Execution count [8.16e-03]: Infreq
..LN3740:
	.loc    1  257  is_stmt 1
        movq      48(%rsp), %rdi                                #257.3[spill]
..LN3741:
#       _mm_free(void *)
        call      _mm_free                                      #257.3
..LN3742:
                                # LOE rbx r15 r12d r13d r14d
..B1.505:                       # Preds ..B1.504
                                # Execution count [8.16e-03]: Infreq
..LN3743:
	.loc    1  258  is_stmt 1
        movq      16(%rsp), %rdi                                #258.3[spill]
..LN3744:
#       _mm_free(void *)
        call      _mm_free                                      #258.3
..LN3745:
                                # LOE rbx r15 r12d r13d r14d
..B1.506:                       # Preds ..B1.505
                                # Execution count [8.16e-03]: Infreq
..LN3746:
	.loc    1  259  is_stmt 1
        movq      %rbx, %rdi                                    #259.3
..LN3747:
#       _mm_free(void *)
        call      _mm_free                                      #259.3
..LN3748:
        jmp       ..B1.18       # Prob 100%                     #259.3
..LN3749:
                                # LOE r15 r12d r13d r14d
..B1.507:                       # Preds ..B1.478
                                # Execution count [1.84e-02]: Infreq
..LN3750:
	.loc    1  238  is_stmt 1
        xorl      %ecx, %ecx                                    #238.5
..LN3751:
        jmp       ..B1.484      # Prob 100%                     #238.5
..LN3752:
                                # LOE rbx r11 r12 r15 ecx esi r13d r14d xmm0
..B1.508:                       # Preds ..B1.459
                                # Execution count [7.34e-04]: Infreq
..LN3753:
	.loc    1  219  is_stmt 1
        xorl      %edx, %edx                                    #219.3
..LN3754:
        jmp       ..B1.469      # Prob 100%                     #219.3
..LN3755:
                                # LOE rbx r15 edx r12d r13d
..B1.509:                       # Preds ..B1.10
                                # Execution count [8.16e-03]: Infreq
..LN3756:
	.loc    1  162  is_stmt 1
        movq      %rbx, %rdi                                    #162.16
..LN3757:
        movq      %r15, %rsi                                    #162.16
..LN3758:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #162.16
..LN3759:
                                # LOE rax rbx r15 r12d r13d
..B1.732:                       # Preds ..B1.509
                                # Execution count [8.16e-03]: Infreq
..LN3760:
        movq      %rax, 16(%rsp)                                #162.16[spill]
..LN3761:
                                # LOE rbx r15 r12d r13d
..B1.510:                       # Preds ..B1.732
                                # Execution count [8.16e-03]: Infreq
..LN3762:
	.loc    1  163  is_stmt 1
        movq      %rbx, %rdi                                    #163.16
..LN3763:
        movq      %r15, %rsi                                    #163.16
..LN3764:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #163.16
..LN3765:
                                # LOE rax rbx r15 r12d r13d
..B1.733:                       # Preds ..B1.510
                                # Execution count [8.16e-03]: Infreq
..LN3766:
        movq      %rax, 32(%rsp)                                #163.16[spill]
..LN3767:
                                # LOE rbx r15 r12d r13d
..B1.511:                       # Preds ..B1.733
                                # Execution count [8.16e-03]: Infreq
..LN3768:
	.loc    1  164  is_stmt 1
        movq      %rbx, %rdi                                    #164.16
..LN3769:
        movq      %r15, %rsi                                    #164.16
..LN3770:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #164.16
..LN3771:
                                # LOE rax rbx r15 r12d r13d
..B1.734:                       # Preds ..B1.511
                                # Execution count [8.16e-03]: Infreq
..LN3772:
        movq      %rax, 24(%rsp)                                #164.16[spill]
..LN3773:
                                # LOE rbx r15 r12d r13d
..B1.512:                       # Preds ..B1.734
                                # Execution count [8.16e-03]: Infreq
..LN3774:
	.loc    1  165  is_stmt 1
        movq      %rbx, %rdi                                    #165.16
..LN3775:
        movq      %r15, %rsi                                    #165.16
..LN3776:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #165.16
..LN3777:
                                # LOE rax r15 r12d r13d
..B1.735:                       # Preds ..B1.512
                                # Execution count [8.16e-03]: Infreq
..LN3778:
        movq      %rax, %rbx                                    #165.16
..LN3779:
                                # LOE rbx r15 r12d r13d
..B1.513:                       # Preds ..B1.735
                                # Execution count [8.16e-03]: Infreq
..LN3780:
	.loc    1  167  is_stmt 1
        testl     %r13d, %r13d                                  #167.18
..LN3781:
        jle       ..B1.529      # Prob 50%                      #167.18
..LN3782:
                                # LOE rbx r15 r12d r13d
..B1.514:                       # Preds ..B1.513
                                # Execution count [7.34e-03]: Infreq
..LN3783:
        movq      %rbx, %r11                                    #167.3
..LN3784:
        andq      $63, %r11                                     #167.3
..LN3785:
        testl     %r11d, %r11d                                  #167.3
..LN3786:
        je        ..B1.517      # Prob 50%                      #167.3
..LN3787:
                                # LOE rbx r15 r11d r12d r13d
..B1.515:                       # Preds ..B1.514
                                # Execution count [7.34e-03]: Infreq
..LN3788:
        testl     $7, %r11d                                     #167.3
..LN3789:
        jne       ..B1.563      # Prob 10%                      #167.3
..LN3790:
                                # LOE rbx r15 r11d r12d r13d
..B1.516:                       # Preds ..B1.515
                                # Execution count [0.00e+00]: Infreq
..LN3791:
        negl      %r11d                                         #167.3
..LN3792:
        addl      $64, %r11d                                    #167.3
..LN3793:
        shrl      $3, %r11d                                     #167.3
..LN3794:
        cmpl      %r11d, %r13d                                  #167.3
..LN3795:
        cmovl     %r13d, %r11d                                  #167.3
..LN3796:
                                # LOE rbx r15 r11d r12d r13d
..B1.517:                       # Preds ..B1.516 ..B1.514
                                # Execution count [8.16e-03]: Infreq
..LN3797:
        movl      %r13d, %eax                                   #167.3
..LN3798:
        subl      %r11d, %eax                                   #167.3
..LN3799:
        andl      $7, %eax                                      #167.3
..LN3800:
        negl      %eax                                          #167.3
..LN3801:
        addl      %r13d, %eax                                   #167.3
..LN3802:
        cmpl      $1, %r11d                                     #167.3
..LN3803:
        jb        ..B1.521      # Prob 50%                      #167.3
..LN3804:
                                # LOE rbx r15 eax r11d r12d r13d
..B1.518:                       # Preds ..B1.517
                                # Execution count [7.34e-03]: Infreq
..LN3805:
        movl      $8, %r8d                                      #167.3
..LN3806:
        vmovd     %r11d, %xmm0                                  #167.3
..LN3807:
        vpbroadcastd %xmm0, %ymm0                               #167.3
..LN3808:
        movl      $255, %edx                                    #167.3
..LN3809:
        xorl      %r10d, %r10d                                  #167.3
..LN3810:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #167.3
..LN3811:
        vmovd     %r8d, %xmm6                                   #167.3
..LN3812:
	.loc    1  168  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #168.11
..LN3813:
	.loc    1  169  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #169.11
..LN3814:
	.loc    1  170  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #170.11
..LN3815:
	.loc    1  171  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #171.11
..LN3816:
	.loc    1  167  is_stmt 1
        kmovw     %edx, %k1                                     #167.3
..LN3817:
        vpbroadcastd %xmm6, %ymm6                               #167.3
..LN3818:
        xorl      %r8d, %r8d                                    #167.3
..LN3819:
        movslq    %r11d, %r9                                    #167.3
..LN3820:
        movq      24(%rsp), %rdx                                #167.3[spill]
..LN3821:
        movq      32(%rsp), %rcx                                #167.3[spill]
..LN3822:
        movq      16(%rsp), %rsi                                #167.3[spill]
..LN3823:
                                # LOE rdx rcx rbx rsi r8 r9 r10 r15 eax r11d r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.519:                       # Preds ..B1.519 ..B1.518
                                # Execution count [4.08e-02]: Infreq
..LN3824:
        addq      $8, %r10                                      #167.3
..LN3825:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #167.3
..LN3826:
        vpaddd    %ymm6, %ymm5, %ymm5                           #167.3
..LN3827:
	.loc    1  168  is_stmt 1
        vmovupd   %zmm4, (%r8,%rsi){%k2}                        #168.4
..LN3828:
	.loc    1  169  is_stmt 1
        vmovupd   %zmm3, (%r8,%rcx){%k2}                        #169.4
..LN3829:
	.loc    1  170  is_stmt 1
        vmovupd   %zmm2, (%r8,%rdx){%k2}                        #170.4
..LN3830:
	.loc    1  171  is_stmt 1
        vmovupd   %zmm1, (%r8,%rbx){%k2}                        #171.4
..LN3831:
	.loc    1  167  is_stmt 1
        addq      $64, %r8                                      #167.3
..LN3832:
        cmpq      %r9, %r10                                     #167.3
..LN3833:
        jb        ..B1.519      # Prob 81%                      #167.3
..LN3834:
                                # LOE rdx rcx rbx rsi r8 r9 r10 r15 eax r11d r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.520:                       # Preds ..B1.519
                                # Execution count [7.34e-03]: Infreq
..LN3835:
        cmpl      %r11d, %r13d                                  #167.3
..LN3836:
        je        ..B1.529      # Prob 10%                      #167.3
..LN3837:
                                # LOE rbx r15 eax r11d r12d r13d
..B1.521:                       # Preds ..B1.517 ..B1.520
                                # Execution count [0.00e+00]: Infreq
..LN3838:
        lea       8(%r11), %r8d                                 #167.3
..LN3839:
        cmpl      %r8d, %eax                                    #167.3
..LN3840:
        jl        ..B1.525      # Prob 50%                      #167.3
..LN3841:
                                # LOE rbx r15 eax r11d r12d r13d
..B1.522:                       # Preds ..B1.521
                                # Execution count [7.34e-03]: Infreq
..LN3842:
        movslq    %r11d, %r11                                   #167.3
..LN3843:
	.loc    1  168  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #168.11
..LN3844:
	.loc    1  169  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #169.11
..LN3845:
	.loc    1  170  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #170.11
..LN3846:
	.loc    1  171  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm0             #171.11
..LN3847:
	.loc    1  167  is_stmt 1
        movslq    %eax, %r8                                     #167.3
..LN3848:
        movq      24(%rsp), %r9                                 #167.3[spill]
..LN3849:
        movq      32(%rsp), %r10                                #167.3[spill]
..LN3850:
        movq      16(%rsp), %rdx                                #167.3[spill]
..LN3851:
                                # LOE rdx rbx r8 r9 r10 r11 r15 eax r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.523:                       # Preds ..B1.523 ..B1.522
                                # Execution count [4.08e-02]: Infreq
..LN3852:
	.loc    1  168  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r11,8)                          #168.4
..LN3853:
	.loc    1  169  is_stmt 1
        vmovupd   %zmm2, (%r10,%r11,8)                          #169.4
..LN3854:
	.loc    1  170  is_stmt 1
        vmovupd   %zmm1, (%r9,%r11,8)                           #170.4
..LN3855:
	.loc    1  171  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r11,8)                          #171.4
..LN3856:
	.loc    1  167  is_stmt 1
        addq      $8, %r11                                      #167.3
..LN3857:
        cmpq      %r8, %r11                                     #167.3
..LN3858:
        jb        ..B1.523      # Prob 81%                      #167.3
..LN3859:
                                # LOE rdx rbx r8 r9 r10 r11 r15 eax r12d r13d zmm0 zmm1 zmm2 zmm3
..B1.525:                       # Preds ..B1.523 ..B1.521 ..B1.563
                                # Execution count [8.16e-03]: Infreq
..LN3860:
        lea       1(%rax), %r8d                                 #167.3
..LN3861:
        cmpl      %r13d, %r8d                                   #167.3
..LN3862:
        ja        ..B1.529      # Prob 50%                      #167.3
..LN3863:
                                # LOE rbx r15 eax r12d r13d
..B1.526:                       # Preds ..B1.525
                                # Execution count [7.34e-03]: Infreq
..LN3864:
        movslq    %eax, %rsi                                    #167.3
..LN3865:
        negl      %eax                                          #167.3
..LN3866:
        addl      %r13d, %eax                                   #167.3
..LN3867:
        movl      $8, %r8d                                      #167.3
..LN3868:
	.loc    1  170  is_stmt 1
        movq      24(%rsp), %r11                                #170.4[spill]
..LN3869:
	.loc    1  167  is_stmt 1
        movl      $255, %edx                                    #167.3
..LN3870:
	.loc    1  169  is_stmt 1
        movq      32(%rsp), %r9                                 #169.4[spill]
..LN3871:
	.loc    1  168  is_stmt 1
        movq      16(%rsp), %r10                                #168.4[spill]
..LN3872:
	.loc    1  167  is_stmt 1
        vmovd     %eax, %xmm0                                   #167.3
..LN3873:
        vmovd     %r8d, %xmm6                                   #167.3
..LN3874:
        vpbroadcastd %xmm0, %ymm0                               #167.3
..LN3875:
        xorl      %r8d, %r8d                                    #167.3
..LN3876:
        movq      112(%rsp), %rax                               #167.3[spill]
..LN3877:
	.loc    1  170  is_stmt 1
        lea       (%r11,%rsi,8), %rcx                           #170.4
..LN3878:
	.loc    1  167  is_stmt 1
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm5             #167.3
..LN3879:
        subq      %rsi, %rax                                    #167.3
..LN3880:
	.loc    1  168  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm4             #168.11
..LN3881:
	.loc    1  169  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm3             #169.11
..LN3882:
	.loc    1  170  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm2             #170.11
..LN3883:
	.loc    1  171  is_stmt 1
        vmovups   .L_2il0floatpacket.8(%rip), %zmm1             #171.11
..LN3884:
	.loc    1  167  is_stmt 1
        kmovw     %edx, %k1                                     #167.3
..LN3885:
        vpbroadcastd %xmm6, %ymm6                               #167.3
..LN3886:
	.loc    1  171  is_stmt 1
        lea       (%rbx,%rsi,8), %rdx                           #171.4
..LN3887:
	.loc    1  169  is_stmt 1
        lea       (%r9,%rsi,8), %r11                            #169.4
..LN3888:
	.loc    1  167  is_stmt 1
        xorl      %r9d, %r9d                                    #167.3
..LN3889:
	.loc    1  168  is_stmt 1
        lea       (%r10,%rsi,8), %r10                           #168.4
..LN3890:
                                # LOE rax rdx rcx rbx r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.527:                       # Preds ..B1.527 ..B1.526
                                # Execution count [4.08e-02]: Infreq
..LN3891:
	.loc    1  167  is_stmt 1
        addq      $8, %r8                                       #167.3
..LN3892:
        vpcmpgtd  %zmm5, %zmm0, %k2{%k1}                        #167.3
..LN3893:
        vpaddd    %ymm6, %ymm5, %ymm5                           #167.3
..LN3894:
	.loc    1  168  is_stmt 1
        vmovupd   %zmm4, (%r9,%r10){%k2}                        #168.4
..LN3895:
	.loc    1  169  is_stmt 1
        vmovupd   %zmm3, (%r9,%r11){%k2}                        #169.4
..LN3896:
	.loc    1  170  is_stmt 1
        vmovupd   %zmm2, (%r9,%rcx){%k2}                        #170.4
..LN3897:
	.loc    1  171  is_stmt 1
        vmovupd   %zmm1, (%r9,%rdx){%k2}                        #171.4
..LN3898:
	.loc    1  167  is_stmt 1
        addq      $64, %r9                                      #167.3
..LN3899:
        cmpq      %rax, %r8                                     #167.3
..LN3900:
        jb        ..B1.527      # Prob 81%                      #167.3
..LN3901:
                                # LOE rax rdx rcx rbx r8 r9 r10 r11 r15 r12d r13d ymm5 ymm6 zmm0 zmm1 zmm2 zmm3 zmm4 k1
..B1.529:                       # Preds ..B1.527 ..B1.513 ..B1.520 ..B1.525
                                # Execution count [8.16e-03]: Infreq
..LN3902:
	.loc    1  176  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #176.3
..LN3903:
	.loc    1  174  is_stmt 1
        movl      $1, %r14d                                     #174.3
..LN3904:
	.loc    1  176  is_stmt 1
        vzeroupper                                              #176.3
..___tag_value_main.99:
..LN3905:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #176.3
..___tag_value_main.100:
..LN3906:
                                # LOE rbx r15 r12d r13d r14d
..B1.530:                       # Preds ..B1.529
                                # Execution count [8.16e-03]: Infreq
..LN3907:
	.loc    1  178  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #178.11
..LN3908:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #178.24
..LN3909:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #178.15
..LN3910:
        vcomisd   %xmm1, %xmm0                                  #178.24
..LN3911:
        jbe       ..B1.556      # Prob 10%                      #178.24
..LN3912:
                                # LOE rbx r15 r12d r13d r14d
..B1.531:                       # Preds ..B1.530
                                # Execution count [7.34e-03]: Infreq
..LN3913:
	.loc    1  185  is_stmt 1
        movl      $8, %r9d                                      #185.5
..LN3914:
        movl      %r13d, %r8d                                   #185.5
..LN3915:
        andl      $-64, %r8d                                    #185.5
..LN3916:
	.loc    1  180  is_stmt 1
        lea       56(%rsp), %rdi                                #180.4
..LN3917:
	.loc    1  185  is_stmt 1
        movl      %r8d, 72(%rdi)                                #185.5[spill]
..LN3918:
	.loc    1  180  is_stmt 1
        lea       40(%rsp), %rsi                                #180.4
..LN3919:
	.loc    1  185  is_stmt 1
        movslq    %r8d, %r8                                     #185.5
..LN3920:
        vmovd     %r9d, %xmm0                                   #185.5
..LN3921:
        vpbroadcastd %xmm0, %ymm1                               #185.5
..LN3922:
        vmovdqu   %ymm1, 24(%rsi)                               #185.5[spill]
..LN3923:
        movq      %r8, 80(%rsi)                                 #185.5[spill]
..LN3924:
	.loc    1  180  is_stmt 1
        vzeroupper                                              #180.4
..___tag_value_main.101:
..LN3925:
#       timing(double *, double *)
        call      timing                                        #180.4
..___tag_value_main.102:
..LN3926:
                                # LOE rbx r15 r12d r13d r14d
..B1.532:                       # Preds ..B1.531
                                # Execution count [6.61e-03]: Infreq
..LN3927:
	.loc    1  181  is_stmt 1
        xorl      %eax, %eax                                    #181.4
..LN3928:
        movq      %rbx, %rdx                                    #181.4
..LN3929:
        movl      %r14d, 184(%rsp)                              #181.4[spill]
..LN3930:
        movl      %eax, %ebx                                    #181.4
..LN3931:
        movl      %r12d, (%rsp)                                 #181.4[spill]
..LN3932:
        vxorpd    %xmm0, %xmm0, %xmm0                           #181.4
..LN3933:
        movq      %r15, 8(%rsp)                                 #181.4[spill]
..LN3934:
        movq      24(%rsp), %r12                                #181.4[spill]
..LN3935:
        movq      32(%rsp), %r14                                #181.4[spill]
..LN3936:
        movq      16(%rsp), %r15                                #181.4[spill]
..LN3937:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.533:                       # Preds ..B1.532 ..B1.548 ..B1.554
                                # Execution count [2.04e-01]: Infreq
..LN3938:
	.loc    1  185  is_stmt 1
        xorl      %edi, %edi                                    #185.9
..LN3939:
        testl     %r13d, %r13d                                  #185.20
..LN3940:
        jle       ..B1.546      # Prob 50%                      #185.20
..LN3941:
                                # LOE rdx r12 r14 r15 ebx edi r13d xmm0
..B1.534:                       # Preds ..B1.533
                                # Execution count [1.84e-01]: Infreq
..LN3942:
        cmpl      $64, %r13d                                    #185.5
..LN3943:
        jl        ..B1.562      # Prob 10%                      #185.5
..LN3944:
                                # LOE rdx r12 r14 r15 ebx edi r13d xmm0
..B1.535:                       # Preds ..B1.534
                                # Execution count [1.84e-01]: Infreq
..LN3945:
        movl      128(%rsp), %esi                               #185.5[spill]
..LN3946:
                                # LOE rdx r12 r14 r15 ebx esi r13d xmm0
..B1.537:                       # Preds ..B1.535
                                # Execution count [1.84e-01]: Infreq
..LN3947:
        movq      120(%rsp), %rdi                               #185.5[spill]
..LN3948:
        xorl      %ecx, %ecx                                    #185.5
..LN3949:
                                # LOE rdx rcx rdi r12 r14 r15 ebx esi r13d xmm0
..B1.538:                       # Preds ..B1.538 ..B1.537
                                # Execution count [1.02e+00]: Infreq
..LN3950:
	.loc    1  186  is_stmt 1
        vmovups   (%r14,%rcx,8), %zmm1                          #186.13
..LN3951:
        vmovups   64(%r14,%rcx,8), %zmm2                        #186.13
..LN3952:
        vaddpd    (%r12,%rcx,8), %zmm1, %zmm3                   #186.20
..LN3953:
        vaddpd    64(%r12,%rcx,8), %zmm2, %zmm4                 #186.20
..LN3954:
        vaddpd    (%rdx,%rcx,8), %zmm3, %zmm5                   #186.27
..LN3955:
        vaddpd    64(%rdx,%rcx,8), %zmm4, %zmm6                 #186.27
..LN3956:
        vmovntpd  %zmm5, (%r15,%rcx,8)                          #186.6
..LN3957:
        vmovntpd  %zmm6, 64(%r15,%rcx,8)                        #186.6
..LN3958:
        vmovups   128(%r14,%rcx,8), %zmm7                       #186.13
..LN3959:
        vmovups   192(%r14,%rcx,8), %zmm8                       #186.13
..LN3960:
        vaddpd    128(%r12,%rcx,8), %zmm7, %zmm9                #186.20
..LN3961:
        vaddpd    192(%r12,%rcx,8), %zmm8, %zmm10               #186.20
..LN3962:
        vaddpd    128(%rdx,%rcx,8), %zmm9, %zmm11               #186.27
..LN3963:
        vaddpd    192(%rdx,%rcx,8), %zmm10, %zmm12              #186.27
..LN3964:
        vmovntpd  %zmm11, 128(%r15,%rcx,8)                      #186.6
..LN3965:
        vmovntpd  %zmm12, 192(%r15,%rcx,8)                      #186.6
..LN3966:
        vmovups   256(%r14,%rcx,8), %zmm13                      #186.13
..LN3967:
        vmovups   320(%r14,%rcx,8), %zmm14                      #186.13
..LN3968:
        vaddpd    256(%r12,%rcx,8), %zmm13, %zmm15              #186.20
..LN3969:
        vaddpd    320(%r12,%rcx,8), %zmm14, %zmm16              #186.20
..LN3970:
        vaddpd    256(%rdx,%rcx,8), %zmm15, %zmm17              #186.27
..LN3971:
        vaddpd    320(%rdx,%rcx,8), %zmm16, %zmm18              #186.27
..LN3972:
        vmovntpd  %zmm17, 256(%r15,%rcx,8)                      #186.6
..LN3973:
        vmovntpd  %zmm18, 320(%r15,%rcx,8)                      #186.6
..LN3974:
        vmovups   384(%r14,%rcx,8), %zmm19                      #186.13
..LN3975:
        vmovups   448(%r14,%rcx,8), %zmm20                      #186.13
..LN3976:
        vaddpd    384(%r12,%rcx,8), %zmm19, %zmm21              #186.20
..LN3977:
        vaddpd    448(%r12,%rcx,8), %zmm20, %zmm22              #186.20
..LN3978:
        vaddpd    384(%rdx,%rcx,8), %zmm21, %zmm23              #186.27
..LN3979:
        vaddpd    448(%rdx,%rcx,8), %zmm22, %zmm24              #186.27
..LN3980:
        vmovntpd  %zmm23, 384(%r15,%rcx,8)                      #186.6
..LN3981:
        vmovntpd  %zmm24, 448(%r15,%rcx,8)                      #186.6
..LN3982:
	.loc    1  185  is_stmt 1
        addq      $64, %rcx                                     #185.5
..LN3983:
        cmpq      %rdi, %rcx                                    #185.5
..LN3984:
        jb        ..B1.538      # Prob 82%                      #185.5
..LN3985:
                                # LOE rdx rcx rdi r12 r14 r15 ebx esi r13d xmm0
..B1.539:                       # Preds ..B1.538
                                # Execution count [1.84e-01]: Infreq
..LN3986:
        movl      %esi, %edi                                    #185.36
..LN3987:
                                # LOE rdx r12 r14 r15 ebx esi edi r13d xmm0
..B1.540:                       # Preds ..B1.539 ..B1.562
                                # Execution count [2.04e-01]: Infreq
..LN3988:
        lea       1(%rsi), %ecx                                 #185.5
..LN3989:
        cmpl      %r13d, %ecx                                   #185.5
..LN3990:
        ja        ..B1.546      # Prob 50%                      #185.5
..LN3991:
                                # LOE rdx r12 r14 r15 ebx esi edi r13d xmm0
..B1.541:                       # Preds ..B1.540
                                # Execution count [1.84e-01]: Infreq
..LN3992:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #185.5
..LN3993:
                                # LOE rdx r12 r14 r15 ebx esi r13d xmm0 ymm2
..B1.543:                       # Preds ..B1.541
                                # Execution count [1.84e-01]: Infreq
..LN3994:
        movslq    %esi, %rcx                                    #185.5
..LN3995:
        negl      %esi                                          #185.5
..LN3996:
        addl      %r13d, %esi                                   #185.5
..LN3997:
        movl      $255, %eax                                    #185.5
..LN3998:
        kmovw     %eax, %k1                                     #185.5
..LN3999:
        xorl      %eax, %eax                                    #185.5
..LN4000:
        vmovdqu   64(%rsp), %ymm6                               #185.5[spill]
..LN4001:
        vmovd     %esi, %xmm1                                   #185.5
..LN4002:
        vpbroadcastd %xmm1, %ymm1                               #185.5
..LN4003:
	.loc    1  186  is_stmt 1
        lea       (%r15,%rcx,8), %r9                            #186.6
..LN4004:
	.loc    1  185  is_stmt 1
        movq      112(%rsp), %r10                               #185.5[spill]
..LN4005:
	.loc    1  186  is_stmt 1
        lea       (%rdx,%rcx,8), %r8                            #186.27
..LN4006:
	.loc    1  185  is_stmt 1
        subq      %rcx, %r10                                    #185.5
..LN4007:
	.loc    1  186  is_stmt 1
        lea       (%r12,%rcx,8), %rdi                           #186.20
..LN4008:
        lea       (%r14,%rcx,8), %rsi                           #186.13
..LN4009:
	.loc    1  185  is_stmt 1
        xorl      %ecx, %ecx                                    #185.5
..LN4010:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r12 r14 r15 ebx r13d xmm0 ymm2 ymm6 zmm1 k1
..B1.544:                       # Preds ..B1.544 ..B1.543
                                # Execution count [1.02e+00]: Infreq
..LN4011:
	.loc    1  186  is_stmt 1
        vmovups   (%rcx,%rsi), %zmm3                            #186.13
..LN4012:
	.loc    1  185  is_stmt 1
        addq      $8, %rax                                      #185.5
..LN4013:
	.loc    1  186  is_stmt 1
        vaddpd    (%rcx,%rdi), %zmm3, %zmm4                     #186.20
..LN4014:
        vaddpd    (%rcx,%r8), %zmm4, %zmm5                      #186.27
..LN4015:
	.loc    1  185  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #185.5
..LN4016:
        vpaddd    %ymm6, %ymm2, %ymm2                           #185.5
..LN4017:
	.loc    1  186  is_stmt 1
        vmovupd   %zmm5, (%rcx,%r9){%k2}                        #186.6
..LN4018:
	.loc    1  185  is_stmt 1
        addq      $64, %rcx                                     #185.5
..LN4019:
        cmpq      %r10, %rax                                    #185.5
..LN4020:
        jb        ..B1.544      # Prob 82%                      #185.5
..LN4021:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r12 r14 r15 ebx r13d xmm0 ymm2 ymm6 zmm1 k1
..B1.545:                       # Preds ..B1.544
                                # Execution count [1.84e-01]: Infreq
..LN4022:
        movl      %r13d, %edi                                   #185.36
..LN4023:
                                # LOE rdx r12 r14 r15 ebx edi r13d xmm0
..B1.546:                       # Preds ..B1.545 ..B1.540 ..B1.533
                                # Execution count [2.04e-01]: Infreq
..LN4024:
	.loc    1  188  is_stmt 1
        movslq    %edi, %rdi                                    #188.8
..LN4025:
        vcomisd   (%r15,%rdi,8), %xmm0                          #188.13
..LN4026:
        jbe       ..B1.548      # Prob 78%                      #188.13
..LN4027:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.547:                       # Preds ..B1.546
                                # Execution count [4.49e-02]: Infreq
..LN4028:
        movl      $il0_peep_printf_format_7, %edi               #188.16
..LN4029:
        movq      %rdx, 48(%rsp)                                #188.16[spill]
..LN4030:
        vzeroupper                                              #188.16
..LN4031:
        call      puts                                          #188.16
..LN4032:
                                # LOE r12 r14 r15 ebx r13d
..B1.743:                       # Preds ..B1.547
                                # Execution count [4.49e-02]: Infreq
..LN4033:
        movq      48(%rsp), %rdx                                #[spill]
..LN4034:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4035:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.548:                       # Preds ..B1.546 ..B1.743
                                # Execution count [2.04e-01]: Infreq
..LN4036:
	.loc    1  181  is_stmt 1
        incl      %ebx                                          #181.4
..LN4037:
        cmpl      184(%rsp), %ebx                               #181.4[spill]
..LN4038:
        jb        ..B1.533      # Prob 81%                      #181.4
..LN4039:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.549:                       # Preds ..B1.548
                                # Execution count [3.74e-02]: Infreq
..LN4040:
        movl      %r13d, 192(%rsp)                              #[spill]
..LN4041:
        movq      %rdx, %rbx                                    #
..LN4042:
        movq      %r12, %r13                                    #
..LN4043:
        movq      %r14, %r12                                    #
..LN4044:
        movl      184(%rsp), %r14d                              #[spill]
..LN4045:
                                # LOE rbx r12 r13 r15 r14d
..B1.550:                       # Preds ..B1.553 ..B1.549
                                # Execution count [4.08e-02]: Infreq
..LN4046:
	.loc    1  191  is_stmt 1
        vzeroupper                                              #191.4
..LN4047:
        lea       96(%rsp), %rdi                                #191.4
..LN4048:
        lea       40(%rsp), %rsi                                #191.4
..___tag_value_main.103:
..LN4049:
#       timing(double *, double *)
        call      timing                                        #191.4
..___tag_value_main.104:
..LN4050:
                                # LOE rbx r12 r13 r15 r14d
..B1.551:                       # Preds ..B1.550
                                # Execution count [4.08e-02]: Infreq
..LN4051:
	.loc    1  178  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #178.11
..LN4052:
	.loc    1  192  is_stmt 1
        addl      %r14d, %r14d                                  #192.4
..LN4053:
	.loc    1  178  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #178.24
..LN4054:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #178.15
..LN4055:
        vcomisd   %xmm1, %xmm0                                  #178.24
..LN4056:
        jbe       ..B1.555      # Prob 18%                      #178.24
..LN4057:
                                # LOE rbx r12 r13 r15 r14d
..B1.552:                       # Preds ..B1.551
                                # Execution count [3.34e-02]: Infreq
..LN4058:
	.loc    1  180  is_stmt 1
        lea       56(%rsp), %rdi                                #180.4
..LN4059:
        lea       40(%rsp), %rsi                                #180.4
..___tag_value_main.105:
..LN4060:
#       timing(double *, double *)
        call      timing                                        #180.4
..___tag_value_main.106:
..LN4061:
                                # LOE rbx r12 r13 r15 r14d
..B1.553:                       # Preds ..B1.552
                                # Execution count [3.34e-02]: Infreq
..LN4062:
	.loc    1  181  is_stmt 1
        xorl      %eax, %eax                                    #181.4
..LN4063:
        testl     %r14d, %r14d                                  #181.19
..LN4064:
        jle       ..B1.550      # Prob 9%                       #181.19
..LN4065:
                                # LOE rbx r12 r13 r15 eax r14d
..B1.554:                       # Preds ..B1.553
                                # Execution count [3.01e-02]: Infreq
..LN4066:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN4067:
        movq      %rbx, %rdx                                    #
..LN4068:
        movl      %eax, %ebx                                    #
..LN4069:
        movq      %r12, %r14                                    #
..LN4070:
        movq      %r13, %r12                                    #
..LN4071:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4072:
        movl      192(%rsp), %r13d                              #[spill]
..LN4073:
        jmp       ..B1.533      # Prob 100%                     #
..LN4074:
                                # LOE rdx r12 r14 r15 ebx r13d xmm0
..B1.555:                       # Preds ..B1.551
                                # Execution count [7.34e-03]: Infreq
..LN4075:
        movq      %r13, 24(%rsp)                                #[spill]
..LN4076:
        movq      %r12, 32(%rsp)                                #[spill]
..LN4077:
        movq      %r15, 16(%rsp)                                #[spill]
..LN4078:
        movl      (%rsp), %r12d                                 #[spill]
..LN4079:
        movq      8(%rsp), %r15                                 #[spill]
..LN4080:
        movl      192(%rsp), %r13d                              #[spill]
..LN4081:
                                # LOE rbx r15 r12d r13d r14d
..B1.556:                       # Preds ..B1.555 ..B1.530
                                # Execution count [8.16e-03]: Infreq
..LN4082:
	.loc    1  195  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #195.3
..___tag_value_main.107:
..LN4083:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #195.3
..___tag_value_main.108:
..LN4084:
                                # LOE rbx r15 r12d r13d r14d
..B1.557:                       # Preds ..B1.556
                                # Execution count [8.16e-03]: Infreq
..LN4085:
	.loc    1  197  is_stmt 1
        movl      %r14d, %r8d                                   #197.3
..LN4086:
        shrl      $31, %r8d                                     #197.3
..LN4087:
        addl      %r8d, %r14d                                   #197.3
..LN4088:
        sarl      $1, %r14d                                     #197.3
..___tag_value_main.109:
..LN4089:
	.loc    1  200  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #200.3
..___tag_value_main.110:
..LN4090:
                                # LOE rbx r15 r12d r13d r14d
..B1.558:                       # Preds ..B1.557
                                # Execution count [8.16e-03]: Infreq
..LN4091:
	.loc    1  202  is_stmt 1
        movq      16(%rsp), %rdi                                #202.3[spill]
..LN4092:
#       _mm_free(void *)
        call      _mm_free                                      #202.3
..LN4093:
                                # LOE rbx r15 r12d r13d r14d
..B1.559:                       # Preds ..B1.558
                                # Execution count [8.16e-03]: Infreq
..LN4094:
	.loc    1  203  is_stmt 1
        movq      32(%rsp), %rdi                                #203.3[spill]
..LN4095:
#       _mm_free(void *)
        call      _mm_free                                      #203.3
..LN4096:
                                # LOE rbx r15 r12d r13d r14d
..B1.560:                       # Preds ..B1.559
                                # Execution count [8.16e-03]: Infreq
..LN4097:
	.loc    1  204  is_stmt 1
        movq      24(%rsp), %rdi                                #204.3[spill]
..LN4098:
#       _mm_free(void *)
        call      _mm_free                                      #204.3
..LN4099:
                                # LOE rbx r15 r12d r13d r14d
..B1.561:                       # Preds ..B1.560
                                # Execution count [8.16e-03]: Infreq
..LN4100:
	.loc    1  205  is_stmt 1
        movq      %rbx, %rdi                                    #205.3
..LN4101:
#       _mm_free(void *)
        call      _mm_free                                      #205.3
..LN4102:
        jmp       ..B1.18       # Prob 100%                     #205.3
..LN4103:
                                # LOE r15 r12d r13d r14d
..B1.562:                       # Preds ..B1.534
                                # Execution count [1.84e-02]: Infreq
..LN4104:
	.loc    1  185  is_stmt 1
        xorl      %esi, %esi                                    #185.5
..LN4105:
        jmp       ..B1.540      # Prob 100%                     #185.5
..LN4106:
                                # LOE rdx r12 r14 r15 ebx esi edi r13d xmm0
..B1.563:                       # Preds ..B1.515
                                # Execution count [7.34e-04]: Infreq
..LN4107:
	.loc    1  167  is_stmt 1
        xorl      %eax, %eax                                    #167.3
..LN4108:
        jmp       ..B1.525      # Prob 100%                     #167.3
..LN4109:
                                # LOE rbx r15 eax r12d r13d
..B1.564:                       # Preds ..B1.9
                                # Execution count [8.16e-03]: Infreq
..LN4110:
	.loc    1  114  is_stmt 1
        movq      %rbx, %rdi                                    #114.16
..LN4111:
        movq      %r15, %rsi                                    #114.16
..LN4112:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #114.16
..LN4113:
                                # LOE rax rbx r15 r12d r13d
..B1.736:                       # Preds ..B1.564
                                # Execution count [8.16e-03]: Infreq
..LN4114:
        movq      %rax, 16(%rsp)                                #114.16[spill]
..LN4115:
                                # LOE rbx r15 r12d r13d
..B1.565:                       # Preds ..B1.736
                                # Execution count [8.16e-03]: Infreq
..LN4116:
	.loc    1  115  is_stmt 1
        movq      %rbx, %rdi                                    #115.16
..LN4117:
        movq      %r15, %rsi                                    #115.16
..LN4118:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #115.16
..LN4119:
                                # LOE rax rbx r15 r12d r13d
..B1.737:                       # Preds ..B1.565
                                # Execution count [8.16e-03]: Infreq
..LN4120:
        movq      %rax, 24(%rsp)                                #115.16[spill]
..LN4121:
                                # LOE rbx r15 r12d r13d
..B1.566:                       # Preds ..B1.737
                                # Execution count [8.16e-03]: Infreq
..LN4122:
	.loc    1  116  is_stmt 1
        movq      %rbx, %rdi                                    #116.16
..LN4123:
        movq      %r15, %rsi                                    #116.16
..LN4124:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #116.16
..LN4125:
                                # LOE rax r15 r12d r13d
..B1.738:                       # Preds ..B1.566
                                # Execution count [8.16e-03]: Infreq
..LN4126:
        movq      %rax, %rbx                                    #116.16
..LN4127:
                                # LOE rbx r15 r12d r13d
..B1.567:                       # Preds ..B1.738
                                # Execution count [8.16e-03]: Infreq
..LN4128:
	.loc    1  118  is_stmt 1
        testl     %r13d, %r13d                                  #118.18
..LN4129:
        jle       ..B1.583      # Prob 50%                      #118.18
..LN4130:
                                # LOE rbx r15 r12d r13d
..B1.568:                       # Preds ..B1.567
                                # Execution count [7.34e-03]: Infreq
..LN4131:
        movq      %rbx, %r10                                    #118.3
..LN4132:
        andq      $63, %r10                                     #118.3
..LN4133:
        testl     %r10d, %r10d                                  #118.3
..LN4134:
        je        ..B1.571      # Prob 50%                      #118.3
..LN4135:
                                # LOE rbx r15 r10d r12d r13d
..B1.569:                       # Preds ..B1.568
                                # Execution count [7.34e-03]: Infreq
..LN4136:
        testl     $7, %r10d                                     #118.3
..LN4137:
        jne       ..B1.616      # Prob 10%                      #118.3
..LN4138:
                                # LOE rbx r15 r10d r12d r13d
..B1.570:                       # Preds ..B1.569
                                # Execution count [0.00e+00]: Infreq
..LN4139:
        negl      %r10d                                         #118.3
..LN4140:
        addl      $64, %r10d                                    #118.3
..LN4141:
        shrl      $3, %r10d                                     #118.3
..LN4142:
        cmpl      %r10d, %r13d                                  #118.3
..LN4143:
        cmovl     %r13d, %r10d                                  #118.3
..LN4144:
                                # LOE rbx r15 r10d r12d r13d
..B1.571:                       # Preds ..B1.570 ..B1.568
                                # Execution count [8.16e-03]: Infreq
..LN4145:
        movl      %r13d, %eax                                   #118.3
..LN4146:
        subl      %r10d, %eax                                   #118.3
..LN4147:
        andl      $7, %eax                                      #118.3
..LN4148:
        negl      %eax                                          #118.3
..LN4149:
        addl      %r13d, %eax                                   #118.3
..LN4150:
        cmpl      $1, %r10d                                     #118.3
..LN4151:
        jb        ..B1.575      # Prob 50%                      #118.3
..LN4152:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.572:                       # Preds ..B1.571
                                # Execution count [7.34e-03]: Infreq
..LN4153:
        movl      $255, %edx                                    #118.3
..LN4154:
        vmovd     %r10d, %xmm0                                  #118.3
..LN4155:
        kmovw     %edx, %k1                                     #118.3
..LN4156:
        movl      $8, %edx                                      #118.3
..LN4157:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #118.3
..LN4158:
	.loc    1  119  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #119.11
..LN4159:
	.loc    1  120  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #120.11
..LN4160:
	.loc    1  118  is_stmt 1
        vmovd     %edx, %xmm5                                   #118.3
..LN4161:
	.loc    1  121  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #121.11
..LN4162:
	.loc    1  118  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #118.3
..LN4163:
        xorl      %r9d, %r9d                                    #118.3
..LN4164:
        vpbroadcastd %xmm5, %ymm5                               #118.3
..LN4165:
        xorl      %edx, %edx                                    #118.3
..LN4166:
        movslq    %r10d, %r8                                    #118.3
..LN4167:
        movq      24(%rsp), %r11                                #118.3[spill]
..LN4168:
        movq      16(%rsp), %rcx                                #118.3[spill]
..LN4169:
                                # LOE rdx rcx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.573:                       # Preds ..B1.573 ..B1.572
                                # Execution count [4.08e-02]: Infreq
..LN4170:
        addq      $8, %r9                                       #118.3
..LN4171:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #118.3
..LN4172:
        vpaddd    %ymm5, %ymm4, %ymm4                           #118.3
..LN4173:
	.loc    1  119  is_stmt 1
        vmovupd   %zmm3, (%rdx,%rcx){%k2}                       #119.4
..LN4174:
	.loc    1  120  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r11){%k2}                       #120.4
..LN4175:
	.loc    1  121  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rbx){%k2}                       #121.4
..LN4176:
	.loc    1  118  is_stmt 1
        addq      $64, %rdx                                     #118.3
..LN4177:
        cmpq      %r8, %r9                                      #118.3
..LN4178:
        jb        ..B1.573      # Prob 81%                      #118.3
..LN4179:
                                # LOE rdx rcx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.574:                       # Preds ..B1.573
                                # Execution count [7.34e-03]: Infreq
..LN4180:
        cmpl      %r10d, %r13d                                  #118.3
..LN4181:
        je        ..B1.583      # Prob 10%                      #118.3
..LN4182:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.575:                       # Preds ..B1.574 ..B1.571
                                # Execution count [0.00e+00]: Infreq
..LN4183:
        lea       8(%r10), %edx                                 #118.3
..LN4184:
        cmpl      %edx, %eax                                    #118.3
..LN4185:
        jl        ..B1.579      # Prob 50%                      #118.3
..LN4186:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.576:                       # Preds ..B1.575
                                # Execution count [7.34e-03]: Infreq
..LN4187:
        movslq    %r10d, %r10                                   #118.3
..LN4188:
	.loc    1  119  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #119.11
..LN4189:
	.loc    1  120  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #120.11
..LN4190:
	.loc    1  121  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm0             #121.11
..LN4191:
	.loc    1  118  is_stmt 1
        movslq    %eax, %rdx                                    #118.3
..LN4192:
        movq      24(%rsp), %r8                                 #118.3[spill]
..LN4193:
        movq      16(%rsp), %r9                                 #118.3[spill]
..LN4194:
                                # LOE rdx rbx r8 r9 r10 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.577:                       # Preds ..B1.577 ..B1.576
                                # Execution count [4.08e-02]: Infreq
..LN4195:
	.loc    1  119  is_stmt 1
        vmovupd   %zmm2, (%r9,%r10,8)                           #119.4
..LN4196:
	.loc    1  120  is_stmt 1
        vmovupd   %zmm1, (%r8,%r10,8)                           #120.4
..LN4197:
	.loc    1  121  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r10,8)                          #121.4
..LN4198:
	.loc    1  118  is_stmt 1
        addq      $8, %r10                                      #118.3
..LN4199:
        cmpq      %rdx, %r10                                    #118.3
..LN4200:
        jb        ..B1.577      # Prob 81%                      #118.3
..LN4201:
                                # LOE rdx rbx r8 r9 r10 r15 eax r12d r13d zmm0 zmm1 zmm2
..B1.579:                       # Preds ..B1.577 ..B1.575 ..B1.616
                                # Execution count [8.16e-03]: Infreq
..LN4202:
        lea       1(%rax), %edx                                 #118.3
..LN4203:
        cmpl      %r13d, %edx                                   #118.3
..LN4204:
        ja        ..B1.583      # Prob 50%                      #118.3
..LN4205:
                                # LOE rbx r15 eax r12d r13d
..B1.580:                       # Preds ..B1.579
                                # Execution count [7.34e-03]: Infreq
..LN4206:
        movslq    %eax, %rcx                                    #118.3
..LN4207:
        negl      %eax                                          #118.3
..LN4208:
        addl      %r13d, %eax                                   #118.3
..LN4209:
        movl      $8, %r9d                                      #118.3
..LN4210:
        movl      $255, %edx                                    #118.3
..LN4211:
        xorl      %r11d, %r11d                                  #118.3
..LN4212:
        kmovw     %edx, %k1                                     #118.3
..LN4213:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm4             #118.3
..LN4214:
        vmovd     %eax, %xmm0                                   #118.3
..LN4215:
        vmovd     %r9d, %xmm5                                   #118.3
..LN4216:
	.loc    1  119  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm3             #119.11
..LN4217:
	.loc    1  120  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm2             #120.11
..LN4218:
	.loc    1  121  is_stmt 1
        vmovups   .L_2il0floatpacket.6(%rip), %zmm1             #121.11
..LN4219:
	.loc    1  120  is_stmt 1
        movq      24(%rsp), %r8                                 #120.4[spill]
..LN4220:
	.loc    1  121  is_stmt 1
        lea       (%rbx,%rcx,8), %r9                            #121.4
..LN4221:
	.loc    1  119  is_stmt 1
        movq      16(%rsp), %rdx                                #119.4[spill]
..LN4222:
	.loc    1  118  is_stmt 1
        xorl      %eax, %eax                                    #118.3
..LN4223:
        vpbroadcastd %xmm0, %ymm0                               #118.3
..LN4224:
        movq      112(%rsp), %r10                               #118.3[spill]
..LN4225:
	.loc    1  120  is_stmt 1
        lea       (%r8,%rcx,8), %r8                             #120.4
..LN4226:
	.loc    1  118  is_stmt 1
        vpbroadcastd %xmm5, %ymm5                               #118.3
..LN4227:
        subq      %rcx, %r10                                    #118.3
..LN4228:
	.loc    1  119  is_stmt 1
        lea       (%rdx,%rcx,8), %rdx                           #119.4
..LN4229:
                                # LOE rax rdx rbx r8 r9 r10 r11 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.581:                       # Preds ..B1.581 ..B1.580
                                # Execution count [4.08e-02]: Infreq
..LN4230:
	.loc    1  118  is_stmt 1
        addq      $8, %r11                                      #118.3
..LN4231:
        vpcmpgtd  %zmm4, %zmm0, %k2{%k1}                        #118.3
..LN4232:
        vpaddd    %ymm5, %ymm4, %ymm4                           #118.3
..LN4233:
	.loc    1  119  is_stmt 1
        vmovupd   %zmm3, (%rax,%rdx){%k2}                       #119.4
..LN4234:
	.loc    1  120  is_stmt 1
        vmovupd   %zmm2, (%rax,%r8){%k2}                        #120.4
..LN4235:
	.loc    1  121  is_stmt 1
        vmovupd   %zmm1, (%rax,%r9){%k2}                        #121.4
..LN4236:
	.loc    1  118  is_stmt 1
        addq      $64, %rax                                     #118.3
..LN4237:
        cmpq      %r10, %r11                                    #118.3
..LN4238:
        jb        ..B1.581      # Prob 81%                      #118.3
..LN4239:
                                # LOE rax rdx rbx r8 r9 r10 r11 r15 r12d r13d ymm4 ymm5 zmm0 zmm1 zmm2 zmm3 k1
..B1.583:                       # Preds ..B1.581 ..B1.574 ..B1.567 ..B1.579
                                # Execution count [8.16e-03]: Infreq
..LN4240:
	.loc    1  126  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #126.3
..LN4241:
	.loc    1  124  is_stmt 1
        movl      $1, %r14d                                     #124.3
..LN4242:
	.loc    1  126  is_stmt 1
        vzeroupper                                              #126.3
..___tag_value_main.111:
..LN4243:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #126.3
..___tag_value_main.112:
..LN4244:
                                # LOE rbx r15 r12d r13d r14d
..B1.584:                       # Preds ..B1.583
                                # Execution count [8.16e-03]: Infreq
..LN4245:
	.loc    1  128  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #128.11
..LN4246:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #128.24
..LN4247:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #128.15
..LN4248:
        vcomisd   %xmm1, %xmm0                                  #128.24
..LN4249:
        jbe       ..B1.610      # Prob 10%                      #128.24
..LN4250:
                                # LOE rbx r15 r12d r13d r14d
..B1.585:                       # Preds ..B1.584
                                # Execution count [7.34e-03]: Infreq
..LN4251:
	.loc    1  135  is_stmt 1
        movl      $8, %r8d                                      #135.5
..LN4252:
        movl      %r13d, %edx                                   #135.5
..LN4253:
        andl      $-64, %edx                                    #135.5
..LN4254:
	.loc    1  130  is_stmt 1
        lea       56(%rsp), %rdi                                #130.4
..LN4255:
	.loc    1  135  is_stmt 1
        movl      %edx, -8(%rdi)                                #135.5[spill]
..LN4256:
	.loc    1  130  is_stmt 1
        lea       40(%rsp), %rsi                                #130.4
..LN4257:
	.loc    1  135  is_stmt 1
        movslq    %edx, %rdx                                    #135.5
..LN4258:
        vmovd     %r8d, %xmm0                                   #135.5
..LN4259:
        vpbroadcastd %xmm0, %ymm1                               #135.5
..LN4260:
        vmovdqu   %ymm1, 24(%rsi)                               #135.5[spill]
..LN4261:
        movq      %rdx, -8(%rsi)                                #135.5[spill]
..LN4262:
	.loc    1  130  is_stmt 1
        vzeroupper                                              #130.4
..___tag_value_main.113:
..LN4263:
#       timing(double *, double *)
        call      timing                                        #130.4
..___tag_value_main.114:
..LN4264:
                                # LOE rbx r15 r12d r13d r14d
..B1.586:                       # Preds ..B1.585
                                # Execution count [6.61e-03]: Infreq
..LN4265:
	.loc    1  131  is_stmt 1
        xorl      %eax, %eax                                    #131.4
..LN4266:
        movl      %r12d, (%rsp)                                 #131.4[spill]
..LN4267:
        vxorpd    %xmm0, %xmm0, %xmm0                           #131.4
..LN4268:
        movq      %r15, 8(%rsp)                                 #131.4[spill]
..LN4269:
        movl      %r14d, 184(%rsp)                              #131.4[spill]
..LN4270:
        movl      %eax, %r14d                                   #131.4
..LN4271:
        movq      24(%rsp), %r15                                #131.4[spill]
..LN4272:
        movq      16(%rsp), %r12                                #131.4[spill]
..LN4273:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.587:                       # Preds ..B1.586 ..B1.602 ..B1.608
                                # Execution count [2.04e-01]: Infreq
..LN4274:
	.loc    1  135  is_stmt 1
        xorl      %r8d, %r8d                                    #135.9
..LN4275:
        testl     %r13d, %r13d                                  #135.20
..LN4276:
        jle       ..B1.600      # Prob 50%                      #135.20
..LN4277:
                                # LOE rbx r12 r15 r8d r13d r14d xmm0
..B1.588:                       # Preds ..B1.587
                                # Execution count [1.84e-01]: Infreq
..LN4278:
        cmpl      $64, %r13d                                    #135.5
..LN4279:
        jl        ..B1.615      # Prob 10%                      #135.5
..LN4280:
                                # LOE rbx r12 r15 r8d r13d r14d xmm0
..B1.589:                       # Preds ..B1.588
                                # Execution count [1.84e-01]: Infreq
..LN4281:
        movl      48(%rsp), %ecx                                #135.5[spill]
..LN4282:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0
..B1.591:                       # Preds ..B1.589
                                # Execution count [1.84e-01]: Infreq
..LN4283:
        movq      32(%rsp), %r8                                 #135.5[spill]
..LN4284:
        xorl      %edx, %edx                                    #135.5
..LN4285:
                                # LOE rdx rbx r8 r12 r15 ecx r13d r14d xmm0
..B1.592:                       # Preds ..B1.592 ..B1.591
                                # Execution count [1.02e+00]: Infreq
..LN4286:
	.loc    1  136  is_stmt 1
        vmovups   (%r15,%rdx,8), %zmm1                          #136.13
..LN4287:
        vmovups   64(%r15,%rdx,8), %zmm2                        #136.13
..LN4288:
        vaddpd    (%rbx,%rdx,8), %zmm1, %zmm3                   #136.20
..LN4289:
        vaddpd    64(%rbx,%rdx,8), %zmm2, %zmm4                 #136.20
..LN4290:
        vmovntpd  %zmm3, (%r12,%rdx,8)                          #136.6
..LN4291:
        vmovntpd  %zmm4, 64(%r12,%rdx,8)                        #136.6
..LN4292:
        vmovups   128(%r15,%rdx,8), %zmm5                       #136.13
..LN4293:
        vmovups   192(%r15,%rdx,8), %zmm6                       #136.13
..LN4294:
        vaddpd    128(%rbx,%rdx,8), %zmm5, %zmm7                #136.20
..LN4295:
        vaddpd    192(%rbx,%rdx,8), %zmm6, %zmm8                #136.20
..LN4296:
        vmovntpd  %zmm7, 128(%r12,%rdx,8)                       #136.6
..LN4297:
        vmovntpd  %zmm8, 192(%r12,%rdx,8)                       #136.6
..LN4298:
        vmovups   256(%r15,%rdx,8), %zmm9                       #136.13
..LN4299:
        vmovups   320(%r15,%rdx,8), %zmm10                      #136.13
..LN4300:
        vaddpd    256(%rbx,%rdx,8), %zmm9, %zmm11               #136.20
..LN4301:
        vaddpd    320(%rbx,%rdx,8), %zmm10, %zmm12              #136.20
..LN4302:
        vmovntpd  %zmm11, 256(%r12,%rdx,8)                      #136.6
..LN4303:
        vmovntpd  %zmm12, 320(%r12,%rdx,8)                      #136.6
..LN4304:
        vmovups   384(%r15,%rdx,8), %zmm13                      #136.13
..LN4305:
        vmovups   448(%r15,%rdx,8), %zmm14                      #136.13
..LN4306:
        vaddpd    384(%rbx,%rdx,8), %zmm13, %zmm15              #136.20
..LN4307:
        vaddpd    448(%rbx,%rdx,8), %zmm14, %zmm16              #136.20
..LN4308:
        vmovntpd  %zmm15, 384(%r12,%rdx,8)                      #136.6
..LN4309:
        vmovntpd  %zmm16, 448(%r12,%rdx,8)                      #136.6
..LN4310:
	.loc    1  135  is_stmt 1
        addq      $64, %rdx                                     #135.5
..LN4311:
        cmpq      %r8, %rdx                                     #135.5
..LN4312:
        jb        ..B1.592      # Prob 82%                      #135.5
..LN4313:
                                # LOE rdx rbx r8 r12 r15 ecx r13d r14d xmm0
..B1.593:                       # Preds ..B1.592
                                # Execution count [1.84e-01]: Infreq
..LN4314:
        movl      %ecx, %r8d                                    #135.36
..LN4315:
                                # LOE rbx r12 r15 ecx r8d r13d r14d xmm0
..B1.594:                       # Preds ..B1.593 ..B1.615
                                # Execution count [2.04e-01]: Infreq
..LN4316:
        lea       1(%rcx), %edx                                 #135.5
..LN4317:
        cmpl      %r13d, %edx                                   #135.5
..LN4318:
        ja        ..B1.600      # Prob 50%                      #135.5
..LN4319:
                                # LOE rbx r12 r15 ecx r8d r13d r14d xmm0
..B1.595:                       # Preds ..B1.594
                                # Execution count [1.84e-01]: Infreq
..LN4320:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #135.5
..LN4321:
                                # LOE rbx r12 r15 ecx r13d r14d xmm0 ymm2
..B1.597:                       # Preds ..B1.595
                                # Execution count [1.84e-01]: Infreq
..LN4322:
        movslq    %ecx, %rdx                                    #135.5
..LN4323:
        negl      %ecx                                          #135.5
..LN4324:
        addl      %r13d, %ecx                                   #135.5
..LN4325:
        movl      $255, %eax                                    #135.5
..LN4326:
        xorl      %r11d, %r11d                                  #135.5
..LN4327:
        movq      112(%rsp), %r10                               #135.5[spill]
..LN4328:
        vmovdqu   64(%rsp), %ymm5                               #135.5[spill]
..LN4329:
        subq      %rdx, %r10                                    #135.5
..LN4330:
        vmovd     %ecx, %xmm1                                   #135.5
..LN4331:
        kmovw     %eax, %k1                                     #135.5
..LN4332:
        vpbroadcastd %xmm1, %ymm1                               #135.5
..LN4333:
	.loc    1  136  is_stmt 1
        lea       (%r12,%rdx,8), %r9                            #136.6
..LN4334:
        lea       (%rbx,%rdx,8), %r8                            #136.20
..LN4335:
        lea       (%r15,%rdx,8), %rcx                           #136.13
..LN4336:
	.loc    1  135  is_stmt 1
        xorl      %edx, %edx                                    #135.5
..LN4337:
                                # LOE rdx rcx rbx r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm5 zmm1 k1
..B1.598:                       # Preds ..B1.598 ..B1.597
                                # Execution count [1.02e+00]: Infreq
..LN4338:
	.loc    1  136  is_stmt 1
        vmovups   (%rdx,%rcx), %zmm3                            #136.13
..LN4339:
	.loc    1  135  is_stmt 1
        addq      $8, %r11                                      #135.5
..LN4340:
	.loc    1  136  is_stmt 1
        vaddpd    (%rdx,%r8), %zmm3, %zmm4                      #136.20
..LN4341:
	.loc    1  135  is_stmt 1
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #135.5
..LN4342:
        vpaddd    %ymm5, %ymm2, %ymm2                           #135.5
..LN4343:
	.loc    1  136  is_stmt 1
        vmovupd   %zmm4, (%rdx,%r9){%k2}                        #136.6
..LN4344:
	.loc    1  135  is_stmt 1
        addq      $64, %rdx                                     #135.5
..LN4345:
        cmpq      %r10, %r11                                    #135.5
..LN4346:
        jb        ..B1.598      # Prob 82%                      #135.5
..LN4347:
                                # LOE rdx rcx rbx r8 r9 r10 r11 r12 r15 r13d r14d xmm0 ymm2 ymm5 zmm1 k1
..B1.599:                       # Preds ..B1.598
                                # Execution count [1.84e-01]: Infreq
..LN4348:
        movl      %r13d, %r8d                                   #135.36
..LN4349:
                                # LOE rbx r12 r15 r8d r13d r14d xmm0
..B1.600:                       # Preds ..B1.599 ..B1.594 ..B1.587
                                # Execution count [2.04e-01]: Infreq
..LN4350:
	.loc    1  138  is_stmt 1
        movslq    %r8d, %r8                                     #138.8
..LN4351:
        vcomisd   (%r12,%r8,8), %xmm0                           #138.13
..LN4352:
        jbe       ..B1.602      # Prob 78%                      #138.13
..LN4353:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.601:                       # Preds ..B1.600
                                # Execution count [4.49e-02]: Infreq
..LN4354:
        movl      $il0_peep_printf_format_8, %edi               #138.16
..LN4355:
        vzeroupper                                              #138.16
..LN4356:
        call      puts                                          #138.16
..LN4357:
                                # LOE rbx r12 r15 r13d r14d
..B1.742:                       # Preds ..B1.601
                                # Execution count [4.49e-02]: Infreq
..LN4358:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4359:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.602:                       # Preds ..B1.600 ..B1.742
                                # Execution count [2.04e-01]: Infreq
..LN4360:
	.loc    1  131  is_stmt 1
        incl      %r14d                                         #131.4
..LN4361:
        cmpl      184(%rsp), %r14d                              #131.4[spill]
..LN4362:
        jb        ..B1.587      # Prob 81%                      #131.4
..LN4363:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.603:                       # Preds ..B1.602
                                # Execution count [3.74e-02]: Infreq
..LN4364:
        movl      184(%rsp), %r14d                              #[spill]
..LN4365:
                                # LOE rbx r12 r15 r13d r14d
..B1.604:                       # Preds ..B1.607 ..B1.603
                                # Execution count [4.08e-02]: Infreq
..LN4366:
	.loc    1  141  is_stmt 1
        vzeroupper                                              #141.4
..LN4367:
        lea       96(%rsp), %rdi                                #141.4
..LN4368:
        lea       40(%rsp), %rsi                                #141.4
..___tag_value_main.115:
..LN4369:
#       timing(double *, double *)
        call      timing                                        #141.4
..___tag_value_main.116:
..LN4370:
                                # LOE rbx r12 r15 r13d r14d
..B1.605:                       # Preds ..B1.604
                                # Execution count [4.08e-02]: Infreq
..LN4371:
	.loc    1  128  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #128.11
..LN4372:
	.loc    1  142  is_stmt 1
        addl      %r14d, %r14d                                  #142.4
..LN4373:
	.loc    1  128  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #128.24
..LN4374:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #128.15
..LN4375:
        vcomisd   %xmm1, %xmm0                                  #128.24
..LN4376:
        jbe       ..B1.609      # Prob 18%                      #128.24
..LN4377:
                                # LOE rbx r12 r15 r13d r14d
..B1.606:                       # Preds ..B1.605
                                # Execution count [3.34e-02]: Infreq
..LN4378:
	.loc    1  130  is_stmt 1
        lea       56(%rsp), %rdi                                #130.4
..LN4379:
        lea       40(%rsp), %rsi                                #130.4
..___tag_value_main.117:
..LN4380:
#       timing(double *, double *)
        call      timing                                        #130.4
..___tag_value_main.118:
..LN4381:
                                # LOE rbx r12 r15 r13d r14d
..B1.607:                       # Preds ..B1.606
                                # Execution count [3.34e-02]: Infreq
..LN4382:
	.loc    1  131  is_stmt 1
        xorl      %eax, %eax                                    #131.4
..LN4383:
        testl     %r14d, %r14d                                  #131.19
..LN4384:
        jle       ..B1.604      # Prob 9%                       #131.19
..LN4385:
                                # LOE rbx r12 r15 eax r13d r14d
..B1.608:                       # Preds ..B1.607
                                # Execution count [3.01e-02]: Infreq
..LN4386:
        movl      %r14d, 184(%rsp)                              #[spill]
..LN4387:
        movl      %eax, %r14d                                   #
..LN4388:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4389:
        jmp       ..B1.587      # Prob 100%                     #
..LN4390:
                                # LOE rbx r12 r15 r13d r14d xmm0
..B1.609:                       # Preds ..B1.605
                                # Execution count [7.34e-03]: Infreq
..LN4391:
        movl      (%rsp), %r12d                                 #[spill]
..LN4392:
        movq      8(%rsp), %r15                                 #[spill]
..LN4393:
                                # LOE rbx r15 r12d r13d r14d
..B1.610:                       # Preds ..B1.609 ..B1.584
                                # Execution count [8.16e-03]: Infreq
..LN4394:
	.loc    1  145  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #145.3
..___tag_value_main.119:
..LN4395:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #145.3
..___tag_value_main.120:
..LN4396:
                                # LOE rbx r15 r12d r13d r14d
..B1.611:                       # Preds ..B1.610
                                # Execution count [8.16e-03]: Infreq
..LN4397:
	.loc    1  147  is_stmt 1
        movl      %r14d, %edx                                   #147.3
..LN4398:
        shrl      $31, %edx                                     #147.3
..LN4399:
        addl      %edx, %r14d                                   #147.3
..LN4400:
        sarl      $1, %r14d                                     #147.3
..___tag_value_main.121:
..LN4401:
	.loc    1  150  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #150.3
..___tag_value_main.122:
..LN4402:
                                # LOE rbx r15 r12d r13d r14d
..B1.612:                       # Preds ..B1.611
                                # Execution count [8.16e-03]: Infreq
..LN4403:
	.loc    1  152  is_stmt 1
        movq      16(%rsp), %rdi                                #152.3[spill]
..LN4404:
#       _mm_free(void *)
        call      _mm_free                                      #152.3
..LN4405:
                                # LOE rbx r15 r12d r13d r14d
..B1.613:                       # Preds ..B1.612
                                # Execution count [8.16e-03]: Infreq
..LN4406:
	.loc    1  153  is_stmt 1
        movq      24(%rsp), %rdi                                #153.3[spill]
..LN4407:
#       _mm_free(void *)
        call      _mm_free                                      #153.3
..LN4408:
                                # LOE rbx r15 r12d r13d r14d
..B1.614:                       # Preds ..B1.613
                                # Execution count [8.16e-03]: Infreq
..LN4409:
	.loc    1  154  is_stmt 1
        movq      %rbx, %rdi                                    #154.3
..LN4410:
#       _mm_free(void *)
        call      _mm_free                                      #154.3
..LN4411:
        jmp       ..B1.18       # Prob 100%                     #154.3
..LN4412:
                                # LOE r15 r12d r13d r14d
..B1.615:                       # Preds ..B1.588
                                # Execution count [1.84e-02]: Infreq
..LN4413:
	.loc    1  135  is_stmt 1
        xorl      %ecx, %ecx                                    #135.5
..LN4414:
        jmp       ..B1.594      # Prob 100%                     #135.5
..LN4415:
                                # LOE rbx r12 r15 ecx r8d r13d r14d xmm0
..B1.616:                       # Preds ..B1.569
                                # Execution count [7.34e-04]: Infreq
..LN4416:
	.loc    1  118  is_stmt 1
        xorl      %eax, %eax                                    #118.3
..LN4417:
        jmp       ..B1.579      # Prob 100%                     #118.3
..LN4418:
                                # LOE rbx r15 eax r12d r13d
..B1.617:                       # Preds ..B1.8
                                # Execution count [8.16e-03]: Infreq
..LN4419:
	.loc    1  67  is_stmt 1
        movq      %rbx, %rdi                                    #67.16
..LN4420:
        movq      %r15, %rsi                                    #67.16
..LN4421:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #67.16
..LN4422:
                                # LOE rax rbx r15 r12d r13d
..B1.739:                       # Preds ..B1.617
                                # Execution count [8.16e-03]: Infreq
..LN4423:
        movq      %rax, 16(%rsp)                                #67.16[spill]
..LN4424:
                                # LOE rbx r15 r12d r13d
..B1.618:                       # Preds ..B1.739
                                # Execution count [8.16e-03]: Infreq
..LN4425:
	.loc    1  68  is_stmt 1
        movq      %rbx, %rdi                                    #68.16
..LN4426:
        movq      %r15, %rsi                                    #68.16
..LN4427:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #68.16
..LN4428:
                                # LOE rax r15 r12d r13d
..B1.740:                       # Preds ..B1.618
                                # Execution count [8.16e-03]: Infreq
..LN4429:
        movq      %rax, %rbx                                    #68.16
..LN4430:
                                # LOE rbx r15 r12d r13d
..B1.619:                       # Preds ..B1.740
                                # Execution count [8.16e-03]: Infreq
..LN4431:
	.loc    1  70  is_stmt 1
        testl     %r13d, %r13d                                  #70.18
..LN4432:
        jle       ..B1.635      # Prob 50%                      #70.18
..LN4433:
                                # LOE rbx r15 r12d r13d
..B1.620:                       # Preds ..B1.619
                                # Execution count [7.34e-03]: Infreq
..LN4434:
        movq      %rbx, %r10                                    #70.3
..LN4435:
        andq      $63, %r10                                     #70.3
..LN4436:
        testl     %r10d, %r10d                                  #70.3
..LN4437:
        je        ..B1.623      # Prob 50%                      #70.3
..LN4438:
                                # LOE rbx r15 r10d r12d r13d
..B1.621:                       # Preds ..B1.620
                                # Execution count [7.34e-03]: Infreq
..LN4439:
        testl     $7, %r10d                                     #70.3
..LN4440:
        jne       ..B1.667      # Prob 10%                      #70.3
..LN4441:
                                # LOE rbx r15 r10d r12d r13d
..B1.622:                       # Preds ..B1.621
                                # Execution count [0.00e+00]: Infreq
..LN4442:
        negl      %r10d                                         #70.3
..LN4443:
        addl      $64, %r10d                                    #70.3
..LN4444:
        shrl      $3, %r10d                                     #70.3
..LN4445:
        cmpl      %r10d, %r13d                                  #70.3
..LN4446:
        cmovl     %r13d, %r10d                                  #70.3
..LN4447:
                                # LOE rbx r15 r10d r12d r13d
..B1.623:                       # Preds ..B1.622 ..B1.620
                                # Execution count [8.16e-03]: Infreq
..LN4448:
        movl      %r13d, %eax                                   #70.3
..LN4449:
        subl      %r10d, %eax                                   #70.3
..LN4450:
        andl      $7, %eax                                      #70.3
..LN4451:
        negl      %eax                                          #70.3
..LN4452:
        addl      %r13d, %eax                                   #70.3
..LN4453:
        cmpl      $1, %r10d                                     #70.3
..LN4454:
        jb        ..B1.627      # Prob 50%                      #70.3
..LN4455:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.624:                       # Preds ..B1.623
                                # Execution count [7.34e-03]: Infreq
..LN4456:
        movl      $255, %edx                                    #70.3
..LN4457:
        vmovd     %r10d, %xmm0                                  #70.3
..LN4458:
        kmovw     %edx, %k1                                     #70.3
..LN4459:
        movl      $8, %edx                                      #70.3
..LN4460:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #70.3
..LN4461:
	.loc    1  71  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #71.11
..LN4462:
	.loc    1  72  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #72.11
..LN4463:
	.loc    1  70  is_stmt 1
        vmovd     %edx, %xmm4                                   #70.3
..LN4464:
        vpbroadcastd %xmm0, %ymm0                               #70.3
..LN4465:
        xorl      %r9d, %r9d                                    #70.3
..LN4466:
        vpbroadcastd %xmm4, %ymm4                               #70.3
..LN4467:
        xorl      %edx, %edx                                    #70.3
..LN4468:
        movslq    %r10d, %r8                                    #70.3
..LN4469:
        movq      16(%rsp), %r11                                #70.3[spill]
..LN4470:
                                # LOE rdx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.625:                       # Preds ..B1.625 ..B1.624
                                # Execution count [4.08e-02]: Infreq
..LN4471:
        addq      $8, %r9                                       #70.3
..LN4472:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #70.3
..LN4473:
        vpaddd    %ymm4, %ymm3, %ymm3                           #70.3
..LN4474:
	.loc    1  71  is_stmt 1
        vmovupd   %zmm2, (%rdx,%r11){%k2}                       #71.4
..LN4475:
	.loc    1  72  is_stmt 1
        vmovupd   %zmm1, (%rdx,%rbx){%k2}                       #72.4
..LN4476:
	.loc    1  70  is_stmt 1
        addq      $64, %rdx                                     #70.3
..LN4477:
        cmpq      %r8, %r9                                      #70.3
..LN4478:
        jb        ..B1.625      # Prob 81%                      #70.3
..LN4479:
                                # LOE rdx rbx r8 r9 r11 r15 eax r10d r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.626:                       # Preds ..B1.625
                                # Execution count [7.34e-03]: Infreq
..LN4480:
        cmpl      %r10d, %r13d                                  #70.3
..LN4481:
        je        ..B1.635      # Prob 10%                      #70.3
..LN4482:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.627:                       # Preds ..B1.623 ..B1.626
                                # Execution count [0.00e+00]: Infreq
..LN4483:
        lea       8(%r10), %edx                                 #70.3
..LN4484:
        cmpl      %edx, %eax                                    #70.3
..LN4485:
        jl        ..B1.631      # Prob 50%                      #70.3
..LN4486:
                                # LOE rbx r15 eax r10d r12d r13d
..B1.628:                       # Preds ..B1.627
                                # Execution count [7.34e-03]: Infreq
..LN4487:
        movslq    %r10d, %r10                                   #70.3
..LN4488:
	.loc    1  71  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm1             #71.11
..LN4489:
	.loc    1  72  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm0             #72.11
..LN4490:
	.loc    1  70  is_stmt 1
        movslq    %eax, %rdx                                    #70.3
..LN4491:
        movq      16(%rsp), %r8                                 #70.3[spill]
..LN4492:
                                # LOE rdx rbx r8 r10 r15 eax r12d r13d zmm0 zmm1
..B1.629:                       # Preds ..B1.629 ..B1.628
                                # Execution count [4.08e-02]: Infreq
..LN4493:
	.loc    1  71  is_stmt 1
        vmovupd   %zmm1, (%r8,%r10,8)                           #71.4
..LN4494:
	.loc    1  72  is_stmt 1
        vmovntpd  %zmm0, (%rbx,%r10,8)                          #72.4
..LN4495:
	.loc    1  70  is_stmt 1
        addq      $8, %r10                                      #70.3
..LN4496:
        cmpq      %rdx, %r10                                    #70.3
..LN4497:
        jb        ..B1.629      # Prob 81%                      #70.3
..LN4498:
                                # LOE rdx rbx r8 r10 r15 eax r12d r13d zmm0 zmm1
..B1.631:                       # Preds ..B1.629 ..B1.627 ..B1.667
                                # Execution count [8.16e-03]: Infreq
..LN4499:
        lea       1(%rax), %edx                                 #70.3
..LN4500:
        cmpl      %r13d, %edx                                   #70.3
..LN4501:
        ja        ..B1.635      # Prob 50%                      #70.3
..LN4502:
                                # LOE rbx r15 eax r12d r13d
..B1.632:                       # Preds ..B1.631
                                # Execution count [7.34e-03]: Infreq
..LN4503:
        movslq    %eax, %r11                                    #70.3
..LN4504:
        negl      %eax                                          #70.3
..LN4505:
        addl      %r13d, %eax                                   #70.3
..LN4506:
        movl      $8, %r8d                                      #70.3
..LN4507:
        movl      $255, %edx                                    #70.3
..LN4508:
        xorl      %r10d, %r10d                                  #70.3
..LN4509:
        kmovw     %edx, %k1                                     #70.3
..LN4510:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm3             #70.3
..LN4511:
        vmovd     %eax, %xmm0                                   #70.3
..LN4512:
        vmovd     %r8d, %xmm4                                   #70.3
..LN4513:
	.loc    1  71  is_stmt 1
        vmovups   .L_2il0floatpacket.3(%rip), %zmm2             #71.11
..LN4514:
	.loc    1  72  is_stmt 1
        vmovups   .L_2il0floatpacket.4(%rip), %zmm1             #72.11
..LN4515:
	.loc    1  71  is_stmt 1
        movq      16(%rsp), %rdx                                #71.4[spill]
..LN4516:
	.loc    1  72  is_stmt 1
        lea       (%rbx,%r11,8), %r8                            #72.4
..LN4517:
	.loc    1  70  is_stmt 1
        vpbroadcastd %xmm0, %ymm0                               #70.3
..LN4518:
        xorl      %eax, %eax                                    #70.3
..LN4519:
        movq      112(%rsp), %r9                                #70.3[spill]
..LN4520:
        vpbroadcastd %xmm4, %ymm4                               #70.3
..LN4521:
        subq      %r11, %r9                                     #70.3
..LN4522:
	.loc    1  71  is_stmt 1
        lea       (%rdx,%r11,8), %rdx                           #71.4
..LN4523:
                                # LOE rax rdx rbx r8 r9 r10 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.633:                       # Preds ..B1.633 ..B1.632
                                # Execution count [4.08e-02]: Infreq
..LN4524:
	.loc    1  70  is_stmt 1
        addq      $8, %r10                                      #70.3
..LN4525:
        vpcmpgtd  %zmm3, %zmm0, %k2{%k1}                        #70.3
..LN4526:
        vpaddd    %ymm4, %ymm3, %ymm3                           #70.3
..LN4527:
	.loc    1  71  is_stmt 1
        vmovupd   %zmm2, (%rax,%rdx){%k2}                       #71.4
..LN4528:
	.loc    1  72  is_stmt 1
        vmovupd   %zmm1, (%rax,%r8){%k2}                        #72.4
..LN4529:
	.loc    1  70  is_stmt 1
        addq      $64, %rax                                     #70.3
..LN4530:
        cmpq      %r9, %r10                                     #70.3
..LN4531:
        jb        ..B1.633      # Prob 81%                      #70.3
..LN4532:
                                # LOE rax rdx rbx r8 r9 r10 r15 r12d r13d ymm3 ymm4 zmm0 zmm1 zmm2 k1
..B1.635:                       # Preds ..B1.633 ..B1.619 ..B1.626 ..B1.631
                                # Execution count [8.16e-03]: Infreq
..LN4533:
	.loc    1  77  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #77.3
..LN4534:
	.loc    1  75  is_stmt 1
        movl      $1, %r14d                                     #75.3
..LN4535:
	.loc    1  77  is_stmt 1
        vzeroupper                                              #77.3
..___tag_value_main.123:
..LN4536:
#       likwid_markerStartRegion(const char *)
        call      likwid_markerStartRegion                      #77.3
..___tag_value_main.124:
..LN4537:
                                # LOE rbx r15 r12d r13d r14d
..B1.636:                       # Preds ..B1.635
                                # Execution count [8.16e-03]: Infreq
..LN4538:
	.loc    1  79  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #79.11
..LN4539:
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #79.24
..LN4540:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #79.15
..LN4541:
        vcomisd   %xmm1, %xmm0                                  #79.24
..LN4542:
        jbe       ..B1.662      # Prob 10%                      #79.24
..LN4543:
                                # LOE rbx r15 r12d r13d r14d
..B1.637:                       # Preds ..B1.636
                                # Execution count [7.34e-03]: Infreq
..LN4544:
	.loc    1  86  is_stmt 1
        movl      $8, %r8d                                      #86.5
..LN4545:
        movl      %r13d, %edx                                   #86.5
..LN4546:
        andl      $-64, %edx                                    #86.5
..LN4547:
	.loc    1  81  is_stmt 1
        lea       56(%rsp), %rdi                                #81.4
..LN4548:
	.loc    1  86  is_stmt 1
        movl      %edx, -24(%rdi)                               #86.5[spill]
..LN4549:
	.loc    1  81  is_stmt 1
        lea       40(%rsp), %rsi                                #81.4
..LN4550:
	.loc    1  86  is_stmt 1
        movslq    %edx, %rdx                                    #86.5
..LN4551:
        vmovd     %r8d, %xmm0                                   #86.5
..LN4552:
        vpbroadcastd %xmm0, %ymm1                               #86.5
..LN4553:
        vmovdqu   %ymm1, 24(%rsi)                               #86.5[spill]
..LN4554:
        movq      %rdx, -16(%rsi)                               #86.5[spill]
..LN4555:
	.loc    1  81  is_stmt 1
        vzeroupper                                              #81.4
..___tag_value_main.125:
..LN4556:
#       timing(double *, double *)
        call      timing                                        #81.4
..___tag_value_main.126:
..LN4557:
                                # LOE rbx r15 r12d r13d r14d
..B1.638:                       # Preds ..B1.637
                                # Execution count [6.61e-03]: Infreq
..LN4558:
	.loc    1  82  is_stmt 1
        xorl      %eax, %eax                                    #82.4
..LN4559:
        movq      %r15, 8(%rsp)                                 #82.4[spill]
..LN4560:
        vxorpd    %xmm0, %xmm0, %xmm0                           #82.4
..LN4561:
        movl      %r12d, (%rsp)                                 #82.4[spill]
..LN4562:
        movl      %eax, %r12d                                   #82.4
..LN4563:
        movq      16(%rsp), %r15                                #82.4[spill]
..LN4564:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.639:                       # Preds ..B1.638 ..B1.654 ..B1.660
                                # Execution count [2.04e-01]: Infreq
..LN4565:
	.loc    1  86  is_stmt 1
        xorl      %r8d, %r8d                                    #86.9
..LN4566:
        testl     %r13d, %r13d                                  #86.20
..LN4567:
        jle       ..B1.652      # Prob 50%                      #86.20
..LN4568:
                                # LOE rbx r15 r8d r12d r13d r14d xmm0
..B1.640:                       # Preds ..B1.639
                                # Execution count [1.84e-01]: Infreq
..LN4569:
        cmpl      $64, %r13d                                    #86.5
..LN4570:
        jl        ..B1.666      # Prob 10%                      #86.5
..LN4571:
                                # LOE rbx r15 r8d r12d r13d r14d xmm0
..B1.641:                       # Preds ..B1.640
                                # Execution count [1.84e-01]: Infreq
..LN4572:
        movl      32(%rsp), %ecx                                #86.5[spill]
..LN4573:
                                # LOE rbx r15 ecx r12d r13d r14d xmm0
..B1.643:                       # Preds ..B1.641
                                # Execution count [1.84e-01]: Infreq
..LN4574:
        vmovups   .L_2il0floatpacket.5(%rip), %zmm9             #86.5
..LN4575:
        xorl      %edx, %edx                                    #86.5
..LN4576:
        movq      24(%rsp), %r8                                 #86.5[spill]
..LN4577:
                                # LOE rdx rbx r8 r15 ecx r12d r13d r14d xmm0 zmm9
..B1.644:                       # Preds ..B1.644 ..B1.643
                                # Execution count [1.02e+00]: Infreq
..LN4578:
	.loc    1  87  is_stmt 1
        vmulpd    (%rbx,%rdx,8), %zmm9, %zmm1                   #87.18
..LN4579:
        vmulpd    64(%rbx,%rdx,8), %zmm9, %zmm2                 #87.18
..LN4580:
        vmovntpd  %zmm1, (%r15,%rdx,8)                          #87.6
..LN4581:
        vmovntpd  %zmm2, 64(%r15,%rdx,8)                        #87.6
..LN4582:
        vmulpd    128(%rbx,%rdx,8), %zmm9, %zmm3                #87.18
..LN4583:
        vmulpd    192(%rbx,%rdx,8), %zmm9, %zmm4                #87.18
..LN4584:
        vmovntpd  %zmm3, 128(%r15,%rdx,8)                       #87.6
..LN4585:
        vmovntpd  %zmm4, 192(%r15,%rdx,8)                       #87.6
..LN4586:
        vmulpd    256(%rbx,%rdx,8), %zmm9, %zmm5                #87.18
..LN4587:
        vmulpd    320(%rbx,%rdx,8), %zmm9, %zmm6                #87.18
..LN4588:
        vmovntpd  %zmm5, 256(%r15,%rdx,8)                       #87.6
..LN4589:
        vmovntpd  %zmm6, 320(%r15,%rdx,8)                       #87.6
..LN4590:
        vmulpd    384(%rbx,%rdx,8), %zmm9, %zmm7                #87.18
..LN4591:
        vmulpd    448(%rbx,%rdx,8), %zmm9, %zmm8                #87.18
..LN4592:
        vmovntpd  %zmm7, 384(%r15,%rdx,8)                       #87.6
..LN4593:
        vmovntpd  %zmm8, 448(%r15,%rdx,8)                       #87.6
..LN4594:
	.loc    1  86  is_stmt 1
        addq      $64, %rdx                                     #86.5
..LN4595:
        cmpq      %r8, %rdx                                     #86.5
..LN4596:
        jb        ..B1.644      # Prob 82%                      #86.5
..LN4597:
                                # LOE rdx rbx r8 r15 ecx r12d r13d r14d xmm0 zmm9
..B1.645:                       # Preds ..B1.644
                                # Execution count [1.84e-01]: Infreq
..LN4598:
        movl      %ecx, %r8d                                    #86.36
..LN4599:
                                # LOE rbx r15 ecx r8d r12d r13d r14d xmm0
..B1.646:                       # Preds ..B1.645 ..B1.666
                                # Execution count [2.04e-01]: Infreq
..LN4600:
        lea       1(%rcx), %edx                                 #86.5
..LN4601:
        cmpl      %r13d, %edx                                   #86.5
..LN4602:
        ja        ..B1.652      # Prob 50%                      #86.5
..LN4603:
                                # LOE rbx r15 ecx r8d r12d r13d r14d xmm0
..B1.647:                       # Preds ..B1.646
                                # Execution count [1.84e-01]: Infreq
..LN4604:
        vmovdqu   .L_2il0floatpacket.9(%rip), %ymm2             #86.5
..LN4605:
                                # LOE rbx r15 ecx r12d r13d r14d xmm0 ymm2
..B1.649:                       # Preds ..B1.647
                                # Execution count [1.84e-01]: Infreq
..LN4606:
        movslq    %ecx, %rdx                                    #86.5
..LN4607:
        negl      %ecx                                          #86.5
..LN4608:
        addl      %r13d, %ecx                                   #86.5
..LN4609:
        movl      $255, %eax                                    #86.5
..LN4610:
        xorl      %r10d, %r10d                                  #86.5
..LN4611:
        movq      112(%rsp), %r9                                #86.5[spill]
..LN4612:
        vmovdqu   64(%rsp), %ymm5                               #86.5[spill]
..LN4613:
        subq      %rdx, %r9                                     #86.5
..LN4614:
        vmovd     %ecx, %xmm1                                   #86.5
..LN4615:
        vmovups   .L_2il0floatpacket.5(%rip), %zmm4             #86.5
..LN4616:
        kmovw     %eax, %k1                                     #86.5
..LN4617:
        vpbroadcastd %xmm1, %ymm1                               #86.5
..LN4618:
	.loc    1  87  is_stmt 1
        lea       (%r15,%rdx,8), %r8                            #87.6
..LN4619:
        lea       (%rbx,%rdx,8), %rcx                           #87.18
..LN4620:
	.loc    1  86  is_stmt 1
        xorl      %edx, %edx                                    #86.5
..LN4621:
                                # LOE rdx rcx rbx r8 r9 r10 r15 r12d r13d r14d xmm0 ymm2 ymm5 zmm1 zmm4 k1
..B1.650:                       # Preds ..B1.650 ..B1.649
                                # Execution count [1.02e+00]: Infreq
..LN4622:
	.loc    1  87  is_stmt 1
        vmulpd    (%rdx,%rcx), %zmm4, %zmm3                     #87.18
..LN4623:
	.loc    1  86  is_stmt 1
        addq      $8, %r10                                      #86.5
..LN4624:
        vpcmpgtd  %zmm2, %zmm1, %k2{%k1}                        #86.5
..LN4625:
        vpaddd    %ymm5, %ymm2, %ymm2                           #86.5
..LN4626:
	.loc    1  87  is_stmt 1
        vmovupd   %zmm3, (%rdx,%r8){%k2}                        #87.6
..LN4627:
	.loc    1  86  is_stmt 1
        addq      $64, %rdx                                     #86.5
..LN4628:
        cmpq      %r9, %r10                                     #86.5
..LN4629:
        jb        ..B1.650      # Prob 82%                      #86.5
..LN4630:
                                # LOE rdx rcx rbx r8 r9 r10 r15 r12d r13d r14d xmm0 ymm2 ymm5 zmm1 zmm4 k1
..B1.651:                       # Preds ..B1.650
                                # Execution count [1.84e-01]: Infreq
..LN4631:
        movl      %r13d, %r8d                                   #86.36
..LN4632:
                                # LOE rbx r15 r8d r12d r13d r14d xmm0
..B1.652:                       # Preds ..B1.651 ..B1.646 ..B1.639
                                # Execution count [2.04e-01]: Infreq
..LN4633:
	.loc    1  89  is_stmt 1
        movslq    %r8d, %r8                                     #89.8
..LN4634:
        vcomisd   (%r15,%r8,8), %xmm0                           #89.13
..LN4635:
        jbe       ..B1.654      # Prob 78%                      #89.13
..LN4636:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.653:                       # Preds ..B1.652
                                # Execution count [4.49e-02]: Infreq
..LN4637:
        movl      $il0_peep_printf_format_9, %edi               #89.16
..LN4638:
        vzeroupper                                              #89.16
..LN4639:
        call      puts                                          #89.16
..LN4640:
                                # LOE rbx r15 r12d r13d r14d
..B1.741:                       # Preds ..B1.653
                                # Execution count [4.49e-02]: Infreq
..LN4641:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4642:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.654:                       # Preds ..B1.652 ..B1.741
                                # Execution count [2.04e-01]: Infreq
..LN4643:
	.loc    1  82  is_stmt 1
        incl      %r12d                                         #82.4
..LN4644:
        cmpl      %r14d, %r12d                                  #82.4
..LN4645:
        jb        ..B1.639      # Prob 81%                      #82.4
..LN4646:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.656:                       # Preds ..B1.654 ..B1.659
                                # Execution count [4.08e-02]: Infreq
..LN4647:
	.loc    1  92  is_stmt 1
        vzeroupper                                              #92.4
..LN4648:
        lea       96(%rsp), %rdi                                #92.4
..LN4649:
        lea       40(%rsp), %rsi                                #92.4
..___tag_value_main.127:
..LN4650:
#       timing(double *, double *)
        call      timing                                        #92.4
..___tag_value_main.128:
..LN4651:
                                # LOE rbx r15 r13d r14d
..B1.657:                       # Preds ..B1.656
                                # Execution count [4.08e-02]: Infreq
..LN4652:
	.loc    1  79  is_stmt 1
        vmovsd    96(%rsp), %xmm16                              #79.11
..LN4653:
	.loc    1  93  is_stmt 1
        addl      %r14d, %r14d                                  #93.4
..LN4654:
	.loc    1  79  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm0             #79.24
..LN4655:
        vsubsd    56(%rsp), %xmm16, %xmm1                       #79.15
..LN4656:
        vcomisd   %xmm1, %xmm0                                  #79.24
..LN4657:
        jbe       ..B1.661      # Prob 18%                      #79.24
..LN4658:
                                # LOE rbx r15 r13d r14d
..B1.658:                       # Preds ..B1.657
                                # Execution count [3.34e-02]: Infreq
..LN4659:
	.loc    1  81  is_stmt 1
        lea       56(%rsp), %rdi                                #81.4
..LN4660:
        lea       40(%rsp), %rsi                                #81.4
..___tag_value_main.129:
..LN4661:
#       timing(double *, double *)
        call      timing                                        #81.4
..___tag_value_main.130:
..LN4662:
                                # LOE rbx r15 r13d r14d
..B1.659:                       # Preds ..B1.658
                                # Execution count [3.34e-02]: Infreq
..LN4663:
	.loc    1  82  is_stmt 1
        xorl      %r12d, %r12d                                  #82.4
..LN4664:
        testl     %r14d, %r14d                                  #82.19
..LN4665:
        jle       ..B1.656      # Prob 9%                       #82.19
..LN4666:
                                # LOE rbx r15 r12d r13d r14d
..B1.660:                       # Preds ..B1.659
                                # Execution count [3.01e-02]: Infreq
..LN4667:
        .byte     15                                            #
..LN4668:
        .byte     31                                            #
..LN4669:
        .byte     0                                             #
..LN4670:
        .byte     15                                            #
..LN4671:
        .byte     31                                            #
..LN4672:
        .byte     128                                           #
..LN4673:
        .byte     0                                             #
..LN4674:
        .byte     0                                             #
..LN4675:
        .byte     0                                             #
..LN4676:
        .byte     0                                             #
..LN4677:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN4678:
        jmp       ..B1.639      # Prob 100%                     #
..LN4679:
                                # LOE rbx r15 r12d r13d r14d xmm0
..B1.661:                       # Preds ..B1.657
                                # Execution count [7.34e-03]: Infreq
..LN4680:
        movl      (%rsp), %r12d                                 #[spill]
..LN4681:
        movq      8(%rsp), %r15                                 #[spill]
..LN4682:
                                # LOE rbx r15 r12d r13d r14d
..B1.662:                       # Preds ..B1.661 ..B1.636
                                # Execution count [8.16e-03]: Infreq
..LN4683:
	.loc    1  96  is_stmt 1
        movl      $.L_2__STRING.1, %edi                         #96.3
..___tag_value_main.131:
..LN4684:
#       likwid_markerStopRegion(const char *)
        call      likwid_markerStopRegion                       #96.3
..___tag_value_main.132:
..LN4685:
                                # LOE rbx r15 r12d r13d r14d
..B1.663:                       # Preds ..B1.662
                                # Execution count [8.16e-03]: Infreq
..LN4686:
	.loc    1  98  is_stmt 1
        movl      %r14d, %edx                                   #98.3
..LN4687:
        shrl      $31, %edx                                     #98.3
..LN4688:
        addl      %edx, %r14d                                   #98.3
..LN4689:
        sarl      $1, %r14d                                     #98.3
..___tag_value_main.133:
..LN4690:
	.loc    1  102  is_stmt 1
#       likwid_markerClose(void)
        call      likwid_markerClose                            #102.3
..___tag_value_main.134:
..LN4691:
                                # LOE rbx r15 r12d r13d r14d
..B1.664:                       # Preds ..B1.663
                                # Execution count [8.16e-03]: Infreq
..LN4692:
	.loc    1  104  is_stmt 1
        movq      16(%rsp), %rdi                                #104.3[spill]
..LN4693:
#       _mm_free(void *)
        call      _mm_free                                      #104.3
..LN4694:
                                # LOE rbx r15 r12d r13d r14d
..B1.665:                       # Preds ..B1.664
                                # Execution count [8.16e-03]: Infreq
..LN4695:
	.loc    1  105  is_stmt 1
        movq      %rbx, %rdi                                    #105.3
..LN4696:
#       _mm_free(void *)
        call      _mm_free                                      #105.3
..LN4697:
        jmp       ..B1.18       # Prob 100%                     #105.3
..LN4698:
                                # LOE r15 r12d r13d r14d
..B1.666:                       # Preds ..B1.640
                                # Execution count [1.84e-02]: Infreq
..LN4699:
	.loc    1  86  is_stmt 1
        xorl      %ecx, %ecx                                    #86.5
..LN4700:
        jmp       ..B1.646      # Prob 100%                     #86.5
..LN4701:
                                # LOE rbx r15 ecx r8d r12d r13d r14d xmm0
..B1.667:                       # Preds ..B1.621
                                # Execution count [7.34e-04]: Infreq
..LN4702:
	.loc    1  70  is_stmt 1
        xorl      %eax, %eax                                    #70.3
..LN4703:
        jmp       ..B1.631      # Prob 100%                     #70.3
        .align    16,0x90
..LN4704:
                                # LOE rbx r15 eax r12d r13d
..LN4705:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.4706:
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
..LN4707:
	.loc    1  22  is_stmt 1
        pushq     %r15                                          #22.1
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
..LN4708:
        pushq     %rbx                                          #22.1
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
..LN4709:
        subq      $168, %rsp                                    #22.1
	.cfi_def_cfa_offset 192
..LN4710:
        movq      %rsi, %r15                                    #22.1
..LN4711:
        movq      %rdi, %rbx                                    #22.1
..LN4712:
	.loc    1  26  is_stmt 1

### 	struct timeval tp;
### 	struct rusage ruse;
### 	
### 	gettimeofday(&tp, NULL);

        lea       144(%rsp), %rdi                               #26.2
..LN4713:
        xorl      %esi, %esi                                    #26.2
..LN4714:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #26.2
..LN4715:
                                # LOE rbx rbp r12 r13 r14 r15
..B2.2:                         # Preds ..B2.1
                                # Execution count [1.00e+00]
..LN4716:
	.loc    1  27  is_stmt 1

### 	*wcTime=(double) (tp.tv_sec + tp.tv_usec/1000000.0);

        vxorpd    %xmm1, %xmm1, %xmm1                           #27.32
..LN4717:
        vxorpd    %xmm0, %xmm0, %xmm0                           #27.20
..LN4718:
        vcvtsi2sdq 152(%rsp), %xmm1, %xmm1                      #27.32
..LN4719:
        vcvtsi2sdq 144(%rsp), %xmm0, %xmm0                      #27.20
..LN4720:
        vfmadd132sd .L_2il0floatpacket.7(%rip), %xmm0, %xmm1    #27.3
..LN4721:
	.loc    1  29  is_stmt 1

### 	
### 	getrusage(RUSAGE_SELF, &ruse);

        xorl      %edi, %edi                                    #29.2
..LN4722:
	.loc    1  27  is_stmt 1
        vmovsd    %xmm1, (%rbx)                                 #27.3
..LN4723:
	.loc    1  29  is_stmt 1
        lea       (%rsp), %rsi                                  #29.2
..LN4724:
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #29.2
..LN4725:
                                # LOE rbp r12 r13 r14 r15
..B2.3:                         # Preds ..B2.2
                                # Execution count [1.00e+00]
..LN4726:
	.loc    1  30  is_stmt 1

### 	*cpuTime=(double)(ruse.ru_utime.tv_sec+ruse.ru_utime.tv_usec / 1000000.0);

        vxorpd    %xmm1, %xmm1, %xmm1                           #30.41
..LN4727:
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.20
..LN4728:
        vcvtsi2sdq 8(%rsp), %xmm1, %xmm1                        #30.41
..LN4729:
        vcvtsi2sdq (%rsp), %xmm0, %xmm0                         #30.20
..LN4730:
        vfmadd132sd .L_2il0floatpacket.7(%rip), %xmm0, %xmm1    #30.3
..LN4731:
        vmovsd    %xmm1, (%r15)                                 #30.3
..LN4732:
	.loc    1  31  is_stmt 1

### }

        addq      $168, %rsp                                    #31.1
	.cfi_def_cfa_offset 24
	.cfi_restore 3
..LN4733:
        popq      %rbx                                          #31.1
	.cfi_def_cfa_offset 16
	.cfi_restore 15
..LN4734:
        popq      %r15                                          #31.1
	.cfi_def_cfa_offset 8
..LN4735:
        ret                                                     #31.1
        .align    16,0x90
..LN4736:
                                # LOE
..LN4737:
	.cfi_endproc
# mark_end;
	.type	timing,@function
	.size	timing,.-timing
..LNtiming.4738:
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
	.long	543565088
	.long	543452197
	.word	10
	.type	.L_2__STRING.3,@object
	.size	.L_2__STRING.3,22
	.space 2, 0x00 	# pad
	.align 4
.L_2__STRING.1:
	.long	1145128274
	.byte	0
	.type	.L_2__STRING.1,@object
	.size	.L_2__STRING.1,5
	.data
	.section .note.GNU-stack, ""
# End
