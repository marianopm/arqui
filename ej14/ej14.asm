EXTERN print
EXTERN numtostr
EXTERN print_pid
EXTERN exit
GLOBAL _start

section .text
_start:
    mov eax, 2
    int 80h

    test eax, eax
    jnz .padre

    mov ebx, msg_hijo
    jmp .next

    .padre:
    mov ebx, msg_padre

    .next:
    call print
    call print_pid

    call exit
section .data
msg_padre db "soy el proceso padre",10,0
msg_hijo db "soy el proceso hijo",10,0

section .bss
