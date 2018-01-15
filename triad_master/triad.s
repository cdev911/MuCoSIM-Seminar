	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.5.239 Build 20170817";
# mark_description "-Ofast -fno-alias -O3 -xHost -qopt-streaming-stores=never -DUSEOMP -qopenmp -qopt-report=5 -fsource-asm -S -";
# mark_description "o triad.s";
	.file "triad.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main, L_main_64__par_loop0_2.2, L_main_80__par_region1_2.3
	.text
# mark_begin;
       .align    16,0x90
	.globl main
# --- main(int, char **)
main:
# parameter 1(argc): %edi
# parameter 2(argv): %rsi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]

### int main(int argc, char* argv[]){

	.cfi_startproc
..___tag_value_main.1:
..L2:
                                                          #39.33
..LN0:
	.file   1 "triad.c"
	.loc    1  39  is_stmt 1
        pushq     %rbp                                          #39.33
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #39.33
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        andq      $-128, %rsp                                   #39.33
..LN3:
        subq      $640, %rsp                                    #39.33
..LN4:
        movq      %rbx, 552(%rsp)                               #39.33[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa8, 0xff, 0xff, 0xff, 0x22
..LN5:
        movl      %edi, %ebx                                    #39.33
..LN6:
        movq      %r12, 544(%rsp)                               #39.33[spill]
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa0, 0xff, 0xff, 0xff, 0x22
..LN7:
        movq      %rsi, %r12                                    #39.33
..LN8:
        movl      $104446, %esi                                 #39.33
..LN9:
        movl      $3, %edi                                      #39.33
..LN10:
        movq      %r15, 520(%rsp)                               #39.33[spill]
..LN11:
        movq      %r14, 528(%rsp)                               #39.33[spill]
..LN12:
        movq      %r13, 536(%rsp)                               #39.33[spill]
..LN13:
        call      __intel_new_feature_proc_init                 #39.33
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
..LN14:
                                # LOE r12 ebx
..B1.98:                        # Preds ..B1.1
                                # Execution count [0.00e+00]
..LN15:
        vstmxcsr  (%rsp)                                        #39.33
..LN16:
        movl      $.2.9_2_kmpc_loc_struct_pack.11, %edi         #39.33
..LN17:
        xorl      %esi, %esi                                    #39.33
..LN18:
        orl       $32832, (%rsp)                                #39.33
..LN19:
        xorl      %eax, %eax                                    #39.33
..LN20:
        vldmxcsr  (%rsp)                                        #39.33
..___tag_value_main.11:
..LN21:
        call      __kmpc_begin                                  #39.33
..___tag_value_main.12:
..LN22:
                                # LOE r12 ebx
..B1.2:                         # Preds ..B1.98
                                # Execution count [1.00e+00]
..LN23:
	.loc    1  41  is_stmt 1

### 
### 	if(argc != 2){

        cmpl      $2, %ebx                                      #41.13
..LN24:
        jne       ..B1.28       # Prob 21%                      #41.13
..LN25:
                                # LOE r12
..B1.3:                         # Preds ..B1.2
                                # Execution count [7.84e-01]
..LN26:
	.file   2 "/usr/include/stdlib.h"
	.loc    2  280  is_stmt 1

### 		printf("please call with correct arguments ./triad [num_elements in each array]\n");
### 		exit(-1);
### 	}
### 	const int avx = 4;
### 	const int unroll = 4;
### 	int num_elements = atoi(argv[1]);
### 	num_elements = num_elements - (num_elements%(avx*unroll));
### 	const int array_size = num_elements*sizeof(real);
### 
### 	real *A; 
### 	real *B; 
### 	real *C; 
### 	real *D;	
### 
### 	A = (real *) _mm_malloc(array_size, 64);
### 	B = (real *) _mm_malloc(array_size, 64);
### 	C = (real *) _mm_malloc(array_size, 64);
### 	D = (real *) _mm_malloc(array_size, 64);
### 	  
### 	__m256d a, b, c, d, tmp;
### 	int i;	
### 
### 	#pragma omp parallel for
### 	for(i = 0; i < num_elements; ++i){
### 		A[i] = 1.01;
### 		B[i] = 1.03;
### 		C[i] = 1.04;
### 		D[i] = 0;
### 	}
### 
### 	//vect triad
### 	int repeat = 1;
### 	double start, end, ct;
### 	int r;
### 
### 	while( (end-start) < 0.1){
### 		#pragma inline
### 		timing(&start, &ct);
### 		#pragma omp parallel private (r, i)
### 		for(r = 0; r < repeat; ++r){
### 			
### 			#pragma omp for
### 			#pragma unroll(4)
### 			#pragma loop_count(1600)
### 			for(i = 0; i < num_elements-4; i+=4){
### 				//D[i] = A[i] + B[i] * C[i];
### 				c = _mm256_load_pd(C + i);
### 				b = _mm256_load_pd(B + i);
### 				a = _mm256_load_pd(A + i);
### 				tmp = _mm256_mul_pd(b, c);
### 				d = _mm256_add_pd(tmp, a);
### 				_mm256_store_pd(D + i, d);
### 			}
### 			if(A[i]<0) printf("stop\n");
### 		}
### 		#pragma inline	
### 		timing(&end, &ct);
### 		repeat *= 2;
### 	}
### 	repeat /= 2;
### 
### 	printf(", %d, %f\n", num_elements, (2.0*repeat*num_elements)/(end-start)/1000000.0);
### 
### 
### 	_mm_free(A);
### 	_mm_free(B);
### 	_mm_free(C);
### 	_mm_free(D);
### }
 movq 8(%r12), %rcx #280.16
..LN27:
        call      __intel_sse4_atol                             #280.16
..LN28:
                                # LOE rax
..B1.4:                         # Preds ..B1.3
                                # Execution count [7.84e-01]
..LN29:
	.loc    1  48  is_stmt 1
        movl      %eax, %edx                                    #48.46
..LN30:
        andl      $-2147483633, %edx                            #48.46
..LN31:
        jge       ..B1.96       # Prob 50%                      #48.46
..LN32:
                                # LOE eax edx
..B1.97:                        # Preds ..B1.4
                                # Execution count [7.84e-01]
..LN33:
        subl      $1, %edx                                      #48.46
..LN34:
        orl       $-16, %edx                                    #48.46
..LN35:
        incl      %edx                                          #48.46
..LN36:
                                # LOE eax edx
..B1.96:                        # Preds ..B1.4 ..B1.97
                                # Execution count [7.84e-01]
..LN37:
        subl      %edx, %eax                                    #48.17
..LN38:
	.loc    1  56  is_stmt 1
        movl      $64, %esi                                     #56.15
..LN39:
	.loc    1  48  is_stmt 1
        movl      %eax, 480(%rsp)                               #48.2
..LN40:
	.loc    1  49  is_stmt 1
        movslq    %eax, %rax                                    #49.25
..LN41:
        shlq      $3, %rax                                      #49.38
..LN42:
        movslq    %eax, %rbx                                    #49.38
..LN43:
	.loc    1  56  is_stmt 1
        movq      %rbx, %rdi                                    #56.15
..LN44:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #56.15
..LN45:
                                # LOE rax rbx
..B1.5:                         # Preds ..B1.96
                                # Execution count [7.84e-01]
..LN46:
	.loc    1  57  is_stmt 1
        movq      %rbx, %rdi                                    #57.15
..LN47:
        movl      $64, %esi                                     #57.15
..LN48:
	.loc    1  56  is_stmt 1
        movq      %rax, 448(%rsp)                               #56.2
..LN49:
	.loc    1  57  is_stmt 1
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #57.15
..LN50:
                                # LOE rax rbx
..B1.6:                         # Preds ..B1.5
                                # Execution count [7.84e-01]
..LN51:
	.loc    1  58  is_stmt 1
        movq      %rbx, %rdi                                    #58.15
..LN52:
        movl      $64, %esi                                     #58.15
..LN53:
	.loc    1  57  is_stmt 1
        movq      %rax, 456(%rsp)                               #57.2
..LN54:
	.loc    1  58  is_stmt 1
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #58.15
..LN55:
                                # LOE rax rbx
..B1.7:                         # Preds ..B1.6
                                # Execution count [7.84e-01]
..LN56:
	.loc    1  59  is_stmt 1
        movq      %rbx, %rdi                                    #59.15
..LN57:
        movl      $64, %esi                                     #59.15
..LN58:
	.loc    1  58  is_stmt 1
        movq      %rax, 464(%rsp)                               #58.2
..LN59:
	.loc    1  59  is_stmt 1
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #59.15
..LN60:
                                # LOE rax
..B1.8:                         # Preds ..B1.7
                                # Execution count [7.84e-01]
..LN61:
	.loc    1  64  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.22, %edi         #64.2
..LN62:
	.loc    1  59  is_stmt 1
        movq      %rax, 472(%rsp)                               #59.2
..LN63:
	.loc    1  64  is_stmt 1
        call      __kmpc_global_thread_num                      #64.2
..LN64:
                                # LOE eax
..B1.105:                       # Preds ..B1.8
                                # Execution count [7.84e-01]
..LN65:
        movl      %eax, 484(%rsp)                               #64.2
..LN66:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #64.2
..LN67:
        xorl      %eax, %eax                                    #64.2
..___tag_value_main.13:
..LN68:
        call      __kmpc_ok_to_fork                             #64.2
..___tag_value_main.14:
..LN69:
                                # LOE eax
..B1.9:                         # Preds ..B1.105
                                # Execution count [7.84e-01]
..LN70:
        testl     %eax, %eax                                    #64.2
..LN71:
        je        ..B1.11       # Prob 50%                      #64.2
..LN72:
                                # LOE
..B1.10:                        # Preds ..B1.9
                                # Execution count [0.00e+00]
..LN73:
        movl      $L_main_64__par_loop0_2.2, %edx               #64.2
..LN74:
        lea       472(%rsp), %rbx                               #64.2
..LN75:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #64.2
..LN76:
        lea       8(%rbx), %r13                                 #64.2
..LN77:
        movl      $5, %esi                                      #64.2
..LN78:
        lea       -24(%rbx), %r14                               #64.2
..LN79:
        movq      %r13, %rcx                                    #64.2
..LN80:
        lea       -16(%rbx), %r15                               #64.2
..LN81:
        movq      %r14, %r8                                     #64.2
..LN82:
        lea       -8(%rbx), %r12                                #64.2
..LN83:
        pushq     %rbx                                          #64.2
..LN84:
        movq      %r15, %r9                                     #64.2
..LN85:
        xorl      %eax, %eax                                    #64.2
..LN86:
        pushq     %r12                                          #64.2
..___tag_value_main.15:
..LN87:
        call      __kmpc_fork_call                              #64.2
..___tag_value_main.16:
..LN88:
                                # LOE rbx r12 r13 r14 r15
..B1.106:                       # Preds ..B1.10
                                # Execution count [0.00e+00]
..LN89:
        addq      $16, %rsp                                     #64.2
..LN90:
        jmp       ..B1.14       # Prob 100%                     #64.2
..LN91:
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.9
                                # Execution count [0.00e+00]
..LN92:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #64.2
..LN93:
        xorl      %eax, %eax                                    #64.2
..LN94:
        movl      484(%rsp), %esi                               #64.2
..___tag_value_main.17:
..LN95:
        call      __kmpc_serialized_parallel                    #64.2
..___tag_value_main.18:
..LN96:
                                # LOE
..B1.12:                        # Preds ..B1.11
                                # Execution count [0.00e+00]
..LN97:
        addq      $-16, %rsp                                    #64.2
..LN98:
        movl      $___kmpv_zeromain_0, %esi                     #64.2
..LN99:
        lea       496(%rsp), %r13                               #64.2
..LN100:
        movq      %r13, %rdx                                    #64.2
..LN101:
        lea       -32(%r13), %r14                               #64.2
..LN102:
        movq      %r14, %rcx                                    #64.2
..LN103:
        lea       -24(%r13), %r15                               #64.2
..LN104:
        movq      %r15, %r8                                     #64.2
..LN105:
        lea       -16(%r13), %r12                               #64.2
..LN106:
        movq      %r12, %r9                                     #64.2
..LN107:
        lea       20(%r12), %rdi                                #64.2
..LN108:
        lea       -12(%rdi), %rbx                               #64.2
..LN109:
        movq      %rbx, (%rsp)                                  #64.2
..___tag_value_main.19:
..LN110:
        call      L_main_64__par_loop0_2.2                      #64.2
..___tag_value_main.20:
..LN111:
                                # LOE rbx r12 r13 r14 r15
..B1.107:                       # Preds ..B1.12
                                # Execution count [0.00e+00]
..LN112:
        addq      $16, %rsp                                     #64.2
..LN113:
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.107
                                # Execution count [0.00e+00]
..LN114:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #64.2
..LN115:
        xorl      %eax, %eax                                    #64.2
..LN116:
        movl      484(%rsp), %esi                               #64.2
..___tag_value_main.21:
..LN117:
        call      __kmpc_end_serialized_parallel                #64.2
..___tag_value_main.22:
..LN118:
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.106 ..B1.13
                                # Execution count [7.84e-01]
..LN119:
	.loc    1  77  is_stmt 1
        vmovsd    .L_2il0floatpacket.10(%rip), %xmm1            #77.23
..LN120:
	.loc    1  73  is_stmt 1
        movl      $1, %eax                                      #73.13
..LN121:
	.loc    1  77  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #77.2
..LN122:
        vcomisd   %xmm0, %xmm1                                  #77.23
..LN123:
        jbe       ..B1.90       # Prob 10%                      #77.23
..LN124:
                                # LOE rbx r12 r13 r14 r15 eax xmm0 xmm1
..B1.15:                        # Preds ..B1.14
                                # Execution count [7.05e-01]
..LN125:
	.loc    1  32  is_stmt 1
        vmovsd    .L_2il0floatpacket.11(%rip), %xmm3            #32.43
..LN126:
	.loc    1  73  is_stmt 1
        movl      $1, 584(%rsp)                                 #73.13
..LN127:
	.loc    1  32  is_stmt 1
        vmovsd    %xmm3, 560(%rsp)                              #32.43[spill]
..LN128:
        jmp       ..B1.16       # Prob 100%                     #32.43
..LN129:
                                # LOE rbx r12 r13 r14 r15
..B1.27:                        # Preds ..B1.26
                                # Execution count [3.21e+00]
..LN130:
	.loc    1  73  is_stmt 1
        movl      %eax, 584(%rsp)                               #73.13
..LN131:
                                # LOE rbx r12 r13 r14 r15
..B1.16:                        # Preds ..B1.15 ..B1.27
                                # Execution count [3.92e+00]
..LN132:
	.loc    1  31  is_stmt 1
        xorl      %esi, %esi                                    #31.2
..LN133:
        lea       488(%rsp), %rdi                               #31.2
..LN134:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #31.2
..LN135:
                                # LOE rbx r12 r13 r14 r15
..B1.17:                        # Preds ..B1.16
                                # Execution count [3.92e+00]
..LN136:
	.loc    1  32  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #32.32
..LN137:
        vxorpd    %xmm1, %xmm1, %xmm1                           #32.20
..LN138:
        vcvtsi2sdq 496(%rsp), %xmm0, %xmm0                      #32.32
..LN139:
        vcvtsi2sdq 488(%rsp), %xmm1, %xmm1                      #32.20
..LN140:
        vmulsd    560(%rsp), %xmm0, %xmm2                       #32.43[spill]
..LN141:
	.loc    1  34  is_stmt 1
        xorl      %edi, %edi                                    #34.2
..LN142:
        lea       160(%rsp), %rsi                               #34.2
..LN143:
	.loc    1  32  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #32.43
..LN144:
        vmovsd    %xmm3, 408(%rsi)                              #32.43[spill]
..LN145:
	.loc    1  34  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #34.2
..LN146:
                                # LOE rbx r12 r13 r14 r15
..B1.18:                        # Preds ..B1.17
                                # Execution count [3.92e+00]
..LN147:
	.loc    1  80  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #80.3
..LN148:
        xorl      %eax, %eax                                    #80.3
..___tag_value_main.23:
..LN149:
        call      __kmpc_ok_to_fork                             #80.3
..___tag_value_main.24:
..LN150:
                                # LOE rbx r12 r13 r14 r15 eax
..B1.19:                        # Preds ..B1.18
                                # Execution count [3.92e+00]
..LN151:
        testl     %eax, %eax                                    #80.3
..LN152:
        je        ..B1.21       # Prob 50%                      #80.3
..LN153:
                                # LOE rbx r12 r13 r14 r15
..B1.20:                        # Preds ..B1.19
                                # Execution count [0.00e+00]
..LN154:
        pushq     %rbx                                          #80.3
..LN155:
        movl      $L_main_80__par_region1_2.3, %edx             #80.3
..LN156:
        lea       136(%rsp), %r10                               #80.3
..LN157:
        pushq     %r10                                          #80.3
..LN158:
        movq      %r13, %r8                                     #80.3
..LN159:
        lea       -32(%r10), %r11                               #80.3
..LN160:
        pushq     %r11                                          #80.3
..LN161:
        pushq     %r14                                          #80.3
..LN162:
        xorl      %eax, %eax                                    #80.3
..LN163:
        lea       -64(%r10), %rsi                               #80.3
..LN164:
        pushq     %rsi                                          #80.3
..LN165:
        pushq     %r15                                          #80.3
..LN166:
        movl      $11, %esi                                     #80.3
..LN167:
        lea       -96(%r10), %rdi                               #80.3
..LN168:
        pushq     %rdi                                          #80.3
..LN169:
        pushq     %r12                                          #80.3
..LN170:
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #80.3
..LN171:
        lea       456(%r10), %rcx                               #80.3
..LN172:
        lea       64(%rsp), %r9                                 #80.3
..___tag_value_main.25:
..LN173:
        call      __kmpc_fork_call                              #80.3
..___tag_value_main.26:
..LN174:
                                # LOE rbx r12 r13 r14 r15
..B1.109:                       # Preds ..B1.20
                                # Execution count [0.00e+00]
..LN175:
        addq      $64, %rsp                                     #80.3
..LN176:
        jmp       ..B1.24       # Prob 100%                     #80.3
..LN177:
                                # LOE rbx r12 r13 r14 r15
..B1.21:                        # Preds ..B1.19
                                # Execution count [0.00e+00]
..LN178:
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #80.3
..LN179:
        xorl      %eax, %eax                                    #80.3
..LN180:
        movl      484(%rsp), %esi                               #80.3
..___tag_value_main.27:
..LN181:
        call      __kmpc_serialized_parallel                    #80.3
..___tag_value_main.28:
..LN182:
                                # LOE rbx r12 r13 r14 r15
..B1.22:                        # Preds ..B1.21
                                # Execution count [0.00e+00]
..LN183:
        addq      $-64, %rsp                                    #80.3
..LN184:
        movl      $___kmpv_zeromain_1, %esi                     #80.3
..LN185:
        movq      %r13, %rcx                                    #80.3
..LN186:
        lea       96(%rsp), %rax                                #80.3
..LN187:
        movq      %r12, %r9                                     #80.3
..LN188:
        lea       32(%rax), %r10                                #80.3
..LN189:
        lea       64(%rax), %r11                                #80.3
..LN190:
        movq      %rax, (%rsp)                                  #80.3
..LN191:
        lea       96(%rax), %rdi                                #80.3
..LN192:
        movq      %r15, 8(%rsp)                                 #80.3
..LN193:
        lea       552(%rax), %rdx                               #80.3
..LN194:
        movq      %r10, 16(%rsp)                                #80.3
..LN195:
        lea       64(%rsp), %r8                                 #80.3
..LN196:
        movq      %r14, 24(%rsp)                                #80.3
..LN197:
        movq      %r11, 32(%rsp)                                #80.3
..LN198:
        movq      %rdi, 40(%rsp)                                #80.3
..LN199:
        lea       452(%rax), %rdi                               #80.3
..LN200:
        movq      %rbx, 48(%rsp)                                #80.3
..___tag_value_main.29:
..LN201:
        call      L_main_80__par_region1_2.3                    #80.3
..___tag_value_main.30:
..LN202:
                                # LOE rbx r12 r13 r14 r15
..B1.110:                       # Preds ..B1.22
                                # Execution count [0.00e+00]
..LN203:
        addq      $64, %rsp                                     #80.3
..LN204:
                                # LOE rbx r12 r13 r14 r15
..B1.23:                        # Preds ..B1.110
                                # Execution count [0.00e+00]
..LN205:
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #80.3
..LN206:
        xorl      %eax, %eax                                    #80.3
..LN207:
        movl      484(%rsp), %esi                               #80.3
..___tag_value_main.31:
..LN208:
        call      __kmpc_end_serialized_parallel                #80.3
..___tag_value_main.32:
..LN209:
                                # LOE rbx r12 r13 r14 r15
..B1.24:                        # Preds ..B1.109 ..B1.23
                                # Execution count [3.92e+00]
..LN210:
	.loc    1  31  is_stmt 1
        xorl      %esi, %esi                                    #31.2
..LN211:
        lea       504(%rsp), %rdi                               #31.2
..LN212:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #31.2
..LN213:
                                # LOE rbx r12 r13 r14 r15
..B1.25:                        # Preds ..B1.24
                                # Execution count [3.92e+00]
..LN214:
	.loc    1  32  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #32.32
..LN215:
        vxorpd    %xmm1, %xmm1, %xmm1                           #32.20
..LN216:
        vcvtsi2sdq 512(%rsp), %xmm0, %xmm0                      #32.32
..LN217:
        vcvtsi2sdq 504(%rsp), %xmm1, %xmm1                      #32.20
..LN218:
        vmulsd    560(%rsp), %xmm0, %xmm2                       #32.43[spill]
..LN219:
	.loc    1  34  is_stmt 1
        xorl      %edi, %edi                                    #34.2
..LN220:
        lea       304(%rsp), %rsi                               #34.2
..LN221:
	.loc    1  32  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #32.43
..LN222:
        vmovsd    %xmm3, 272(%rsi)                              #32.43[spill]
..LN223:
	.loc    1  34  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #34.2
..LN224:
                                # LOE rbx r12 r13 r14 r15
..B1.26:                        # Preds ..B1.25
                                # Execution count [3.92e+00]
..LN225:
	.loc    1  77  is_stmt 1
        vmovsd    576(%rsp), %xmm0                              #77.14[spill]
..LN226:
        vmovsd    .L_2il0floatpacket.10(%rip), %xmm1            #77.23
..LN227:
	.loc    1  99  is_stmt 1
        movl      584(%rsp), %eax                               #99.3
..LN228:
        addl      %eax, %eax                                    #99.3
..LN229:
	.loc    1  77  is_stmt 1
        vsubsd    568(%rsp), %xmm0, %xmm0                       #77.14[spill]
..LN230:
        vcomisd   %xmm0, %xmm1                                  #77.23
..LN231:
        ja        ..B1.27       # Prob 82%                      #77.23
..LN232:
        jmp       ..B1.82       # Prob 100%                     #77.23
..LN233:
                                # LOE rbx r12 r13 r14 r15 eax xmm0
..B1.28:                        # Preds ..B1.2
                                # Execution count [2.16e-01]
..LN234:
	.loc    1  42  is_stmt 1
        movl      $il0_peep_printf_format_0, %edi               #42.3
..LN235:
        call      puts                                          #42.3
..LN236:
                                # LOE
..B1.29:                        # Preds ..B1.28
                                # Execution count [2.16e-01]
..LN237:
	.loc    1  43  is_stmt 1
        movl      $-1, %edi                                     #43.3
..LN238:
#       exit(int)
        call      exit                                          #43.3
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
..LN239:
                                # LOE
L_main_80__par_region1_2.3:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
# parameter 7: 16 + %rbp
# parameter 8: 24 + %rbp
# parameter 9: 32 + %rbp
# parameter 10: 40 + %rbp
# parameter 11: 48 + %rbp
# parameter 12: 56 + %rbp
# parameter 13: 64 + %rbp
..B1.30:                        # Preds ..B1.0
                                # Execution count [3.92e+00]
..LN240:
	.loc    1  80  is_stmt 1
        pushq     %rbp                                          #80.3
	.cfi_def_cfa 7, 16
..LN241:
        movq      %rsp, %rbp                                    #80.3
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN242:
        andq      $-128, %rsp                                   #80.3
..LN243:
        subq      $640, %rsp                                    #80.3
..LN244:
        movq      %r15, 520(%rsp)                               #80.3[spill]
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
..LN245:
	.loc    1  81  is_stmt 1
        xorl      %r15d, %r15d                                  #81.3
..LN246:
	.loc    1  80  is_stmt 1
        movl      (%rdx), %esi                                  #80.3
..LN247:
        movq      %rbx, 552(%rsp)                               #80.3[spill]
..LN248:
        movq      %r13, 536(%rsp)                               #80.3[spill]
..LN249:
        movq      %r14, 528(%rsp)                               #80.3[spill]
..LN250:
        movq      %r12, 544(%rsp)                               #80.3[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
..LN251:
	.loc    1  81  is_stmt 1
        xorl      %r12d, %r12d                                  #81.3
..LN252:
	.loc    1  80  is_stmt 1
        movl      (%rdi), %r13d                                 #80.3
..LN253:
        movl      (%rcx), %ebx                                  #80.3
..LN254:
	.loc    1  81  is_stmt 1
        testl     %esi, %esi                                    #81.18
..LN255:
        jle       ..B1.58       # Prob 9%                       #81.18
..LN256:
                                # LOE r8 r9 ebx esi r12d r13d r15d
..B1.31:                        # Preds ..B1.30
                                # Execution count [3.53e+00]
..LN257:
	.loc    1  80  is_stmt 1
        movq      16(%rbp), %r14                                #80.3
..LN258:
	.loc    1  86  is_stmt 1
        lea       -4(%rbx), %eax                                #86.8
..LN259:
	.loc    1  80  is_stmt 1
        movq      24(%rbp), %r11                                #80.3
..LN260:
	.loc    1  86  is_stmt 1
        addl      $-5, %ebx                                     #86.8
..LN261:
	.loc    1  80  is_stmt 1
        movq      32(%rbp), %r10                                #80.3
..LN262:
	.loc    1  95  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #95.12
..LN263:
	.loc    1  80  is_stmt 1
        movq      56(%rbp), %rcx                                #80.3
..LN264:
	.loc    1  86  is_stmt 1
        vmovupd   %ymm1, (%rsp)                                 #86.8[spill]
..LN265:
        vmovupd   %ymm2, 96(%rsp)                               #86.8[spill]
..LN266:
        vmovupd   %ymm3, 32(%rsp)                               #86.8[spill]
..LN267:
        vmovupd   %ymm4, 64(%rsp)                               #86.8[spill]
..LN268:
        vmovupd   %ymm5, 128(%rsp)                              #86.8[spill]
..LN269:
        movl      %eax, 192(%rsp)                               #86.8[spill]
..LN270:
        movl      %r15d, 200(%rsp)                              #86.8[spill]
..LN271:
        movl      %esi, 184(%rsp)                               #86.8[spill]
..LN272:
        movq      %r8, 168(%rsp)                                #86.8[spill]
..LN273:
        movq      %r9, 176(%rsp)                                #86.8[spill]
..LN274:
                                # LOE ebx r12d r13d
..B1.32:                        # Preds ..B1.56 ..B1.31
                                # Execution count [1.96e+01]
..LN275:
        cmpl      $0, 192(%rsp)                                 #86.40[spill]
..LN276:
        jle       ..B1.53       # Prob 10%                      #86.40
..LN277:
                                # LOE ebx r12d r13d
..B1.33:                        # Preds ..B1.32
                                # Execution count [2.82e+04]
..LN278:
	.loc    1  83  is_stmt 1
        movl      $4, %r10d                                     #83.4
..LN279:
        movl      $.2.9_2_kmpc_loc_struct_pack.63, %edi         #83.4
..LN280:
        movl      %r12d, 208(%rsp)                              #83.4
..LN281:
        movl      %r13d, %esi                                   #83.4
..LN282:
        movl      %ebx, 212(%rsp)                               #83.4
..LN283:
        movl      $34, %edx                                     #83.4
..LN284:
        movl      %r12d, 216(%rsp)                              #83.4
..LN285:
        movl      %r10d, 220(%rsp)                              #83.4
..LN286:
        addq      $-32, %rsp                                    #83.4
..LN287:
        lea       248(%rsp), %rcx                               #83.4
..LN288:
        lea       240(%rsp), %r8                                #83.4
..LN289:
        lea       244(%rsp), %r9                                #83.4
..LN290:
        lea       252(%rsp), %rax                               #83.4
..LN291:
        movq      %rax, (%rsp)                                  #83.4
..LN292:
        movl      %r10d, 8(%rsp)                                #83.4
..LN293:
        movl      $1, 16(%rsp)                                  #83.4
..LN294:
        vzeroupper                                              #83.4
..LN295:
        call      __kmpc_for_static_init_4                      #83.4
..LN296:
                                # LOE ebx r12d r13d
..B1.111:                       # Preds ..B1.33
                                # Execution count [2.82e+04]
..LN297:
        addq      $32, %rsp                                     #83.4
..LN298:
                                # LOE ebx r12d r13d
..B1.34:                        # Preds ..B1.111
                                # Execution count [0.00e+00]
..LN299:
        movl      208(%rsp), %r14d                              #83.4
..LN300:
        movl      212(%rsp), %edx                               #83.4
..LN301:
        cmpl      %ebx, %r14d                                   #83.4
..LN302:
        jg        ..B1.52       # Prob 50%                      #83.4
..LN303:
                                # LOE edx ebx r12d r13d r14d
..B1.35:                        # Preds ..B1.34
                                # Execution count [0.00e+00]
..LN304:
        cmpl      %ebx, %edx                                    #83.4
..LN305:
        cmovge    %ebx, %edx                                    #83.4
..LN306:
	.loc    1  86  is_stmt 1
        cmpl      %edx, %r14d                                   #86.40
..LN307:
        jg        ..B1.52       # Prob 50%                      #86.40
..LN308:
                                # LOE edx ebx r12d r13d r14d
..B1.36:                        # Preds ..B1.35
                                # Execution count [1.76e+01]
..LN309:
	.loc    1  90  is_stmt 1
        movq      40(%rbp), %r11                                #90.24
..LN310:
	.loc    1  89  is_stmt 1
        movq      24(%rbp), %r9                                 #89.24
..LN311:
	.loc    1  93  is_stmt 1
        movq      64(%rbp), %rax                                #93.21
..LN312:
	.loc    1  88  is_stmt 1
        movq      176(%rsp), %r10                               #88.24[spill]
..LN313:
	.loc    1  90  is_stmt 1
        movq      (%r11), %r11                                  #90.24
..LN314:
	.loc    1  89  is_stmt 1
        movq      (%r9), %r9                                    #89.24
..LN315:
	.loc    1  88  is_stmt 1
        movq      (%r10), %r10                                  #88.24
..LN316:
	.loc    1  93  is_stmt 1
        movq      (%rax), %r8                                   #93.21
..LN317:
	.loc    1  83  is_stmt 1
        movl      $1, %eax                                      #83.4
..LN318:
                                # LOE r8 r9 r10 r11 eax edx ebx r12d r13d r14d
..B1.40:                        # Preds ..B1.36
                                # Execution count [1.76e+01]
..LN319:
        movl      %edx, %ecx                                    #83.4
..LN320:
        movl      %r12d, %edi                                   #83.4
..LN321:
        subl      %r14d, %ecx                                   #83.4
..LN322:
        addl      $4, %ecx                                      #83.4
..LN323:
        sarl      $1, %ecx                                      #83.4
..LN324:
        shrl      $30, %ecx                                     #83.4
..LN325:
        subl      %r14d, %ecx                                   #83.4
..LN326:
        lea       4(%rcx,%rdx), %r15d                           #83.4
..LN327:
	.loc    1  88  is_stmt 1
        xorl      %edx, %edx                                    #88.9
..LN328:
	.loc    1  83  is_stmt 1
        sarl      $2, %r15d                                     #83.4
..LN329:
        movl      %r15d, %ecx                                   #83.4
..LN330:
        shrl      $2, %ecx                                      #83.4
..LN331:
        testl     %ecx, %ecx                                    #83.4
..LN332:
        jbe       ..B1.47       # Prob 0%                       #83.4
..LN333:
                                # LOE rdx r8 r9 r10 r11 eax ecx ebx edi r12d r13d r14d r15d
..B1.41:                        # Preds ..B1.40
                                # Execution count [1.76e+01]
..LN334:
	.loc    1  88  is_stmt 1
        movslq    %r14d, %r14                                   #88.24
..LN335:
	.loc    1  93  is_stmt 1
        movl      %r13d, 160(%rsp)                              #93.21[spill]
..LN336:
	.loc    1  89  is_stmt 1
        lea       (%r9,%r14,8), %rsi                            #89.24
..LN337:
	.loc    1  93  is_stmt 1
        movq      %rsi, %r13                                    #93.21
..LN338:
	.loc    1  90  is_stmt 1
        lea       (%r11,%r14,8), %rsi                           #90.24
..LN339:
	.loc    1  88  is_stmt 1
        lea       (%r10,%r14,8), %rax                           #88.24
..LN340:
	.loc    1  93  is_stmt 1
        movq      %rsi, %r12                                    #93.21
..LN341:
        lea       (%r8,%r14,8), %rsi                            #93.21
        .align    16,0x90
..LN342:
                                # LOE rax rdx rsi r8 r9 r10 r11 r12 r13 ecx ebx edi r14d r15d
..B1.42:                        # Preds ..B1.42 ..B1.41
                                # Execution count [7.05e+03]
..LN343:
	.loc    1  89  is_stmt 1
        vmovupd   (%r13,%rdx,8), %ymm0                          #89.24
..LN344:
	.loc    1  83  is_stmt 1
        incl      %edi                                          #83.4
..LN345:
	.loc    1  89  is_stmt 1
        vmovupd   32(%r13,%rdx,8), %ymm3                        #89.24
..LN346:
        vmovupd   64(%r13,%rdx,8), %ymm6                        #89.24
..LN347:
	.loc    1  91  is_stmt 1
        vmulpd    (%rax,%rdx,8), %ymm0, %ymm1                   #91.11
..LN348:
	.loc    1  88  is_stmt 1
        vmovupd   96(%rax,%rdx,8), %ymm0                        #88.24
..LN349:
	.loc    1  91  is_stmt 1
        vmulpd    32(%rax,%rdx,8), %ymm3, %ymm4                 #91.11
..LN350:
        vmulpd    64(%rax,%rdx,8), %ymm6, %ymm7                 #91.11
..LN351:
	.loc    1  92  is_stmt 1
        vaddpd    (%r12,%rdx,8), %ymm1, %ymm2                   #92.9
..LN352:
        vaddpd    32(%r12,%rdx,8), %ymm4, %ymm5                 #92.9
..LN353:
        vaddpd    64(%r12,%rdx,8), %ymm7, %ymm8                 #92.9
..LN354:
	.loc    1  89  is_stmt 1
        vmovupd   96(%r13,%rdx,8), %ymm1                        #89.24
..LN355:
	.loc    1  93  is_stmt 1
        vmovupd   %ymm2, (%rsi,%rdx,8)                          #93.21
..LN356:
	.loc    1  90  is_stmt 1
        vmovupd   96(%r12,%rdx,8), %ymm2                        #90.24
..LN357:
	.loc    1  93  is_stmt 1
        vmovupd   %ymm5, 32(%rsi,%rdx,8)                        #93.21
..LN358:
        vmovupd   %ymm8, 64(%rsi,%rdx,8)                        #93.21
..LN359:
	.loc    1  91  is_stmt 1
        vmulpd    %ymm0, %ymm1, %ymm3                           #91.11
..LN360:
	.loc    1  92  is_stmt 1
        vaddpd    %ymm3, %ymm2, %ymm4                           #92.9
..LN361:
	.loc    1  93  is_stmt 1
        vmovupd   %ymm4, 96(%rsi,%rdx,8)                        #93.21
..LN362:
	.loc    1  83  is_stmt 1
        addq      $16, %rdx                                     #83.4
..LN363:
        cmpl      %ecx, %edi                                    #83.4
..LN364:
        jb        ..B1.42       # Prob 99%                      #83.4
..LN365:
                                # LOE rax rdx rsi r8 r9 r10 r11 r12 r13 ecx ebx edi r14d r15d ymm0 ymm1 ymm2 ymm3 ymm4
..B1.43:                        # Preds ..B1.42
                                # Execution count [1.76e+01]
..LN366:
        vmovupd   %ymm0, (%rsp)                                 #[spill]
..LN367:
        xorl      %r12d, %r12d                                  #
..LN368:
        vmovupd   %ymm1, 96(%rsp)                               #[spill]
..LN369:
        vmovupd   %ymm2, 32(%rsp)                               #[spill]
..LN370:
        vmovupd   %ymm3, 64(%rsp)                               #[spill]
..LN371:
        vmovupd   %ymm4, 128(%rsp)                              #[spill]
..LN372:
        movl      160(%rsp), %r13d                              #[spill]
..LN373:
	.loc    1  88  is_stmt 1
        lea       1(,%rdi,4), %eax                              #88.9
..LN374:
                                # LOE r8 r9 r10 r11 eax ebx r12d r13d r14d r15d
..B1.47:                        # Preds ..B1.40 ..B1.43
                                # Execution count [1.76e+01]
..LN375:
	.loc    1  83  is_stmt 1
        decl      %eax                                          #83.4
..LN376:
        cmpl      %r15d, %eax                                   #83.4
..LN377:
        jae       ..B1.51       # Prob 0%                       #83.4
..LN378:
                                # LOE r8 r9 r10 r11 eax ebx r12d r13d r14d r15d
..B1.48:                        # Preds ..B1.47
                                # Execution count [1.76e+01]
..LN379:
	.loc    1  88  is_stmt 1
        movslq    %r14d, %r14                                   #88.24
..LN380:
        lea       (%r10,%r14,8), %rdx                           #88.24
..LN381:
	.loc    1  89  is_stmt 1
        lea       (%r9,%r14,8), %r9                             #89.24
..LN382:
	.loc    1  90  is_stmt 1
        lea       (%r11,%r14,8), %rdi                           #90.24
..LN383:
	.loc    1  93  is_stmt 1
        lea       (%r8,%r14,8), %rcx                            #93.21
..LN384:
                                # LOE rdx rcx rdi r9 eax ebx r12d r13d r15d
..B1.49:                        # Preds ..B1.49 ..B1.48
                                # Execution count [5.29e+01]
..LN385:
	.loc    1  88  is_stmt 1
        lea       (,%rax,4), %r8d                               #88.24
..LN386:
	.loc    1  83  is_stmt 1
        incl      %eax                                          #83.4
..LN387:
	.loc    1  88  is_stmt 1
        movslq    %r8d, %r8                                     #88.24
..LN388:
        vmovupd   (%rdx,%r8,8), %ymm0                           #88.24
..LN389:
	.loc    1  89  is_stmt 1
        vmovupd   (%r9,%r8,8), %ymm1                            #89.24
..LN390:
	.loc    1  90  is_stmt 1
        vmovupd   (%rdi,%r8,8), %ymm2                           #90.24
..LN391:
	.loc    1  91  is_stmt 1
        vmulpd    %ymm0, %ymm1, %ymm3                           #91.11
..LN392:
	.loc    1  92  is_stmt 1
        vaddpd    %ymm3, %ymm2, %ymm4                           #92.9
..LN393:
	.loc    1  93  is_stmt 1
        vmovupd   %ymm4, (%rcx,%r8,8)                           #93.21
..LN394:
	.loc    1  83  is_stmt 1
        cmpl      %r15d, %eax                                   #83.4
..LN395:
        jb        ..B1.49       # Prob 66%                      #83.4
..LN396:
                                # LOE rdx rcx rdi r9 eax ebx r12d r13d r15d ymm0 ymm1 ymm2 ymm3 ymm4
..B1.50:                        # Preds ..B1.49
                                # Execution count [1.76e+01]
..LN397:
        vmovupd   %ymm0, (%rsp)                                 #[spill]
..LN398:
        vmovupd   %ymm1, 96(%rsp)                               #[spill]
..LN399:
        vmovupd   %ymm2, 32(%rsp)                               #[spill]
..LN400:
        vmovupd   %ymm3, 64(%rsp)                               #[spill]
..LN401:
        vmovupd   %ymm4, 128(%rsp)                              #[spill]
..LN402:
                                # LOE ebx r12d r13d
..B1.51:                        # Preds ..B1.50 ..B1.47
                                # Execution count [1.76e+01]
..LN403:
	.loc    1  88  is_stmt 1
        vmovupd   (%rsp), %ymm0                                 #88.5[spill]
..LN404:
	.loc    1  89  is_stmt 1
        vmovupd   96(%rsp), %ymm1                               #89.5[spill]
..LN405:
	.loc    1  90  is_stmt 1
        vmovupd   32(%rsp), %ymm2                               #90.5[spill]
..LN406:
	.loc    1  91  is_stmt 1
        vmovupd   64(%rsp), %ymm3                               #91.5[spill]
..LN407:
	.loc    1  92  is_stmt 1
        vmovupd   128(%rsp), %ymm4                              #92.5[spill]
..LN408:
	.loc    1  88  is_stmt 1
        movq      168(%rsp), %rax                               #88.5[spill]
..LN409:
	.loc    1  89  is_stmt 1
        movq      16(%rbp), %rdx                                #89.5
..LN410:
	.loc    1  90  is_stmt 1
        movq      32(%rbp), %rcx                                #90.5
..LN411:
	.loc    1  91  is_stmt 1
        movq      48(%rbp), %rdi                                #91.5
..LN412:
	.loc    1  92  is_stmt 1
        movq      56(%rbp), %r8                                 #92.5
..LN413:
	.loc    1  88  is_stmt 1
        vmovupd   %ymm0, (%rax)                                 #88.5
..LN414:
	.loc    1  89  is_stmt 1
        vmovupd   %ymm1, (%rdx)                                 #89.5
..LN415:
	.loc    1  90  is_stmt 1
        vmovupd   %ymm2, (%rcx)                                 #90.5
..LN416:
	.loc    1  91  is_stmt 1
        vmovupd   %ymm3, (%rdi)                                 #91.5
..LN417:
	.loc    1  92  is_stmt 1
        vmovupd   %ymm4, (%r8)                                  #92.5
..LN418:
                                # LOE ebx r12d r13d
..B1.52:                        # Preds ..B1.51 ..B1.35 ..B1.34
                                # Execution count [0.00e+00]
..LN419:
	.loc    1  83  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.63, %edi         #83.4
..LN420:
        movl      %r13d, %esi                                   #83.4
..LN421:
        vzeroupper                                              #83.4
..LN422:
        call      __kmpc_for_static_fini                        #83.4
..LN423:
                                # LOE ebx r12d r13d
..B1.53:                        # Preds ..B1.52 ..B1.32
                                # Execution count [0.00e+00]
..LN424:
	.loc    1  94  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.81, %edi         #94.4
..LN425:
        movl      %r13d, %esi                                   #94.4
..LN426:
        xorl      %eax, %eax                                    #94.4
..LN427:
        vzeroupper                                              #94.4
..___tag_value_main.48:
..LN428:
        call      __kmpc_barrier                                #94.4
..___tag_value_main.49:
..LN429:
                                # LOE ebx r12d r13d
..B1.54:                        # Preds ..B1.53
                                # Execution count [1.96e+01]
..LN430:
	.loc    1  95  is_stmt 1
        movq      40(%rbp), %rax                                #95.7
..LN431:
        vxorpd    %xmm0, %xmm0, %xmm0                           #95.12
..LN432:
        movq      (%rax), %rdx                                  #95.7
..LN433:
        vcomisd   (%rdx), %xmm0                                 #95.12
..LN434:
        jbe       ..B1.56       # Prob 78%                      #95.12
..LN435:
                                # LOE ebx r12d r13d
..B1.55:                        # Preds ..B1.54
                                # Execution count [4.31e+00]
..LN436:
        movl      $il0_peep_printf_format_1, %edi               #95.15
..LN437:
        call      puts                                          #95.15
..LN438:
                                # LOE ebx r12d r13d
..B1.56:                        # Preds ..B1.55 ..B1.54
                                # Execution count [1.96e+01]
..LN439:
	.loc    1  81  is_stmt 1
        movl      200(%rsp), %eax                               #81.3[spill]
..LN440:
        incl      %eax                                          #81.3
..LN441:
        movl      %eax, 200(%rsp)                               #81.3[spill]
..LN442:
        cmpl      184(%rsp), %eax                               #81.3[spill]
..LN443:
        jb        ..B1.32       # Prob 81%                      #81.3
..LN444:
                                # LOE ebx r12d r13d
..B1.58:                        # Preds ..B1.56 ..B1.30
                                # Execution count [0.00e+00]
..LN445:
	.loc    1  80  is_stmt 1
        xorl      %eax, %eax                                    #80.3
..LN446:
        movq      520(%rsp), %r15                               #80.3[spill]
	.cfi_restore 15
..LN447:
        movq      528(%rsp), %r14                               #80.3[spill]
	.cfi_restore 14
..LN448:
        movq      536(%rsp), %r13                               #80.3[spill]
	.cfi_restore 13
..LN449:
        movq      544(%rsp), %r12                               #80.3[spill]
	.cfi_restore 12
..LN450:
        movq      552(%rsp), %rbx                               #80.3[spill]
	.cfi_restore 3
..LN451:
        movq      %rbp, %rsp                                    #80.3
..LN452:
        popq      %rbp                                          #80.3
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN453:
        ret                                                     #80.3
	.cfi_def_cfa 6, 16
..LN454:
                                # LOE
L_main_64__par_loop0_2.2:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
# parameter 7: 16 + %rbp
..B1.59:                        # Preds ..B1.0
                                # Execution count [7.84e-01]
..LN455:
	.loc    1  64  is_stmt 1
        pushq     %rbp                                          #64.2
	.cfi_def_cfa 7, 16
..LN456:
        movq      %rsp, %rbp                                    #64.2
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN457:
        andq      $-128, %rsp                                   #64.2
..LN458:
        subq      $640, %rsp                                    #64.2
..LN459:
        movq      %r15, 520(%rsp)                               #64.2[spill]
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
..LN460:
        movl      (%rdx), %r15d                                 #64.2
..LN461:
        movq      %r14, 528(%rsp)                               #64.2[spill]
..LN462:
        movq      %rbx, 552(%rsp)                               #64.2[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
..LN463:
        movq      %rcx, %rbx                                    #64.2
..LN464:
        movq      %r13, 536(%rsp)                               #64.2[spill]
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
..LN465:
        movq      %r8, %r13                                     #64.2
..LN466:
        movq      %r12, 544(%rsp)                               #64.2[spill]
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa0, 0xff, 0xff, 0xff, 0x22
..LN467:
        movq      %r9, %r12                                     #64.2
..LN468:
        movl      (%rdi), %r14d                                 #64.2
..LN469:
	.loc    1  65  is_stmt 1
        testl     %r15d, %r15d                                  #65.35
..LN470:
        jle       ..B1.81       # Prob 10%                      #65.35
..LN471:
                                # LOE rbx r12 r13 r14d r15d
..B1.60:                        # Preds ..B1.59
                                # Execution count [3.92e+00]
..LN472:
	.loc    1  64  is_stmt 1
        xorl      %eax, %eax                                    #64.2
..LN473:
        decl      %r15d                                         #64.2
..LN474:
        movl      $1, %r11d                                     #64.2
..LN475:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #64.2
..LN476:
        movl      %eax, 32(%rsp)                                #64.2
..LN477:
        movl      %r14d, %esi                                   #64.2
..LN478:
        movl      %r15d, 36(%rsp)                               #64.2
..LN479:
        movl      $34, %edx                                     #64.2
..LN480:
        movl      %eax, 40(%rsp)                                #64.2
..LN481:
        movl      %r11d, 44(%rsp)                               #64.2
..LN482:
        addq      $-32, %rsp                                    #64.2
..LN483:
        lea       72(%rsp), %rcx                                #64.2
..LN484:
        lea       64(%rsp), %r8                                 #64.2
..LN485:
        lea       68(%rsp), %r9                                 #64.2
..LN486:
        lea       76(%rsp), %r10                                #64.2
..LN487:
        movq      %r10, (%rsp)                                  #64.2
..LN488:
        movl      %r11d, 8(%rsp)                                #64.2
..LN489:
        movl      %r11d, 16(%rsp)                               #64.2
..LN490:
        call      __kmpc_for_static_init_4                      #64.2
..LN491:
                                # LOE rbx r12 r13 r14d r15d
..B1.112:                       # Preds ..B1.60
                                # Execution count [3.92e+00]
..LN492:
        addq      $32, %rsp                                     #64.2
..LN493:
                                # LOE rbx r12 r13 r14d r15d
..B1.61:                        # Preds ..B1.112
                                # Execution count [0.00e+00]
..LN494:
        movslq    %r15d, %r15                                   #64.2
..LN495:
        movslq    32(%rsp), %rdx                                #64.2
..LN496:
        movl      36(%rsp), %eax                                #64.2
..LN497:
        cmpq      %r15, %rdx                                    #64.2
..LN498:
        jg        ..B1.80       # Prob 50%                      #64.2
..LN499:
                                # LOE rdx rbx r12 r13 eax r14d r15d
..B1.62:                        # Preds ..B1.61
                                # Execution count [0.00e+00]
..LN500:
        cmpl      %r15d, %eax                                   #64.2
..LN501:
        cmovl     %eax, %r15d                                   #64.2
..LN502:
        movslq    %r15d, %r15                                   #64.2
..LN503:
	.loc    1  65  is_stmt 1
        cmpq      %r15, %rdx                                    #65.35
..LN504:
        jg        ..B1.80       # Prob 50%                      #65.35
..LN505:
                                # LOE rdx rbx r12 r13 r14d r15d
..B1.63:                        # Preds ..B1.62
                                # Execution count [7.05e-01]
..LN506:
	.loc    1  64  is_stmt 1
        movq      16(%rbp), %r9                                 #64.2
..LN507:
        subl      %edx, %r15d                                   #64.2
..LN508:
        incl      %r15d                                         #64.2
..LN509:
	.loc    1  66  is_stmt 1
        movq      (%rbx), %rax                                  #66.3
..LN510:
	.loc    1  67  is_stmt 1
        movq      (%r13), %r13                                  #67.3
..LN511:
	.loc    1  68  is_stmt 1
        movq      (%r12), %r8                                   #68.3
..LN512:
	.loc    1  69  is_stmt 1
        movq      (%r9), %r9                                    #69.3
..LN513:
	.loc    1  64  is_stmt 1
        cmpl      $16, %r15d                                    #64.2
..LN514:
        jl        ..B1.92       # Prob 10%                      #64.2
..LN515:
                                # LOE rax rdx r8 r9 r13 r14d r15d
..B1.64:                        # Preds ..B1.63
                                # Execution count [7.05e-01]
..LN516:
	.loc    1  69  is_stmt 1
        lea       (%r9,%rdx,8), %r12                            #69.3
..LN517:
	.loc    1  64  is_stmt 1
        movq      %r12, %rsi                                    #64.2
..LN518:
        andq      $31, %rsi                                     #64.2
..LN519:
        movl      %esi, %ecx                                    #64.2
..LN520:
        negl      %ecx                                          #64.2
..LN521:
        addl      $32, %ecx                                     #64.2
..LN522:
        shrl      $3, %ecx                                      #64.2
..LN523:
        testl     %esi, %esi                                    #64.2
..LN524:
        cmovne    %ecx, %esi                                    #64.2
..LN525:
        lea       16(%rsi), %ebx                                #64.2
..LN526:
        cmpl      %ebx, %r15d                                   #64.2
..LN527:
        jl        ..B1.92       # Prob 10%                      #64.2
..LN528:
                                # LOE rax rdx rsi r8 r9 r12 r13 r14d r15d
..B1.65:                        # Preds ..B1.64
                                # Execution count [7.05e-01]
..LN529:
        movl      %r15d, %ebx                                   #64.2
..LN530:
        xorl      %r11d, %r11d                                  #64.2
..LN531:
        subl      %esi, %ebx                                    #64.2
..LN532:
	.loc    1  66  is_stmt 1
        lea       (%rax,%rdx,8), %r10                           #66.3
..LN533:
	.loc    1  64  is_stmt 1
        andl      $15, %ebx                                     #64.2
..LN534:
	.loc    1  67  is_stmt 1
        lea       (%r13,%rdx,8), %rdi                           #67.3
..LN535:
	.loc    1  64  is_stmt 1
        negl      %ebx                                          #64.2
..LN536:
	.loc    1  68  is_stmt 1
        lea       (%r8,%rdx,8), %rcx                            #68.3
..LN537:
	.loc    1  64  is_stmt 1
        addl      %r15d, %ebx                                   #64.2
..LN538:
        testl     %esi, %esi                                    #64.2
..LN539:
        jbe       ..B1.69       # Prob 0%                       #64.2
..LN540:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 ebx r14d r15d
..B1.66:                        # Preds ..B1.65
                                # Execution count [7.05e-01]
..LN541:
        movq      %r13, (%rsp)                                  #[spill]
..LN542:
        movq      $0x3ff07ae147ae147b, %r13                     #
..LN543:
        movq      %rax, 8(%rsp)                                 #[spill]
..LN544:
        xorl      %eax, %eax                                    #
..LN545:
        movq      %rdx, 16(%rsp)                                #[spill]
..LN546:
        movq      $0x3ff0a3d70a3d70a4, %rdx                     #
..LN547:
        movl      %r14d, 24(%rsp)                               #[spill]
..LN548:
        movq      $0x3ff028f5c28f5c29, %r14                     #
..LN549:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 ebx r15d
..B1.67:                        # Preds ..B1.67 ..B1.66
                                # Execution count [3.92e+00]
..LN550:
	.loc    1  66  is_stmt 1
        movq      %r14, (%r10,%r11,8)                           #66.3
..LN551:
	.loc    1  67  is_stmt 1
        movq      %r13, (%rdi,%r11,8)                           #67.3
..LN552:
	.loc    1  68  is_stmt 1
        movq      %rdx, (%rcx,%r11,8)                           #68.3
..LN553:
	.loc    1  69  is_stmt 1
        movq      %rax, (%r12,%r11,8)                           #69.3
..LN554:
	.loc    1  64  is_stmt 1
        incq      %r11                                          #64.2
..LN555:
        cmpq      %rsi, %r11                                    #64.2
..LN556:
        jb        ..B1.67       # Prob 82%                      #64.2
..LN557:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 ebx r15d
..B1.68:                        # Preds ..B1.67
                                # Execution count [7.05e-01]
..LN558:
        movq      (%rsp), %r13                                  #[spill]
..LN559:
        movq      8(%rsp), %rax                                 #[spill]
..LN560:
        movq      16(%rsp), %rdx                                #[spill]
..LN561:
        movl      24(%rsp), %r14d                               #[spill]
..LN562:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r12 r13 ebx r14d r15d
..B1.69:                        # Preds ..B1.65 ..B1.68
                                # Execution count [7.05e-01]
..LN563:
	.loc    1  66  is_stmt 1
        vmovupd   .L_2il0floatpacket.7(%rip), %ymm3             #66.10
..LN564:
	.loc    1  67  is_stmt 1
        vmovupd   .L_2il0floatpacket.8(%rip), %ymm2             #67.10
..LN565:
	.loc    1  68  is_stmt 1
        vmovupd   .L_2il0floatpacket.9(%rip), %ymm1             #68.10
..LN566:
	.loc    1  69  is_stmt 1
        vxorpd    %ymm0, %ymm0, %ymm0                           #69.10
..LN567:
	.loc    1  64  is_stmt 1
        movslq    %ebx, %r11                                    #64.2
        .align    16,0x90
..LN568:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 ebx r14d r15d ymm0 ymm1 ymm2 ymm3
..B1.70:                        # Preds ..B1.70 ..B1.69
                                # Execution count [3.92e+00]
..LN569:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, (%r10,%rsi,8)                          #66.3
..LN570:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm2, (%rdi,%rsi,8)                          #67.3
..LN571:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm1, (%rcx,%rsi,8)                          #68.3
..LN572:
	.loc    1  69  is_stmt 1
        vmovupd   %ymm0, (%r12,%rsi,8)                          #69.3
..LN573:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, 32(%r10,%rsi,8)                        #66.3
..LN574:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm2, 32(%rdi,%rsi,8)                        #67.3
..LN575:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm1, 32(%rcx,%rsi,8)                        #68.3
..LN576:
	.loc    1  69  is_stmt 1
        vmovupd   %ymm0, 32(%r12,%rsi,8)                        #69.3
..LN577:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, 64(%r10,%rsi,8)                        #66.3
..LN578:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm2, 64(%rdi,%rsi,8)                        #67.3
..LN579:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm1, 64(%rcx,%rsi,8)                        #68.3
..LN580:
	.loc    1  69  is_stmt 1
        vmovupd   %ymm0, 64(%r12,%rsi,8)                        #69.3
..LN581:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, 96(%r10,%rsi,8)                        #66.3
..LN582:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm2, 96(%rdi,%rsi,8)                        #67.3
..LN583:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm1, 96(%rcx,%rsi,8)                        #68.3
..LN584:
	.loc    1  69  is_stmt 1
        vmovupd   %ymm0, 96(%r12,%rsi,8)                        #69.3
..LN585:
	.loc    1  64  is_stmt 1
        addq      $16, %rsi                                     #64.2
..LN586:
        cmpq      %r11, %rsi                                    #64.2
..LN587:
        jb        ..B1.70       # Prob 82%                      #64.2
..LN588:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 ebx r14d r15d ymm0 ymm1 ymm2 ymm3
..B1.71:                        # Preds ..B1.70
                                # Execution count [7.05e-01]
..LN589:
        lea       1(%rbx), %esi                                 #64.2
..LN590:
        cmpl      %r15d, %esi                                   #64.2
..LN591:
        ja        ..B1.80       # Prob 50%                      #64.2
..LN592:
                                # LOE rax rdx rcx rdi r8 r9 r10 r11 r12 r13 ebx r14d r15d ymm0 ymm1 ymm2 ymm3
..B1.72:                        # Preds ..B1.71
                                # Execution count [7.05e-01]
..LN593:
        movslq    %r15d, %r15                                   #64.2
..LN594:
        subq      %r11, %r15                                    #64.2
..LN595:
        cmpq      $4, %r15                                      #64.2
..LN596:
        jl        ..B1.91       # Prob 10%                      #64.2
..LN597:
                                # LOE rax rdx rcx rdi r8 r9 r10 r11 r12 r13 r15 ebx r14d ymm0 ymm1 ymm2 ymm3
..B1.73:                        # Preds ..B1.72
                                # Execution count [7.05e-01]
..LN598:
        xorl      %esi, %esi                                    #64.2
..LN599:
	.loc    1  69  is_stmt 1
        lea       (%r12,%r11,8), %r12                           #69.3
..LN600:
	.loc    1  68  is_stmt 1
        lea       (%rcx,%r11,8), %rcx                           #68.3
..LN601:
	.loc    1  67  is_stmt 1
        lea       (%rdi,%r11,8), %rdi                           #67.3
..LN602:
	.loc    1  66  is_stmt 1
        lea       (%r10,%r11,8), %r11                           #66.3
..LN603:
	.loc    1  64  is_stmt 1
        movl      %r15d, %r10d                                  #64.2
..LN604:
        andl      $-4, %r10d                                    #64.2
..LN605:
        movslq    %r10d, %r10                                   #64.2
..LN606:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r15 ebx r14d ymm0 ymm1 ymm2 ymm3
..B1.74:                        # Preds ..B1.74 ..B1.73
                                # Execution count [3.92e+00]
..LN607:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, (%r11,%rsi,8)                          #66.3
..LN608:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm2, (%rdi,%rsi,8)                          #67.3
..LN609:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm1, (%rcx,%rsi,8)                          #68.3
..LN610:
	.loc    1  69  is_stmt 1
        vmovupd   %ymm0, (%r12,%rsi,8)                          #69.3
..LN611:
	.loc    1  64  is_stmt 1
        addq      $4, %rsi                                      #64.2
..LN612:
        cmpq      %r10, %rsi                                    #64.2
..LN613:
        jb        ..B1.74       # Prob 82%                      #64.2
..LN614:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r15 ebx r14d ymm0 ymm1 ymm2 ymm3
..B1.76:                        # Preds ..B1.74 ..B1.91 ..B1.93
                                # Execution count [7.05e-01]
..LN615:
        cmpq      %r15, %r10                                    #64.2
..LN616:
        jae       ..B1.80       # Prob 0%                       #64.2
..LN617:
                                # LOE rax rdx r8 r9 r10 r13 r15 ebx r14d
..B1.77:                        # Preds ..B1.76
                                # Execution count [7.05e-01]
..LN618:
	.loc    1  66  is_stmt 1
        movslq    %ebx, %rbx                                    #66.3
..LN619:
	.loc    1  69  is_stmt 1
        lea       (%r9,%rdx,8), %r9                             #69.3
..LN620:
	.loc    1  68  is_stmt 1
        xorl      %r11d, %r11d                                  #68.10
..LN621:
        lea       (%r8,%rdx,8), %rdi                            #68.3
..LN622:
	.loc    1  67  is_stmt 1
        lea       (%r13,%rdx,8), %rcx                           #67.3
..LN623:
	.loc    1  66  is_stmt 1
        lea       (%rax,%rdx,8), %rax                           #66.3
..LN624:
	.loc    1  67  is_stmt 1
        movq      $0x3ff07ae147ae147b, %rdx                     #67.10
..LN625:
	.loc    1  69  is_stmt 1
        lea       (%r9,%rbx,8), %r9                             #69.3
..LN626:
	.loc    1  68  is_stmt 1
        lea       (%rdi,%rbx,8), %rdi                           #68.3
..LN627:
	.loc    1  67  is_stmt 1
        lea       (%rcx,%rbx,8), %rcx                           #67.3
..LN628:
	.loc    1  66  is_stmt 1
        lea       (%rax,%rbx,8), %r8                            #66.3
..LN629:
        movq      $0x3ff028f5c28f5c29, %rbx                     #66.10
..LN630:
	.loc    1  68  is_stmt 1
        movq      $0x3ff0a3d70a3d70a4, %rax                     #68.10
..LN631:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r15 r14d
..B1.78:                        # Preds ..B1.78 ..B1.77
                                # Execution count [3.92e+00]
..LN632:
	.loc    1  66  is_stmt 1
        movq      %rbx, (%r8,%r10,8)                            #66.3
..LN633:
	.loc    1  67  is_stmt 1
        movq      %rdx, (%rcx,%r10,8)                           #67.3
..LN634:
	.loc    1  68  is_stmt 1
        movq      %rax, (%rdi,%r10,8)                           #68.3
..LN635:
	.loc    1  69  is_stmt 1
        movq      %r11, (%r9,%r10,8)                            #69.3
..LN636:
	.loc    1  64  is_stmt 1
        incq      %r10                                          #64.2
..LN637:
        cmpq      %r15, %r10                                    #64.2
..LN638:
        jb        ..B1.78       # Prob 82%                      #64.2
..LN639:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r15 r14d
..B1.80:                        # Preds ..B1.78 ..B1.71 ..B1.61 ..B1.62 ..B1.92
                                #       ..B1.76
                                # Execution count [0.00e+00]
..LN640:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #64.2
..LN641:
        movl      %r14d, %esi                                   #64.2
..LN642:
        vzeroupper                                              #64.2
..LN643:
        call      __kmpc_for_static_fini                        #64.2
..LN644:
                                # LOE
..B1.81:                        # Preds ..B1.80 ..B1.59
                                # Execution count [0.00e+00]
..LN645:
        xorl      %eax, %eax                                    #64.2
..LN646:
        movq      520(%rsp), %r15                               #64.2[spill]
	.cfi_restore 15
..LN647:
        movq      528(%rsp), %r14                               #64.2[spill]
	.cfi_restore 14
..LN648:
        movq      536(%rsp), %r13                               #64.2[spill]
	.cfi_restore 13
..LN649:
        movq      544(%rsp), %r12                               #64.2[spill]
	.cfi_restore 12
..LN650:
        movq      552(%rsp), %rbx                               #64.2[spill]
	.cfi_restore 3
..LN651:
        movq      %rbp, %rsp                                    #64.2
..LN652:
        popq      %rbp                                          #64.2
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN653:
        ret                                                     #64.2
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
..LN654:
                                # LOE
..B1.82:                        # Preds ..B1.26
                                # Execution count [7.05e-01]: Infreq
..LN655:
        vmovsd    560(%rsp), %xmm3                              #[spill]
..LN656:
                                # LOE eax xmm0 xmm3
..B1.83:                        # Preds ..B1.82 ..B1.90
                                # Execution count [7.84e-01]: Infreq
..LN657:
	.loc    1  103  is_stmt 1
        vdivsd    %xmm0, %xmm3, %xmm0                           #103.2
..LN658:
	.loc    1  101  is_stmt 1
        movl      %eax, %edx                                    #101.2
..LN659:
	.loc    1  103  is_stmt 1
        vxorpd    %xmm2, %xmm2, %xmm2                           #103.42
..LN660:
	.loc    1  101  is_stmt 1
        shrl      $31, %edx                                     #101.2
..LN661:
	.loc    1  103  is_stmt 1
        vxorpd    %xmm1, %xmm1, %xmm1                           #103.2
..LN662:
	.loc    1  101  is_stmt 1
        addl      %edx, %eax                                    #101.2
..LN663:
	.loc    1  103  is_stmt 1
        movl      $.L_2__STRING.2, %edi                         #103.2
..LN664:
	.loc    1  101  is_stmt 1
        sarl      $1, %eax                                      #101.2
..LN665:
	.loc    1  103  is_stmt 1
        movl      480(%rsp), %esi                               #103.23
..LN666:
        vcvtsi2sd %eax, %xmm2, %xmm2                            #103.42
..LN667:
        vcvtsi2sd %esi, %xmm1, %xmm1                            #103.2
..LN668:
        vaddsd    %xmm2, %xmm2, %xmm4                           #103.2
..LN669:
        vmulsd    %xmm1, %xmm0, %xmm3                           #103.2
..LN670:
	.loc    1  101  is_stmt 1
        movl      %eax, 584(%rsp)                               #101.2
..LN671:
	.loc    1  103  is_stmt 1
        movl      $1, %eax                                      #103.2
..LN672:
        vmulsd    %xmm4, %xmm3, %xmm0                           #103.2
..___tag_value_main.81:
..LN673:
#       printf(const char *__restrict__, ...)
        call      printf                                        #103.2
..___tag_value_main.82:
..LN674:
                                # LOE
..B1.84:                        # Preds ..B1.83
                                # Execution count [7.84e-01]: Infreq
..LN675:
	.loc    1  106  is_stmt 1
        movq      448(%rsp), %rdi                               #106.2
..LN676:
#       _mm_free(void *)
        call      _mm_free                                      #106.2
..LN677:
                                # LOE
..B1.85:                        # Preds ..B1.84
                                # Execution count [7.84e-01]: Infreq
..LN678:
	.loc    1  107  is_stmt 1
        movq      456(%rsp), %rdi                               #107.2
..LN679:
#       _mm_free(void *)
        call      _mm_free                                      #107.2
..LN680:
                                # LOE
..B1.86:                        # Preds ..B1.85
                                # Execution count [7.84e-01]: Infreq
..LN681:
	.loc    1  108  is_stmt 1
        movq      464(%rsp), %rdi                               #108.2
..LN682:
#       _mm_free(void *)
        call      _mm_free                                      #108.2
..LN683:
                                # LOE
..B1.87:                        # Preds ..B1.86
                                # Execution count [7.84e-01]: Infreq
..LN684:
	.loc    1  109  is_stmt 1
        movq      472(%rsp), %rdi                               #109.2
..LN685:
#       _mm_free(void *)
        call      _mm_free                                      #109.2
..LN686:
                                # LOE
..B1.88:                        # Preds ..B1.87
                                # Execution count [7.84e-01]: Infreq
..LN687:
	.loc    1  110  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.30, %edi         #110.1
..LN688:
        xorl      %eax, %eax                                    #110.1
..___tag_value_main.83:
..LN689:
        call      __kmpc_end                                    #110.1
..___tag_value_main.84:
..LN690:
                                # LOE
..B1.89:                        # Preds ..B1.88
                                # Execution count [7.84e-01]: Infreq
..LN691:
        movq      520(%rsp), %r15                               #110.1[spill]
	.cfi_restore 15
..LN692:
        xorl      %eax, %eax                                    #110.1
..LN693:
        movq      528(%rsp), %r14                               #110.1[spill]
	.cfi_restore 14
..LN694:
        movq      536(%rsp), %r13                               #110.1[spill]
	.cfi_restore 13
..LN695:
        movq      544(%rsp), %r12                               #110.1[spill]
	.cfi_restore 12
..LN696:
        movq      552(%rsp), %rbx                               #110.1[spill]
	.cfi_restore 3
..LN697:
        movq      %rbp, %rsp                                    #110.1
..LN698:
        popq      %rbp                                          #110.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN699:
        ret                                                     #110.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xa0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x98, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x90, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
..LN700:
                                # LOE
..B1.90:                        # Preds ..B1.14
                                # Execution count [7.84e-02]: Infreq
..LN701:
	.loc    1  103  is_stmt 1
        vmovsd    .L_2il0floatpacket.11(%rip), %xmm3            #103.75
..LN702:
        jmp       ..B1.83       # Prob 100%                     #103.75
..LN703:
                                # LOE eax xmm0 xmm3
..B1.91:                        # Preds ..B1.72
                                # Execution count [7.05e-02]: Infreq
..LN704:
	.loc    1  64  is_stmt 1
        xorl      %r10d, %r10d                                  #64.2
..LN705:
        jmp       ..B1.76       # Prob 100%                     #64.2
..LN706:
                                # LOE rax rdx r8 r9 r10 r13 r15 ebx r14d
..B1.92:                        # Preds ..B1.63 ..B1.64
                                # Execution count [0.00e+00]: Infreq
..LN707:
        xorl      %ebx, %ebx                                    #64.2
..LN708:
        cmpl      $1, %r15d                                     #64.2
..LN709:
        jb        ..B1.80       # Prob 50%                      #64.2
..LN710:
                                # LOE rax rdx r8 r9 r13 ebx r14d r15d
..B1.93:                        # Preds ..B1.92
                                # Execution count [0.00e+00]: Infreq
..LN711:
        movslq    %r15d, %r15                                   #64.2
..LN712:
        xorl      %r10d, %r10d                                  #64.2
..LN713:
        jmp       ..B1.76       # Prob 100%                     #64.2
        .align    16,0x90
..LN714:
                                # LOE rax rdx r8 r9 r10 r13 r15 ebx r14d
..LN715:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.716:
.LNmain:
	.data
	.align 4
	.align 4
.2.9_2_kmpc_loc_struct_pack.11:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.10
	.align 4
.2.9_2__kmpc_loc_pack.10:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	51
	.byte	57
	.byte	59
	.byte	51
	.byte	57
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.22:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.21
	.align 4
.2.9_2__kmpc_loc_pack.21:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	54
	.byte	52
	.byte	59
	.byte	54
	.byte	52
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.38:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.37
	.align 4
.2.9_2__kmpc_loc_pack.37:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	54
	.byte	52
	.byte	59
	.byte	55
	.byte	48
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.89:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.88
	.align 4
.2.9_2__kmpc_loc_pack.88:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	56
	.byte	48
	.byte	59
	.byte	57
	.byte	54
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.63:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.62
	.align 4
.2.9_2__kmpc_loc_pack.62:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	56
	.byte	51
	.byte	59
	.byte	57
	.byte	52
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.81:
	.long	0
	.long	66
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.80
	.align 4
.2.9_2__kmpc_loc_pack.80:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	57
	.byte	52
	.byte	59
	.byte	57
	.byte	52
	.byte	59
	.byte	59
	.space 3, 0x00 	# pad
	.align 4
.2.9_2_kmpc_loc_struct_pack.30:
	.long	0
	.long	2
	.long	0
	.long	0
	.quad	.2.9_2__kmpc_loc_pack.29
	.align 4
.2.9_2__kmpc_loc_pack.29:
	.byte	59
	.byte	117
	.byte	110
	.byte	107
	.byte	110
	.byte	111
	.byte	119
	.byte	110
	.byte	59
	.byte	109
	.byte	97
	.byte	105
	.byte	110
	.byte	59
	.byte	49
	.byte	49
	.byte	48
	.byte	59
	.byte	49
	.byte	49
	.byte	48
	.byte	59
	.byte	59
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
il0_peep_printf_format_1:
	.long	1886352499
	.byte	0
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
il0_peep_printf_format_0:
	.long	1634036848
	.long	1663067507
	.long	543976545
	.long	1752459639
	.long	1919902496
	.long	1952671090
	.long	1735549216
	.long	1852140917
	.long	773878644
	.long	1769108527
	.long	1528849505
	.long	1601009006
	.long	1835363429
	.long	1937010277
	.long	544106784
	.long	1751343461
	.long	1920098592
	.long	6125921
	.data
# -- End  main, L_main_64__par_loop0_2.2, L_main_80__par_region1_2.3
	.text
.L_2__routine_start_check_sum_1:
# -- Begin  check_sum
	.text
# mark_begin;
       .align    16,0x90
	.globl check_sum
# --- check_sum(real *, int)
check_sum:
# parameter 1(D): %rdi
# parameter 2(length): %esi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_check_sum.100:
..L101:
                                                        #16.36
..LN717:
	.loc    1  16  is_stmt 1
..LN718:
	.loc    1  17  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #17.11
..LN719:
	.loc    1  19  is_stmt 1
        testl     %esi, %esi                                    #19.17
..LN720:
        jle       ..B2.22       # Prob 50%                      #19.17
..LN721:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.2:                         # Preds ..B2.1
                                # Execution count [9.00e-01]
..LN722:
        cmpl      $16, %esi                                     #19.2
..LN723:
        jl        ..B2.24       # Prob 10%                      #19.2
..LN724:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.3:                         # Preds ..B2.2
                                # Execution count [9.00e-01]
..LN725:
        movq      %rdi, %r8                                     #19.2
..LN726:
        andq      $31, %r8                                      #19.2
..LN727:
        testl     %r8d, %r8d                                    #19.2
..LN728:
        je        ..B2.6        # Prob 50%                      #19.2
..LN729:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.4:                         # Preds ..B2.3
                                # Execution count [9.00e-01]
..LN730:
        testl     $7, %r8d                                      #19.2
..LN731:
        jne       ..B2.24       # Prob 10%                      #19.2
..LN732:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.5:                         # Preds ..B2.4
                                # Execution count [4.50e-01]
..LN733:
        negl      %r8d                                          #19.2
..LN734:
        addl      $32, %r8d                                     #19.2
..LN735:
        shrl      $3, %r8d                                      #19.2
..LN736:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.6:                         # Preds ..B2.5 ..B2.3
                                # Execution count [9.00e-01]
..LN737:
        lea       16(%r8), %eax                                 #19.2
..LN738:
        cmpl      %eax, %esi                                    #19.2
..LN739:
        jl        ..B2.24       # Prob 10%                      #19.2
..LN740:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.7:                         # Preds ..B2.6
                                # Execution count [1.00e+00]
..LN741:
        movl      %esi, %edx                                    #19.2
..LN742:
        xorl      %eax, %eax                                    #19.2
..LN743:
        subl      %r8d, %edx                                    #19.2
..LN744:
        andl      $15, %edx                                     #19.2
..LN745:
        negl      %edx                                          #19.2
..LN746:
        addl      %esi, %edx                                    #19.2
..LN747:
        movl      %r8d, %ecx                                    #19.2
..LN748:
        testl     %r8d, %r8d                                    #19.2
..LN749:
        jbe       ..B2.11       # Prob 9%                       #19.2
..LN750:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.9:                         # Preds ..B2.7 ..B2.9
                                # Execution count [5.00e+00]
..LN751:
	.loc    1  20  is_stmt 1
        vaddsd    (%rdi,%rax,8), %xmm0, %xmm0                   #20.3
..LN752:
	.loc    1  19  is_stmt 1
        incq      %rax                                          #19.2
..LN753:
        cmpq      %rcx, %rax                                    #19.2
..LN754:
        jb        ..B2.9        # Prob 82%                      #19.2
..LN755:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.11:                        # Preds ..B2.9 ..B2.7
                                # Execution count [9.00e-01]
..LN756:
        movslq    %edx, %rax                                    #19.2
..LN757:
	.loc    1  17  is_stmt 1
        vxorpd    %xmm4, %xmm4, %xmm4                           #17.11
..LN758:
        vxorpd    %ymm2, %ymm2, %ymm2                           #17.11
..LN759:
        vmovsd    %xmm0, %xmm4, %xmm3                           #17.11
..LN760:
        vmovapd   %ymm2, %ymm1                                  #17.11
..LN761:
        vmovapd   %ymm2, %ymm0                                  #17.11
..LN762:
        vmovaps   %xmm3, %xmm3                                  #17.11
..LN763:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.12:                        # Preds ..B2.12 ..B2.11
                                # Execution count [5.00e+00]
..LN764:
	.loc    1  20  is_stmt 1
        vaddpd    (%rdi,%rcx,8), %ymm3, %ymm3                   #20.3
..LN765:
        vaddpd    32(%rdi,%rcx,8), %ymm2, %ymm2                 #20.3
..LN766:
        vaddpd    64(%rdi,%rcx,8), %ymm1, %ymm1                 #20.3
..LN767:
        vaddpd    96(%rdi,%rcx,8), %ymm0, %ymm0                 #20.3
..LN768:
	.loc    1  19  is_stmt 1
        addq      $16, %rcx                                     #19.2
..LN769:
        cmpq      %rax, %rcx                                    #19.2
..LN770:
        jb        ..B2.12       # Prob 82%                      #19.2
..LN771:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.13:                        # Preds ..B2.12
                                # Execution count [9.00e-01]
..LN772:
	.loc    1  17  is_stmt 1
        vaddpd    %ymm2, %ymm3, %ymm2                           #17.11
..LN773:
	.loc    1  19  is_stmt 1
        lea       1(%rdx), %ecx                                 #19.2
..LN774:
	.loc    1  17  is_stmt 1
        vaddpd    %ymm0, %ymm1, %ymm0                           #17.11
..LN775:
        vaddpd    %ymm0, %ymm2, %ymm1                           #17.11
..LN776:
        vextractf128 $1, %ymm1, %xmm3                           #17.11
..LN777:
        vaddpd    %xmm3, %xmm1, %xmm5                           #17.11
..LN778:
        vunpckhpd %xmm5, %xmm5, %xmm6                           #17.11
..LN779:
        vaddsd    %xmm6, %xmm5, %xmm0                           #17.11
..LN780:
	.loc    1  19  is_stmt 1
        cmpl      %esi, %ecx                                    #19.2
..LN781:
        ja        ..B2.22       # Prob 50%                      #19.2
..LN782:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx esi xmm0 xmm4
..B2.14:                        # Preds ..B2.13
                                # Execution count [8.50e-01]
..LN783:
        movslq    %esi, %rsi                                    #19.2
..LN784:
        subq      %rax, %rsi                                    #19.2
..LN785:
        cmpq      $4, %rsi                                      #19.2
..LN786:
        jl        ..B2.23       # Prob 10%                      #19.2
..LN787:
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0 xmm4
..B2.15:                        # Preds ..B2.14
                                # Execution count [9.00e-01]
..LN788:
        movl      %esi, %ecx                                    #19.2
..LN789:
	.loc    1  17  is_stmt 1
        vmovsd    %xmm0, %xmm4, %xmm0                           #17.11
..LN790:
	.loc    1  19  is_stmt 1
        andl      $-4, %ecx                                     #19.2
..LN791:
        xorl      %r8d, %r8d                                    #19.2
..LN792:
        movslq    %ecx, %rcx                                    #19.2
..LN793:
	.loc    1  20  is_stmt 1
        lea       (%rdi,%rax,8), %rax                           #20.10
..LN794:
	.loc    1  17  is_stmt 1
        vmovaps   %xmm0, %xmm0                                  #17.11
..LN795:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.16:                        # Preds ..B2.16 ..B2.15
                                # Execution count [5.00e+00]
..LN796:
	.loc    1  20  is_stmt 1
        vaddpd    (%rax,%r8,8), %ymm0, %ymm0                    #20.3
..LN797:
	.loc    1  19  is_stmt 1
        addq      $4, %r8                                       #19.2
..LN798:
        cmpq      %rcx, %r8                                     #19.2
..LN799:
        jb        ..B2.16       # Prob 82%                      #19.2
..LN800:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.17:                        # Preds ..B2.16
                                # Execution count [9.00e-01]
..LN801:
	.loc    1  17  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #17.11
..LN802:
        vaddpd    %xmm1, %xmm0, %xmm2                           #17.11
..LN803:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #17.11
..LN804:
        vaddsd    %xmm3, %xmm2, %xmm0                           #17.11
..LN805:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.18:                        # Preds ..B2.17 ..B2.23 ..B2.25
                                # Execution count [1.00e+00]
..LN806:
	.loc    1  19  is_stmt 1
        cmpq      %rsi, %rcx                                    #19.2
..LN807:
        jae       ..B2.22       # Prob 9%                       #19.2
..LN808:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.19:                        # Preds ..B2.18
                                # Execution count [9.00e-01]
..LN809:
	.loc    1  20  is_stmt 1
        movslq    %edx, %rdx                                    #20.10
..LN810:
        lea       (%rdi,%rdx,8), %rax                           #20.10
..LN811:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.20:                        # Preds ..B2.20 ..B2.19
                                # Execution count [5.00e+00]
..LN812:
        vaddsd    (%rax,%rcx,8), %xmm0, %xmm0                   #20.3
..LN813:
	.loc    1  19  is_stmt 1
        incq      %rcx                                          #19.2
..LN814:
        cmpq      %rsi, %rcx                                    #19.2
..LN815:
        jb        ..B2.20       # Prob 82%                      #19.2
..LN816:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.22:                        # Preds ..B2.20 ..B2.13 ..B2.18 ..B2.24 ..B2.1
                                #      
                                # Execution count [1.00e+00]
..LN817:
	.loc    1  21  is_stmt 1
        vzeroupper                                              #21.9
..LN818:
        ret                                                     #21.9
..LN819:
                                # LOE
..B2.23:                        # Preds ..B2.14
                                # Execution count [9.00e-02]: Infreq
..LN820:
	.loc    1  19  is_stmt 1
        xorl      %ecx, %ecx                                    #19.2
..LN821:
        jmp       ..B2.18       # Prob 100%                     #19.2
..LN822:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.24:                        # Preds ..B2.6 ..B2.4 ..B2.2
                                # Execution count [1.00e-01]: Infreq
..LN823:
        xorl      %edx, %edx                                    #19.2
..LN824:
        cmpl      $1, %esi                                      #19.2
..LN825:
        jb        ..B2.22       # Prob 50%                      #19.2
..LN826:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.25:                        # Preds ..B2.24
                                # Execution count [5.00e-02]: Infreq
..LN827:
        movslq    %esi, %rsi                                    #19.2
..LN828:
        xorl      %ecx, %ecx                                    #19.2
..LN829:
        jmp       ..B2.18       # Prob 100%                     #19.2
        .align    16,0x90
..LN830:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..LN831:
	.cfi_endproc
# mark_end;
	.type	check_sum,@function
	.size	check_sum,.-check_sum
..LNcheck_sum.832:
.LNcheck_sum:
	.data
# -- End  check_sum
	.text
.L_2__routine_start_timing_2:
# -- Begin  timing
	.text
# mark_begin;
       .align    16,0x90
	.globl timing
# --- timing(double *, double *)
timing:
# parameter 1(wcTime): %rdi
# parameter 2(cpuTime): %rsi
..B3.1:                         # Preds ..B3.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_timing.103:
..L104:
                                                        #27.1
..LN833:
	.loc    1  27  is_stmt 1
        pushq     %r12                                          #27.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
..LN834:
        pushq     %r13                                          #27.1
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
..LN835:
        subq      $168, %rsp                                    #27.1
	.cfi_def_cfa_offset 192
..LN836:
        movq      %rsi, %r13                                    #27.1
..LN837:
        movq      %rdi, %r12                                    #27.1
..LN838:
	.loc    1  31  is_stmt 1
        lea       144(%rsp), %rdi                               #31.2
..LN839:
        xorl      %esi, %esi                                    #31.2
..LN840:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #31.2
..LN841:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
                                # Execution count [1.00e+00]
..LN842:
	.loc    1  32  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #32.32
..LN843:
        vxorpd    %xmm1, %xmm1, %xmm1                           #32.20
..LN844:
        vcvtsi2sdq 152(%rsp), %xmm0, %xmm0                      #32.32
..LN845:
        vcvtsi2sdq 144(%rsp), %xmm1, %xmm1                      #32.20
..LN846:
        vmulsd    .L_2il0floatpacket.11(%rip), %xmm0, %xmm2     #32.43
..LN847:
	.loc    1  34  is_stmt 1
        xorl      %edi, %edi                                    #34.2
..LN848:
        lea       (%rsp), %rsi                                  #34.2
..LN849:
	.loc    1  32  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #32.43
..LN850:
        vmovsd    %xmm3, (%r12)                                 #32.3
..LN851:
	.loc    1  34  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #34.2
..LN852:
                                # LOE rbx rbp r13 r14 r15
..B3.3:                         # Preds ..B3.2
                                # Execution count [1.00e+00]
..LN853:
	.loc    1  35  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #35.41
..LN854:
        vxorpd    %xmm1, %xmm1, %xmm1                           #35.20
..LN855:
        vcvtsi2sdq 8(%rsp), %xmm0, %xmm0                        #35.41
..LN856:
        vcvtsi2sdq (%rsp), %xmm1, %xmm1                         #35.20
..LN857:
        vmulsd    .L_2il0floatpacket.11(%rip), %xmm0, %xmm2     #35.65
..LN858:
        vaddsd    %xmm2, %xmm1, %xmm3                           #35.65
..LN859:
        vmovsd    %xmm3, (%r13)                                 #35.3
..LN860:
	.loc    1  36  is_stmt 1
        addq      $168, %rsp                                    #36.1
	.cfi_def_cfa_offset 24
	.cfi_restore 13
..LN861:
        popq      %r13                                          #36.1
	.cfi_def_cfa_offset 16
	.cfi_restore 12
..LN862:
        popq      %r12                                          #36.1
	.cfi_def_cfa_offset 8
..LN863:
        ret                                                     #36.1
        .align    16,0x90
..LN864:
                                # LOE
..LN865:
	.cfi_endproc
# mark_end;
	.type	timing,@function
	.size	timing,.-timing
..LNtiming.866:
.LNtiming:
	.data
# -- End  timing
	.bss
	.align 4
	.align 4
___kmpv_zeromain_0:
	.type	___kmpv_zeromain_0,@object
	.size	___kmpv_zeromain_0,4
	.space 4	# pad
	.align 4
___kmpv_zeromain_1:
	.type	___kmpv_zeromain_1,@object
	.size	___kmpv_zeromain_1,4
	.space 4	# pad
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.7:
	.long	0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,32
	.align 32
.L_2il0floatpacket.8:
	.long	0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,32
	.align 32
.L_2il0floatpacket.9:
	.long	0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,32
	.align 8
.L_2il0floatpacket.4:
	.long	0xc28f5c29,0x3ff028f5
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,8
	.align 8
.L_2il0floatpacket.5:
	.long	0x47ae147b,0x3ff07ae1
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,8
	.align 8
.L_2il0floatpacket.6:
	.long	0x0a3d70a4,0x3ff0a3d7
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,8
	.align 8
.L_2il0floatpacket.10:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,8
	.align 8
.L_2il0floatpacket.11:
	.long	0xa0b5ed8d,0x3eb0c6f7
	.type	.L_2il0floatpacket.11,@object
	.size	.L_2il0floatpacket.11,8
	.align 8
.L_2il0floatpacket.12:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.12,@object
	.size	.L_2il0floatpacket.12,8
	.section .rodata.str1.4, "aMS",@progbits,1
	.space 3, 0x00 	# pad
	.align 4
.L_2__STRING.2:
	.long	1680154668
	.long	1713709100
	.word	10
	.type	.L_2__STRING.2,@object
	.size	.L_2__STRING.2,10
	.data
	.section .note.GNU-stack, ""
# End
