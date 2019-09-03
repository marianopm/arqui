GLOBAL _start
EXTERN numtostr
EXTERN min
EXTERN exit
EXTERN printArray
EXTERN selection_sort

section .text
_start:
    mov ecx, size
    shr ecx, 2
    mov edx, ecx

    mov ebx, array
    call printArray

    call selection_sort

    call printArray
    
    mov ebx, 0
    call exit

section .data
array dd 10,3,5,6,5,15,37,68
size equ $-array

section .rodata
barra_n db 10, 0

section .bss
result resb 10