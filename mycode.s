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
                                                          #37.33
..LN0:
	.file   1 "mycode.c"
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
        pushq     %r12                                          #37.33
..LN4:
        pushq     %r13                                          #37.33
..LN5:
        pushq     %r14                                          #37.33
..LN6:
        pushq     %r15                                          #37.33
..LN7:
        pushq     %rbx                                          #37.33
..LN8:
        subq      $472, %rsp                                    #37.33
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN9:
        movq      %rsi, %r12                                    #37.33
..LN10:
        movl      %edi, %ebx                                    #37.33
..LN11:
        movl      $104446, %esi                                 #37.33
..LN12:
        movl      $3, %edi                                      #37.33
..LN13:
        call      __intel_new_feature_proc_init                 #37.33
..LN14:
                                # LOE r12 ebx
..B1.61:                        # Preds ..B1.1
                                # Execution count [1.00e+00]
..LN15:
        vstmxcsr  (%rsp)                                        #37.33
..LN16:
        orl       $32832, (%rsp)                                #37.33
..LN17:
        vldmxcsr  (%rsp)                                        #37.33
..LN18:
	.loc    1  39  is_stmt 1

### 
### 	if(argc != 2){

        cmpl      $2, %ebx                                      #39.13
..LN19:
        jne       ..B1.53       # Prob 21%                      #39.13
..LN20:
                                # LOE r12
..B1.2:                         # Preds ..B1.61
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
### 	A = (double *) _mm_malloc(array_size, 64);
### 	B = (double *) _mm_malloc(array_size, 64);
### 	C = (double *) _mm_malloc(array_size, 64);
### 	D = (double *) _mm_malloc(array_size, 64);
### 	  
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
### 	// double s = 5;
### 	while( (end-start) < 0.1){
### 		#pragma inline
### 		timing(&start, &ct);
### 		#pragma omp parallel private (r, i)
### 		for(r = 0; r < repeat; ++r){
### 			#pragma omp for
### 			#pragma unroll(4)
### 			#pragma loop_count(1600)		
### 			for(i = 0; i < num_elements-4; i+=4){
### 				// A[i] = B[i] + C[i] * D[i];
### 				c = _mm256_load_pd(C+i);
### 				b = _mm256_load_pd(B+i);
### 				a = _mm256_load_pd(A+i);
### 				tmp = c = _mm256_mul_pd(b,c);
### 				d = _mm256_add_pd(tmp, a);
### 				_mm256_store_pd(D+i, d);
### 				// A[i] = s;
### 				// if(A[i]<0) printf("stop\n");
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
### 	_mm_free(A);
### 	_mm_free(B);
### 	_mm_free(C);
### 	_mm_free(D);
### }
 movq 8(%r12), %rcx #280.16
..LN22:
        call      __intel_sse4_atol                             #280.16
..LN23:
                                # LOE rax
..B1.3:                         # Preds ..B1.2
                                # Execution count [7.84e-01]
..LN24:
        movl      %eax, %ebx                                    #280.16
..LN25:
	.loc    1  46  is_stmt 1
        movl      %ebx, %edx                                    #46.46
..LN26:
        andl      $-2147483633, %edx                            #46.46
..LN27:
        jge       ..B1.59       # Prob 50%                      #46.46
..LN28:
                                # LOE edx ebx
..B1.60:                        # Preds ..B1.3
                                # Execution count [7.84e-01]
..LN29:
        subl      $1, %edx                                      #46.46
..LN30:
        orl       $-16, %edx                                    #46.46
..LN31:
        incl      %edx                                          #46.46
..LN32:
                                # LOE edx ebx
..B1.59:                        # Preds ..B1.3 ..B1.60
                                # Execution count [7.84e-01]
..LN33:
        subl      %edx, %ebx                                    #46.2
..LN34:
	.loc    1  54  is_stmt 1
        movl      $64, %esi                                     #54.17
..LN35:
	.loc    1  47  is_stmt 1
        movslq    %ebx, %r15                                    #47.25
..LN36:
        lea       (,%r15,8), %rdx                               #47.38
..LN37:
        movslq    %edx, %r13                                    #47.38
..LN38:
	.loc    1  54  is_stmt 1
        movq      %r13, %rdi                                    #54.17
..LN39:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #54.17
..LN40:
                                # LOE rax r13 r15 ebx
..B1.63:                        # Preds ..B1.59
                                # Execution count [7.84e-01]
..LN41:
        movq      %rax, %r14                                    #54.17
..LN42:
                                # LOE r13 r14 r15 ebx
..B1.4:                         # Preds ..B1.63
                                # Execution count [7.84e-01]
..LN43:
	.loc    1  55  is_stmt 1
        movq      %r13, %rdi                                    #55.17
..LN44:
        movl      $64, %esi                                     #55.17
..LN45:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #55.17
..LN46:
                                # LOE rax r13 r14 r15 ebx
..B1.64:                        # Preds ..B1.4
                                # Execution count [7.84e-01]
..LN47:
        movq      %rax, 344(%rsp)                               #55.17[spill]
..LN48:
                                # LOE r13 r14 r15 ebx
..B1.5:                         # Preds ..B1.64
                                # Execution count [7.84e-01]
..LN49:
	.loc    1  56  is_stmt 1
        movq      %r13, %rdi                                    #56.17
..LN50:
        movl      $64, %esi                                     #56.17
..LN51:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #56.17
..LN52:
                                # LOE rax r13 r14 r15 ebx
..B1.65:                        # Preds ..B1.5
                                # Execution count [7.84e-01]
..LN53:
        movq      %rax, %r12                                    #56.17
..LN54:
                                # LOE r12 r13 r14 r15 ebx
..B1.6:                         # Preds ..B1.65
                                # Execution count [7.84e-01]
..LN55:
	.loc    1  57  is_stmt 1
        movq      %r13, %rdi                                    #57.17
..LN56:
        movl      $64, %esi                                     #57.17
..LN57:
#       _mm_malloc(size_t, size_t)
        call      _mm_malloc                                    #57.17
..LN58:
                                # LOE rax r12 r14 r15 ebx
..B1.66:                        # Preds ..B1.6
                                # Execution count [7.84e-01]
..LN59:
        movq      %rax, %r13                                    #57.17
..LN60:
                                # LOE r12 r13 r14 r15 ebx
..B1.7:                         # Preds ..B1.66
                                # Execution count [7.84e-01]
..LN61:
	.loc    1  64  is_stmt 1
        testl     %ebx, %ebx                                    #64.17
..LN62:
        jle       ..B1.21       # Prob 50%                      #64.17
..LN63:
                                # LOE r12 r13 r14 r15 ebx
..B1.8:                         # Preds ..B1.7
                                # Execution count [7.05e-01]
..LN64:
        cmpl      $16, %ebx                                     #64.2
..LN65:
        jl        ..B1.56       # Prob 10%                      #64.2
..LN66:
                                # LOE r12 r13 r14 r15 ebx
..B1.9:                         # Preds ..B1.8
                                # Execution count [7.05e-01]
..LN67:
        movl      %ebx, %r8d                                    #64.2
..LN68:
        xorl      %edx, %edx                                    #64.2
..LN69:
        andl      $-16, %r8d                                    #64.2
..LN70:
	.loc    1  65  is_stmt 1
        vmovupd   .L_2il0floatpacket.4(%rip), %ymm3             #65.10
..LN71:
	.loc    1  66  is_stmt 1
        vmovupd   .L_2il0floatpacket.5(%rip), %ymm2             #66.10
..LN72:
	.loc    1  67  is_stmt 1
        vmovupd   .L_2il0floatpacket.6(%rip), %ymm1             #67.10
..LN73:
	.loc    1  68  is_stmt 1
        vxorpd    %ymm0, %ymm0, %ymm0                           #68.10
..LN74:
	.loc    1  64  is_stmt 1
        movslq    %r8d, %rax                                    #64.2
..LN75:
        movq      344(%rsp), %rcx                               #64.2[spill]
        .align    16,0x90
..LN76:
                                # LOE rax rdx rcx r12 r13 r14 r15 ebx r8d ymm0 ymm1 ymm2 ymm3
..B1.10:                        # Preds ..B1.10 ..B1.9
                                # Execution count [3.92e+00]
..LN77:
	.loc    1  65  is_stmt 1
        vmovupd   %ymm3, (%r14,%rdx,8)                          #65.3
..LN78:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm2, (%rcx,%rdx,8)                          #66.3
..LN79:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm1, (%r12,%rdx,8)                          #67.3
..LN80:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm0, (%r13,%rdx,8)                          #68.3
..LN81:
	.loc    1  65  is_stmt 1
        vmovupd   %ymm3, 32(%r14,%rdx,8)                        #65.3
..LN82:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm2, 32(%rcx,%rdx,8)                        #66.3
..LN83:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm1, 32(%r12,%rdx,8)                        #67.3
..LN84:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm0, 32(%r13,%rdx,8)                        #68.3
..LN85:
	.loc    1  65  is_stmt 1
        vmovupd   %ymm3, 64(%r14,%rdx,8)                        #65.3
..LN86:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm2, 64(%rcx,%rdx,8)                        #66.3
..LN87:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm1, 64(%r12,%rdx,8)                        #67.3
..LN88:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm0, 64(%r13,%rdx,8)                        #68.3
..LN89:
	.loc    1  65  is_stmt 1
        vmovupd   %ymm3, 96(%r14,%rdx,8)                        #65.3
..LN90:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm2, 96(%rcx,%rdx,8)                        #66.3
..LN91:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm1, 96(%r12,%rdx,8)                        #67.3
..LN92:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm0, 96(%r13,%rdx,8)                        #68.3
..LN93:
	.loc    1  64  is_stmt 1
        addq      $16, %rdx                                     #64.2
..LN94:
        cmpq      %rax, %rdx                                    #64.2
..LN95:
        jb        ..B1.10       # Prob 82%                      #64.2
..LN96:
                                # LOE rax rdx rcx r12 r13 r14 r15 ebx r8d ymm0 ymm1 ymm2 ymm3
..B1.12:                        # Preds ..B1.10 ..B1.56
                                # Execution count [7.84e-01]
..LN97:
        lea       1(%r8), %edx                                  #64.2
..LN98:
        cmpl      %ebx, %edx                                    #64.2
..LN99:
        ja        ..B1.21       # Prob 50%                      #64.2
..LN100:
                                # LOE r12 r13 r14 r15 ebx r8d
..B1.13:                        # Preds ..B1.12
                                # Execution count [7.05e-01]
..LN101:
        movslq    %r8d, %r8                                     #64.2
..LN102:
        subq      %r8, %r15                                     #64.2
..LN103:
        cmpq      $4, %r15                                      #64.2
..LN104:
        jl        ..B1.55       # Prob 10%                      #64.2
..LN105:
                                # LOE r12 r13 r14 r15 ebx r8d
..B1.14:                        # Preds ..B1.13
                                # Execution count [7.05e-01]
..LN106:
	.loc    1  65  is_stmt 1
        movslq    %r8d, %r8                                     #65.3
..LN107:
	.loc    1  64  is_stmt 1
        movl      %r15d, %r9d                                   #64.2
..LN108:
	.loc    1  66  is_stmt 1
        movq      344(%rsp), %rdx                               #66.3[spill]
..LN109:
	.loc    1  64  is_stmt 1
        andl      $-4, %r9d                                     #64.2
..LN110:
        movslq    %r9d, %r9                                     #64.2
..LN111:
        xorl      %r11d, %r11d                                  #64.2
..LN112:
	.loc    1  68  is_stmt 1
        vxorpd    %ymm0, %ymm0, %ymm0                           #68.10
..LN113:
	.loc    1  65  is_stmt 1
        vmovupd   .L_2il0floatpacket.4(%rip), %ymm3             #65.10
..LN114:
	.loc    1  68  is_stmt 1
        lea       (%r13,%r8,8), %r10                            #68.3
..LN115:
	.loc    1  66  is_stmt 1
        vmovupd   .L_2il0floatpacket.5(%rip), %ymm2             #66.10
..LN116:
	.loc    1  67  is_stmt 1
        vmovupd   .L_2il0floatpacket.6(%rip), %ymm1             #67.10
..LN117:
        lea       (%r12,%r8,8), %rcx                            #67.3
..LN118:
	.loc    1  66  is_stmt 1
        lea       (%rdx,%r8,8), %rdx                            #66.3
..LN119:
	.loc    1  65  is_stmt 1
        lea       (%r14,%r8,8), %rax                            #65.3
..LN120:
                                # LOE rax rdx rcx r9 r10 r11 r12 r13 r14 r15 ebx r8d ymm0 ymm1 ymm2 ymm3
..B1.15:                        # Preds ..B1.15 ..B1.14
                                # Execution count [3.92e+00]
..LN121:
        vmovupd   %ymm3, (%rax,%r11,8)                          #65.3
..LN122:
	.loc    1  66  is_stmt 1
        vmovupd   %ymm2, (%rdx,%r11,8)                          #66.3
..LN123:
	.loc    1  67  is_stmt 1
        vmovupd   %ymm1, (%rcx,%r11,8)                          #67.3
..LN124:
	.loc    1  68  is_stmt 1
        vmovupd   %ymm0, (%r10,%r11,8)                          #68.3
..LN125:
	.loc    1  64  is_stmt 1
        addq      $4, %r11                                      #64.2
..LN126:
        cmpq      %r9, %r11                                     #64.2
..LN127:
        jb        ..B1.15       # Prob 82%                      #64.2
..LN128:
                                # LOE rax rdx rcx r9 r10 r11 r12 r13 r14 r15 ebx r8d ymm0 ymm1 ymm2 ymm3
..B1.17:                        # Preds ..B1.15 ..B1.55
                                # Execution count [7.84e-01]
..LN129:
        cmpq      %r15, %r9                                     #64.2
..LN130:
        jae       ..B1.21       # Prob 10%                      #64.2
..LN131:
                                # LOE r9 r12 r13 r14 r15 ebx r8d
..B1.18:                        # Preds ..B1.17
                                # Execution count [7.05e-01]
..LN132:
	.loc    1  65  is_stmt 1
        movslq    %r8d, %r8                                     #65.3
..LN133:
        movq      $0x3ff028f5c28f5c29, %r11                     #65.10
..LN134:
	.loc    1  66  is_stmt 1
        movq      344(%rsp), %r10                               #66.3[spill]
..LN135:
	.loc    1  67  is_stmt 1
        xorl      %edi, %edi                                    #67.10
..LN136:
	.loc    1  68  is_stmt 1
        lea       (%r13,%r8,8), %rdx                            #68.3
..LN137:
	.loc    1  67  is_stmt 1
        lea       (%r12,%r8,8), %rcx                            #67.3
..LN138:
	.loc    1  66  is_stmt 1
        lea       (%r10,%r8,8), %rax                            #66.3
..LN139:
        movq      $0x3ff07ae147ae147b, %r10                     #66.10
..LN140:
	.loc    1  65  is_stmt 1
        lea       (%r14,%r8,8), %rsi                            #65.3
..LN141:
	.loc    1  67  is_stmt 1
        movq      $0x3ff0a3d70a3d70a4, %r8                      #67.10
..LN142:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx
..B1.19:                        # Preds ..B1.19 ..B1.18
                                # Execution count [3.92e+00]
..LN143:
	.loc    1  65  is_stmt 1
        movq      %r11, (%rsi,%r9,8)                            #65.3
..LN144:
	.loc    1  66  is_stmt 1
        movq      %r10, (%rax,%r9,8)                            #66.3
..LN145:
	.loc    1  67  is_stmt 1
        movq      %r8, (%rcx,%r9,8)                             #67.3
..LN146:
	.loc    1  68  is_stmt 1
        movq      %rdi, (%rdx,%r9,8)                            #68.3
..LN147:
	.loc    1  64  is_stmt 1
        incq      %r9                                           #64.2
..LN148:
        cmpq      %r15, %r9                                     #64.2
..LN149:
        jb        ..B1.19       # Prob 82%                      #64.2
..LN150:
                                # LOE rax rdx rcx rsi rdi r8 r9 r10 r11 r12 r13 r14 r15 ebx
..B1.21:                        # Preds ..B1.19 ..B1.7 ..B1.12 ..B1.17
                                # Execution count [7.84e-01]
..LN151:
	.loc    1  76  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm1             #76.23
..LN152:
	.loc    1  72  is_stmt 1
        movl      $1, %r15d                                     #72.13
..LN153:
	.loc    1  76  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #76.2
..LN154:
	.loc    1  30  is_stmt 1
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm3             #30.43
..LN155:
	.loc    1  76  is_stmt 1
        vmovapd   %xmm0, %xmm2                                  #76.2
..LN156:
        vcomisd   %xmm0, %xmm1                                  #76.23
..LN157:
        jbe       ..B1.47       # Prob 10%                      #76.23
..LN158:
                                # LOE r12 r13 r14 ebx r15d xmm0 xmm1 xmm2 xmm3
..B1.22:                        # Preds ..B1.21
                                # Execution count [7.05e-01]
..LN159:
	.loc    1  84  is_stmt 1
        movq      %r13, 352(%rsp)                               #84.4[spill]
..LN160:
        lea       -1(%rbx), %ecx                                #84.4
..LN161:
        sarl      $1, %ecx                                      #84.4
..LN162:
        lea       -4(%rbx), %edx                                #84.32
..LN163:
        shrl      $30, %ecx                                     #84.4
..LN164:
        movq      %r12, 360(%rsp)                               #84.4[spill]
..LN165:
        movl      %edx, %r12d                                   #84.4
..LN166:
        movl      %ebx, 288(%rsp)                               #84.4[spill]
..LN167:
        lea       -1(%rbx,%rcx), %ecx                           #84.4
..LN168:
        sarl      $2, %ecx                                      #84.4
..LN169:
        movl      %ecx, %eax                                    #84.4
..LN170:
        shrl      $2, %eax                                      #84.4
..LN171:
        movl      %ecx, 368(%rsp)                               #84.4[spill]
..LN172:
        movl      %eax, %r13d                                   #84.4
..LN173:
                                # LOE r14 r12d r13d r15d
..B1.23:                        # Preds ..B1.45 ..B1.22
                                # Execution count [3.92e+00]
..LN174:
	.loc    1  29  is_stmt 1
        xorl      %esi, %esi                                    #29.2
..LN175:
        lea       296(%rsp), %rdi                               #29.2
..LN176:
        vzeroupper                                              #29.2
..LN177:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #29.2
..LN178:
                                # LOE r14 r12d r13d r15d
..B1.24:                        # Preds ..B1.23
                                # Execution count [3.92e+00]
..LN179:
	.loc    1  30  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.32
..LN180:
        vxorpd    %xmm1, %xmm1, %xmm1                           #30.20
..LN181:
        vcvtsi2sdq 304(%rsp), %xmm0, %xmm0                      #30.32
..LN182:
        vcvtsi2sdq 296(%rsp), %xmm1, %xmm1                      #30.20
..LN183:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #30.43
..LN184:
	.loc    1  32  is_stmt 1
        xorl      %edi, %edi                                    #32.2
..LN185:
        lea       (%rsp), %rsi                                  #32.2
..LN186:
	.loc    1  30  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #30.43
..LN187:
        vmovsd    %xmm3, 328(%rsi)                              #30.43[spill]
..LN188:
	.loc    1  32  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #32.2
..LN189:
                                # LOE r14 r12d r13d r15d
..B1.25:                        # Preds ..B1.24
                                # Execution count [3.92e+00]
..LN190:
	.loc    1  80  is_stmt 1
        xorl      %ebx, %ebx                                    #80.3
..LN191:
        testl     %r15d, %r15d                                  #80.18
..LN192:
        jle       ..B1.43       # Prob 9%                       #80.18
..LN193:
                                # LOE r14 ebx r12d r13d r15d
..B1.26:                        # Preds ..B1.25
                                # Execution count [3.53e+00]
..LN194:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN195:
                                # LOE r14 ebx r12d r13d r15d xmm0
..B1.27:                        # Preds ..B1.41 ..B1.26
                                # Execution count [1.96e+01]
..LN196:
	.loc    1  84  is_stmt 1
        xorl      %ecx, %ecx                                    #84.8
..LN197:
        testl     %r12d, %r12d                                  #84.32
..LN198:
        jle       ..B1.39       # Prob 50%                      #84.32
..LN199:
                                # LOE r14 ecx ebx r12d r13d r15d xmm0
..B1.28:                        # Preds ..B1.27
                                # Execution count [1.76e+01]
..LN200:
        movl      $1, %eax                                      #84.4
..LN201:
                                # LOE r14 eax ecx ebx r12d r13d r15d xmm0
..B1.30:                        # Preds ..B1.28
                                # Execution count [1.96e+01]
..LN202:
        xorl      %r8d, %r8d                                    #84.4
..LN203:
	.loc    1  86  is_stmt 1
        xorl      %esi, %esi                                    #86.9
..LN204:
	.loc    1  84  is_stmt 1
        testl     %r13d, %r13d                                  #84.4
..LN205:
        jbe       ..B1.35       # Prob 9%                       #84.4
..LN206:
                                # LOE r14 eax ecx ebx esi r8d r12d r13d r15d xmm0
..B1.31:                        # Preds ..B1.30
                                # Execution count [1.76e+01]
..LN207:
        movq      352(%rsp), %r9                                #[spill]
..LN208:
        movq      360(%rsp), %r10                               #[spill]
..LN209:
        movq      344(%rsp), %r11                               #[spill]
        .align    16,0x90
..LN210:
                                # LOE r9 r10 r11 r14 ebx esi r8d r12d r13d r15d xmm0
..B1.32:                        # Preds ..B1.32 ..B1.31
                                # Execution count [7.05e+03]
..LN211:
	.loc    1  86  is_stmt 1
        movslq    %esi, %rsi                                    #86.24
..LN212:
	.loc    1  84  is_stmt 1
        incl      %r8d                                          #84.4
..LN213:
        lea       16(%rsi), %ecx                                #84.35
..LN214:
	.loc    1  87  is_stmt 1
        vmovupd   (%r11,%rsi,8), %ymm1                          #87.24
..LN215:
        vmovupd   32(%r11,%rsi,8), %ymm4                        #87.24
..LN216:
        vmovupd   64(%r11,%rsi,8), %ymm7                        #87.24
..LN217:
        vmovupd   96(%r11,%rsi,8), %ymm10                       #87.24
..LN218:
	.loc    1  89  is_stmt 1
        vmulpd    (%r10,%rsi,8), %ymm1, %ymm2                   #89.15
..LN219:
        vmulpd    32(%r10,%rsi,8), %ymm4, %ymm5                 #89.15
..LN220:
        vmulpd    64(%r10,%rsi,8), %ymm7, %ymm8                 #89.15
..LN221:
        vmulpd    96(%r10,%rsi,8), %ymm10, %ymm11               #89.15
..LN222:
	.loc    1  90  is_stmt 1
        vaddpd    (%r14,%rsi,8), %ymm2, %ymm3                   #90.9
..LN223:
        vaddpd    32(%r14,%rsi,8), %ymm5, %ymm6                 #90.9
..LN224:
        vaddpd    64(%r14,%rsi,8), %ymm8, %ymm9                 #90.9
..LN225:
        vaddpd    96(%r14,%rsi,8), %ymm11, %ymm12               #90.9
..LN226:
	.loc    1  91  is_stmt 1
        vmovupd   %ymm3, (%r9,%rsi,8)                           #91.21
..LN227:
        vmovupd   %ymm6, 32(%r9,%rsi,8)                         #91.21
..LN228:
        vmovupd   %ymm9, 64(%r9,%rsi,8)                         #91.21
..LN229:
        vmovupd   %ymm12, 96(%r9,%rsi,8)                        #91.21
..LN230:
	.loc    1  84  is_stmt 1
        movl      %ecx, %esi                                    #84.4
..LN231:
        cmpl      %r13d, %r8d                                   #84.4
..LN232:
        jb        ..B1.32       # Prob 99%                      #84.4
..LN233:
                                # LOE r9 r10 r11 r14 ecx ebx esi r8d r12d r13d r15d xmm0
..B1.33:                        # Preds ..B1.32
                                # Execution count [1.76e+01]
..LN234:
	.loc    1  86  is_stmt 1
        lea       1(,%r8,4), %eax                               #86.9
..LN235:
                                # LOE r14 eax ecx ebx r12d r13d r15d xmm0
..B1.35:                        # Preds ..B1.30 ..B1.33
                                # Execution count [1.96e+01]
..LN236:
	.loc    1  84  is_stmt 1
        decl      %eax                                          #84.4
..LN237:
        cmpl      368(%rsp), %eax                               #84.4[spill]
..LN238:
        jae       ..B1.39       # Prob 9%                       #84.4
..LN239:
                                # LOE r14 eax ecx ebx r12d r13d r15d xmm0
..B1.36:                        # Preds ..B1.35
                                # Execution count [1.76e+01]
..LN240:
        movl      368(%rsp), %esi                               #[spill]
..LN241:
        movq      352(%rsp), %r8                                #[spill]
..LN242:
        movq      360(%rsp), %r9                                #[spill]
..LN243:
        movq      344(%rsp), %r10                               #[spill]
..LN244:
                                # LOE r8 r9 r10 r14 eax ebx esi r12d r13d r15d xmm0
..B1.37:                        # Preds ..B1.37 ..B1.36
                                # Execution count [5.29e+01]
..LN245:
	.loc    1  86  is_stmt 1
        lea       (,%rax,4), %ecx                               #86.24
..LN246:
	.loc    1  84  is_stmt 1
        incl      %eax                                          #84.4
..LN247:
	.loc    1  86  is_stmt 1
        movslq    %ecx, %rcx                                    #86.24
..LN248:
	.loc    1  87  is_stmt 1
        vmovupd   (%r10,%rcx,8), %ymm1                          #87.24
..LN249:
	.loc    1  89  is_stmt 1
        vmulpd    (%r9,%rcx,8), %ymm1, %ymm2                    #89.15
..LN250:
	.loc    1  90  is_stmt 1
        vaddpd    (%r14,%rcx,8), %ymm2, %ymm3                   #90.9
..LN251:
	.loc    1  91  is_stmt 1
        vmovupd   %ymm3, (%r8,%rcx,8)                           #91.21
..LN252:
	.loc    1  84  is_stmt 1
        cmpl      %esi, %eax                                    #84.4
..LN253:
        jb        ..B1.37       # Prob 66%                      #84.4
..LN254:
                                # LOE r8 r9 r10 r14 eax ebx esi r12d r13d r15d xmm0
..B1.38:                        # Preds ..B1.37
                                # Execution count [1.76e+01]
..LN255:
	.loc    1  86  is_stmt 1
        lea       (,%rax,4), %ecx                               #86.9
..LN256:
                                # LOE r14 ecx ebx r12d r13d r15d xmm0
..B1.39:                        # Preds ..B1.38 ..B1.35 ..B1.27
                                # Execution count [1.96e+01]
..LN257:
	.loc    1  95  is_stmt 1
        movslq    %ecx, %rcx                                    #95.7
..LN258:
        vcomisd   (%r14,%rcx,8), %xmm0                          #95.12
..LN259:
        jbe       ..B1.41       # Prob 78%                      #95.12
..LN260:
                                # LOE r14 ebx r12d r13d r15d xmm0
..B1.40:                        # Preds ..B1.39
                                # Execution count [4.31e+00]
..LN261:
        movl      $il0_peep_printf_format_0, %edi               #95.15
..LN262:
        vzeroupper                                              #95.15
..LN263:
        call      puts                                          #95.15
..LN264:
                                # LOE r14 ebx r12d r13d r15d
..B1.67:                        # Preds ..B1.40
                                # Execution count [4.31e+00]
..LN265:
        vxorpd    %xmm0, %xmm0, %xmm0                           #
..LN266:
                                # LOE r14 ebx r12d r13d r15d xmm0
..B1.41:                        # Preds ..B1.67 ..B1.39
                                # Execution count [1.96e+01]
..LN267:
	.loc    1  80  is_stmt 1
        incl      %ebx                                          #80.3
..LN268:
        cmpl      %r15d, %ebx                                   #80.3
..LN269:
        jb        ..B1.27       # Prob 81%                      #80.3
..LN270:
                                # LOE r14 ebx r12d r13d r15d xmm0
..B1.43:                        # Preds ..B1.41 ..B1.25
                                # Execution count [3.92e+00]
..LN271:
	.loc    1  29  is_stmt 1
        xorl      %esi, %esi                                    #29.2
..LN272:
        lea       312(%rsp), %rdi                               #29.2
..LN273:
        vzeroupper                                              #29.2
..LN274:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #29.2
..LN275:
                                # LOE r14 r12d r13d r15d
..B1.44:                        # Preds ..B1.43
                                # Execution count [3.92e+00]
..LN276:
	.loc    1  30  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.32
..LN277:
        vxorpd    %xmm1, %xmm1, %xmm1                           #30.20
..LN278:
        vcvtsi2sdq 320(%rsp), %xmm0, %xmm0                      #30.32
..LN279:
        vcvtsi2sdq 312(%rsp), %xmm1, %xmm1                      #30.20
..LN280:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #30.43
..LN281:
	.loc    1  32  is_stmt 1
        xorl      %edi, %edi                                    #32.2
..LN282:
        lea       144(%rsp), %rsi                               #32.2
..LN283:
	.loc    1  30  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #30.43
..LN284:
        vmovsd    %xmm3, 192(%rsi)                              #30.43[spill]
..LN285:
	.loc    1  32  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #32.2
..LN286:
                                # LOE r14 r12d r13d r15d
..B1.45:                        # Preds ..B1.44
                                # Execution count [3.92e+00]
..LN287:
	.loc    1  76  is_stmt 1
        vmovsd    336(%rsp), %xmm0                              #76.14[spill]
..LN288:
	.loc    1  99  is_stmt 1
        addl      %r15d, %r15d                                  #99.3
..LN289:
	.loc    1  76  is_stmt 1
        vmovsd    .L_2il0floatpacket.2(%rip), %xmm1             #76.23
..LN290:
        vsubsd    328(%rsp), %xmm0, %xmm0                       #76.14[spill]
..LN291:
        vcomisd   %xmm0, %xmm1                                  #76.23
..LN292:
        ja        ..B1.23       # Prob 82%                      #76.23
..LN293:
                                # LOE r14 r12d r13d r15d xmm0
..B1.46:                        # Preds ..B1.45
                                # Execution count [7.05e-01]
..LN294:
        vmovsd    .L_2il0floatpacket.3(%rip), %xmm3             #
..LN295:
        movq      352(%rsp), %r13                               #[spill]
..LN296:
        movq      360(%rsp), %r12                               #[spill]
..LN297:
        movl      288(%rsp), %ebx                               #[spill]
..LN298:
                                # LOE r12 r13 r14 ebx r15d xmm0 xmm3
..B1.47:                        # Preds ..B1.21 ..B1.46
                                # Execution count [7.84e-01]
..LN299:
	.loc    1  103  is_stmt 1
        movl      %r15d, %edx                                   #103.2
..LN300:
        vxorpd    %xmm2, %xmm2, %xmm2                           #103.42
..LN301:
        shrl      $31, %edx                                     #103.2
..LN302:
        vxorpd    %xmm1, %xmm1, %xmm1                           #103.2
..LN303:
	.loc    1  101  is_stmt 1
        addl      %edx, %r15d                                   #101.2
..LN304:
	.loc    1  103  is_stmt 1
        movl      $.L_2__STRING.2, %edi                         #103.2
..LN305:
	.loc    1  101  is_stmt 1
        sarl      $1, %r15d                                     #101.2
..LN306:
	.loc    1  103  is_stmt 1
        movl      %ebx, %esi                                    #103.2
..LN307:
        vcvtsi2sd %r15d, %xmm2, %xmm2                           #103.42
..LN308:
        vcvtsi2sd %ebx, %xmm1, %xmm1                            #103.2
..LN309:
        vaddsd    %xmm2, %xmm2, %xmm4                           #103.2
..LN310:
        vmulsd    %xmm1, %xmm3, %xmm3                           #103.2
..LN311:
        vmulsd    %xmm4, %xmm3, %xmm5                           #103.2
..LN312:
        movl      $1, %eax                                      #103.2
..LN313:
        vdivsd    %xmm0, %xmm5, %xmm0                           #103.2
..LN314:
        vzeroupper                                              #103.2
..___tag_value_main.11:
..LN315:
#       printf(const char *__restrict__, ...)
        call      printf                                        #103.2
..___tag_value_main.12:
..LN316:
                                # LOE r12 r13 r14
..B1.48:                        # Preds ..B1.47
                                # Execution count [7.84e-01]
..LN317:
	.loc    1  105  is_stmt 1
        movq      %r14, %rdi                                    #105.2
..LN318:
#       _mm_free(void *)
        call      _mm_free                                      #105.2
..LN319:
                                # LOE r12 r13
..B1.49:                        # Preds ..B1.48
                                # Execution count [7.84e-01]
..LN320:
	.loc    1  106  is_stmt 1
        movq      344(%rsp), %rdi                               #106.2[spill]
..LN321:
#       _mm_free(void *)
        call      _mm_free                                      #106.2
..LN322:
                                # LOE r12 r13
..B1.50:                        # Preds ..B1.49
                                # Execution count [7.84e-01]
..LN323:
	.loc    1  107  is_stmt 1
        movq      %r12, %rdi                                    #107.2
..LN324:
#       _mm_free(void *)
        call      _mm_free                                      #107.2
..LN325:
                                # LOE r13
..B1.51:                        # Preds ..B1.50
                                # Execution count [7.84e-01]
..LN326:
	.loc    1  108  is_stmt 1
        movq      %r13, %rdi                                    #108.2
..LN327:
#       _mm_free(void *)
        call      _mm_free                                      #108.2
..LN328:
                                # LOE
..B1.52:                        # Preds ..B1.51
                                # Execution count [7.84e-01]
..LN329:
	.loc    1  109  is_stmt 1
        xorl      %eax, %eax                                    #109.1
..LN330:
        addq      $472, %rsp                                    #109.1
	.cfi_restore 3
..LN331:
        popq      %rbx                                          #109.1
	.cfi_restore 15
..LN332:
        popq      %r15                                          #109.1
	.cfi_restore 14
..LN333:
        popq      %r14                                          #109.1
	.cfi_restore 13
..LN334:
        popq      %r13                                          #109.1
	.cfi_restore 12
..LN335:
        popq      %r12                                          #109.1
..LN336:
        movq      %rbp, %rsp                                    #109.1
..LN337:
        popq      %rbp                                          #109.1
	.cfi_def_cfa 7, 8
	.cfi_restore 6
..LN338:
        ret                                                     #109.1
	.cfi_def_cfa 6, 16
	.cfi_escape 0x10, 0x03, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xd8, 0xff, 0xff, 0xff, 0x22
	.cfi_offset 6, -16
	.cfi_escape 0x10, 0x0c, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0d, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xf0, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0e, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe8, 0xff, 0xff, 0xff, 0x22
	.cfi_escape 0x10, 0x0f, 0x0e, 0x38, 0x1c, 0x0d, 0x80, 0xff, 0xff, 0xff, 0x1a, 0x0d, 0xe0, 0xff, 0xff, 0xff, 0x22
..LN339:
                                # LOE
..B1.53:                        # Preds ..B1.61
                                # Execution count [2.16e-01]
..LN340:
	.loc    1  40  is_stmt 1
        movl      $il0_peep_printf_format_1, %edi               #40.3
..LN341:
        call      puts                                          #40.3
..LN342:
                                # LOE
..B1.54:                        # Preds ..B1.53
                                # Execution count [2.16e-01]
..LN343:
	.loc    1  41  is_stmt 1
        movl      $-1, %edi                                     #41.3
..LN344:
#       exit(int)
        call      exit                                          #41.3
..LN345:
                                # LOE
..B1.55:                        # Preds ..B1.13
                                # Execution count [7.05e-02]: Infreq
..LN346:
	.loc    1  64  is_stmt 1
        xorl      %r9d, %r9d                                    #64.2
..LN347:
        jmp       ..B1.17       # Prob 100%                     #64.2
..LN348:
                                # LOE r9 r12 r13 r14 r15 ebx r8d
..B1.56:                        # Preds ..B1.8
                                # Execution count [7.05e-02]: Infreq
..LN349:
        xorl      %r8d, %r8d                                    #64.2
..LN350:
        jmp       ..B1.12       # Prob 100%                     #64.2
        .align    16,0x90
..LN351:
                                # LOE r12 r13 r14 r15 ebx r8d
..LN352:
	.cfi_endproc
# mark_end;
	.type	main,@function
	.size	main,.-main
..LNmain.353:
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
                                                         #14.40
..LN354:
	.loc    1  14  is_stmt 1
..LN355:
	.loc    1  15  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #15.13
..LN356:
	.loc    1  17  is_stmt 1
        testl     %esi, %esi                                    #17.17
..LN357:
        jle       ..B2.22       # Prob 50%                      #17.17
..LN358:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.2:                         # Preds ..B2.1
                                # Execution count [9.00e-01]
..LN359:
        cmpl      $16, %esi                                     #17.2
..LN360:
        jl        ..B2.24       # Prob 10%                      #17.2
..LN361:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi xmm0
..B2.3:                         # Preds ..B2.2
                                # Execution count [9.00e-01]
..LN362:
        movq      %rdi, %r8                                     #17.2
..LN363:
        andq      $31, %r8                                      #17.2
..LN364:
        testl     %r8d, %r8d                                    #17.2
..LN365:
        je        ..B2.6        # Prob 50%                      #17.2
..LN366:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.4:                         # Preds ..B2.3
                                # Execution count [9.00e-01]
..LN367:
        testl     $7, %r8d                                      #17.2
..LN368:
        jne       ..B2.24       # Prob 10%                      #17.2
..LN369:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.5:                         # Preds ..B2.4
                                # Execution count [4.50e-01]
..LN370:
        negl      %r8d                                          #17.2
..LN371:
        addl      $32, %r8d                                     #17.2
..LN372:
        shrl      $3, %r8d                                      #17.2
..LN373:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.6:                         # Preds ..B2.5 ..B2.3
                                # Execution count [9.00e-01]
..LN374:
        lea       16(%r8), %eax                                 #17.2
..LN375:
        cmpl      %eax, %esi                                    #17.2
..LN376:
        jl        ..B2.24       # Prob 10%                      #17.2
..LN377:
                                # LOE rbx rbp rdi r12 r13 r14 r15 esi r8d xmm0
..B2.7:                         # Preds ..B2.6
                                # Execution count [1.00e+00]
..LN378:
        movl      %esi, %edx                                    #17.2
..LN379:
        xorl      %eax, %eax                                    #17.2
..LN380:
        subl      %r8d, %edx                                    #17.2
..LN381:
        andl      $15, %edx                                     #17.2
..LN382:
        negl      %edx                                          #17.2
..LN383:
        addl      %esi, %edx                                    #17.2
..LN384:
        movl      %r8d, %ecx                                    #17.2
..LN385:
        testl     %r8d, %r8d                                    #17.2
..LN386:
        jbe       ..B2.11       # Prob 9%                       #17.2
..LN387:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.9:                         # Preds ..B2.7 ..B2.9
                                # Execution count [5.00e+00]
..LN388:
	.loc    1  18  is_stmt 1
        vaddsd    (%rdi,%rax,8), %xmm0, %xmm0                   #18.3
..LN389:
	.loc    1  17  is_stmt 1
        incq      %rax                                          #17.2
..LN390:
        cmpq      %rcx, %rax                                    #17.2
..LN391:
        jb        ..B2.9        # Prob 82%                      #17.2
..LN392:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.11:                        # Preds ..B2.9 ..B2.7
                                # Execution count [9.00e-01]
..LN393:
        movslq    %edx, %rax                                    #17.2
..LN394:
	.loc    1  15  is_stmt 1
        vxorpd    %xmm4, %xmm4, %xmm4                           #15.13
..LN395:
        vxorpd    %ymm2, %ymm2, %ymm2                           #15.13
..LN396:
        vmovsd    %xmm0, %xmm4, %xmm3                           #15.13
..LN397:
        vmovapd   %ymm2, %ymm1                                  #15.13
..LN398:
        vmovapd   %ymm2, %ymm0                                  #15.13
..LN399:
        vmovaps   %xmm3, %xmm3                                  #15.13
..LN400:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.12:                        # Preds ..B2.12 ..B2.11
                                # Execution count [5.00e+00]
..LN401:
	.loc    1  18  is_stmt 1
        vaddpd    (%rdi,%rcx,8), %ymm3, %ymm3                   #18.3
..LN402:
        vaddpd    32(%rdi,%rcx,8), %ymm2, %ymm2                 #18.3
..LN403:
        vaddpd    64(%rdi,%rcx,8), %ymm1, %ymm1                 #18.3
..LN404:
        vaddpd    96(%rdi,%rcx,8), %ymm0, %ymm0                 #18.3
..LN405:
	.loc    1  17  is_stmt 1
        addq      $16, %rcx                                     #17.2
..LN406:
        cmpq      %rax, %rcx                                    #17.2
..LN407:
        jb        ..B2.12       # Prob 82%                      #17.2
..LN408:
                                # LOE rax rcx rbx rbp rdi r12 r13 r14 r15 edx esi xmm4 ymm0 ymm1 ymm2 ymm3
..B2.13:                        # Preds ..B2.12
                                # Execution count [9.00e-01]
..LN409:
	.loc    1  15  is_stmt 1
        vaddpd    %ymm2, %ymm3, %ymm2                           #15.13
..LN410:
	.loc    1  17  is_stmt 1
        lea       1(%rdx), %ecx                                 #17.2
..LN411:
	.loc    1  15  is_stmt 1
        vaddpd    %ymm0, %ymm1, %ymm0                           #15.13
..LN412:
        vaddpd    %ymm0, %ymm2, %ymm1                           #15.13
..LN413:
        vextractf128 $1, %ymm1, %xmm3                           #15.13
..LN414:
        vaddpd    %xmm3, %xmm1, %xmm5                           #15.13
..LN415:
        vunpckhpd %xmm5, %xmm5, %xmm6                           #15.13
..LN416:
        vaddsd    %xmm6, %xmm5, %xmm0                           #15.13
..LN417:
	.loc    1  17  is_stmt 1
        cmpl      %esi, %ecx                                    #17.2
..LN418:
        ja        ..B2.22       # Prob 50%                      #17.2
..LN419:
                                # LOE rax rbx rbp rdi r12 r13 r14 r15 edx esi xmm0 xmm4
..B2.14:                        # Preds ..B2.13
                                # Execution count [8.50e-01]
..LN420:
        movslq    %esi, %rsi                                    #17.2
..LN421:
        subq      %rax, %rsi                                    #17.2
..LN422:
        cmpq      $4, %rsi                                      #17.2
..LN423:
        jl        ..B2.23       # Prob 10%                      #17.2
..LN424:
                                # LOE rax rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0 xmm4
..B2.15:                        # Preds ..B2.14
                                # Execution count [9.00e-01]
..LN425:
        movl      %esi, %ecx                                    #17.2
..LN426:
	.loc    1  15  is_stmt 1
        vmovsd    %xmm0, %xmm4, %xmm0                           #15.13
..LN427:
	.loc    1  17  is_stmt 1
        andl      $-4, %ecx                                     #17.2
..LN428:
        xorl      %r8d, %r8d                                    #17.2
..LN429:
        movslq    %ecx, %rcx                                    #17.2
..LN430:
	.loc    1  18  is_stmt 1
        lea       (%rdi,%rax,8), %rax                           #18.10
..LN431:
	.loc    1  15  is_stmt 1
        vmovaps   %xmm0, %xmm0                                  #15.13
..LN432:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.16:                        # Preds ..B2.16 ..B2.15
                                # Execution count [5.00e+00]
..LN433:
	.loc    1  18  is_stmt 1
        vaddpd    (%rax,%r8,8), %ymm0, %ymm0                    #18.3
..LN434:
	.loc    1  17  is_stmt 1
        addq      $4, %r8                                       #17.2
..LN435:
        cmpq      %rcx, %r8                                     #17.2
..LN436:
        jb        ..B2.16       # Prob 82%                      #17.2
..LN437:
                                # LOE rax rcx rbx rbp rsi rdi r8 r12 r13 r14 r15 edx ymm0
..B2.17:                        # Preds ..B2.16
                                # Execution count [9.00e-01]
..LN438:
	.loc    1  15  is_stmt 1
        vextractf128 $1, %ymm0, %xmm1                           #15.13
..LN439:
        vaddpd    %xmm1, %xmm0, %xmm2                           #15.13
..LN440:
        vunpckhpd %xmm2, %xmm2, %xmm3                           #15.13
..LN441:
        vaddsd    %xmm3, %xmm2, %xmm0                           #15.13
..LN442:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.18:                        # Preds ..B2.17 ..B2.23 ..B2.25
                                # Execution count [1.00e+00]
..LN443:
	.loc    1  17  is_stmt 1
        cmpq      %rsi, %rcx                                    #17.2
..LN444:
        jae       ..B2.22       # Prob 9%                       #17.2
..LN445:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.19:                        # Preds ..B2.18
                                # Execution count [9.00e-01]
..LN446:
	.loc    1  18  is_stmt 1
        movslq    %edx, %rdx                                    #18.10
..LN447:
        lea       (%rdi,%rdx,8), %rax                           #18.10
..LN448:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.20:                        # Preds ..B2.20 ..B2.19
                                # Execution count [5.00e+00]
..LN449:
        vaddsd    (%rax,%rcx,8), %xmm0, %xmm0                   #18.3
..LN450:
	.loc    1  17  is_stmt 1
        incq      %rcx                                          #17.2
..LN451:
        cmpq      %rsi, %rcx                                    #17.2
..LN452:
        jb        ..B2.20       # Prob 82%                      #17.2
..LN453:
                                # LOE rax rcx rbx rbp rsi r12 r13 r14 r15 xmm0
..B2.22:                        # Preds ..B2.20 ..B2.13 ..B2.18 ..B2.24 ..B2.1
                                #      
                                # Execution count [1.00e+00]
..LN454:
	.loc    1  19  is_stmt 1
        vzeroupper                                              #19.9
..LN455:
        ret                                                     #19.9
..LN456:
                                # LOE
..B2.23:                        # Preds ..B2.14
                                # Execution count [9.00e-02]: Infreq
..LN457:
	.loc    1  17  is_stmt 1
        xorl      %ecx, %ecx                                    #17.2
..LN458:
        jmp       ..B2.18       # Prob 100%                     #17.2
..LN459:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..B2.24:                        # Preds ..B2.6 ..B2.4 ..B2.2
                                # Execution count [1.00e-01]: Infreq
..LN460:
        xorl      %edx, %edx                                    #17.2
..LN461:
        cmpl      $1, %esi                                      #17.2
..LN462:
        jb        ..B2.22       # Prob 50%                      #17.2
..LN463:
                                # LOE rbx rbp rdi r12 r13 r14 r15 edx esi xmm0
..B2.25:                        # Preds ..B2.24
                                # Execution count [5.00e-02]: Infreq
..LN464:
        movslq    %esi, %rsi                                    #17.2
..LN465:
        xorl      %ecx, %ecx                                    #17.2
..LN466:
        jmp       ..B2.18       # Prob 100%                     #17.2
        .align    16,0x90
..LN467:
                                # LOE rcx rbx rbp rsi rdi r12 r13 r14 r15 edx xmm0
..LN468:
	.cfi_endproc
# mark_end;
	.type	check_sum,@function
	.size	check_sum,.-check_sum
..LNcheck_sum.469:
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
                                                         #25.1
..LN470:
	.loc    1  25  is_stmt 1
        pushq     %r12                                          #25.1
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
..LN471:
        pushq     %r13                                          #25.1
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
..LN472:
        subq      $168, %rsp                                    #25.1
	.cfi_def_cfa_offset 192
..LN473:
        movq      %rsi, %r13                                    #25.1
..LN474:
        movq      %rdi, %r12                                    #25.1
..LN475:
	.loc    1  29  is_stmt 1
        lea       144(%rsp), %rdi                               #29.2
..LN476:
        xorl      %esi, %esi                                    #29.2
..LN477:
#       gettimeofday(struct timeval *__restrict__, __timezone_ptr_t)
        call      gettimeofday                                  #29.2
..LN478:
                                # LOE rbx rbp r12 r13 r14 r15
..B3.2:                         # Preds ..B3.1
                                # Execution count [1.00e+00]
..LN479:
	.loc    1  30  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #30.32
..LN480:
        vxorpd    %xmm1, %xmm1, %xmm1                           #30.20
..LN481:
        vcvtsi2sdq 152(%rsp), %xmm0, %xmm0                      #30.32
..LN482:
        vcvtsi2sdq 144(%rsp), %xmm1, %xmm1                      #30.20
..LN483:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #30.43
..LN484:
	.loc    1  32  is_stmt 1
        xorl      %edi, %edi                                    #32.2
..LN485:
        lea       (%rsp), %rsi                                  #32.2
..LN486:
	.loc    1  30  is_stmt 1
        vaddsd    %xmm2, %xmm1, %xmm3                           #30.43
..LN487:
        vmovsd    %xmm3, (%r12)                                 #30.3
..LN488:
	.loc    1  32  is_stmt 1
#       getrusage(__rusage_who_t, struct rusage *)
        call      getrusage                                     #32.2
..LN489:
                                # LOE rbx rbp r13 r14 r15
..B3.3:                         # Preds ..B3.2
                                # Execution count [1.00e+00]
..LN490:
	.loc    1  33  is_stmt 1
        vxorpd    %xmm0, %xmm0, %xmm0                           #33.41
..LN491:
        vxorpd    %xmm1, %xmm1, %xmm1                           #33.20
..LN492:
        vcvtsi2sdq 8(%rsp), %xmm0, %xmm0                        #33.41
..LN493:
        vcvtsi2sdq (%rsp), %xmm1, %xmm1                         #33.20
..LN494:
        vmulsd    .L_2il0floatpacket.3(%rip), %xmm0, %xmm2      #33.65
..LN495:
        vaddsd    %xmm2, %xmm1, %xmm3                           #33.65
..LN496:
        vmovsd    %xmm3, (%r13)                                 #33.3
..LN497:
	.loc    1  34  is_stmt 1
        addq      $168, %rsp                                    #34.1
	.cfi_def_cfa_offset 24
	.cfi_restore 13
..LN498:
        popq      %r13                                          #34.1
	.cfi_def_cfa_offset 16
	.cfi_restore 12
..LN499:
        popq      %r12                                          #34.1
	.cfi_def_cfa_offset 8
..LN500:
        ret                                                     #34.1
        .align    16,0x90
..LN501:
                                # LOE
..LN502:
	.cfi_endproc
# mark_end;
	.type	timing,@function
	.size	timing,.-timing
..LNtiming.503:
.LNtiming:
	.data
# -- End  timing
	.section .rodata, "a"
	.align 32
	.align 32
.L_2il0floatpacket.4:
	.long	0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5,0xc28f5c29,0x3ff028f5
	.type	.L_2il0floatpacket.4,@object
	.size	.L_2il0floatpacket.4,32
	.align 32
.L_2il0floatpacket.5:
	.long	0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1,0x47ae147b,0x3ff07ae1
	.type	.L_2il0floatpacket.5,@object
	.size	.L_2il0floatpacket.5,32
	.align 32
.L_2il0floatpacket.6:
	.long	0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7,0x0a3d70a4,0x3ff0a3d7
	.type	.L_2il0floatpacket.6,@object
	.size	.L_2il0floatpacket.6,32
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
.L_2il0floatpacket.7:
	.long	0xc28f5c29,0x3ff028f5
	.type	.L_2il0floatpacket.7,@object
	.size	.L_2il0floatpacket.7,8
	.align 8
.L_2il0floatpacket.8:
	.long	0x47ae147b,0x3ff07ae1
	.type	.L_2il0floatpacket.8,@object
	.size	.L_2il0floatpacket.8,8
	.align 8
.L_2il0floatpacket.9:
	.long	0x0a3d70a4,0x3ff0a3d7
	.type	.L_2il0floatpacket.9,@object
	.size	.L_2il0floatpacket.9,8
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
