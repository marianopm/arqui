	.file	"arreglos6.c"
	.intel_syntax noprefix
	.globl	arr
	.data
	.align 32
	.type	arr, @object
	.size	arr, 40
arr:
	.long	1
	.long	3
	.long	5
	.zero	28
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
