GLOBAL _start
EXTERN print
EXTERN numtostr
EXTERN exit
EXTERN sum

section .text
_start:
    mov ebp, esp
    mov ebx, mensaje
    call print

    mov eax, [num]
    mov ebx, result
    call numtostr

    mov ebx, barra_n
    call print

    mov ebx, mensaje2
    call print

    mov ecx, [num]
    call sum
    mov ebx, result
    call numtostr

    mov ebx, barra_n
    call print

    mov ebx, 0
    call exit
section .data
mensaje db "Numero: ",0
mensaje2 db "Sumatoria desde 0 a ese numero: ",0
barra_n db 10
num db 10
section .bss
result resb 10