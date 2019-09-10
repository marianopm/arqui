	.file	"arreglos3.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	sub	esp, 72
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	mov	DWORD PTR [ebp-32], 3
	nop
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail
.L2:
	leave
	ret
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
