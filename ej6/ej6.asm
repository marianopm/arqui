GLOBAL _start
EXTERN fact

section .text
_start:
    mov ecx, [num]
    mov eax, 1
    mov ebx, result
    call fact

section .data
num dd 6

section .bss
result resb 10