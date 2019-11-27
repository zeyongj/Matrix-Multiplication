
    .globl matrix_prod
	# variable table: %rdi = A, %rsi = B, %rdx = C, %ecx = n
	# %r8d = i, %r9d = j, %r10d =temp1, %r11 = temp2
	# %r12 = C[i][j], %r13 = temp3
matrix_prod:            # void matrix_prod(void *A, void *B, void *C, int n);
	movl $0, %r8d	    # i = 0
    movl %ecx, %r10d 
    subl $1, %r10d      # temp1 = n-1
loop:                   # while ( i <= n-1 )   
	cmp %r10d, %r8d
	jg endloop
	movl $0, %r9d       # j = 0
while:                  # while ( j <= n-1 )
    cmp %r10d, %r9d
    jg endwhile
    push %r13           # push callee saved register into stack for later used
    movq %rcx, %r13      
    imulq %r8, %r13     # temp3 = n * i
    movq %rdx, %r11
    addq %r13,%r11      # temp1 = Ci 
    push %r12           
	leaq (%r11,%r9), %r12  # C[i][j] = Ci + j
	
	push %rdi
	push %rsi
    push %rdx
    push %rcx
    push %r8
    push %r9
    push %r10
    push %r11           # save caller saved registers
    
    movl %ecx, %edx
    movl %r8d, %ecx
    movl %r9d, %r8d     # set up arguments
    
    call dot_prod       # %rax = result
    
    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rcx
    pop %rdx
    pop %rsi
    pop %rdi            # restore caller saved registers
    
    push %rdi
	push %rsi
    push %rdx
    push %rcx
    push %r8
    push %r9
    push %r10
    push %r11           # save caller saved registers
    
    movq %rax, %rdi
    movl $17, %esi
    
    call mod            # %rax = result
    
    pop %r11
    pop %r10
    pop %r9
    pop %r8
    pop %rcx
    pop %rdx
    pop %rsi
    pop %rdi            # restore caller saved registers
    
    movb %al, (%r12)    # result = C[i][j]
    pop %r12
    pop %r13
    incl %r9d           # j++
    jmp while
    
endwhile:
    incl %r8d           # i++
    jmp endloop

endloop:
	ret
