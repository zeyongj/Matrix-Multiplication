	.file	"main.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%2x"
	.text
	.p2align 4,,15
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB24:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC0(%rip), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r12
	movl	$4, %r14d
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.L2:
	leaq	4(%r12), %rbp
	movq	%r12, %rbx
.L3:
	movzbl	(%rbx), %edx
	xorl	%eax, %eax
	movq	%r13, %rsi
	movl	$1, %edi
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %rbp
	jne	.L3
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	addq	%r15, %r12
	call	_IO_putc@PLT
	subl	$1, %r14d
	jne	.L2
	movq	stdout(%rip), %rsi
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	$10, %edi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_IO_putc@PLT
	.cfi_endproc
.LFE24:
	.size	print_matrix, .-print_matrix
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	leaq	C(%rip), %rdx
	leaq	B(%rip), %rsi
	leaq	A(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$4, %ecx
	call	matrix_prod@PLT
	leaq	A(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	leaq	B(%rip), %rdi
	movl	$4, %esi
	call	print_matrix
	leaq	C(%rip), %rdi
	movl	$4, %esi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	print_matrix
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.comm	C,16,16
	.globl	B
	.data
	.align 16
	.type	B, @object
	.size	B, 16
B:
	.byte	10
	.byte	12
	.byte	14
	.byte	5
	.byte	12
	.byte	10
	.byte	1
	.byte	1
	.byte	12
	.byte	0
	.byte	12
	.byte	10
	.byte	12
	.byte	0
	.byte	1
	.byte	10
	.globl	A
	.align 16
	.type	A, @object
	.size	A, 16
A:
	.byte	5
	.byte	11
	.byte	10
	.byte	3
	.byte	10
	.byte	6
	.byte	2
	.byte	1
	.byte	6
	.byte	3
	.byte	14
	.byte	13
	.byte	8
	.byte	5
	.byte	2
	.byte	0
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
