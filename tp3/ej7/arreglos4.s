	.file	"arreglos4.c"
	.intel_syntax noprefix
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	push	edi
	sub	esp, 68
	mov	eax, DWORD PTR gs:20
	mov	DWORD PTR [ebp-12], eax
	xor	eax, eax
	lea	edx, [ebp-68]
	mov	eax, 0
	mov	ecx, 14
	mov	edi, edx
	rep stosd
	mov	DWORD PTR [ebp-68], 1
	mov	DWORD PTR [ebp-64], 2
	mov	DWORD PTR [ebp-60], 3
	mov	DWORD PTR [ebp-28], 4
	nop
	mov	eax, DWORD PTR [ebp-12]
	xor	eax, DWORD PTR gs:20
	je	.L2
	call	__stack_chk_fail
.L2:
	add	esp, 68
	pop	edi
	pop	ebp
	ret
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
