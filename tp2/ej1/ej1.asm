section .text
GLOBAL _start

_start:
    mov ecx, cadena ; "cargo" la cadena
    mov edx, longitud ; "cargo" la longitud
    mov ebx, 1 ; STDOUT
    mov eax, 4 ; ID Syscall WRITE
    int 80h

    mov eax, 1 ; ID de Syscall EXIT
    mov ebx, 0 ; Valor de retorno
    int 80h
    
section .data
    cadena db "Hola Mundo!!", 10
    longitud equ $-cadena

section .bss
    placeholder resb 10