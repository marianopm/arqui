GLOBAL main
EXTERN hello_world

section .text
main:
    call hello_world

    mov eax, 1  ;system call exit
    mov ebx, 0  ;parametro para exit()
    int 80h