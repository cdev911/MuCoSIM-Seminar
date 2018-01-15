	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.5.239 Build 20170817";
# mark_description "-Ofast -fno-alias -O3 -xHost -qopt-streaming-stores=never -qopt-report=5 -fsource-asm -S -o mycode.s";
	.file "mycode.c"
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
                                                          #36.33
..LN0:
	.file   1 "mycode.c"
	.loc    1  36  is_stmt 1
        pushq     %rbp                                          #36.33
	.cfi_def_cfa_offset 16
..LN1:
        movq      %rsp, %rbp                                    #36.33
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
..LN2:
        andq      $-128, %rsp                                   #36.33
..LN3:
        pushq     %r12                                          #36.33
..LN4:
        pushq     %r13                                          #36.33
..LN5:
        pushq     %r14                                          #36.33
..LN6:
        pushq     %r15                                          #36.33
..LN7:
        pushq     %rbx                                          #36.33
..LN8:
        subq      $472, %rsp                                    #36.33
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN9:
        movq      %rsi, %r12                                    #36.33
..LN10:
        movl      %edi, %ebx                                    #36.33
..LN11:
        movl      $104446, %esi                                 #36.33
..LN12:
        movl      $3, %edi                                      #36.33
..LN13:
        call      __intel_new_feature_proc_init                 #36.33
..LN14:
                                # LOE r12 ebx
..B1.81:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
..LN15:
        vstmxcsr  (%rsp)                                        #36.33
..LN16:
        orl       $32832, (%rsp)                                #36.33
..LN17:
        vldmxcsr  (%rsp)                                        #36.33
..LN18:
	.loc    1  38  is_stmt 1

### 
### 	if(argc != 2){

        cmpl      $2, %ebx                                      #38.13
..LN19:
        jne       ..B1.69       # Prob 21%                      #38.13
..LN20:
                                # LOE r12
..B1.2:                         # Preds ..B1.81
                                # Execution count [7.84e-01]
..LN21:
	.file   2 "/usr/include/stdlib.h"
	.loc    2  280  is_stmt 1

### 		printf("please call with correct arguments ./triad [num_elements in each array]\n");
### 		exit(-1);
### 	}
### 	const int avx = 4;
### 	const int unroll = 4;
### 	int num_elements = atoi(argv[1]);
### 	num_elements = num_elements - (num_elements%(avx*unroll));
### 	const int array_size = num_elements*sizeof(double);
### 
### 	double *A; 
### 	double *B; 
### 	double *C; 
### 	double *D;	
### 
### 	A = (double *) malloc(array_size);
### 	B = (double *) malloc(array_size);
### 	C = (double *) malloc(array_size);
### 	D = (double *) malloc(array_size);
### 	  
### 
### 	// double a, b, c, d, tmp;
### 	int i;	
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
### 	double s = 5;
### 	while( (end-start) < 0.1){
### 		#pragma inline
### 		timing(&start, &ct);
### 		#pragma omp parallel private (r, i)
### 		for(r = 0; r < repeat; ++r){
### 			#pragma omp for
### 			for(i = 0; i < num_elements; ++i){
### 				A[i] = B[i] + C[i] * D[i];
### 				// A[i] = s;
### 				// if(A[i]<0) printf("stop\n");
### 			}
### 			if(A[i]<0) printf("stop\n");
### 		}
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
..LN22:
        call      __intel_sse4_atol                             #280.16
..LN23:
                                # LOE rax
..B1.3:                         # Preds ..B1.2
                                # Execution count [7.84e-01]
..LN24:
        movl      %eax, %r12d                                   #280.16
..LN25:
	.loc    1  45  is_stmt 1
        movl      %r12d, %edx                                   #45.46
..LN26:
        andl      $-2147483633, %edx                            #45.46
..LN27:
        jge       ..B1.79       # Prob 50%                      #45.46
..LN28:
                                # LOE edx r12d
..B1.80:                        # Preds ..B1.3
                                # Execution count [7.84e-01]
..LN29:
        subl      $1, %edx                                      #45.46
..LN30:
        orl       $-16, %edx                                    #45.46
..LN31:
        incl      %edx                                          #45.46
..LN32:
                                # LOE edx r12d
..B1.79:                        # Preds ..B1.3 ..B1.80
                                # Execution count [7.84e-01]
..LN33:
        subl      %edx, %r12d                                   #45.2
..LN34:
	.loc    1  46  is_stmt 1
        movslq    %r12d, %r12                                   #46.25
..LN35:
        movq      %r12, 344(%rsp)                               #46.25[spill]
..LN36:
        lea       (,%r12,8), %rdx                               #46.38
..LN37:
        movslq    %edx, %r14                                    #46.38
..LN38:
	.loc    1  53  is_stmt 1
        movq      %r14, %rdi                                    #53.17
..LN39:
#       malloc(size_t)
        call      malloc                                        #53.17
..LN40:
                                # LOE rax r14 r12d
..B1.83:                        # Preds ..B1.79
                                # Execution count [7.84e-01]
..LN41:
        movq      %rax, %r13                                    #53.17
..LN42:
                                # LOE r13 r14 r12d
..B1.4:                         # Preds ..B1.83
                                # Execution count [7.84e-01]
..LN43:
	.loc    1  54  is_stmt 1
        movq      %r14, %rdi                                    #54.17
..LN44:
#       malloc(size_t)
        call      malloc                                        #54.17
..LN45:
                                # LOE rax r13 r14 r12d
..B1.84:                        # Preds ..B1.4
                                # Execution count [7.84e-01]
..LN46:
        movq      %rax, %r15                                    #54.17
..LN47:
                                # LOE r13 r14 r15 r12d
..B1.5:                         # Preds ..B1.84
                                # Execution count [7.84e-01]
..LN48:
	.loc    1  55  is_stmt 1
        movq      %r14, %rdi                                    #55.17
..LN49:
#       malloc(size_t)
        call      malloc                                        #55.17
..LN50:
                                # LOE rax r13 r14 r15 r12d
..B1.85:                        # Preds ..B1.5
                                # Execution count [7.84e-01]
..LN51:
        movq      %rax, %rbx                                    #55.17
..LN52:
                                # LOE rbx r13 r14 r15 r12d
..B1.6:                         # Preds ..B1.85
                                # Execution count [7.84e-01]
..LN53:
	.loc    1  56  is_stmt 1
        movq      %r14, %rdi                                    #56.17
..LN54:
#       malloc(size_t)
        call      malloc                                        #56.17
..LN55:
                                # LOE rax rbx r13 r15 r12d
..B1.86:                        # Preds ..B1.6
                                # Execution count [7.84e-01]
..LN56:
        movq      %rax, %r14                                    #56.17
..LN57:
                                # LOE rbx r13 r14 r15 r12d
..B1.7:                         # Preds ..B1.86
                                # Execution count [7.84e-01]
..LN58:
	.loc    1  62  is_stmt 1
        testl     %r12d, %r12d                                  #62.17
..LN59:
        jle       ..B1.28       # Prob 50%                      #62.17
..LN60:
                                # LOE rbx r13 r14 r15 r12d
..B1.8:                         # Preds ..B1.7
                                # Execution count [7.05e-01]
..LN61:
        cmpl      $16, %r12d                                    #62.2
..LN62:
        jl        ..B1.75       # Prob 10%                      #62.2
..LN63:
                                # LOE rbx r13 r14 r15 r12d
..B1.9:                         # Preds ..B1.8
                                # Execution count [7.05e-01]
..LN64:
        movq      %r14, %r10                                    #62.2
..LN65:
        andq      $31, %r10                                     #62.2
..LN66:
        movl      %r10d, %r10d                                  #62.2
..LN67:
        testl     %r10d, %r10d                                  #62.2
..LN68:
        je        ..B1.12       # Prob 50%                      #62.2
..LN69:
                                # LOE rbx r10 r13 r14 r15 r12d
..B1.10:                        # Preds ..B1.9
                                # Execution count [7.05e-01]
..LN70:
        testl     $7, %r10d                                     #62.2
..LN71:
        jne       ..B1.75       # Prob 10%                      #62.2
..LN72:
                                # LOE rbx r10 r13 r14 r15 r12d
..B1.11:                        # Preds ..B1.10
                                # Execution count [3.53e-01]
..LN73:
        negl      %r10d                                         #62.2
..LN74:
        addl      $32, %r10d                                    #62.2
..LN75:
        shrl      $3, %r10d                                     #62.2
..LN76:
                                # LOE rbx r10 r13 r14 r15 r12d
..B1.12:                        # Preds ..B1.11 ..B1.9
                                # Execution count [7.05e-01]
..LN77:
        lea       16(%r10), %edx                                #62.2
..LN78:
        cmpl      %edx, %r12d                                   #62.2
..LN79:
        jl        ..B1.75       # Prob 10%                      #62.2
..LN80:
                                # LOE rbx r10 r13 r14 r15 r12d
..B1.13:                        # Preds ..B1.12
                                # Execution count [7.84e-01]
..LN81:
        movl      %r12d, %r8d                                   #62.2
..LN82:
        xorl      %r9d, %r9d                                    #62.2
..LN83:
        subl      %r10d, %r8d                                   #62.2
..LN84:
        andl      $15, %r8d                                     #62.2
..LN85:
        negl      %r8d                                          #62.2
..LN86:
        addl      %r12d, %r8d                                   #62.2
..LN87:
        testl     %r10d, %r10d                                  #62.2
..LN88:
        jbe       ..B1.17       # Prob 10%                      #62.2
..LN89:
                                # LOE rbx r9 r10 r13 r14 r15 r8d r12d
..B1.14:                        # Preds ..B1.13
                                # Execution count [7.05e-01]
..LN90:
	.loc    1  63  is_stmt 1
        movq      $0x3ff028f5c28f5c29, %rcx                     #63.10
..LN91:
	.loc    1  64  is_stmt 1
        movq      $0x3ff07ae147ae147b, %rdx                     #64.10
..LN92:
	.loc    1  65  is_stmt 1
        movq      $0x3ff0a3d70a3d70a4, %rax                     #65.10
..LN93:
        xorl      %r11d, %r11d                                  #65.10
..LN94:
                                # LOE rax rdx rcx rbx r9 r10 r11 r13 r14 r15 r8d r12d
..B1.15:                        # Preds ..B1.15 ..B1.14
                                # Execution count [3.92e+00]
..LN95:
	.loc    1  63  is_stmt 1
        movq      %rcx, (%r13,%r9,8)                            #63.3
..LN96:
	.loc    1  64  is_stmt 1
        movq      %rdx, (%r15,%r9,8)                            #64.3
..LN97:
	.loc    1  65  is_stmt 1
        movq      %rax, (%rbx,%r9,8)                            #65.3
..LN98:
	.loc    1  66  is_stmt 1
        movq      %r11, (%r14,%r9,8)                            #66.3
..LN99:
	.loc    1  62  is_stmt 1
        incq      %r9                                           #62.2
..LN100:
        cmpq      %r10, %r9                                     #62.2
..LN101:
        jb        ..B1.15       # Prob 82%                      #62.2
..LN102:
                                # LOE rax rdx rcx rbx r9 r10 r11 r13 r14 r15 r8d r12d
..B1.17:                        # Preds ..B1.15 ..B1.13
                                # Execution count [7.05e-01]
..LN103:
	.loc    1  63  is_stmt 1
        vmovupd   .L_2il0floatpacket.7(%rip), %ymm6             #63.10
..LN104:
	.loc    1  64  is_stmt 1
        vmovupd   .L_2il0floatpacket.8(%rip), %ymm5             #64.10
..LN105:
	.loc    1  65  is_stmt 1
        vmovupd   .L_2il0floatpacket.9(%rip), %ymm4             #65.10
..LN106:
	.loc    1  66  is_stmt 1
        vxorpd    %ymm3, %ymm3, %ymm3                           #66.10
..LN107:
	.loc    1  62  is_stmt 1
        movslq    %r8d, %rcx                                    #62.2
..LN108:
        vmovaps   %xmm6, %xmm2                                  #62.2
..LN109:
        vmovaps   %xmm5, %xmm1                                  #62.2
..LN110:
        vmovaps   %xmm4, %xmm0                                  #62.2
..LN111:
                                # LOE rcx rbx r10 r13 r14 r15 r8d r12d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.18:                        # Preds ..B1.18 ..B1.17
                                # Execution count [3.92e+00]
..LN112:
	.loc    1  63  is_stmt 1
        vmovupd   %xmm2, (%r13,%r10,8)                          #63.3
..LN113:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm1, (%r15,%r10,8)                          #64.3
..LN114:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm0, (%rbx,%r10,8)                          #65.3
..LN115:
	.loc    1  63  is_stmt 1
        vmovupd   %xmm2, 32(%r13,%r10,8)                        #63.3
..LN116:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm1, 32(%r15,%r10,8)                        #64.3
..LN117:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm0, 32(%rbx,%r10,8)                        #65.3
..LN118:
	.loc    1  63  is_stmt 1
        vmovupd   %xmm2, 64(%r13,%r10,8)                        #63.3
..LN119:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm1, 64(%r15,%r10,8)                        #64.3
..LN120:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm0, 64(%rbx,%r10,8)                        #65.3
..LN121:
	.loc    1  63  is_stmt 1
        vmovupd   %xmm2, 96(%r13,%r10,8)                        #63.3
..LN122:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm1, 96(%r15,%r10,8)                        #64.3
..LN123:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm0, 96(%rbx,%r10,8)                        #65.3
..LN124:
	.loc    1  63  is_stmt 1
        vextractf128 $1, %ymm6, 16(%r13,%r10,8)                 #63.3
..LN125:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm5, 16(%r15,%r10,8)                 #64.3
..LN126:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm4, 16(%rbx,%r10,8)                 #65.3
..LN127:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, (%r14,%r10,8)                          #66.3
..LN128:
	.loc    1  63  is_stmt 1
        vextractf128 $1, %ymm6, 48(%r13,%r10,8)                 #63.3
..LN129:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm5, 48(%r15,%r10,8)                 #64.3
..LN130:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm4, 48(%rbx,%r10,8)                 #65.3
..LN131:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, 32(%r14,%r10,8)                        #66.3
..LN132:
	.loc    1  63  is_stmt 1
        vextractf128 $1, %ymm6, 80(%r13,%r10,8)                 #63.3
..LN133:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm5, 80(%r15,%r10,8)                 #64.3
..LN134:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm4, 80(%rbx,%r10,8)                 #65.3
..LN135:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, 64(%r14,%r10,8)                        #66.3
..LN136:
	.loc    1  63  is_stmt 1
        vextractf128 $1, %ymm6, 112(%r13,%r10,8)                #63.3
..LN137:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm5, 112(%r15,%r10,8)                #64.3
..LN138:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm4, 112(%rbx,%r10,8)                #65.3
..LN139:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, 96(%r14,%r10,8)                        #66.3
..LN140:
	.loc    1  62  is_stmt 1
        addq      $16, %r10                                     #62.2
..LN141:
        cmpq      %rcx, %r10                                    #62.2
..LN142:
        jb        ..B1.18       # Prob 82%                      #62.2
..LN143:
                                # LOE rcx rbx r10 r13 r14 r15 r8d r12d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.19:                        # Preds ..B1.18
                                # Execution count [7.05e-01]
..LN144:
        lea       1(%r8), %edx                                  #62.2
..LN145:
        cmpl      %r12d, %edx                                   #62.2
..LN146:
        ja        ..B1.28       # Prob 50%                      #62.2
..LN147:
                                # LOE rcx rbx r13 r14 r15 r8d r12d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.20:                        # Preds ..B1.19
                                # Execution count [6.66e-01]
..LN148:
        movq      344(%rsp), %rax                               #62.2[spill]
..LN149:
        subq      %rcx, %rax                                    #62.2
..LN150:
        cmpq      $4, %rax                                      #62.2
..LN151:
        jl        ..B1.74       # Prob 10%                      #62.2
..LN152:
                                # LOE rax rcx rbx r13 r14 r15 r8d r12d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.21:                        # Preds ..B1.20
                                # Execution count [7.05e-01]
..LN153:
        movl      %eax, %edx                                    #62.2
..LN154:
        xorl      %esi, %esi                                    #62.2
..LN155:
        andl      $-4, %edx                                     #62.2
..LN156:
	.loc    1  66  is_stmt 1
        lea       (%r14,%rcx,8), %r11                           #66.3
..LN157:
	.loc    1  62  is_stmt 1
        movslq    %edx, %rdx                                    #62.2
..LN158:
	.loc    1  65  is_stmt 1
        lea       (%rbx,%rcx,8), %r10                           #65.3
..LN159:
	.loc    1  64  is_stmt 1
        lea       (%r15,%rcx,8), %r9                            #64.3
..LN160:
	.loc    1  63  is_stmt 1
        lea       (%r13,%rcx,8), %rcx                           #63.3
..LN161:
                                # LOE rax rdx rcx rbx rsi r9 r10 r11 r13 r14 r15 r8d r12d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.22:                        # Preds ..B1.22 ..B1.21
                                # Execution count [3.92e+00]
..LN162:
        vmovupd   %xmm2, (%rcx,%rsi,8)                          #63.3
..LN163:
	.loc    1  64  is_stmt 1
        vmovupd   %xmm1, (%r9,%rsi,8)                           #64.3
..LN164:
	.loc    1  65  is_stmt 1
        vmovupd   %xmm0, (%r10,%rsi,8)                          #65.3
..LN165:
	.loc    1  63  is_stmt 1
        vextractf128 $1, %ymm6, 16(%rcx,%rsi,8)                 #63.3
..LN166:
	.loc    1  64  is_stmt 1
        vextractf128 $1, %ymm5, 16(%r9,%rsi,8)                  #64.3
..LN167:
	.loc    1  65  is_stmt 1
        vextractf128 $1, %ymm4, 16(%r10,%rsi,8)                 #65.3
..LN168:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm3, (%r11,%rsi,8)                          #66.3
..LN169:
	.loc    1  62  is_stmt 1
        addq      $4, %rsi                                      #62.2
..LN170:
        cmpq      %rdx, %rsi                                    #62.2
..LN171:
        jb        ..B1.22       # Prob 82%                      #62.2
..LN172:
                                # LOE rax rdx rcx rbx rsi r9 r10 r11 r13 r14 r15 r8d r12d xmm0 xmm1 xmm2 ymm3 ymm4 ymm5 ymm6
..B1.24:                        # Preds ..B1.22 ..B1.74 ..B1.76
                                # Execution count [7.84e-01]
..LN173:
        cmpq      %rax, %rdx                                    #62.2
..LN174:
        jae       ..B1.28       # Prob 10%                      #62.2
..LN175:
                                # LOE rax rdx rbx r13 r14 r15 r8d r12d
..B1.25:                        # Preds ..B1.24
                                # Execution count [7.05e-01]
..LN176:
	.loc    1  63  is_stmt 1
        movslq    %r8d, %r8                                     #63.3
..LN177:
        movq      $0x3ff028f5c28f5c29, %rsi                     #63.10
..LN178:
	.loc    1  65  is_stmt 1
        movl      %r12d, (%rsp)                                 #65.10[spill]
..LN179:
	.loc    1  64  is_stmt 1
        movq      $0x3ff07ae147ae147b, %rcx                     #64.10
..LN180:
	.loc    1  65  is_stmt 1
        xorl      %r12d, %r12d                                  #65.10
..LN181:
	.loc    1  66  is_stmt 1
        lea       (%r14,%r8,8), %rdi                            #66.3
..LN182:
	.loc    1  65  is_stmt 1
        lea       (%rbx,%r8,8), %r9                             #65.3
..LN183:
	.loc    1  64  is_stmt 1
        lea       (%r15,%r8,8), %r10                            #64.3
..LN184:
	.loc    1  63  is_stmt 1
        lea       (%r13,%r8,8), %r11                            #63.3
..LN185:
	.loc    1  65  is_stmt 1
        movq      $0x3ff0a3d70a3d70a4, %r8                      #65.10
..LN186:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.26:                        # Preds ..B1.26 ..B1.25
                                # Execution count [3.92e+00]
..LN187:
	.loc    1  63  is_stmt 1
        movq      %rsi, (%r11,%rdx,8)                           #63.3
..LN188:
	.loc    1  64  is_stmt 1
        movq      %rcx, (%r10,%rdx,8)                           #64.3
..LN189:
	.loc    1  65  is_stmt 1
        movq      %r8, (%r9,%rdx,8)                             #65.3
..LN190:
	.loc    1  66  is_stmt 1
        movq      %r12, (%rdi,%rdx,8)                           #66.3
..LN191:
	.loc    1  62  is_stmt 1
        incq      %rdx                                          #62.2
..LN192:
        cmpq      %rax, %rdx                                    #62.2
..LN193:
        jb        ..B1.26       # Prob 82%                      #62.2
..LN194:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15
..B1.27:                        # Preds ..B1.26
                                # Execution count [7.05e-01]
..LN195:
        movl      (%rsp), %r12d                                 #[spill]
..LN196:
                                # LOE rbx r13 r14 r15 r12d
..B1.28:                        # Preds ..B1.24 ..B1.27 ..B1.75 ..B1.19 ..B1.7
                                #      
                                # Execution count [7.84e-01]
..LN197:
	.loc    1  74  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm1             #74.23
..LN198:
	.loc    1  70  is_stmt 1
        movl      $1, %eax                                      #70.13
..LN199:
	.loc    1  74  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #74.2
..LN200:
	.loc    1  29  is_stmt 1
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm3             #29.43
..LN201:
	.loc    1  74  is_stmt 1
        vmovapd   %xmm0, %xmm2                                  #74.2
..LN202:
        vcomisd   %xmm0, %xmm1                                  #74.23
..LN203:
        jbe       ..B1.63       # Prob 10%                      #74.23
..LN204:
                                # LOE rbx r13 r14 r15 eax r12d xmm0 xmm1 xmm2 xmm3
..B1.29:                        # Preds ..B1.28
                                # Execution count [7.05e-01]
..LN205:
	.loc    1  80  is_stmt 1
        movq      %r13, %rdx                                    #80.4
..LN206:
        andq      $31, %rdx                                     #80.4
..LN207:
        movl      %edx, %ecx                                    #80.4
..LN208:
        movl      %edx, %r8d                                    #80.4
..LN209:
        negl      %ecx                                          #80.4
..LN210:
        andl      $7, %r8d                                      #80.4
..LN211:
        addl      $32, %ecx                                     #80.4
..LN212:
        shrl      $3, %ecx                                      #80.4
..LN213:
        movl      %ecx, 336(%rsp)                               #80.4[spill]
..LN214:
        movl      %r8d, 352(%rsp)                               #80.4[spill]
..LN215:
        movl      %edx, 360(%rsp)                               #80.4[spill]
..LN216:
        movq      %r14, 368(%rsp)                               #80.4[spill]
..LN217:
        movl      %eax, %r14d                                   #80.4
..LN218:
                                # LOE rbx r13 r15 r12d r14d
..B1.30:                        # Preds ..B1.61 ..B1.29
                                # Execution count [3.92e+00]
..LN219:
	.loc    1  28  is_stmt 1
        xorl      %esi, %esi                                    #28.2
..LN220:
        lea       288(%rsp), %rdi                               #28.2
..LN221:
        vzeroupper                                              #28.2
..LN222:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #28.2
..LN223:
                                # LOE rbx r13 r15 r12d r14d
..B1.31:                        # Preds ..B1.30
                                # Execution count [3.92e+00]
..LN224:
	.loc    1  29  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #29.32
..LN225:
        vxorpd    %xmm1, %xmm1, %xmm1                           #29.20
..LN226:
        vcvtsi2sdq 296(%rsp), %xmm0, %xmm0                      #29.32
..LN227:
        vcvtsi2sdq 288(%rsp), %xmm1, %xmm1                      #29.20
..LN228:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #29.43
..LN229:
	.loc    1  31  is_stmt 1
        xorl      %edi, %edi                                    #31.2
..LN230:
        lea       (%rsp), %rsi                                  #31.2
..LN231:
	.loc    1  29  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #29.43
..LN232:
        vmovsd    %xmm3, 320(%rsi)                              #29.43[spill]
..LN233:
	.loc    1  31  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #31.2
..LN234:
                                # LOE rbx r13 r15 r12d r14d
..B1.32:                        # Preds ..B1.31
                                # Execution count [3.92e+00]
..LN235:
	.loc    1  78  is_stmt 1
        xorl      %eax, %eax                                    #78.3
..LN236:
        testl     %r14d, %r14d                                  #78.18
..LN237:
        jle       ..B1.59       # Prob 9%                       #78.18
..LN238:
                                # LOE rbx r13 r15 eax r12d r14d
..B1.33:                        # Preds ..B1.32
                                # Execution count [3.53e+00]
..LN239:
        movl      %r14d, 376(%rsp)                              #[spill]
..LN240:
        movl      %eax, %r14d                                   #
..LN241:
        vxorpd    %xmm4, %xmm4, %xmm4                           #
..LN242:
                                # LOE rbx r13 r15 r12d r14d xmm4
..B1.34:                        # Preds ..B1.57 ..B1.33
                                # Execution count [1.96e+01]
..LN243:
	.loc    1  80  is_stmt 1
        xorl      %edi, %edi                                    #80.8
..LN244:
        testl     %r12d, %r12d                                  #80.19
..LN245:
        jle       ..B1.55       # Prob 50%                      #80.19
..LN246:
                                # LOE rbx r13 r15 edi r12d r14d xmm4
..B1.35:                        # Preds ..B1.34
                                # Execution count [1.76e+01]
..LN247:
        cmpl      $16, %r12d                                    #80.4
..LN248:
        jl        ..B1.72       # Prob 10%                      #80.4
..LN249:
                                # LOE rbx r13 r15 edi r12d r14d xmm4
..B1.36:                        # Preds ..B1.35
                                # Execution count [1.76e+01]
..LN250:
        movl      360(%rsp), %esi                               #80.4[spill]
..LN251:
        testl     %esi, %esi                                    #80.4
..LN252:
        je        ..B1.39       # Prob 50%                      #80.4
..LN253:
                                # LOE rbx rsi r13 r15 edi r12d r14d xmm4
..B1.37:                        # Preds ..B1.36
                                # Execution count [1.76e+01]
..LN254:
        cmpl      $0, 352(%rsp)                                 #80.4[spill]
..LN255:
        jne       ..B1.72       # Prob 10%                      #80.4
..LN256:
                                # LOE rbx r13 r15 edi r12d r14d xmm4
..B1.38:                        # Preds ..B1.37
                                # Execution count [8.81e+00]
..LN257:
        movl      336(%rsp), %esi                               #80.4[spill]
..LN258:
                                # LOE rbx rsi r13 r15 edi r12d r14d xmm4
..B1.39:                        # Preds ..B1.38 ..B1.36
                                # Execution count [1.76e+01]
..LN259:
        lea       16(%rsi), %edx                                #80.4
..LN260:
        cmpl      %edx, %r12d                                   #80.4
..LN261:
        jl        ..B1.72       # Prob 10%                      #80.4
..LN262:
                                # LOE rbx rsi r13 r15 edi r12d r14d xmm4
..B1.40:                        # Preds ..B1.39
                                # Execution count [1.96e+01]
..LN263:
        movl      %r12d, %ecx                                   #80.4
..LN264:
        xorl      %edx, %edx                                    #80.4
..LN265:
        subl      %esi, %ecx                                    #80.4
..LN266:
        andl      $15, %ecx                                     #80.4
..LN267:
        negl      %ecx                                          #80.4
..LN268:
        addl      %r12d, %ecx                                   #80.4
..LN269:
        testl     %esi, %esi                                    #80.4
..LN270:
        jbe       ..B1.44       # Prob 9%                       #80.4
..LN271:
                                # LOE rdx rbx rsi r13 r15 ecx r12d r14d xmm4
..B1.41:                        # Preds ..B1.40
                                # Execution count [1.76e+01]
..LN272:
        movq      368(%rsp), %rdi                               #[spill]
..LN273:
                                # LOE rdx rbx rsi rdi r13 r15 ecx r12d r14d xmm4
..B1.42:                        # Preds ..B1.41 ..B1.42
                                # Execution count [9.79e+01]
..LN274:
	.loc    1  81  is_stmt 1
        vmovsd    (%rbx,%rdx,8), %xmm0                          #81.19
..LN275:
        vmulsd    (%rdi,%rdx,8), %xmm0, %xmm1                   #81.26
..LN276:
        vaddsd    (%r15,%rdx,8), %xmm1, %xmm2                   #81.26
..LN277:
        vmovsd    %xmm2, (%r13,%rdx,8)                          #81.5
..LN278:
	.loc    1  80  is_stmt 1
        incq      %rdx                                          #80.4
..LN279:
        cmpq      %rsi, %rdx                                    #80.4
..LN280:
        jb        ..B1.42       # Prob 82%                      #80.4
..LN281:
                                # LOE rdx rbx rsi rdi r13 r15 ecx r12d r14d xmm4
..B1.44:                        # Preds ..B1.42 ..B1.40
                                # Execution count [1.76e+01]
..LN282:
        movslq    %ecx, %rax                                    #80.4
..LN283:
        movq      368(%rsp), %rdx                               #80.4[spill]
..LN284:
                                # LOE rax rdx rbx rsi r13 r15 ecx r12d r14d xmm4
..B1.45:                        # Preds ..B1.45 ..B1.44
                                # Execution count [9.79e+01]
..LN285:
	.loc    1  81  is_stmt 1
        vmovupd   (%rbx,%rsi,8), %xmm7                          #81.19
..LN286:
        vmovupd   (%rdx,%rsi,8), %xmm9                          #81.26
..LN287:
        vmovupd   32(%r15,%rsi,8), %xmm6                        #81.12
..LN288:
        vmovupd   32(%rbx,%rsi,8), %xmm8                        #81.19
..LN289:
        vmovupd   32(%rdx,%rsi,8), %xmm10                       #81.26
..LN290:
        vmovupd   (%r15,%rsi,8), %xmm5                          #81.12
..LN291:
        vinsertf128 $1, 16(%rbx,%rsi,8), %ymm7, %ymm11          #81.19
..LN292:
        vinsertf128 $1, 16(%rdx,%rsi,8), %ymm9, %ymm12          #81.26
..LN293:
        vmulpd    %ymm12, %ymm11, %ymm15                        #81.26
..LN294:
        vmovupd   96(%rbx,%rsi,8), %xmm7                        #81.19
..LN295:
        vmovupd   96(%rdx,%rsi,8), %xmm9                        #81.26
..LN296:
        vinsertf128 $1, 48(%r15,%rsi,8), %ymm6, %ymm2           #81.12
..LN297:
        vinsertf128 $1, 48(%rbx,%rsi,8), %ymm8, %ymm13          #81.19
..LN298:
        vmovupd   64(%rbx,%rsi,8), %xmm6                        #81.19
..LN299:
        vmovupd   64(%rdx,%rsi,8), %xmm8                        #81.26
..LN300:
        vinsertf128 $1, 48(%rdx,%rsi,8), %ymm10, %ymm14         #81.26
..LN301:
        vmulpd    %ymm14, %ymm13, %ymm0                         #81.26
..LN302:
        vaddpd    %ymm0, %ymm2, %ymm2                           #81.26
..LN303:
        vmovupd   %ymm2, 32(%r13,%rsi,8)                        #81.5
..LN304:
        vinsertf128 $1, 16(%r15,%rsi,8), %ymm5, %ymm3           #81.12
..LN305:
        vinsertf128 $1, 80(%rbx,%rsi,8), %ymm6, %ymm10          #81.19
..LN306:
        vinsertf128 $1, 112(%rbx,%rsi,8), %ymm7, %ymm12         #81.19
..LN307:
        vinsertf128 $1, 80(%rdx,%rsi,8), %ymm8, %ymm11          #81.26
..LN308:
        vinsertf128 $1, 112(%rdx,%rsi,8), %ymm9, %ymm13         #81.26
..LN309:
        vaddpd    %ymm15, %ymm3, %ymm1                          #81.26
..LN310:
        vmovupd   64(%r15,%rsi,8), %xmm3                        #81.12
..LN311:
        vmulpd    %ymm11, %ymm10, %ymm14                        #81.26
..LN312:
        vmulpd    %ymm13, %ymm12, %ymm15                        #81.26
..LN313:
        vmovupd   96(%r15,%rsi,8), %xmm5                        #81.12
..LN314:
        vmovupd   %ymm1, (%r13,%rsi,8)                          #81.5
..LN315:
        vinsertf128 $1, 80(%r15,%rsi,8), %ymm3, %ymm1           #81.12
..LN316:
        vinsertf128 $1, 112(%r15,%rsi,8), %ymm5, %ymm0          #81.12
..LN317:
        vaddpd    %ymm14, %ymm1, %ymm1                          #81.26
..LN318:
        vaddpd    %ymm15, %ymm0, %ymm0                          #81.26
..LN319:
        vmovupd   %ymm1, 64(%r13,%rsi,8)                        #81.5
..LN320:
        vmovupd   %ymm0, 96(%r13,%rsi,8)                        #81.5
..LN321:
	.loc    1  80  is_stmt 1
        addq      $16, %rsi                                     #80.4
..LN322:
        cmpq      %rax, %rsi                                    #80.4
..LN323:
        jb        ..B1.45       # Prob 82%                      #80.4
..LN324:
                                # LOE rax rdx rbx rsi r13 r15 ecx r12d r14d xmm4
..B1.46:                        # Preds ..B1.45
                                # Execution count [1.76e+01]
..LN325:
        movl      %ecx, %edi                                    #80.35
..LN326:
        lea       1(%rcx), %edx                                 #80.4
..LN327:
        cmpl      %r12d, %edx                                   #80.4
..LN328:
        ja        ..B1.55       # Prob 50%                      #80.4
..LN329:
                                # LOE rax rbx r13 r15 ecx edi r12d r14d xmm4
..B1.47:                        # Preds ..B1.46
                                # Execution count [1.66e+01]
..LN330:
        movq      344(%rsp), %rsi                               #80.4[spill]
..LN331:
        subq      %rax, %rsi                                    #80.4
..LN332:
        cmpq      $2, %rsi                                      #80.4
..LN333:
        jl        ..B1.71       # Prob 10%                      #80.4
..LN334:
                                # LOE rax rbx rsi r13 r15 ecx edi r12d r14d xmm4
..B1.48:                        # Preds ..B1.47
                                # Execution count [1.76e+01]
..LN335:
	.loc    1  81  is_stmt 1
        movq      368(%rsp), %r10                               #81.26[spill]
..LN336:
	.loc    1  80  is_stmt 1
        movl      %esi, %edx                                    #80.4
..LN337:
        andl      $-2, %edx                                     #80.4
..LN338:
        xorl      %edi, %edi                                    #80.4
..LN339:
        movslq    %edx, %r8                                     #80.4
..LN340:
	.loc    1  81  is_stmt 1
        lea       (%r13,%rax,8), %r9                            #81.5
..LN341:
        lea       (%r10,%rax,8), %r10                           #81.26
..LN342:
        lea       (%rbx,%rax,8), %r11                           #81.19
..LN343:
        lea       (%r15,%rax,8), %rax                           #81.12
..LN344:
                                # LOE rax rbx rsi rdi r8 r9 r10 r11 r13 r15 edx ecx r12d r14d xmm4
..B1.49:                        # Preds ..B1.49 ..B1.48
                                # Execution count [9.79e+01]
..LN345:
        vmovupd   (%r11,%rdi,8), %xmm0                          #81.19
..LN346:
        vmulpd    (%r10,%rdi,8), %xmm0, %xmm1                   #81.26
..LN347:
        vaddpd    (%rax,%rdi,8), %xmm1, %xmm2                   #81.26
..LN348:
        vmovupd   %xmm2, (%r9,%rdi,8)                           #81.5
..LN349:
	.loc    1  80  is_stmt 1
        addq      $2, %rdi                                      #80.4
..LN350:
        cmpq      %r8, %rdi                                     #80.4
..LN351:
        jb        ..B1.49       # Prob 82%                      #80.4
..LN352:
                                # LOE rax rbx rsi rdi r8 r9 r10 r11 r13 r15 edx ecx r12d r14d xmm4
..B1.50:                        # Preds ..B1.49
                                # Execution count [1.76e+01]
..LN353:
	.loc    1  81  is_stmt 1
        lea       (%rcx,%rdx), %edi                             #81.5
..LN354:
                                # LOE rbx rsi r13 r15 edx ecx edi r12d r14d xmm4
..B1.51:                        # Preds ..B1.50 ..B1.71 ..B1.73
                                # Execution count [1.96e+01]
..LN355:
	.loc    1  80  is_stmt 1
        movslq    %edx, %rdx                                    #80.4
..LN356:
        cmpq      %rsi, %rdx                                    #80.4
..LN357:
        jae       ..B1.55       # Prob 9%                       #80.4
..LN358:
                                # LOE rdx rbx rsi r13 r15 ecx edi r12d r14d xmm4
..B1.52:                        # Preds ..B1.51
                                # Execution count [1.76e+01]
..LN359:
	.loc    1  81  is_stmt 1
        movslq    %ecx, %rcx                                    #81.12
..LN360:
        movq      368(%rsp), %r8                                #81.26[spill]
..LN361:
        lea       (%r13,%rcx,8), %r10                           #81.5
..LN362:
        lea       (%r8,%rcx,8), %r9                             #81.26
..LN363:
        lea       (%rbx,%rcx,8), %r8                            #81.19
..LN364:
        lea       (%r15,%rcx,8), %rdi                           #81.12
..LN365:
                                # LOE rdx rbx rsi rdi r8 r9 r10 r13 r15 ecx r12d r14d xmm4
..B1.53:                        # Preds ..B1.53 ..B1.52
                                # Execution count [9.79e+01]
..LN366:
        vmovsd    (%r8,%rdx,8), %xmm0                           #81.19
..LN367:
        vmulsd    (%r9,%rdx,8), %xmm0, %xmm1                    #81.26
..LN368:
        vaddsd    (%rdi,%rdx,8), %xmm1, %xmm2                   #81.26
..LN369:
        vmovsd    %xmm2, (%r10,%rdx,8)                          #81.5
..LN370:
	.loc    1  80  is_stmt 1
        incq      %rdx                                          #80.4
..LN371:
        cmpq      %rsi, %rdx                                    #80.4
..LN372:
        jb        ..B1.53       # Prob 82%                      #80.4
..LN373:
                                # LOE rdx rbx rsi rdi r8 r9 r10 r13 r15 ecx r12d r14d xmm4
..B1.54:                        # Preds ..B1.53
                                # Execution count [1.76e+01]
..LN374:
        movl      %edx, %edi                                    #80.35
..LN375:
	.loc    1  81  is_stmt 1
        addl      %ecx, %edi                                    #81.5
..LN376:
                                # LOE rbx r13 r15 edi r12d r14d xmm4
..B1.55:                        # Preds ..B1.46 ..B1.54 ..B1.51 ..B1.72 ..B1.34
                                #      
                                # Execution count [1.96e+01]
..LN377:
	.loc    1  85  is_stmt 1
        movslq    %edi, %rdi                                    #85.7
..LN378:
        vcomisd   (%r13,%rdi,8), %xmm4                          #85.12
..LN379:
        jbe       ..B1.57       # Prob 78%                      #85.12
..LN380:
                                # LOE rbx r13 r15 r12d r14d xmm4
..B1.56:                        # Preds ..B1.55
                                # Execution count [4.31e+00]
..LN381:
        movl      $il0_peep_printf_format_0, %edi               #85.15
..LN382:
        vzeroupper                                              #85.15
..LN383:
        call      puts                                          #85.15
..LN384:
                                # LOE rbx r13 r15 r12d r14d
..B1.87:                        # Preds ..B1.56
                                # Execution count [4.31e+00]
..LN385:
        vxorpd    %xmm4, %xmm4, %xmm4                           #
..LN386:
                                # LOE rbx r13 r15 r12d r14d xmm4
..B1.57:                        # Preds ..B1.87 ..B1.55
                                # Execution count [1.96e+01]
..LN387:
	.loc    1  78  is_stmt 1
        incl      %r14d                                         #78.3
..LN388:
        cmpl      376(%rsp), %r14d                              #78.3[spill]
..LN389:
        jb        ..B1.34       # Prob 81%                      #78.3
..LN390:
                                # LOE rbx r13 r15 r12d r14d xmm4
..B1.58:                        # Preds ..B1.57
                                # Execution count [3.53e+00]
..LN391:
        movl      376(%rsp), %r14d                              #[spill]
..LN392:
                                # LOE rbx r13 r15 r12d r14d
..B1.59:                        # Preds ..B1.32 ..B1.58
                                # Execution count [3.92e+00]
..LN393:
	.loc    1  28  is_stmt 1
        xorl      %esi, %esi                                    #28.2
..LN394:
        lea       304(%rsp), %rdi                               #28.2
..LN395:
        vzeroupper                                              #28.2
..LN396:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #28.2
..LN397:
                                # LOE rbx r13 r15 r12d r14d
..B1.60:                        # Preds ..B1.59
                                # Execution count [3.92e+00]
..LN398:
	.loc    1  29  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #29.32
..LN399:
        vxorpd    %xmm1, %xmm1, %xmm1                           #29.20
..LN400:
        vcvtsi2sdq 312(%rsp), %xmm0, %xmm0                      #29.32
..LN401:
        vcvtsi2sdq 304(%rsp), %xmm1, %xmm1                      #29.20
..LN402:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #29.43
..LN403:
	.loc    1  31  is_stmt 1
        xorl      %edi, %edi                                    #31.2
..LN404:
        lea       144(%rsp), %rsi                               #31.2
..LN405:
	.loc    1  29  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #29.43
..LN406:
        vmovsd    %xmm3, 184(%rsi)                              #29.43[spill]
..LN407:
	.loc    1  31  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #31.2
..LN408:
                                # LOE rbx r13 r15 r12d r14d
..B1.61:                        # Preds ..B1.60
                                # Execution count [3.92e+00]
..LN409:
	.loc    1  74  is_stmt 1
        vmovsd    328(%rsp), %xmm0                              #74.14[spill]
..LN410:
	.loc    1  88  is_stmt 1
        addl      %r14d, %r14d                                  #88.3
..LN411:
	.loc    1  74  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm1             #74.23
..LN412:
        vsubsd    320(%rsp), %xmm0, %xmm0                       #74.14[spill]
..LN413:
        vcomisd   %xmm0, %xmm1                                  #74.23
..LN414:
        ja        ..B1.30       # Prob 82%                      #74.23
..LN415:
                                # LOE rbx r13 r15 r12d r14d xmm0
..B1.62:                        # Preds ..B1.61
                                # Execution count [7.05e-01]
..LN416:
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm3             #
..LN417:
        movl      %r14d, %eax                                   #
..LN418:
        movq      368(%rsp), %r14                               #[spill]
..LN419:
                                # LOE rbx r13 r14 r15 eax r12d xmm0 xmm3
..B1.63:                        # Preds ..B1.28 ..B1.62
                                # Execution count [7.84e-01]
..LN420:
	.loc    1  92  is_stmt 1
        movl      %eax, %edx                                    #92.2
..LN421:
        vxorpd    %xmm2, %xmm2, %xmm2                           #92.42
..LN422:
        shrl      $31, %edx                                     #92.2
..LN423:
        vxorpd    %xmm1, %xmm1, %xmm1                           #92.2
..LN424:
	.loc    1  90  is_stmt 1
        addl      %edx, %eax                                    #90.2
..LN425:
	.loc    1  92  is_stmt 1
        movl      $.L_2__STRING.2, %edi                         #92.2
..LN426:
	.loc    1  90  is_stmt 1
        sarl      $1, %eax                                      #90.2
..LN427:
	.loc    1  92  is_stmt 1
        movl      %r12d, %esi                                   #92.2
..LN428:
        vcvtsi2sd %eax, %xmm2, %xmm2                            #92.42
..LN429:
        vcvtsi2sd %r12d, %xmm1, %xmm1                           #92.2
..LN430:
        vaddsd    %xmm2, %xmm2, %xmm4                           #92.2
..LN431:
        vmulsd    %xmm1, %xmm3, %xmm3                           #92.2
..LN432:
        vmulsd    %xmm4, %xmm3, %xmm5                           #92.2
..LN433:
        movl      $1, %eax                                      #92.2
..LN434:
        vdivsd    %xmm0, %xmm5, %xmm0                           #92.2
..LN435:
        vzeroupper                                              #92.2
..___tag_value_main.11:
..LN436:
#       printf(const char *__restrict__, ...)
        call      printf                                        #92.2
..___tag_value_main.12:
..LN437:
                                # LOE rbx r13 r14 r15
..B1.64:                        # Preds ..B1.63
                                # Execution count [7.84e-01]
..LN438:
	.loc    1  94  is_stmt 1
        movq      %r13, %rdi                                    #94.2
..LN439:
#       free(void *)
        call      free                                          #94.2
..LN440:
                                # LOE rbx r14 r15
..B1.65:                        # Preds ..B1.64
                                # Execution count [7.84e-01]
..LN441:
	.loc    1  95  is_stmt 1
        movq      %r15, %rdi                                    #95.2
..LN442:
#       free(void *)
        call      free                                          #95.2
..LN443:
                                # LOE rbx r14
..B1.66:                        # Preds ..B1.65
                                # Execution count [7.84e-01]
..LN444:
	.loc    1  96  is_stmt 1
        movq      %rbx, %rdi                                    #96.2
..LN445:
#       free(void *)
        call      free                                          #96.2
..LN446:
                                # LOE r14
..B1.67:                        # Preds ..B1.66
                                # Execution count [7.84e-01]
..LN447:
	.loc    1  97  is_stmt 1
        movq      %r14, %rdi                                    #97.2
..LN448:
#       free(void *)
        call      free                                          #97.2
..LN449:
                                # LOE
..B1.68:                        # Preds ..B1.67
                                # Execution count [7.84e-01]
..LN450:
	.loc    1  98  is_stmt 1
        xorl      %eax, %eax                                    #98.1
..LN451:
        addq      $472, %rsp                                    #98.1
	.cfi_restore 3
..LN452:
        popq      %rbx                                          #98.1
	.cfi_restore 15
..LN453:
        popq      %r15                                          #98.1
	.cfi_restore 14
..LN454:
        popq      %r14                                          #98.1
	.cfi_restore 13
..LN455:
        popq      %r13                                          #98.1
	.cfi_restore 12
..LN456:
        popq      %r12                                          #98.1
..LN457:
        movq      %rbp, %rsp                                    #98.1
..LN458:
        popq      %rbp                                          #98.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN459:
        ret                                                     #98.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN460:
                                # LOE
..B1.69:                        # Preds ..B1.81
                                # Execution count [2.16e-01]
..LN461:
	.loc    1  39  is_stmt 1
        movl      $il0_peep_printf_format_1, %edi               #39.3
..LN462:
        call      puts                                          #39.3
..LN463:
                                # LOE
..B1.70:                        # Preds ..B1.69
                                # Execution count [2.16e-01]
..LN464:
	.loc    1  40  is_stmt 1
        movl      $-1, %edi                                     #40.3
..LN465:
#       exit(int)
        call      exit                                          #40.3
..LN466:
                                # LOE
..B1.71:                        # Preds ..B1.47
                                # Execution count [1.76e+00]: Infreq
..LN467:
	.loc    1  80  is_stmt 1
        xorl      %edx, %edx                                    #80.4
..LN468:
        jmp       ..B1.51       # Prob 100%                     #80.4
..LN469:
                                # LOE rbx rsi r13 r15 edx ecx edi r12d r14d xmm4
..B1.72:                        # Preds ..B1.35 ..B1.37 ..B1.39
                                # Execution count [1.96e+00]: Infreq
..LN470:
        xorl      %ecx, %ecx                                    #80.4
..LN471:
        cmpl      $1, %r12d                                     #80.4
..LN472:
        jb        ..B1.55       # Prob 50%                      #80.4
..LN473:
                                # LOE rbx r13 r15 ecx edi r12d r14d xmm4
..B1.73:                        # Preds ..B1.72
                                # Execution count [9.79e-01]: Infreq
..LN474:
        movq      344(%rsp), %rsi                               #80.4[spill]
..LN475:
        xorl      %edx, %edx                                    #80.4
..LN476:
        jmp       ..B1.51       # Prob 100%                     #80.4
..LN477:
                                # LOE rbx rsi r13 r15 edx ecx edi r12d r14d xmm4
..B1.74:                        # Preds ..B1.20
                                # Execution count [7.05e-02]: Infreq
..LN478:
	.loc    1  62  is_stmt 1
        xorl      %edx, %edx                                    #62.2
..LN479:
        jmp       ..B1.24       # Prob 100%                     #62.2
..LN480:
                                # LOE rax rdx rbx r13 r14 r15 r8d r12d
..B1.75:                        # Preds ..B1.8 ..B1.10 ..B1.12
                                # Execution count [7.84e-02]: Infreq
..LN481:
        xorl      %r8d, %r8d                                    #62.2
..LN482:
        cmpl      $1, %r12d                                     #62.2
..LN483:
        jb        ..B1.28       # Prob 50%                      #62.2
..LN484:
                                # LOE rbx r12 r13 r14 r15 r8d r12d
..B1.76:                        # Preds ..B1.75
                                # Execution count [3.92e-02]: Infreq
..LN485:
        movq      %r12, %rax                                    #62.2
..LN486:
        xorl      %edx, %edx                                    #62.2
..LN487:
        jmp       ..B1.24       # Prob 100%                     #62.2
        .align    16,0x90
..LN488:
                                # LOE rax rdx rbx r13 r14 r15 r8d r12d
..LN489:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.490:
.LNmain:
	.section .rodata.str1.4, "aMS",@progbits,1
	.align 4
	.align 4
il0_peep_printf_format_0:
	.long	1886352499
	.byte	0
	.section .rodata.str1.32, "aMS",@progbits,1
	.align 32
	.align 32
il0_peep_printf_format_1:
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
# -- End  main
	.text
.L_2__routine_start_check_sum_1:
# -- Begin  check_sum
	.text
# mark_begin;
       .align    16,0x90
	.globl check_sum
# --- check_sum(double *, int)
check_sum:
# parameter 1(D): %rdi
# parameter 2(length): %esi
..B2.1:                         # Preds ..B2.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_check_sum.28:
..L29:
                                                         #13.40
..LN491:
	.loc    1  13  is_stmt 1
..LN492:
	.loc    1  14  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #14.13
..LN493:
	.loc    1  16  is_stmt 1
        testl     %esi, %esi                                    #16.17
..LN494:
        jle       ..B2.22       # Prob 50%                      #16.17
..LN495:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.2:                         # Preds ..B2.1
                                # Execution count [9.00e-01]
..LN496:
        cmpl      $16, %esi                                     #16.2
..LN497:
        jl        ..B2.24       # Prob 10%                      #16.2
..LN498:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.3:                         # Preds ..B2.2
                                # Execution count [9.00e-01]
..LN499:
        movq      %rdi, %r8                                     #16.2
..LN500:
        andq      $31, %r8                                      #16.2
..LN501:
        testl     %r8d, %r8d                                    #16.2
..LN502:
        je        ..B2.6        # Prob 50%                      #16.2
..LN503:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.4:                         # Preds ..B2.3
                                # Execution count [9.00e-01]
..LN504:
        testl     $7, %r8d                                      #16.2
..LN505:
        jne       ..B2.24       # Prob 10%                      #16.2
..LN506:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.5:                         # Preds ..B2.4
                                # Execution count [4.50e-01]
..LN507:
        negl      %r8d                                          #16.2
..LN508:
        addl      $32, %r8d                                     #16.2
..LN509:
        shrl      $3, %r8d                                      #16.2
..LN510:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.6:                         # Preds ..B2.5 ..B2.3
                                # Execution count [9.00e-01]
..LN511:
        lea       16(%r8), %eax                                 #16.2
..LN512:
        cmpl      %eax, %esi                                    #16.2
..LN513:
        jl        ..B2.24       # Prob 10%                      #16.2
..LN514:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.7:                         # Preds ..B2.6
                                # Execution count [1.00e+00]
..LN515:
        movl      %esi, %edx                                    #16.2
..LN516:
        xorl      %eax, %eax                                    #16.2
..LN517:
        subl      %r8d, %edx                                    #16.2
..LN518:
        andl      $15, %edx                                     #16.2
..LN519:
        negl      %edx                                          #16.2
..LN520:
        addl      %esi, %edx                                    #16.2
..LN521:
        movl      %r8d, %ecx                                    #16.2
..LN522:
        testl     %r8d, %r8d                                    #16.2
..LN523:
        jbe       ..B2.11       # Prob 9%                       #16.2
..LN524:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.9:                         # Preds ..B2.7 ..B2.9
                                # Execution count [5.00e+00]
..LN525:
	.loc    1  17  is_stmt 1
        vaddsd    (%rdi,%rax,8), %xmm0, %xmm0                   #17.3
..LN526:
	.loc    1  16  is_stmt 1
        incq      %rax                                          #16.2
..LN527:
        cmpq      %rcx, %rax                                    #16.2
..LN528:
        jb        ..B2.9        # Prob 82%                      #16.2
..LN529:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.11:                        # Preds ..B2.9 ..B2.7
                                # Execution count [9.00e-01]
..LN530:
        movslq    %edx, %rax                                    #16.2
..LN531:
	.loc    1  14  is_stmt 1
        vxorpd    %xmm4, %xmm4, %xmm4                           #14.13
..LN532:
        vxorpd    %ymm2, %ymm2, %ymm2                           #14.13
..LN533:
        vmovsd    %xmm0, %xmm4, %xmm3                           #14.13
..LN534:
        vmovapd   %ymm2, %ymm1                                  #14.13
..LN535:
        vmovapd   %ymm2, %ymm0                                  #14.13
..LN536:
        vmovaps   %xmm3, %xmm3                                  #14.13
..LN537:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.12:                        # Preds ..B2.12 ..B2.11
                                # Execution count [5.00e+00]
..LN538:
	.loc    1  17  is_stmt 1
        vaddpd    (%rdi,%rcx,8), %ymm3, %ymm3                   #17.3
..LN539:
        vaddpd    32(%rdi,%rcx,8), %ymm2, %ymm2                 #17.3
..LN540:
        vaddpd    64(%rdi,%rcx,8), %ymm1, %ymm1                 #17.3
..LN541:
        vaddpd    96(%rdi,%rcx,8), %ymm0, %ymm0                 #17.3
..LN542:
	.loc    1  16  is_stmt 1
        addq      $16, %rcx                                     #16.2
..LN543:
        cmpq      %rax, %rcx                                    #16.2
..LN544:
        jb        ..B2.12       # Prob 82%                      #16.2
..LN545:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.13:                        # Preds ..B2.12
                                # Execution count [9.00e-01]
..LN546:
	.loc    1  14  is_stmt 1
        vaddpd    %ymm2, %ymm3, %ymm2                           #14.13
..LN547:
	.loc    1  16  is_stmt 1
        lea       1(%rdx), %ecx                                 #16.2
..LN548:
	.loc    1  14  is_stmt 1
        vaddpd    %ymm0, %ymm1, %ymm0                           #14.13
..LN549:
        vaddpd    %ymm0, %ymm2, %ymm1                           #14.13
..LN550:
        vextractf128 $1, %ymm1, %xmm3                           #14.13
..LN551:
        vaddpd    %xmm3, %xmm1, %xmm5                           #14.13
..LN552:
        vunpckhpd %xmm5, %xmm5, %xmm6                           #14.13
..LN553:
        vaddsd    %xmm6, %xmm5, %xmm0                           #14.13
..LN554:
	.loc    1  16  is_stmt 1
        cmpl      %esi, %ecx                                    #16.2
..LN555:
        ja        ..B2.22       # Prob 50%                      #16.2
..LN556:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx esi xmm0 xmm4
..B2.14:                        # Preds ..B2.13
                                # Execution count [8.50e-01]
..LN557:
        movslq    %esi, %rsi                                    #16.2
..LN558:
        subq      %rax, %rsi                                    #16.2
..LN559:
        cmpq      $4, %rsi                                      #16.2
..LN560:
        jl        ..B2.23       # Prob 10%                      #16.2
..LN561:
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0 xmm4
..B2.15:                        # Preds ..B2.14
                                # Execution count [9.00e-01]
..LN562:
        movl      %esi, %ecx                                    #16.2
..LN563:
	.loc    1  14  is_stmt 1
        vmovsd    %xmm0, %xmm4, %xmm0                           #14.13
..LN564:
	.loc    1  16  is_stmt 1
        andl      $-4, %ecx                                     #16.2
..LN565:
        xorl      %r8d, %r8d                                    #16.2
..LN566:
        movslq    %ecx, %rcx                                    #16.2
..LN567:
	.loc    1  17  is_stmt 1
        lea       (%rdi,%rax,8), %rax                           #17.10
..LN568:
	.loc    1  14  is_stmt 1
        vmovaps   %xmm0, %xmm0                                  #14.13
..LN569:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.16:                        # Preds ..B2.16 ..B2.15
                                # Execution count [5.00e+00]
..LN570:
	.loc    1  17  is_stmt 1
        vaddpd    (%rax,%r8,8), %ymm0, %ymm0                    #17.3
..LN571:
	.loc    1  16  is_stmt 1
        addq      $4, %r8                                       #16.2
..LN572:
        cmpq      %rcx, %r8                                     #16.2
..LN573:
        jb        ..B2.16       # Prob 82%                      #16.2
..LN574:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.17:                        # Preds ..B2.16
                                # Execution count [9.00e-01]
..LN575:
	.loc    1  14  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #14.13
..LN576:
        vaddpd    %xmm1, %xmm0, %xmm2                           #14.13
..LN577:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #14.13
..LN578:
        vaddsd    %xmm3, %xmm2, %xmm0                           #14.13
..LN579:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.18:                        # Preds ..B2.17 ..B2.23 ..B2.25
                                # Execution count [1.00e+00]
..LN580:
	.loc    1  16  is_stmt 1
        cmpq      %rsi, %rcx                                    #16.2
..LN581:
        jae       ..B2.22       # Prob 9%                       #16.2
..LN582:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.19:                        # Preds ..B2.18
                                # Execution count [9.00e-01]
..LN583:
	.loc    1  17  is_stmt 1
        movslq    %edx, %rdx                                    #17.10
..LN584:
        lea       (%rdi,%rdx,8), %rax                           #17.10
..LN585:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.20:                        # Preds ..B2.20 ..B2.19
                                # Execution count [5.00e+00]
..LN586:
        vaddsd    (%rax,%rcx,8), %xmm0, %xmm0                   #17.3
..LN587:
	.loc    1  16  is_stmt 1
        incq      %rcx                                          #16.2
..LN588:
        cmpq      %rsi, %rcx                                    #16.2
..LN589:
        jb        ..B2.20       # Prob 82%                      #16.2
..LN590:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.22:                        # Preds ..B2.20 ..B2.13 ..B2.18 ..B2.24 ..B2.1
                                #      
                                # Execution count [1.00e+00]
..LN591:
	.loc    1  18  is_stmt 1
        vzeroupper                                              #18.9
..LN592:
        ret                                                     #18.9
..LN593:
                                # LOE
..B2.23:                        # Preds ..B2.14
                                # Execution count [9.00e-02]: Infreq
..LN594:
	.loc    1  16  is_stmt 1
        xorl      %ecx, %ecx                                    #16.2
..LN595:
        jmp       ..B2.18       # Prob 100%                     #16.2
..LN596:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.24:                        # Preds ..B2.6 ..B2.4 ..B2.2
                                # Execution count [1.00e-01]: Infreq
..LN597:
        xorl      %edx, %edx                                    #16.2
..LN598:
        cmpl      $1, %esi                                      #16.2
..LN599:
        jb        ..B2.22       # Prob 50%                      #16.2
..LN600:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.25:                        # Preds ..B2.24
                                # Execution count [5.00e-02]: Infreq
..LN601:
        movslq    %esi, %rsi                                    #16.2
..LN602:
        xorl      %ecx, %ecx                                    #16.2
..LN603:
        jmp       ..B2.18       # Prob 100%                     #16.2
        .align    16,0x90
..LN604:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..LN605:
	.cfi_endproc
# mark_end;
	.type	check_sum,@function
	.size	check_sum,.-check_sum
..LNcheck_sum.606:
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
..___tag_value_timing.31:
..L32:
                                                         #24.1
..LN607:
	.loc    1  24  is_stmt 1
        pushq     %r12                                          #24.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
..LN608:
        pushq     %r13                                          #24.1
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
..LN609:
        subq      $168, %rsp                                    #24.1
	.cfi_def_cfa_offset 192
..LN610:
        movq      %rsi, %r13                                    #24.1
..LN611:
        movq      %rdi, %r12                                    #24.1
..LN612:
	.loc    1  28  is_stmt 1
        lea       144(%rsp), %rdi                               #28.2
..LN613:
        xorl      %esi, %esi                                    #28.2
..LN614:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #28.2
..LN615:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
                                # Execution count [1.00e+00]
..LN616:
	.loc    1  29  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #29.32
..LN617:
        vxorpd    %xmm1, %xmm1, %xmm1                           #29.20
..LN618:
        vcvtsi2sdq 152(%rsp), %xmm0, %xmm0                      #29.32
..LN619:
        vcvtsi2sdq 144(%rsp), %xmm1, %xmm1                      #29.20
..LN620:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #29.43
..LN621:
	.loc    1  31  is_stmt 1
        xorl      %edi, %edi                                    #31.2
..LN622:
        lea       (%rsp), %rsi                                  #31.2
..LN623:
	.loc    1  29  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #29.43
..LN624:
        vmovsd    %xmm3, (%r12)                                 #29.3
..LN625:
	.loc    1  31  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #31.2
..LN626:
                                # LOE rbx rbp r13 r14 r15
..B3.3:                         # Preds ..B3.2
                                # Execution count [1.00e+00]
..LN627:
	.loc    1  32  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #32.41
..LN628:
        vxorpd    %xmm1, %xmm1, %xmm1                           #32.20
..LN629:
        vcvtsi2sdq 8(%rsp), %xmm0, %xmm0                        #32.41
..LN630:
        vcvtsi2sdq (%rsp), %xmm1, %xmm1                         #32.20
..LN631:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #32.65
..LN632:
        vaddsd    %xmm2, %xmm1, %xmm3                           #32.65
..LN633:
        vmovsd    %xmm3, (%r13)                                 #32.3
..LN634:
	.loc    1  33  is_stmt 1
        addq      $168, %rsp                                    #33.1
	.cfi_def_cfa_offset 24
	.cfi_restore 13
..LN635:
        popq      %r13                                          #33.1
	.cfi_def_cfa_offset 16
	.cfi_restore 12
..LN636:
        popq      %r12                                          #33.1
	.cfi_def_cfa_offset 8
..LN637:
        ret                                                     #33.1
        .align    16,0x90
..LN638:
                                # LOE
..LN639:
	.cfi_endproc
# mark_end;
	.type	timing,@function
	.size	timing,.-timing
..LNtiming.640:
.LNtiming:
	.data
# -- End  timing
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
.L_2il0floatpacket.2:
	.long	0x9999999a,0x3fb99999
	.type	.L_2il0floatpacket.2,@object
	.size	.L_2il0floatpacket.2,8
	.align 8
.L_2il0floatpacket.3:
	.long	0xa0b5ed8d,0x3eb0c6f7
	.type	.L_2il0floatpacket.3,@object
	.size	.L_2il0floatpacket.3,8
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
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.10,@object
	.size	.L_2il0floatpacket.10,8
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
