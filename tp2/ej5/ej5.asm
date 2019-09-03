GLOBAL _start
EXTERN exit
EXTERN multn_1_to_k
section .text
_start:
    mov ebp, esp

    mov ecx, [k]
    mov edx, [n]
    call multn_1_to_k

    mov ebx, 0
    call exit

section .data
n dd 6
k dd 102

section .bss
result resb 10