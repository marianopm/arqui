GLOBAL _start
EXTERN print
EXTERN exit

section .text
_start:
    mov ebp, esp
    mov eax, [ebp]
    mov ebx, [ebp + 4*eax + 76]
    call print

    mov ebx, barra_n
    call print

    mov ebx,0
    call exit

section .data
barra_n db 10
section .bss