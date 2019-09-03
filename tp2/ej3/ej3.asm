GLOBAL _start

EXTERN print
EXTERN numtostr
EXTERN exit

section .text
    _start:
    mov ebp, esp
    mov ebx, mensaje
    call print

    mov eax, 239345
    mov ebx, string
    call numtostr

    mov ebx, barra_n
    call print 

    mov ebx, 0
    call exit

section .data
mensaje db "El mensaje es: ", 0
barra_n db 10

section .bss
string resb 10