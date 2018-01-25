	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.5.239 Build 20170817";
# mark_description "-Ofast -fno-alias -O3 -xHost -qopt-streaming-stores=never -DUSEOMP -qopenmp -qopt-report=5 -fsource-asm -S -";
# mark_description "o triad_simple.s";
	.file "triad_simple.c"
	.text
..TXTST0:
.L_2__routine_start_main_0:
# -- Begin  main, L_main_62__par_loop0_2.2, L_main_78__par_region1_2.3
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
                                                          #37.33
..LN0:
	.file   1 "triad_simple.c"
	.loc    1  37  is_stmt 1
        pushq     %rbp                                          #37.33
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #37.33
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        andq      $-128, %rsp                                   #37.33
..LN3:
        subq      $512, %rsp                                    #37.33
..LN4:
        movq      %rbx, 392(%rsp)                               #37.33[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
..LN5:
        movl      %edi, %ebx                                    #37.33
..LN6:
        movq      %r12, 384(%rsp)                               #37.33[spill]
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
..LN7:
        movq      %rsi, %r12                                    #37.33
..LN8:
        movl      $71678, %esi                                  #37.33
..LN9:
        movl      $3, %edi                                      #37.33
..LN10:
        movq      %r15, 360(%rsp)                               #37.33[spill]
..LN11:
        movq      %r14, 368(%rsp)                               #37.33[spill]
..LN12:
        movq      %r13, 376(%rsp)                               #37.33[spill]
..LN13:
        call      __intel_new_feature_proc_init                 #37.33
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x78, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x70, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x68, 0xff, 0xff, 0xff, 0x22
..LN14:
                                # LOE r12 ebx
..B1.100:                       # Preds ..B1.1
                                # Execution count [0.00e+00]
..LN15:
        vstmxcsr  (%rsp)                                        #37.33
..LN16:
        movl      $.2.9_2_kmpc_loc_struct_pack.11, %edi         #37.33
..LN17:
        xorl      %esi, %esi                                    #37.33
..LN18:
        orl       $32832, (%rsp)                                #37.33
..LN19:
        xorl      %eax, %eax                                    #37.33
..LN20:
        vldmxcsr  (%rsp)                                        #37.33
..___tag_value_main.11:
..LN21:
        call      __kmpc_begin                                  #37.33
..___tag_value_main.12:
..LN22:
                                # LOE r12 ebx
..B1.2:                         # Preds ..B1.100
                                # Execution count [1.00e+00]
..LN23:
	.loc    1  39  is_stmt 1

### 
### 	if(argc != 2){

        cmpl      $2, %ebx                                      #39.13
..LN24:
        jne       ..B1.28       # Prob 21%                      #39.13
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
### 	const int unroll = 4;
### 	const int avx = 4;
### 	int num_elements = atoi(argv[1]);
### 	num_elements = num_elements - (num_elements%(avx*unroll));
### 	const int array_size = num_elements*sizeof(real);
### 
### 	real *A; 
### 	real *B; 
### 	real *C; 
### 	real *D;	
### 
### 	A = (real *) malloc(array_size);
### 	B = (real *) malloc(array_size);
### 	C = (real *) malloc(array_size);
### 	D = (real *) malloc(array_size);
### 	  
### 	real a, b, c, d, tmp;
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
### 			#pragma omp for
### 			
### 			for(i = 0; i < num_elements; i++){
### 				D[i] = A[i] + B[i] * C[i];
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
### 	free(A);
### 	free(B);
### 	free(C);
### 	free(D);
### }
 movq 8(%r12), %rcx #280.16
..LN27:
        call      __intel_sse4_atol                             #280.16
..LN28:
                                # LOE rax
..B1.4:                         # Preds ..B1.3
                                # Execution count [7.84e-01]
..LN29:
	.loc    1  46  is_stmt 1
        movl      %eax, %edx                                    #46.46
..LN30:
        andl      $-2147483633, %edx                            #46.46
..LN31:
        jge       ..B1.98       # Prob 50%                      #46.46
..LN32:
                                # LOE eax edx
..B1.99:                        # Preds ..B1.4
                                # Execution count [7.84e-01]
..LN33:
        subl      $1, %edx                                      #46.46
..LN34:
        orl       $-16, %edx                                    #46.46
..LN35:
        incl      %edx                                          #46.46
..LN36:
                                # LOE eax edx
..B1.98:                        # Preds ..B1.4 ..B1.99
                                # Execution count [7.84e-01]
..LN37:
        subl      %edx, %eax                                    #46.17
..LN38:
        movl      %eax, 320(%rsp)                               #46.2
..LN39:
	.loc    1  47  is_stmt 1
        movslq    %eax, %rax                                    #47.25
..LN40:
        shlq      $3, %rax                                      #47.38
..LN41:
        movslq    %eax, %rbx                                    #47.38
..LN42:
	.loc    1  54  is_stmt 1
        movq      %rbx, %rdi                                    #54.15
..LN43:
#       malloc(size_t)
        call      malloc                                        #54.15
..LN44:
                                # LOE rax rbx
..B1.5:                         # Preds ..B1.98
                                # Execution count [7.84e-01]
..LN45:
	.loc    1  55  is_stmt 1
        movq      %rbx, %rdi                                    #55.15
..LN46:
	.loc    1  54  is_stmt 1
        movq      %rax, 288(%rsp)                               #54.2
..LN47:
	.loc    1  55  is_stmt 1
#       malloc(size_t)
        call      malloc                                        #55.15
..LN48:
                                # LOE rax rbx
..B1.6:                         # Preds ..B1.5
                                # Execution count [7.84e-01]
..LN49:
	.loc    1  56  is_stmt 1
        movq      %rbx, %rdi                                    #56.15
..LN50:
	.loc    1  55  is_stmt 1
        movq      %rax, 296(%rsp)                               #55.2
..LN51:
	.loc    1  56  is_stmt 1
#       malloc(size_t)
        call      malloc                                        #56.15
..LN52:
                                # LOE rax rbx
..B1.7:                         # Preds ..B1.6
                                # Execution count [7.84e-01]
..LN53:
	.loc    1  57  is_stmt 1
        movq      %rbx, %rdi                                    #57.15
..LN54:
	.loc    1  56  is_stmt 1
        movq      %rax, 304(%rsp)                               #56.2
..LN55:
	.loc    1  57  is_stmt 1
#       malloc(size_t)
        call      malloc                                        #57.15
..LN56:
                                # LOE rax
..B1.8:                         # Preds ..B1.7
                                # Execution count [7.84e-01]
..LN57:
	.loc    1  62  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.22, %edi         #62.2
..LN58:
	.loc    1  57  is_stmt 1
        movq      %rax, 312(%rsp)                               #57.2
..LN59:
	.loc    1  62  is_stmt 1
        call      __kmpc_global_thread_num                      #62.2
..LN60:
                                # LOE eax
..B1.107:                       # Preds ..B1.8
                                # Execution count [7.84e-01]
..LN61:
        movl      %eax, 324(%rsp)                               #62.2
..LN62:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #62.2
..LN63:
        xorl      %eax, %eax                                    #62.2
..___tag_value_main.13:
..LN64:
        call      __kmpc_ok_to_fork                             #62.2
..___tag_value_main.14:
..LN65:
                                # LOE eax
..B1.9:                         # Preds ..B1.107
                                # Execution count [7.84e-01]
..LN66:
        testl     %eax, %eax                                    #62.2
..LN67:
        je        ..B1.11       # Prob 50%                      #62.2
..LN68:
                                # LOE
..B1.10:                        # Preds ..B1.9
                                # Execution count [0.00e+00]
..LN69:
        movl      $L_main_62__par_loop0_2.2, %edx               #62.2
..LN70:
        lea       312(%rsp), %rbx                               #62.2
..LN71:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #62.2
..LN72:
        lea       8(%rbx), %r13                                 #62.2
..LN73:
        movl      $5, %esi                                      #62.2
..LN74:
        lea       -24(%rbx), %r14                               #62.2
..LN75:
        movq      %r13, %rcx                                    #62.2
..LN76:
        lea       -16(%rbx), %r15                               #62.2
..LN77:
        movq      %r14, %r8                                     #62.2
..LN78:
        lea       -8(%rbx), %r12                                #62.2
..LN79:
        pushq     %rbx                                          #62.2
..LN80:
        movq      %r15, %r9                                     #62.2
..LN81:
        xorl      %eax, %eax                                    #62.2
..LN82:
        pushq     %r12                                          #62.2
..___tag_value_main.15:
..LN83:
        call      __kmpc_fork_call                              #62.2
..___tag_value_main.16:
..LN84:
                                # LOE rbx r12 r13 r14 r15
..B1.108:                       # Preds ..B1.10
                                # Execution count [0.00e+00]
..LN85:
        addq      $16, %rsp                                     #62.2
..LN86:
        jmp       ..B1.14       # Prob 100%                     #62.2
..LN87:
                                # LOE rbx r12 r13 r14 r15
..B1.11:                        # Preds ..B1.9
                                # Execution count [0.00e+00]
..LN88:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #62.2
..LN89:
        xorl      %eax, %eax                                    #62.2
..LN90:
        movl      324(%rsp), %esi                               #62.2
..___tag_value_main.17:
..LN91:
        call      __kmpc_serialized_parallel                    #62.2
..___tag_value_main.18:
..LN92:
                                # LOE
..B1.12:                        # Preds ..B1.11
                                # Execution count [0.00e+00]
..LN93:
        addq      $-16, %rsp                                    #62.2
..LN94:
        movl      $___kmpv_zeromain_0, %esi                     #62.2
..LN95:
        lea       336(%rsp), %r13                               #62.2
..LN96:
        movq      %r13, %rdx                                    #62.2
..LN97:
        lea       -32(%r13), %r14                               #62.2
..LN98:
        movq      %r14, %rcx                                    #62.2
..LN99:
        lea       -24(%r13), %r15                               #62.2
..LN100:
        movq      %r15, %r8                                     #62.2
..LN101:
        lea       -16(%r13), %r12                               #62.2
..LN102:
        movq      %r12, %r9                                     #62.2
..LN103:
        lea       20(%r12), %rdi                                #62.2
..LN104:
        lea       -12(%rdi), %rbx                               #62.2
..LN105:
        movq      %rbx, (%rsp)                                  #62.2
..___tag_value_main.19:
..LN106:
        call      L_main_62__par_loop0_2.2                      #62.2
..___tag_value_main.20:
..LN107:
                                # LOE rbx r12 r13 r14 r15
..B1.109:                       # Preds ..B1.12
                                # Execution count [0.00e+00]
..LN108:
        addq      $16, %rsp                                     #62.2
..LN109:
                                # LOE rbx r12 r13 r14 r15
..B1.13:                        # Preds ..B1.109
                                # Execution count [0.00e+00]
..LN110:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #62.2
..LN111:
        xorl      %eax, %eax                                    #62.2
..LN112:
        movl      324(%rsp), %esi                               #62.2
..___tag_value_main.21:
..LN113:
        call      __kmpc_end_serialized_parallel                #62.2
..___tag_value_main.22:
..LN114:
                                # LOE rbx r12 r13 r14 r15
..B1.14:                        # Preds ..B1.108 ..B1.13
                                # Execution count [7.84e-01]
..LN115:
	.loc    1  75  is_stmt 1
        vmovsd    .L_2il0floatpacket.10(%rip), %xmm1            #75.23
..LN116:
	.loc    1  71  is_stmt 1
        movl      $1, %eax                                      #71.13
..LN117:
	.loc    1  75  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #75.2
..LN118:
        vcomisd   %xmm0, %xmm1                                  #75.23
..LN119:
        jbe       ..B1.89       # Prob 10%                      #75.23
..LN120:
                                # LOE rbx r12 r13 r14 r15 eax xmm0 xmm1
..B1.15:                        # Preds ..B1.14
                                # Execution count [7.05e-01]
..LN121:
	.loc    1  30  is_stmt 1
        vmovsd    .L_2il0floatpacket.11(%rip), %xmm3            #30.43
..LN122:
	.loc    1  71  is_stmt 1
        movl      $1, 424(%rsp)                                 #71.13
..LN123:
	.loc    1  30  is_stmt 1
        vmovsd    %xmm3, 400(%rsp)                              #30.43[spill]
..LN124:
        jmp       ..B1.16       # Prob 100%                     #30.43
..LN125:
                                # LOE rbx r12 r13 r14 r15
..B1.27:                        # Preds ..B1.26
                                # Execution count [3.21e+00]
..LN126:
	.loc    1  71  is_stmt 1
        movl      %eax, 424(%rsp)                               #71.13
..LN127:
                                # LOE rbx r12 r13 r14 r15
..B1.16:                        # Preds ..B1.15 ..B1.27
                                # Execution count [3.92e+00]
..LN128:
	.loc    1  29  is_stmt 1
        xorl      %esi, %esi                                    #29.2
..LN129:
        lea       328(%rsp), %rdi                               #29.2
..LN130:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #29.2
..LN131:
                                # LOE rbx r12 r13 r14 r15
..B1.17:                        # Preds ..B1.16
                                # Execution count [3.92e+00]
..LN132:
	.loc    1  30  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.32
..LN133:
        vxorpd    %xmm1, %xmm1, %xmm1                           #30.20
..LN134:
        vcvtsi2sdq 336(%rsp), %xmm0, %xmm0                      #30.32
..LN135:
        vcvtsi2sdq 328(%rsp), %xmm1, %xmm1                      #30.20
..LN136:
        vmulsd    400(%rsp), %xmm0, %xmm2                       #30.43[spill]
..LN137:
	.loc    1  32  is_stmt 1
        xorl      %edi, %edi                                    #32.2
..LN138:
        lea       (%rsp), %rsi                                  #32.2
..LN139:
	.loc    1  30  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #30.43
..LN140:
        vmovsd    %xmm3, 408(%rsi)                              #30.43[spill]
..LN141:
	.loc    1  32  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #32.2
..LN142:
                                # LOE rbx r12 r13 r14 r15
..B1.18:                        # Preds ..B1.17
                                # Execution count [3.92e+00]
..LN143:
	.loc    1  78  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #78.3
..LN144:
        xorl      %eax, %eax                                    #78.3
..___tag_value_main.23:
..LN145:
        call      __kmpc_ok_to_fork                             #78.3
..___tag_value_main.24:
..LN146:
                                # LOE rbx r12 r13 r14 r15 eax
..B1.19:                        # Preds ..B1.18
                                # Execution count [3.92e+00]
..LN147:
        testl     %eax, %eax                                    #78.3
..LN148:
        je        ..B1.21       # Prob 50%                      #78.3
..LN149:
                                # LOE rbx r12 r13 r14 r15
..B1.20:                        # Preds ..B1.19
                                # Execution count [0.00e+00]
..LN150:
        addq      $-32, %rsp                                    #78.3
..LN151:
        movl      $L_main_78__par_region1_2.3, %edx             #78.3
..LN152:
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #78.3
..LN153:
        movl      $6, %esi                                      #78.3
..LN154:
        movq      %r13, %r8                                     #78.3
..LN155:
        lea       456(%rsp), %rcx                               #78.3
..LN156:
        movq      %rbx, %r9                                     #78.3
..LN157:
        xorl      %eax, %eax                                    #78.3
..LN158:
        movq      %r14, (%rsp)                                  #78.3
..LN159:
        movq      %r15, 8(%rsp)                                 #78.3
..LN160:
        movq      %r12, 16(%rsp)                                #78.3
..___tag_value_main.25:
..LN161:
        call      __kmpc_fork_call                              #78.3
..___tag_value_main.26:
..LN162:
                                # LOE rbx r12 r13 r14 r15
..B1.111:                       # Preds ..B1.20
                                # Execution count [0.00e+00]
..LN163:
        addq      $32, %rsp                                     #78.3
..LN164:
        jmp       ..B1.24       # Prob 100%                     #78.3
..LN165:
                                # LOE rbx r12 r13 r14 r15
..B1.21:                        # Preds ..B1.19
                                # Execution count [0.00e+00]
..LN166:
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #78.3
..LN167:
        xorl      %eax, %eax                                    #78.3
..LN168:
        movl      324(%rsp), %esi                               #78.3
..___tag_value_main.27:
..LN169:
        call      __kmpc_serialized_parallel                    #78.3
..___tag_value_main.28:
..LN170:
                                # LOE rbx r12 r13 r14 r15
..B1.22:                        # Preds ..B1.21
                                # Execution count [0.00e+00]
..LN171:
        movl      $___kmpv_zeromain_1, %esi                     #78.3
..LN172:
        lea       324(%rsp), %rdi                               #78.3
..LN173:
        pushq     %r12                                          #78.3
..LN174:
        pushq     %r15                                          #78.3
..LN175:
        movq      %r13, %rcx                                    #78.3
..LN176:
        lea       100(%rdi), %rdx                               #78.3
..LN177:
        movq      %rbx, %r8                                     #78.3
..LN178:
        movq      %r14, %r9                                     #78.3
..___tag_value_main.29:
..LN179:
        call      L_main_78__par_region1_2.3                    #78.3
..___tag_value_main.30:
..LN180:
                                # LOE rbx r12 r13 r14 r15
..B1.112:                       # Preds ..B1.22
                                # Execution count [0.00e+00]
..LN181:
        addq      $16, %rsp                                     #78.3
..LN182:
                                # LOE rbx r12 r13 r14 r15
..B1.23:                        # Preds ..B1.112
                                # Execution count [0.00e+00]
..LN183:
        movl      $.2.9_2_kmpc_loc_struct_pack.89, %edi         #78.3
..LN184:
        xorl      %eax, %eax                                    #78.3
..LN185:
        movl      324(%rsp), %esi                               #78.3
..___tag_value_main.31:
..LN186:
        call      __kmpc_end_serialized_parallel                #78.3
..___tag_value_main.32:
..LN187:
                                # LOE rbx r12 r13 r14 r15
..B1.24:                        # Preds ..B1.111 ..B1.23
                                # Execution count [3.92e+00]
..LN188:
	.loc    1  29  is_stmt 1
        xorl      %esi, %esi                                    #29.2
..LN189:
        lea       344(%rsp), %rdi                               #29.2
..LN190:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #29.2
..LN191:
                                # LOE rbx r12 r13 r14 r15
..B1.25:                        # Preds ..B1.24
                                # Execution count [3.92e+00]
..LN192:
	.loc    1  30  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.32
..LN193:
        vxorpd    %xmm1, %xmm1, %xmm1                           #30.20
..LN194:
        vcvtsi2sdq 352(%rsp), %xmm0, %xmm0                      #30.32
..LN195:
        vcvtsi2sdq 344(%rsp), %xmm1, %xmm1                      #30.20
..LN196:
        vmulsd    400(%rsp), %xmm0, %xmm2                       #30.43[spill]
..LN197:
	.loc    1  32  is_stmt 1
        xorl      %edi, %edi                                    #32.2
..LN198:
        lea       144(%rsp), %rsi                               #32.2
..LN199:
	.loc    1  30  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #30.43
..LN200:
        vmovsd    %xmm3, 272(%rsi)                              #30.43[spill]
..LN201:
	.loc    1  32  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #32.2
..LN202:
                                # LOE rbx r12 r13 r14 r15
..B1.26:                        # Preds ..B1.25
                                # Execution count [3.92e+00]
..LN203:
	.loc    1  75  is_stmt 1
        vmovsd    416(%rsp), %xmm0                              #75.14[spill]
..LN204:
        vmovsd    .L_2il0floatpacket.10(%rip), %xmm1            #75.23
..LN205:
	.loc    1  89  is_stmt 1
        movl      424(%rsp), %eax                               #89.3
..LN206:
        addl      %eax, %eax                                    #89.3
..LN207:
	.loc    1  75  is_stmt 1
        vsubsd    408(%rsp), %xmm0, %xmm0                       #75.14[spill]
..LN208:
        vcomisd   %xmm0, %xmm1                                  #75.23
..LN209:
        ja        ..B1.27       # Prob 82%                      #75.23
..LN210:
        jmp       ..B1.81       # Prob 100%                     #75.23
..LN211:
                                # LOE rbx r12 r13 r14 r15 eax xmm0
..B1.28:                        # Preds ..B1.2
                                # Execution count [2.16e-01]
..LN212:
	.loc    1  40  is_stmt 1
        movl      $il0_peep_printf_format_0, %edi               #40.3
..LN213:
        call      puts                                          #40.3
..LN214:
                                # LOE
..B1.29:                        # Preds ..B1.28
                                # Execution count [2.16e-01]
..LN215:
	.loc    1  41  is_stmt 1
        movl      $-1, %edi                                     #41.3
..LN216:
#       exit(int)
        call      exit                                          #41.3
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
..LN217:
                                # LOE
L_main_78__par_region1_2.3:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
# parameter 7: 16 + %rbp
# parameter 8: 24 + %rbp
..B1.30:                        # Preds ..B1.0
                                # Execution count [3.92e+00]
..LN218:
	.loc    1  78  is_stmt 1
        pushq     %rbp                                          #78.3
	.cfi_def_cfa 7, 16
..LN219:
        movq      %rsp, %rbp                                    #78.3
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN220:
        andq      $-128, %rsp                                   #78.3
..LN221:
        subq      $512, %rsp                                    #78.3
..LN222:
	.loc    1  79  is_stmt 1
        xorl      %esi, %esi                                    #79.3
..LN223:
	.loc    1  78  is_stmt 1
        movl      (%rdi), %r11d                                 #78.3
..LN224:
        movl      (%rdx), %edi                                  #78.3
..LN225:
        movq      %rbx, 392(%rsp)                               #78.3[spill]
..LN226:
        movq      %r15, 360(%rsp)                               #78.3[spill]
..LN227:
        movq      %r14, 368(%rsp)                               #78.3[spill]
..LN228:
        movq      %r13, 376(%rsp)                               #78.3[spill]
..LN229:
        movq      %r12, 384(%rsp)                               #78.3[spill]
..LN230:
        movl      (%rcx), %r10d                                 #78.3
..LN231:
	.loc    1  79  is_stmt 1
        xorl      %ecx, %ecx                                    #79.3
..LN232:
        testl     %edi, %edi                                    #79.18
..LN233:
        jle       ..B1.58       # Prob 9%                       #79.18
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x78, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x70, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x68, 0xff, 0xff, 0xff, 0x22
..LN234:
                                # LOE r8 r9 ecx esi edi r10d r11d
..B1.31:                        # Preds ..B1.30
                                # Execution count [3.53e+00]
..LN235:
	.loc    1  80  is_stmt 1
        lea       -1(%r10), %ebx                                #80.4
..LN236:
	.loc    1  85  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #85.12
..LN237:
	.loc    1  80  is_stmt 1
        movl      %esi, 32(%rsp)                                #80.4[spill]
..LN238:
        movl      %edi, 8(%rsp)                                 #80.4[spill]
..LN239:
        movl      %r10d, 16(%rsp)                               #80.4[spill]
..LN240:
        movl      %r11d, 40(%rsp)                               #80.4[spill]
..LN241:
        movq      %r8, (%rsp)                                   #80.4[spill]
..LN242:
        movq      %r9, 24(%rsp)                                 #80.4[spill]
..LN243:
                                # LOE ebx
..B1.32:                        # Preds ..B1.56 ..B1.31
                                # Execution count [1.96e+01]
..LN244:
	.loc    1  82  is_stmt 1
        cmpl      $0, 16(%rsp)                                  #82.37[spill]
..LN245:
        jle       ..B1.53       # Prob 10%                      #82.37
..LN246:
                                # LOE ebx
..B1.33:                        # Preds ..B1.32
                                # Execution count [9.79e+01]
..LN247:
	.loc    1  80  is_stmt 1
        xorl      %eax, %eax                                    #80.4
..LN248:
        movl      $1, %r11d                                     #80.4
..LN249:
        movl      %eax, 48(%rsp)                                #80.4
..LN250:
        movl      $.2.9_2_kmpc_loc_struct_pack.63, %edi         #80.4
..LN251:
        movl      %ebx, 52(%rsp)                                #80.4
..LN252:
        movl      $34, %edx                                     #80.4
..LN253:
        movl      %eax, 56(%rsp)                                #80.4
..LN254:
        movl      %r11d, 60(%rsp)                               #80.4
..LN255:
        addq      $-32, %rsp                                    #80.4
..LN256:
        lea       92(%rsp), %r10                                #80.4
..LN257:
        lea       88(%rsp), %rcx                                #80.4
..LN258:
        lea       80(%rsp), %r8                                 #80.4
..LN259:
        movq      %r10, (%rsp)                                  #80.4
..LN260:
        lea       84(%rsp), %r9                                 #80.4
..LN261:
        movl      %r11d, 8(%rsp)                                #80.4
..LN262:
        movl      %r11d, 16(%rsp)                               #80.4
..LN263:
        movl      -16(%rcx), %esi                               #80.4[spill]
..LN264:
        call      __kmpc_for_static_init_4                      #80.4
..LN265:
                                # LOE ebx
..B1.113:                       # Preds ..B1.33
                                # Execution count [9.79e+01]
..LN266:
        addq      $32, %rsp                                     #80.4
..LN267:
                                # LOE ebx
..B1.34:                        # Preds ..B1.113
                                # Execution count [0.00e+00]
..LN268:
        movslq    16(%rsp), %rax                                #80.4[spill]
..LN269:
        decq      %rax                                          #80.4
..LN270:
        movslq    48(%rsp), %r8                                 #80.4
..LN271:
        movl      52(%rsp), %r9d                                #80.4
..LN272:
        cmpq      %rax, %r8                                     #80.4
..LN273:
        jg        ..B1.52       # Prob 50%                      #80.4
..LN274:
                                # LOE r8 ebx r9d
..B1.35:                        # Preds ..B1.34
                                # Execution count [0.00e+00]
..LN275:
        cmpl      %ebx, %r9d                                    #80.4
..LN276:
        cmovge    %ebx, %r9d                                    #80.4
..LN277:
        movslq    %r9d, %r9                                     #80.4
..LN278:
	.loc    1  82  is_stmt 1
        cmpq      %r9, %r8                                      #82.37
..LN279:
        jg        ..B1.52       # Prob 50%                      #82.37
..LN280:
                                # LOE r8 ebx r9d
..B1.36:                        # Preds ..B1.35
                                # Execution count [1.76e+01]
..LN281:
	.loc    1  80  is_stmt 1
        subl      %r8d, %r9d                                    #80.4
..LN282:
	.loc    1  83  is_stmt 1
        movq      24(%rsp), %rdi                                #83.12[spill]
..LN283:
	.loc    1  80  is_stmt 1
        incl      %r9d                                          #80.4
..LN284:
	.loc    1  83  is_stmt 1
        movq      (%rsp), %rsi                                  #83.5[spill]
..LN285:
        movq      16(%rbp), %rcx                                #83.19
..LN286:
        movq      24(%rbp), %rax                                #83.26
..LN287:
	.loc    1  80  is_stmt 1
        movslq    %r9d, %rdx                                    #80.4
..LN288:
	.loc    1  83  is_stmt 1
        movq      (%rdi), %rdi                                  #83.12
..LN289:
        movq      (%rsi), %rsi                                  #83.5
..LN290:
        movq      (%rcx), %rcx                                  #83.19
..LN291:
        movq      (%rax), %rax                                  #83.26
..LN292:
	.loc    1  80  is_stmt 1
        cmpq      $16, %rdx                                     #80.4
..LN293:
        jl        ..B1.90       # Prob 10%                      #80.4
..LN294:
                                # LOE rax rdx rcx rsi rdi r8 ebx r9d
..B1.37:                        # Preds ..B1.36
                                # Execution count [1.76e+01]
..LN295:
	.loc    1  83  is_stmt 1
        lea       (%rsi,%r8,8), %r14                            #83.5
..LN296:
	.loc    1  80  is_stmt 1
        movq      %r14, %r10                                    #80.4
..LN297:
        andq      $31, %r10                                     #80.4
..LN298:
        testl     %r10d, %r10d                                  #80.4
..LN299:
        je        ..B1.40       # Prob 50%                      #80.4
..LN300:
                                # LOE rax rdx rcx rsi rdi r8 r14 ebx r9d r10d
..B1.38:                        # Preds ..B1.37
                                # Execution count [1.76e+01]
..LN301:
        testl     $7, %r10d                                     #80.4
..LN302:
        jne       ..B1.90       # Prob 10%                      #80.4
..LN303:
                                # LOE rax rdx rcx rsi rdi r8 r14 ebx r9d r10d
..B1.39:                        # Preds ..B1.38
                                # Execution count [8.81e+00]
..LN304:
        negl      %r10d                                         #80.4
..LN305:
        addl      $32, %r10d                                    #80.4
..LN306:
        shrl      $3, %r10d                                     #80.4
..LN307:
                                # LOE rax rdx rcx rsi rdi r8 r14 ebx r9d r10d
..B1.40:                        # Preds ..B1.39 ..B1.37
                                # Execution count [1.76e+01]
..LN308:
        lea       16(%r10), %r11d                               #80.4
..LN309:
        cmpq      %r11, %rdx                                    #80.4
..LN310:
        jl        ..B1.90       # Prob 10%                      #80.4
..LN311:
                                # LOE rax rdx rcx rsi rdi r8 r14 ebx r9d r10d
..B1.41:                        # Preds ..B1.40
                                # Execution count [1.76e+01]
..LN312:
        movl      %r9d, %r11d                                   #80.4
..LN313:
        xorl      %r15d, %r15d                                  #80.4
..LN314:
        subl      %r10d, %r11d                                  #80.4
..LN315:
	.loc    1  83  is_stmt 1
        lea       (%rdi,%r8,8), %r13                            #83.12
..LN316:
	.loc    1  80  is_stmt 1
        andl      $15, %r11d                                    #80.4
..LN317:
	.loc    1  83  is_stmt 1
        lea       (%rcx,%r8,8), %r12                            #83.19
..LN318:
	.loc    1  80  is_stmt 1
        subl      %r11d, %r9d                                   #80.4
..LN319:
	.loc    1  83  is_stmt 1
        lea       (%rax,%r8,8), %r11                            #83.26
..LN320:
	.loc    1  80  is_stmt 1
        testl     %r10d, %r10d                                  #80.4
..LN321:
        movl      %r10d, %r10d                                  #80.4
..LN322:
        jbe       ..B1.45       # Prob 0%                       #80.4
..LN323:
                                # LOE rax rdx rcx rsi rdi r8 r10 r11 r12 r13 r14 r15 ebx r9d
..B1.43:                        # Preds ..B1.41 ..B1.43
                                # Execution count [9.79e+01]
..LN324:
	.loc    1  83  is_stmt 1
        vmovsd    (%r12,%r15,8), %xmm0                          #83.19
..LN325:
        vmulsd    (%r11,%r15,8), %xmm0, %xmm1                   #83.26
..LN326:
        vaddsd    (%r13,%r15,8), %xmm1, %xmm2                   #83.26
..LN327:
        vmovsd    %xmm2, (%r14,%r15,8)                          #83.5
..LN328:
	.loc    1  80  is_stmt 1
        incq      %r15                                          #80.4
..LN329:
        cmpq      %r10, %r15                                    #80.4
..LN330:
        jb        ..B1.43       # Prob 82%                      #80.4
..LN331:
                                # LOE rax rdx rcx rsi rdi r8 r10 r11 r12 r13 r14 r15 ebx r9d
..B1.45:                        # Preds ..B1.43 ..B1.41
                                # Execution count [1.76e+01]
..LN332:
        movslq    %r9d, %r15                                    #80.4
..LN333:
                                # LOE rax rdx rcx rsi rdi r8 r10 r11 r12 r13 r14 r15 ebx r9d
..B1.46:                        # Preds ..B1.46 ..B1.45
                                # Execution count [9.79e+01]
..LN334:
	.loc    1  83  is_stmt 1
        vmovupd   (%r12,%r10,8), %xmm1                          #83.19
..LN335:
        vmovupd   32(%r12,%r10,8), %xmm9                        #83.19
..LN336:
        vmovupd   (%r11,%r10,8), %xmm2                          #83.26
..LN337:
        vmovupd   32(%r11,%r10,8), %xmm10                       #83.26
..LN338:
        vmovupd   (%r13,%r10,8), %xmm0                          #83.12
..LN339:
        vmovupd   32(%r13,%r10,8), %xmm8                        #83.12
..LN340:
        vinsertf128 $1, 16(%r12,%r10,8), %ymm1, %ymm3           #83.19
..LN341:
        vinsertf128 $1, 48(%r12,%r10,8), %ymm9, %ymm11          #83.19
..LN342:
        vinsertf128 $1, 16(%r11,%r10,8), %ymm2, %ymm4           #83.26
..LN343:
        vinsertf128 $1, 48(%r11,%r10,8), %ymm10, %ymm12         #83.26
..LN344:
        vmulpd    %ymm4, %ymm3, %ymm6                           #83.26
..LN345:
        vmulpd    %ymm12, %ymm11, %ymm14                        #83.26
..LN346:
        vmovupd   64(%r11,%r10,8), %xmm2                        #83.26
..LN347:
        vmovupd   96(%r11,%r10,8), %xmm10                       #83.26
..LN348:
        vmovupd   64(%r12,%r10,8), %xmm1                        #83.19
..LN349:
        vmovupd   96(%r12,%r10,8), %xmm9                        #83.19
..LN350:
        vinsertf128 $1, 80(%r12,%r10,8), %ymm1, %ymm3           #83.19
..LN351:
        vinsertf128 $1, 112(%r12,%r10,8), %ymm9, %ymm11         #83.19
..LN352:
        vinsertf128 $1, 16(%r13,%r10,8), %ymm0, %ymm5           #83.12
..LN353:
        vinsertf128 $1, 48(%r13,%r10,8), %ymm8, %ymm13          #83.12
..LN354:
        vinsertf128 $1, 80(%r11,%r10,8), %ymm2, %ymm4           #83.26
..LN355:
        vinsertf128 $1, 112(%r11,%r10,8), %ymm10, %ymm12        #83.26
..LN356:
        vaddpd    %ymm6, %ymm5, %ymm7                           #83.26
..LN357:
        vaddpd    %ymm14, %ymm13, %ymm15                        #83.26
..LN358:
        vmovupd   64(%r13,%r10,8), %xmm0                        #83.12
..LN359:
        vmulpd    %ymm4, %ymm3, %ymm6                           #83.26
..LN360:
        vmulpd    %ymm12, %ymm11, %ymm14                        #83.26
..LN361:
        vmovupd   96(%r13,%r10,8), %xmm8                        #83.12
..LN362:
        vmovupd   %ymm7, (%r14,%r10,8)                          #83.5
..LN363:
        vmovupd   %ymm15, 32(%r14,%r10,8)                       #83.5
..LN364:
        vinsertf128 $1, 80(%r13,%r10,8), %ymm0, %ymm5           #83.12
..LN365:
        vinsertf128 $1, 112(%r13,%r10,8), %ymm8, %ymm13         #83.12
..LN366:
        vaddpd    %ymm6, %ymm5, %ymm7                           #83.26
..LN367:
        vaddpd    %ymm14, %ymm13, %ymm15                        #83.26
..LN368:
        vmovupd   %ymm7, 64(%r14,%r10,8)                        #83.5
..LN369:
        vmovupd   %ymm15, 96(%r14,%r10,8)                       #83.5
..LN370:
	.loc    1  80  is_stmt 1
        addq      $16, %r10                                     #80.4
..LN371:
        cmpq      %r15, %r10                                    #80.4
..LN372:
        jb        ..B1.46       # Prob 82%                      #80.4
..LN373:
                                # LOE rax rdx rcx rsi rdi r8 r10 r11 r12 r13 r14 r15 ebx r9d
..B1.48:                        # Preds ..B1.46 ..B1.90
                                # Execution count [1.76e+01]
..LN374:
        xorl      %r10d, %r10d                                  #80.4
..LN375:
        lea       1(%r9), %r11d                                 #80.4
..LN376:
        movslq    %r11d, %r11                                   #80.4
..LN377:
        cmpq      %rdx, %r11                                    #80.4
..LN378:
        ja        ..B1.52       # Prob 0%                       #80.4
..LN379:
                                # LOE rax rdx rcx rsi rdi r8 r10 ebx r9d
..B1.49:                        # Preds ..B1.48
                                # Execution count [1.76e+01]
..LN380:
        movslq    %r9d, %r9                                     #80.4
..LN381:
	.loc    1  83  is_stmt 1
        lea       (%rax,%r8,8), %rax                            #83.26
..LN382:
	.loc    1  80  is_stmt 1
        subq      %r9, %rdx                                     #80.4
..LN383:
	.loc    1  83  is_stmt 1
        lea       (%rcx,%r8,8), %r11                            #83.19
..LN384:
        lea       (%rdi,%r8,8), %rcx                            #83.12
..LN385:
        lea       (%rsi,%r8,8), %rdi                            #83.5
..LN386:
        lea       (%rax,%r9,8), %rax                            #83.26
..LN387:
        lea       (%r11,%r9,8), %r11                            #83.19
..LN388:
        lea       (%rcx,%r9,8), %rsi                            #83.12
..LN389:
        lea       (%rdi,%r9,8), %rcx                            #83.5
..LN390:
                                # LOE rax rdx rcx rsi r10 r11 ebx
..B1.50:                        # Preds ..B1.50 ..B1.49
                                # Execution count [9.79e+01]
..LN391:
        vmovsd    (%r11,%r10,8), %xmm0                          #83.19
..LN392:
        vmulsd    (%rax,%r10,8), %xmm0, %xmm1                   #83.26
..LN393:
        vaddsd    (%rsi,%r10,8), %xmm1, %xmm2                   #83.26
..LN394:
        vmovsd    %xmm2, (%rcx,%r10,8)                          #83.5
..LN395:
	.loc    1  80  is_stmt 1
        incq      %r10                                          #80.4
..LN396:
        cmpq      %rdx, %r10                                    #80.4
..LN397:
        jb        ..B1.50       # Prob 82%                      #80.4
..LN398:
                                # LOE rax rdx rcx rsi r10 r11 ebx
..B1.52:                        # Preds ..B1.50 ..B1.48 ..B1.34 ..B1.35
                                # Execution count [0.00e+00]
..LN399:
        movl      $.2.9_2_kmpc_loc_struct_pack.63, %edi         #80.4
..LN400:
        movl      40(%rsp), %esi                                #80.4[spill]
..LN401:
        vzeroupper                                              #80.4
..LN402:
        call      __kmpc_for_static_fini                        #80.4
..LN403:
                                # LOE ebx
..B1.53:                        # Preds ..B1.52 ..B1.32
                                # Execution count [0.00e+00]
..LN404:
	.loc    1  84  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.81, %edi         #84.4
..LN405:
        xorl      %eax, %eax                                    #84.4
..LN406:
        movl      40(%rsp), %esi                                #84.4[spill]
..___tag_value_main.48:
..LN407:
        call      __kmpc_barrier                                #84.4
..___tag_value_main.49:
..LN408:
                                # LOE ebx
..B1.54:                        # Preds ..B1.53
                                # Execution count [1.96e+01]
..LN409:
	.loc    1  85  is_stmt 1
        movq      24(%rsp), %rax                                #85.7[spill]
..LN410:
        vxorpd    %xmm0, %xmm0, %xmm0                           #85.12
..LN411:
        movq      (%rax), %rdx                                  #85.7
..LN412:
        vcomisd   (%rdx), %xmm0                                 #85.12
..LN413:
        jbe       ..B1.56       # Prob 78%                      #85.12
..LN414:
                                # LOE ebx
..B1.55:                        # Preds ..B1.54
                                # Execution count [4.31e+00]
..LN415:
        movl      $il0_peep_printf_format_1, %edi               #85.15
..LN416:
        call      puts                                          #85.15
..LN417:
                                # LOE ebx
..B1.56:                        # Preds ..B1.55 ..B1.54
                                # Execution count [1.96e+01]
..LN418:
	.loc    1  79  is_stmt 1
        movl      32(%rsp), %eax                                #79.3[spill]
..LN419:
        incl      %eax                                          #79.3
..LN420:
        movl      %eax, 32(%rsp)                                #79.3[spill]
..LN421:
        cmpl      8(%rsp), %eax                                 #79.3[spill]
..LN422:
        jb        ..B1.32       # Prob 81%                      #79.3
..LN423:
                                # LOE ebx
..B1.58:                        # Preds ..B1.56 ..B1.30
                                # Execution count [0.00e+00]
..LN424:
	.loc    1  78  is_stmt 1
        xorl      %eax, %eax                                    #78.3
..LN425:
        movq      360(%rsp), %r15                               #78.3[spill]
	.cfi_restore 15
..LN426:
        movq      368(%rsp), %r14                               #78.3[spill]
	.cfi_restore 14
..LN427:
        movq      376(%rsp), %r13                               #78.3[spill]
	.cfi_restore 13
..LN428:
        movq      384(%rsp), %r12                               #78.3[spill]
	.cfi_restore 12
..LN429:
        movq      392(%rsp), %rbx                               #78.3[spill]
	.cfi_restore 3
..LN430:
        movq      %rbp, %rsp                                    #78.3
..LN431:
        popq      %rbp                                          #78.3
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN432:
        ret                                                     #78.3
	.cfi_def_cfa 6, 16
..LN433:
                                # LOE
L_main_62__par_loop0_2.2:
# parameter 1: %rdi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
# parameter 6: %r9
# parameter 7: 16 + %rbp
..B1.59:                        # Preds ..B1.0
                                # Execution count [7.84e-01]
..LN434:
	.loc    1  62  is_stmt 1
        pushq     %rbp                                          #62.2
	.cfi_def_cfa 7, 16
..LN435:
        movq      %rsp, %rbp                                    #62.2
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN436:
        andq      $-128, %rsp                                   #62.2
..LN437:
        subq      $512, %rsp                                    #62.2
..LN438:
        movq      %rbx, 392(%rsp)                               #62.2[spill]
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
..LN439:
        movl      (%rdx), %ebx                                  #62.2
..LN440:
        movq      %r15, 360(%rsp)                               #62.2[spill]
..LN441:
        movq      %r14, 368(%rsp)                               #62.2[spill]
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x70, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x68, 0xff, 0xff, 0xff, 0x22
..LN442:
        movq      %rcx, %r14                                    #62.2
..LN443:
        movq      %r13, 376(%rsp)                               #62.2[spill]
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x78, 0xff, 0xff, 0xff, 0x22
..LN444:
        movq      %r8, %r13                                     #62.2
..LN445:
        movq      %r12, 384(%rsp)                               #62.2[spill]
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
..LN446:
        movq      %r9, %r12                                     #62.2
..LN447:
        movl      (%rdi), %r15d                                 #62.2
..LN448:
	.loc    1  63  is_stmt 1
        testl     %ebx, %ebx                                    #63.35
..LN449:
        jle       ..B1.80       # Prob 10%                      #63.35
..LN450:
                                # LOE r12 r13 r14 ebx r15d
..B1.60:                        # Preds ..B1.59
                                # Execution count [3.92e+00]
..LN451:
	.loc    1  62  is_stmt 1
        xorl      %eax, %eax                                    #62.2
..LN452:
        decl      %ebx                                          #62.2
..LN453:
        movl      $1, %r11d                                     #62.2
..LN454:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #62.2
..LN455:
        movl      %eax, 32(%rsp)                                #62.2
..LN456:
        movl      %r15d, %esi                                   #62.2
..LN457:
        movl      %ebx, 36(%rsp)                                #62.2
..LN458:
        movl      $34, %edx                                     #62.2
..LN459:
        movl      %eax, 40(%rsp)                                #62.2
..LN460:
        movl      %r11d, 44(%rsp)                               #62.2
..LN461:
        addq      $-32, %rsp                                    #62.2
..LN462:
        lea       72(%rsp), %rcx                                #62.2
..LN463:
        lea       64(%rsp), %r8                                 #62.2
..LN464:
        lea       68(%rsp), %r9                                 #62.2
..LN465:
        lea       76(%rsp), %r10                                #62.2
..LN466:
        movq      %r10, (%rsp)                                  #62.2
..LN467:
        movl      %r11d, 8(%rsp)                                #62.2
..LN468:
        movl      %r11d, 16(%rsp)                               #62.2
..LN469:
        call      __kmpc_for_static_init_4                      #62.2
..LN470:
                                # LOE r12 r13 r14 ebx r15d
..B1.114:                       # Preds ..B1.60
                                # Execution count [3.92e+00]
..LN471:
        addq      $32, %rsp                                     #62.2
..LN472:
                                # LOE r12 r13 r14 ebx r15d
..B1.61:                        # Preds ..B1.114
                                # Execution count [0.00e+00]
..LN473:
        movslq    %ebx, %rbx                                    #62.2
..LN474:
        movslq    32(%rsp), %rax                                #62.2
..LN475:
        movl      36(%rsp), %edx                                #62.2
..LN476:
        cmpq      %rbx, %rax                                    #62.2
..LN477:
        jg        ..B1.79       # Prob 50%                      #62.2
..LN478:
                                # LOE rax r12 r13 r14 edx ebx r15d
..B1.62:                        # Preds ..B1.61
                                # Execution count [0.00e+00]
..LN479:
        cmpl      %ebx, %edx                                    #62.2
..LN480:
        cmovl     %edx, %ebx                                    #62.2
..LN481:
        movslq    %ebx, %rbx                                    #62.2
..LN482:
	.loc    1  63  is_stmt 1
        cmpq      %rbx, %rax                                    #63.35
..LN483:
        jg        ..B1.79       # Prob 50%                      #63.35
..LN484:
                                # LOE rax r12 r13 r14 ebx r15d
..B1.63:                        # Preds ..B1.62
                                # Execution count [7.05e-01]
..LN485:
	.loc    1  62  is_stmt 1
        subl      %eax, %ebx                                    #62.2
..LN486:
        movq      16(%rbp), %r8                                 #62.2
..LN487:
        incl      %ebx                                          #62.2
..LN488:
        movslq    %ebx, %r10                                    #62.2
..LN489:
	.loc    1  64  is_stmt 1
        movq      (%r14), %r14                                  #64.3
..LN490:
	.loc    1  65  is_stmt 1
        movq      (%r13), %r11                                  #65.3
..LN491:
	.loc    1  66  is_stmt 1
        movq      (%r12), %r9                                   #66.3
..LN492:
	.loc    1  67  is_stmt 1
        movq      (%r8), %r8                                    #67.3
..LN493:
	.loc    1  62  is_stmt 1
        cmpq      $16, %r10                                     #62.2
..LN494:
        jl        ..B1.93       # Prob 10%                      #62.2
..LN495:
                                # LOE rax r8 r9 r10 r11 r14 ebx r15d
..B1.64:                        # Preds ..B1.63
                                # Execution count [7.05e-01]
..LN496:
	.loc    1  67  is_stmt 1
        lea       (%r8,%rax,8), %rdi                            #67.3
..LN497:
	.loc    1  62  is_stmt 1
        movq      %rdi, %r12                                    #62.2
..LN498:
        andq      $31, %r12                                     #62.2
..LN499:
        testl     %r12d, %r12d                                  #62.2
..LN500:
        je        ..B1.67       # Prob 50%                      #62.2
..LN501:
                                # LOE rax rdi r8 r9 r10 r11 r14 ebx r12d r15d
..B1.65:                        # Preds ..B1.64
                                # Execution count [7.05e-01]
..LN502:
        testl     $7, %r12d                                     #62.2
..LN503:
        jne       ..B1.93       # Prob 10%                      #62.2
..LN504:
                                # LOE rax rdi r8 r9 r10 r11 r14 ebx r12d r15d
..B1.66:                        # Preds ..B1.65
                                # Execution count [3.53e-01]
..LN505:
        negl      %r12d                                         #62.2
..LN506:
        addl      $32, %r12d                                    #62.2
..LN507:
        shrl      $3, %r12d                                     #62.2
..LN508:
                                # LOE rax rdi r8 r9 r10 r11 r14 ebx r12d r15d
..B1.67:                        # Preds ..B1.66 ..B1.64
                                # Execution count [7.05e-01]
..LN509:
        lea       16(%r12), %edx                                #62.2
..LN510:
        cmpq      %rdx, %r10                                    #62.2
..LN511:
        jl        ..B1.93       # Prob 10%                      #62.2
..LN512:
                                # LOE rax rdi r8 r9 r10 r11 r14 ebx r12d r15d
..B1.68:                        # Preds ..B1.67
                                # Execution count [7.05e-01]
..LN513:
        movl      %ebx, %edx                                    #62.2
..LN514:
	.loc    1  64  is_stmt 1
        lea       (%r14,%rax,8), %rcx                           #64.3
..LN515:
	.loc    1  62  is_stmt 1
        subl      %r12d, %edx                                   #62.2
..LN516:
	.loc    1  65  is_stmt 1
        lea       (%r11,%rax,8), %rsi                           #65.3
..LN517:
	.loc    1  62  is_stmt 1
        andl      $15, %edx                                     #62.2
..LN518:
	.loc    1  66  is_stmt 1
        lea       (%r9,%rax,8), %r13                            #66.3
..LN519:
	.loc    1  62  is_stmt 1
        subl      %edx, %ebx                                    #62.2
..LN520:
        xorl      %edx, %edx                                    #62.2
..LN521:
        testl     %r12d, %r12d                                  #62.2
..LN522:
        movl      %r12d, %r12d                                  #62.2
..LN523:
        jbe       ..B1.72       # Prob 0%                       #62.2
..LN524:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 ebx r15d
..B1.69:                        # Preds ..B1.68
                                # Execution count [7.05e-01]
..LN525:
        movq      %r11, (%rsp)                                  #[spill]
..LN526:
        movq      $0x3ff0a3d70a3d70a4, %r11                     #
..LN527:
        movq      %r14, 8(%rsp)                                 #[spill]
..LN528:
        movq      $0x3ff07ae147ae147b, %r14                     #
..LN529:
        movq      %rax, 16(%rsp)                                #[spill]
..LN530:
        xorl      %eax, %eax                                    #
..LN531:
        movl      %r15d, 24(%rsp)                               #[spill]
..LN532:
        movq      $0x3ff028f5c28f5c29, %r15                     #
..LN533:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx
..B1.70:                        # Preds ..B1.70 ..B1.69
                                # Execution count [3.92e+00]
..LN534:
	.loc    1  64  is_stmt 1
        movq      %r15, (%rcx,%rdx,8)                           #64.3
..LN535:
	.loc    1  65  is_stmt 1
        movq      %r14, (%rsi,%rdx,8)                           #65.3
..LN536:
	.loc    1  66  is_stmt 1
        movq      %r11, (%r13,%rdx,8)                           #66.3
..LN537:
	.loc    1  67  is_stmt 1
        movq      %rax, (%rdi,%rdx,8)                           #67.3
..LN538:
	.loc    1  62  is_stmt 1
        incq      %rdx                                          #62.2
..LN539:
        cmpq      %r12, %rdx                                    #62.2
..LN540:
        jb        ..B1.70       # Prob 82%                      #62.2
..LN541:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx
..B1.71:                        # Preds ..B1.70
                                # Execution count [7.05e-01]
..LN542:
        movq      (%rsp), %r11                                  #[spill]
..LN543:
        movq      8(%rsp), %r14                                 #[spill]
..LN544:
        movq      16(%rsp), %rax                                #[spill]
..LN545:
        movl      24(%rsp), %r15d                               #[spill]
..LN546:
                                # LOE rax rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 ebx r15d
..B1.72:                        # Preds ..B1.68 ..B1.71
                                # Execution count [7.05e-01]
..LN547:
	.loc    1  64  is_stmt 1
        vmovupd   .L_2il0floatpacket.7(%rip), %ymm6             #64.10
..LN548:
	.loc    1  65  is_stmt 1
        vmovupd   .L_2il0floatpacket.8(%rip), %ymm5             #65.10
..LN549:
	.loc    1  66  is_stmt 1
        vmovupd   .L_2il0floatpacket.9(%rip), %ymm4             #66.10
..LN550:
	.loc    1  67  is_stmt 1
        vxorpd    %ymm3, %ymm3, %ymm3                           #67.10
..LN551:
	.loc    1  62  is_stmt 1
        movslq    %ebx, %rdx                                    #62.2
..LN552:
	.loc    1  64  is_stmt 1
        vmovaps   %xmm6, %xmm2                                  #64.3
..LN553:
	.loc    1  65  is_stmt 1
        vmovaps   %xmm5, %xmm1                                  #65.3
..LN554:
	.loc    1  66  is_stmt 1
        vmovaps   %xmm4, %xmm0                                  #66.3
..LN555:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 ebx r15d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.73:                        # Preds ..B1.73 ..B1.72
                                # Execution count [3.92e+00]
..LN556:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm2, (%rcx,%r12,8)                          #64.3
..LN557:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm1, (%rsi,%r12,8)                          #65.3
..LN558:
	.loc    1  66  is_stmt 1
        vmovupd   %xmm0, (%r13,%r12,8)                          #66.3
..LN559:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm2, 32(%rcx,%r12,8)                        #64.3
..LN560:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm1, 32(%rsi,%r12,8)                        #65.3
..LN561:
	.loc    1  66  is_stmt 1
        vmovupd   %xmm0, 32(%r13,%r12,8)                        #66.3
..LN562:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm2, 64(%rcx,%r12,8)                        #64.3
..LN563:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm1, 64(%rsi,%r12,8)                        #65.3
..LN564:
	.loc    1  66  is_stmt 1
        vmovupd   %xmm0, 64(%r13,%r12,8)                        #66.3
..LN565:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm2, 96(%rcx,%r12,8)                        #64.3
..LN566:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm1, 96(%rsi,%r12,8)                        #65.3
..LN567:
	.loc    1  66  is_stmt 1
        vmovupd   %xmm0, 96(%r13,%r12,8)                        #66.3
..LN568:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm6, 16(%rcx,%r12,8)                 #64.3
..LN569:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm5, 16(%rsi,%r12,8)                 #65.3
..LN570:
	.loc    1  66  is_stmt 1
        vextractf128 $1, %ymm4, 16(%r13,%r12,8)                 #66.3
..LN571:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm3, (%rdi,%r12,8)                          #67.3
..LN572:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm6, 48(%rcx,%r12,8)                 #64.3
..LN573:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm5, 48(%rsi,%r12,8)                 #65.3
..LN574:
	.loc    1  66  is_stmt 1
        vextractf128 $1, %ymm4, 48(%r13,%r12,8)                 #66.3
..LN575:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm3, 32(%rdi,%r12,8)                        #67.3
..LN576:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm6, 80(%rcx,%r12,8)                 #64.3
..LN577:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm5, 80(%rsi,%r12,8)                 #65.3
..LN578:
	.loc    1  66  is_stmt 1
        vextractf128 $1, %ymm4, 80(%r13,%r12,8)                 #66.3
..LN579:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm3, 64(%rdi,%r12,8)                        #67.3
..LN580:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm6, 112(%rcx,%r12,8)                #64.3
..LN581:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm5, 112(%rsi,%r12,8)                #65.3
..LN582:
	.loc    1  66  is_stmt 1
        vextractf128 $1, %ymm4, 112(%r13,%r12,8)                #66.3
..LN583:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm3, 96(%rdi,%r12,8)                        #67.3
..LN584:
	.loc    1  62  is_stmt 1
        addq      $16, %r12                                     #62.2
..LN585:
        cmpq      %rdx, %r12                                    #62.2
..LN586:
        jb        ..B1.73       # Prob 82%                      #62.2
..LN587:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 ebx r15d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.75:                        # Preds ..B1.73 ..B1.93
                                # Execution count [7.05e-01]
..LN588:
        xorl      %edx, %edx                                    #62.2
..LN589:
        lea       1(%rbx), %ecx                                 #62.2
..LN590:
        movslq    %ecx, %rcx                                    #62.2
..LN591:
        cmpq      %r10, %rcx                                    #62.2
..LN592:
        ja        ..B1.79       # Prob 0%                       #62.2
..LN593:
                                # LOE rax rdx r8 r9 r10 r11 r14 ebx r15d
..B1.76:                        # Preds ..B1.75
                                # Execution count [7.05e-01]
..LN594:
        movslq    %ebx, %rbx                                    #62.2
..LN595:
	.loc    1  67  is_stmt 1
        lea       (%r8,%rax,8), %rdi                            #67.3
..LN596:
	.loc    1  62  is_stmt 1
        subq      %rbx, %r10                                    #62.2
..LN597:
	.loc    1  66  is_stmt 1
        lea       (%r9,%rax,8), %rcx                            #66.3
..LN598:
	.loc    1  64  is_stmt 1
        movq      $0x3ff028f5c28f5c29, %rsi                     #64.10
..LN599:
	.loc    1  65  is_stmt 1
        lea       (%r11,%rax,8), %r8                            #65.3
..LN600:
        movq      $0x3ff07ae147ae147b, %r13                     #65.10
..LN601:
	.loc    1  64  is_stmt 1
        lea       (%r14,%rax,8), %rax                           #64.3
..LN602:
	.loc    1  66  is_stmt 1
        movq      $0x3ff0a3d70a3d70a4, %r12                     #66.10
..LN603:
	.loc    1  67  is_stmt 1
        lea       (%rdi,%rbx,8), %rdi                           #67.3
..LN604:
	.loc    1  66  is_stmt 1
        lea       (%rcx,%rbx,8), %rcx                           #66.3
..LN605:
	.loc    1  65  is_stmt 1
        lea       (%r8,%rbx,8), %r8                             #65.3
..LN606:
	.loc    1  64  is_stmt 1
        lea       (%rax,%rbx,8), %rax                           #64.3
..LN607:
        xorl      %ebx, %ebx                                    #64.3
..LN608:
                                # LOE rax rdx rcx rbx rsi rdi r8 r10 r12 r13 r15d
..B1.77:                        # Preds ..B1.77 ..B1.76
                                # Execution count [3.92e+00]
..LN609:
        movq      %rsi, (%rax,%rdx,8)                           #64.3
..LN610:
	.loc    1  65  is_stmt 1
        movq      %r13, (%r8,%rdx,8)                            #65.3
..LN611:
	.loc    1  66  is_stmt 1
        movq      %r12, (%rcx,%rdx,8)                           #66.3
..LN612:
	.loc    1  67  is_stmt 1
        movq      %rbx, (%rdi,%rdx,8)                           #67.3
..LN613:
	.loc    1  62  is_stmt 1
        incq      %rdx                                          #62.2
..LN614:
        cmpq      %r10, %rdx                                    #62.2
..LN615:
        jb        ..B1.77       # Prob 82%                      #62.2
..LN616:
                                # LOE rax rdx rcx rbx rsi rdi r8 r10 r12 r13 r15d
..B1.79:                        # Preds ..B1.77 ..B1.62 ..B1.61 ..B1.75
                                # Execution count [0.00e+00]
..LN617:
        movl      $.2.9_2_kmpc_loc_struct_pack.38, %edi         #62.2
..LN618:
        movl      %r15d, %esi                                   #62.2
..LN619:
        vzeroupper                                              #62.2
..LN620:
        call      __kmpc_for_static_fini                        #62.2
..LN621:
                                # LOE
..B1.80:                        # Preds ..B1.79 ..B1.59
                                # Execution count [0.00e+00]
..LN622:
        xorl      %eax, %eax                                    #62.2
..LN623:
        movq      360(%rsp), %r15                               #62.2[spill]
	.cfi_restore 15
..LN624:
        movq      368(%rsp), %r14                               #62.2[spill]
	.cfi_restore 14
..LN625:
        movq      376(%rsp), %r13                               #62.2[spill]
	.cfi_restore 13
..LN626:
        movq      384(%rsp), %r12                               #62.2[spill]
	.cfi_restore 12
..LN627:
        movq      392(%rsp), %rbx                               #62.2[spill]
	.cfi_restore 3
..LN628:
        movq      %rbp, %rsp                                    #62.2
..LN629:
        popq      %rbp                                          #62.2
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN630:
        ret                                                     #62.2
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x78, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x70, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x68, 0xff, 0xff, 0xff, 0x22
..LN631:
                                # LOE
..B1.81:                        # Preds ..B1.26
                                # Execution count [7.05e-01]: Infreq
..LN632:
        vmovsd    400(%rsp), %xmm3                              #[spill]
..LN633:
                                # LOE eax xmm0 xmm3
..B1.82:                        # Preds ..B1.81 ..B1.89
                                # Execution count [7.84e-01]: Infreq
..LN634:
	.loc    1  93  is_stmt 1
        vdivsd    %xmm0, %xmm3, %xmm0                           #93.2
..LN635:
	.loc    1  91  is_stmt 1
        movl      %eax, %edx                                    #91.2
..LN636:
	.loc    1  93  is_stmt 1
        vxorpd    %xmm2, %xmm2, %xmm2                           #93.42
..LN637:
	.loc    1  91  is_stmt 1
        shrl      $31, %edx                                     #91.2
..LN638:
	.loc    1  93  is_stmt 1
        vxorpd    %xmm1, %xmm1, %xmm1                           #93.2
..LN639:
	.loc    1  91  is_stmt 1
        addl      %edx, %eax                                    #91.2
..LN640:
	.loc    1  93  is_stmt 1
        movl      $.L_2__STRING.2, %edi                         #93.2
..LN641:
	.loc    1  91  is_stmt 1
        sarl      $1, %eax                                      #91.2
..LN642:
	.loc    1  93  is_stmt 1
        movl      320(%rsp), %esi                               #93.23
..LN643:
        vcvtsi2sd %eax, %xmm2, %xmm2                            #93.42
..LN644:
        vcvtsi2sd %esi, %xmm1, %xmm1                            #93.2
..LN645:
        vaddsd    %xmm2, %xmm2, %xmm4                           #93.2
..LN646:
        vmulsd    %xmm1, %xmm0, %xmm3                           #93.2
..LN647:
	.loc    1  91  is_stmt 1
        movl      %eax, 424(%rsp)                               #91.2
..LN648:
	.loc    1  93  is_stmt 1
        movl      $1, %eax                                      #93.2
..LN649:
        vmulsd    %xmm4, %xmm3, %xmm0                           #93.2
..___tag_value_main.81:
..LN650:
#       printf(const char *__restrict__, ...)
        call      printf                                        #93.2
..___tag_value_main.82:
..LN651:
                                # LOE
..B1.83:                        # Preds ..B1.82
                                # Execution count [7.84e-01]: Infreq
..LN652:
	.loc    1  95  is_stmt 1
        movq      288(%rsp), %rdi                               #95.2
..LN653:
#       free(void *)
        call      free                                          #95.2
..LN654:
                                # LOE
..B1.84:                        # Preds ..B1.83
                                # Execution count [7.84e-01]: Infreq
..LN655:
	.loc    1  96  is_stmt 1
        movq      296(%rsp), %rdi                               #96.2
..LN656:
#       free(void *)
        call      free                                          #96.2
..LN657:
                                # LOE
..B1.85:                        # Preds ..B1.84
                                # Execution count [7.84e-01]: Infreq
..LN658:
	.loc    1  97  is_stmt 1
        movq      304(%rsp), %rdi                               #97.2
..LN659:
#       free(void *)
        call      free                                          #97.2
..LN660:
                                # LOE
..B1.86:                        # Preds ..B1.85
                                # Execution count [7.84e-01]: Infreq
..LN661:
	.loc    1  98  is_stmt 1
        movq      312(%rsp), %rdi                               #98.2
..LN662:
#       free(void *)
        call      free                                          #98.2
..LN663:
                                # LOE
..B1.87:                        # Preds ..B1.86
                                # Execution count [7.84e-01]: Infreq
..LN664:
	.loc    1  99  is_stmt 1
        movl      $.2.9_2_kmpc_loc_struct_pack.30, %edi         #99.1
..LN665:
        xorl      %eax, %eax                                    #99.1
..___tag_value_main.83:
..LN666:
        call      __kmpc_end                                    #99.1
..___tag_value_main.84:
..LN667:
                                # LOE
..B1.88:                        # Preds ..B1.87
                                # Execution count [7.84e-01]: Infreq
..LN668:
        movq      360(%rsp), %r15                               #99.1[spill]
	.cfi_restore 15
..LN669:
        xorl      %eax, %eax                                    #99.1
..LN670:
        movq      368(%rsp), %r14                               #99.1[spill]
	.cfi_restore 14
..LN671:
        movq      376(%rsp), %r13                               #99.1[spill]
	.cfi_restore 13
..LN672:
        movq      384(%rsp), %r12                               #99.1[spill]
	.cfi_restore 12
..LN673:
        movq      392(%rsp), %rbx                               #99.1[spill]
	.cfi_restore 3
..LN674:
        movq      %rbp, %rsp                                    #99.1
..LN675:
        popq      %rbp                                          #99.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN676:
        ret                                                     #99.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x88, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x78, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x70, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0x68, 0xff, 0xff, 0xff, 0x22
..LN677:
                                # LOE
..B1.89:                        # Preds ..B1.14
                                # Execution count [7.84e-02]: Infreq
..LN678:
	.loc    1  93  is_stmt 1
        vmovsd    .L_2il0floatpacket.11(%rip), %xmm3            #93.75
..LN679:
        jmp       ..B1.82       # Prob 100%                     #93.75
..LN680:
                                # LOE eax xmm0 xmm3
..B1.90:                        # Preds ..B1.36 ..B1.38 ..B1.40
                                # Execution count [1.76e+00]: Infreq
..LN681:
	.loc    1  80  is_stmt 1
        xorl      %r9d, %r9d                                    #80.4
..LN682:
        jmp       ..B1.48       # Prob 100%                     #80.4
..LN683:
                                # LOE rax rdx rcx rsi rdi r8 ebx r9d
..B1.93:                        # Preds ..B1.63 ..B1.65 ..B1.67
                                # Execution count [7.05e-02]: Infreq
..LN684:
	.loc    1  62  is_stmt 1
        xorl      %ebx, %ebx                                    #62.2
..LN685:
        jmp       ..B1.75       # Prob 100%                     #62.2
        .align    16,0x90
..LN686:
                                # LOE rax r8 r9 r10 r11 r14 ebx r15d
..LN687:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.688:
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
	.byte	55
	.byte	59
	.byte	51
	.byte	55
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
	.byte	50
	.byte	59
	.byte	54
	.byte	50
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
	.byte	50
	.byte	59
	.byte	54
	.byte	56
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
	.byte	55
	.byte	56
	.byte	59
	.byte	56
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
	.byte	48
	.byte	59
	.byte	56
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
	.byte	56
	.byte	52
	.byte	59
	.byte	56
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
	.byte	57
	.byte	57
	.byte	59
	.byte	57
	.byte	57
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
# -- End  main, L_main_62__par_loop0_2.2, L_main_78__par_region1_2.3
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
                                                        #14.36
..LN689:
	.loc    1  14  is_stmt 1
..LN690:
	.loc    1  15  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #15.11
..LN691:
	.loc    1  17  is_stmt 1
        testl     %esi, %esi                                    #17.17
..LN692:
        jle       ..B2.22       # Prob 50%                      #17.17
..LN693:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.2:                         # Preds ..B2.1
                                # Execution count [9.00e-01]
..LN694:
        cmpl      $16, %esi                                     #17.2
..LN695:
        jl        ..B2.24       # Prob 10%                      #17.2
..LN696:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.3:                         # Preds ..B2.2
                                # Execution count [9.00e-01]
..LN697:
        movq      %rdi, %r8                                     #17.2
..LN698:
        andq      $31, %r8                                      #17.2
..LN699:
        testl     %r8d, %r8d                                    #17.2
..LN700:
        je        ..B2.6        # Prob 50%                      #17.2
..LN701:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.4:                         # Preds ..B2.3
                                # Execution count [9.00e-01]
..LN702:
        testl     $7, %r8d                                      #17.2
..LN703:
        jne       ..B2.24       # Prob 10%                      #17.2
..LN704:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.5:                         # Preds ..B2.4
                                # Execution count [4.50e-01]
..LN705:
        negl      %r8d                                          #17.2
..LN706:
        addl      $32, %r8d                                     #17.2
..LN707:
        shrl      $3, %r8d                                      #17.2
..LN708:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.6:                         # Preds ..B2.5 ..B2.3
                                # Execution count [9.00e-01]
..LN709:
        lea       16(%r8), %eax                                 #17.2
..LN710:
        cmpl      %eax, %esi                                    #17.2
..LN711:
        jl        ..B2.24       # Prob 10%                      #17.2
..LN712:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.7:                         # Preds ..B2.6
                                # Execution count [1.00e+00]
..LN713:
        movl      %esi, %edx                                    #17.2
..LN714:
        xorl      %eax, %eax                                    #17.2
..LN715:
        subl      %r8d, %edx                                    #17.2
..LN716:
        andl      $15, %edx                                     #17.2
..LN717:
        negl      %edx                                          #17.2
..LN718:
        addl      %esi, %edx                                    #17.2
..LN719:
        movl      %r8d, %ecx                                    #17.2
..LN720:
        testl     %r8d, %r8d                                    #17.2
..LN721:
        jbe       ..B2.11       # Prob 9%                       #17.2
..LN722:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.9:                         # Preds ..B2.7 ..B2.9
                                # Execution count [5.00e+00]
..LN723:
	.loc    1  18  is_stmt 1
        vaddsd    (%rdi,%rax,8), %xmm0, %xmm0                   #18.3
..LN724:
	.loc    1  17  is_stmt 1
        incq      %rax                                          #17.2
..LN725:
        cmpq      %rcx, %rax                                    #17.2
..LN726:
        jb        ..B2.9        # Prob 82%                      #17.2
..LN727:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.11:                        # Preds ..B2.9 ..B2.7
                                # Execution count [9.00e-01]
..LN728:
        movslq    %edx, %rax                                    #17.2
..LN729:
	.loc    1  15  is_stmt 1
        vxorpd    %xmm4, %xmm4, %xmm4                           #15.11
..LN730:
        vxorpd    %ymm2, %ymm2, %ymm2                           #15.11
..LN731:
        vmovsd    %xmm0, %xmm4, %xmm3                           #15.11
..LN732:
        vmovapd   %ymm2, %ymm1                                  #15.11
..LN733:
        vmovapd   %ymm2, %ymm0                                  #15.11
..LN734:
        vmovaps   %xmm3, %xmm3                                  #15.11
..LN735:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.12:                        # Preds ..B2.12 ..B2.11
                                # Execution count [5.00e+00]
..LN736:
	.loc    1  18  is_stmt 1
        vaddpd    (%rdi,%rcx,8), %ymm3, %ymm3                   #18.3
..LN737:
        vaddpd    32(%rdi,%rcx,8), %ymm2, %ymm2                 #18.3
..LN738:
        vaddpd    64(%rdi,%rcx,8), %ymm1, %ymm1                 #18.3
..LN739:
        vaddpd    96(%rdi,%rcx,8), %ymm0, %ymm0                 #18.3
..LN740:
	.loc    1  17  is_stmt 1
        addq      $16, %rcx                                     #17.2
..LN741:
        cmpq      %rax, %rcx                                    #17.2
..LN742:
        jb        ..B2.12       # Prob 82%                      #17.2
..LN743:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.13:                        # Preds ..B2.12
                                # Execution count [9.00e-01]
..LN744:
	.loc    1  15  is_stmt 1
        vaddpd    %ymm2, %ymm3, %ymm2                           #15.11
..LN745:
	.loc    1  17  is_stmt 1
        lea       1(%rdx), %ecx                                 #17.2
..LN746:
	.loc    1  15  is_stmt 1
        vaddpd    %ymm0, %ymm1, %ymm0                           #15.11
..LN747:
        vaddpd    %ymm0, %ymm2, %ymm1                           #15.11
..LN748:
        vextractf128 $1, %ymm1, %xmm3                           #15.11
..LN749:
        vaddpd    %xmm3, %xmm1, %xmm5                           #15.11
..LN750:
        vunpckhpd %xmm5, %xmm5, %xmm6                           #15.11
..LN751:
        vaddsd    %xmm6, %xmm5, %xmm0                           #15.11
..LN752:
	.loc    1  17  is_stmt 1
        cmpl      %esi, %ecx                                    #17.2
..LN753:
        ja        ..B2.22       # Prob 50%                      #17.2
..LN754:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx esi xmm0 xmm4
..B2.14:                        # Preds ..B2.13
                                # Execution count [8.50e-01]
..LN755:
        movslq    %esi, %rsi                                    #17.2
..LN756:
        subq      %rax, %rsi                                    #17.2
..LN757:
        cmpq      $4, %rsi                                      #17.2
..LN758:
        jl        ..B2.23       # Prob 10%                      #17.2
..LN759:
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0 xmm4
..B2.15:                        # Preds ..B2.14
                                # Execution count [9.00e-01]
..LN760:
        movl      %esi, %ecx                                    #17.2
..LN761:
	.loc    1  15  is_stmt 1
        vmovsd    %xmm0, %xmm4, %xmm0                           #15.11
..LN762:
	.loc    1  17  is_stmt 1
        andl      $-4, %ecx                                     #17.2
..LN763:
        xorl      %r8d, %r8d                                    #17.2
..LN764:
        movslq    %ecx, %rcx                                    #17.2
..LN765:
	.loc    1  18  is_stmt 1
        lea       (%rdi,%rax,8), %rax                           #18.10
..LN766:
	.loc    1  15  is_stmt 1
        vmovaps   %xmm0, %xmm0                                  #15.11
..LN767:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.16:                        # Preds ..B2.16 ..B2.15
                                # Execution count [5.00e+00]
..LN768:
	.loc    1  18  is_stmt 1
        vaddpd    (%rax,%r8,8), %ymm0, %ymm0                    #18.3
..LN769:
	.loc    1  17  is_stmt 1
        addq      $4, %r8                                       #17.2
..LN770:
        cmpq      %rcx, %r8                                     #17.2
..LN771:
        jb        ..B2.16       # Prob 82%                      #17.2
..LN772:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.17:                        # Preds ..B2.16
                                # Execution count [9.00e-01]
..LN773:
	.loc    1  15  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #15.11
..LN774:
        vaddpd    %xmm1, %xmm0, %xmm2                           #15.11
..LN775:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #15.11
..LN776:
        vaddsd    %xmm3, %xmm2, %xmm0                           #15.11
..LN777:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.18:                        # Preds ..B2.17 ..B2.23 ..B2.25
                                # Execution count [1.00e+00]
..LN778:
	.loc    1  17  is_stmt 1
        cmpq      %rsi, %rcx                                    #17.2
..LN779:
        jae       ..B2.22       # Prob 9%                       #17.2
..LN780:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.19:                        # Preds ..B2.18
                                # Execution count [9.00e-01]
..LN781:
	.loc    1  18  is_stmt 1
        movslq    %edx, %rdx                                    #18.10
..LN782:
        lea       (%rdi,%rdx,8), %rax                           #18.10
..LN783:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.20:                        # Preds ..B2.20 ..B2.19
                                # Execution count [5.00e+00]
..LN784:
        vaddsd    (%rax,%rcx,8), %xmm0, %xmm0                   #18.3
..LN785:
	.loc    1  17  is_stmt 1
        incq      %rcx                                          #17.2
..LN786:
        cmpq      %rsi, %rcx                                    #17.2
..LN787:
        jb        ..B2.20       # Prob 82%                      #17.2
..LN788:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.22:                        # Preds ..B2.20 ..B2.13 ..B2.18 ..B2.24 ..B2.1
                                #      
                                # Execution count [1.00e+00]
..LN789:
	.loc    1  19  is_stmt 1
        vzeroupper                                              #19.9
..LN790:
        ret                                                     #19.9
..LN791:
                                # LOE
..B2.23:                        # Preds ..B2.14
                                # Execution count [9.00e-02]: Infreq
..LN792:
	.loc    1  17  is_stmt 1
        xorl      %ecx, %ecx                                    #17.2
..LN793:
        jmp       ..B2.18       # Prob 100%                     #17.2
..LN794:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.24:                        # Preds ..B2.6 ..B2.4 ..B2.2
                                # Execution count [1.00e-01]: Infreq
..LN795:
        xorl      %edx, %edx                                    #17.2
..LN796:
        cmpl      $1, %esi                                      #17.2
..LN797:
        jb        ..B2.22       # Prob 50%                      #17.2
..LN798:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.25:                        # Preds ..B2.24
                                # Execution count [5.00e-02]: Infreq
..LN799:
        movslq    %esi, %rsi                                    #17.2
..LN800:
        xorl      %ecx, %ecx                                    #17.2
..LN801:
        jmp       ..B2.18       # Prob 100%                     #17.2
        .align    16,0x90
..LN802:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..LN803:
	.cfi_endproc
# mark_end;
	.type	check_sum,@function
	.size	check_sum,.-check_sum
..LNcheck_sum.804:
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
                                                        #25.1
..LN805:
	.loc    1  25  is_stmt 1
        pushq     %r12                                          #25.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
..LN806:
        pushq     %r13                                          #25.1
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
..LN807:
        subq      $168, %rsp                                    #25.1
	.cfi_def_cfa_offset 192
..LN808:
        movq      %rsi, %r13                                    #25.1
..LN809:
        movq      %rdi, %r12                                    #25.1
..LN810:
	.loc    1  29  is_stmt 1
        lea       144(%rsp), %rdi                               #29.2
..LN811:
        xorl      %esi, %esi                                    #29.2
..LN812:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #29.2
..LN813:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
                                # Execution count [1.00e+00]
..LN814:
	.loc    1  30  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.32
..LN815:
        vxorpd    %xmm1, %xmm1, %xmm1                           #30.20
..LN816:
        vcvtsi2sdq 152(%rsp), %xmm0, %xmm0                      #30.32
..LN817:
        vcvtsi2sdq 144(%rsp), %xmm1, %xmm1                      #30.20
..LN818:
        vmulsd    .L_2il0floatpacket.11(%rip), %xmm0, %xmm2     #30.43
..LN819:
	.loc    1  32  is_stmt 1
        xorl      %edi, %edi                                    #32.2
..LN820:
        lea       (%rsp), %rsi                                  #32.2
..LN821:
	.loc    1  30  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #30.43
..LN822:
        vmovsd    %xmm3, (%r12)                                 #30.3
..LN823:
	.loc    1  32  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #32.2
..LN824:
                                # LOE rbx rbp r13 r14 r15
..B3.3:                         # Preds ..B3.2
                                # Execution count [1.00e+00]
..LN825:
	.loc    1  33  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #33.41
..LN826:
        vxorpd    %xmm1, %xmm1, %xmm1                           #33.20
..LN827:
        vcvtsi2sdq 8(%rsp), %xmm0, %xmm0                        #33.41
..LN828:
        vcvtsi2sdq (%rsp), %xmm1, %xmm1                         #33.20
..LN829:
        vmulsd    .L_2il0floatpacket.11(%rip), %xmm0, %xmm2     #33.65
..LN830:
        vaddsd    %xmm2, %xmm1, %xmm3                           #33.65
..LN831:
        vmovsd    %xmm3, (%r13)                                 #33.3
..LN832:
	.loc    1  34  is_stmt 1
        addq      $168, %rsp                                    #34.1
	.cfi_def_cfa_offset 24
	.cfi_restore 13
..LN833:
        popq      %r13                                          #34.1
	.cfi_def_cfa_offset 16
	.cfi_restore 12
..LN834:
        popq      %r12                                          #34.1
	.cfi_def_cfa_offset 8
..LN835:
        ret                                                     #34.1
        .align    16,0x90
..LN836:
                                # LOE
..LN837:
	.cfi_endproc
# mark_end;
	.type	timing,@function
	.size	timing,.-timing
..LNtiming.838:
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
