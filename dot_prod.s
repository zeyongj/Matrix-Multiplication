
    .globl dot_prod
dot_prod:               # long dot_prod(void *A, void *B, int n, int i, int j);
	xorl %eax, %eax

	movl %edx, %r9d
	imull %ecx, %r9d
	addq %r9, %rdi      # rdi points to 0th element of i'th row of A

	addq %r8, %rsi      # rsi points to 0th element of j'th col of B

	xorl %ecx, %ecx     # for (k = 0; 
loop:
	cmpl %ecx, %edx
	je endloop          #            k < n; 
	incl %ecx           #                   k++) {

	movsbq (%rdi), %r8
	movsbq (%rsi), %r9
	imulq %r9, %r8
	addq %r8, %rax      #    total += A[i][k] * B[k][j];

	incq %rdi
	addq %rdx, %rsi     #    update pointers

	jmp loop            # }

endloop:
	ret
