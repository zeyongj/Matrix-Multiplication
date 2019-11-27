
	.globl mod
mod:                     # unsigned char mod(long x, unsigned char m);
	movq %rdi, %rax
	movq %rdi, %rdx
	sarq $63, %rdx       # 128-bit signed dividend in rdx:rax

	movzbq %sil, %rsi    # 64-bit unsigned divisor in rsi

	idiv %rsi            # quotient in rax, remainder in rdx

	cmpq $0, %rdx
	jge endif
	addq %rsi, %rdx      # translate negative remainder to be unsigned
endif:
	movq %rdx, %rax

	ret


