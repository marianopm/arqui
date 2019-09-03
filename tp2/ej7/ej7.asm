GLOBAL _start
EXTERN numtostr
EXTERN min
EXTERN exit
EXTERN print

section .text
_start:
    mov ebx, array
    mov ecx, 7
    call min
    mov ebx, result
    call numtostr
    mov ebx, barra_n
    call print

    mov ebx, 0
    call exit

section .data
array dd 10,3,5,6,5,15,37,68

section .rodata
barra_n db 10, 0

section .bss
result resb 10