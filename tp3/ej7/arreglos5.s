	.file	"arreglos5.c"
	.intel_syntax noprefix
	.comm	arr,40,32
	.text
	.globl	foo
	.type	foo, @function
foo:
	push	ebp
	mov	ebp, esp
	nop
	pop	ebp
	ret
	.size	foo, .-foo
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
