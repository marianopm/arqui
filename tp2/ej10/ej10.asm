GLOBAL _start
EXTERN numtostr
EXTERN print
EXTERN exit
EXTERN printArgs

section .text
_start:
    call printArgs
    mov esp, ebp
    mov ebx, 0
    call exit

section .data
barra_n db 10
section .bss
result resb 10
