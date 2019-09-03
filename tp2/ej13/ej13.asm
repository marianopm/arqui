EXTERN print
EXTERN numtostr
EXTERN exit
GLOBAL _start

section .text
_start:

    mov eax, 20
    int 80h

    mov ebx, msg
    call print

    mov ebx, result
    call numtostr

    mov ebx, barra_n
    call print

    mov ebx, 0
    call exit
section .data
msg db "PID: ",0
barra_n db 10,0

section .bss
result resb 10