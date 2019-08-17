GLOBAL print
GLOBAL exit

section .text

print:
    pushad ;guardo los registros

    call strlen
    mov ecx, ebx ;al c le paso la palabra
    mov edx, eax ;al d la longitud

    mov ebx, 1 ; STDOUT
    mov eax, 4 ; ID de Syscall WRITE
    int 80h

    popad ; los registros vuelven a la normalidad
    ret

exit:
    mov eax, 1 ; ID de Syscall EXIT
    int 80h

strlen:
    push ecx
    push ebx ;guardo en stack c, b y flags para que cuando termine la func
    pushf    ;se vean desafectados

    mov ecx, 0 ;aca pego salvataje por si no es ninguna cadena
    .loop:
    mov al, [ebx] 
    cmp al, 0       ; le paso caracter a caracter para ver si es EOF
    jz .fin         ; y ahi va incrementando
    inc ecx
    inc ebx
    jmp .loop

    .fin:
    mov eax, ecx

    popf
    pop ebx
    pop ecx
    ret
