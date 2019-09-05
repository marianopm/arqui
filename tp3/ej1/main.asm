GLOBAL main
EXTERN printf

section .rodata
fmtA db "Cantidad de argumentos: %d", 10,0
fmtB db "arg[%d]= %s",10,0

section .text
main:
    push ebp
    mov ebp, esp
    
    push dword [ebp+8]
    push fmtA
    call printf
    add esp, 2*4

    mov ecx, [ebp+8] ; aca estamos pasando la cant de argumentos
    mov ebx, 0; el contador de los args
    mov esi, [ebp+12] ; aca se pasa el arreglo
    cld ; hago clear del direction flag

    .loop:
    lodsd ;esto hace dos instr a la vez, eax = [ESI] y ESI = ESI + 4

    push ecx ; hago backup del contador
    push eax ; meto el string
    push ebx ; y despues la cant de argumentos
    push fmtB
    call printf
    add esp, 3*4

    pop ecx ;recuperamos el val de ecx

    inc ebx
    loop .loop ; el loop se usa sobre ecx, vendria a ser dec ecx y jnz .loop en una instr

    mov eax,0

    mov esp, ebp
    pop ebp

    ret