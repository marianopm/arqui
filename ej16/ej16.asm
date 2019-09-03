EXTERN print
EXTERN uppercase
EXTERN exit
GLOBAL _start

section .text
_start:
    mov ebx, 0

    mov ecx, aux
    mov edx, 1000
    mov eax, 3
    int 80h

    mov byte [aux + eax],0
    mov ebx, aux
    call uppercase

    call print
    call exit

section .bss
aux resb 1001