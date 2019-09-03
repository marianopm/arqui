EXTERN print
EXTERN exit
GLOBAL _start

section .text
_start:
    mov ebx, tic
    call print

    mov ebx, time
    mov eax, 162
    int 80h

    mov ebx, toc
    call print

    call exit 

section .data
time db 5,0

section .rodata
tic db "tic",10,0
toc db "toc",10,0