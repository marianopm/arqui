GLOBAL _start
EXTERN numtostr
EXTERN print
EXTERN exit

section .text
_start:
    mov ebp, esp

    mov ebx, mensaje
    call print

    mov eax, [ebp]
    mov ebx, result
    call numtostr
    
    mov ebx, barra_n
    call print

    mov ebx, 0
    call exit

section .data
mensaje db "Cantidad de argumentos: ", 0
barra_n db 10

section .bss
result resb 10