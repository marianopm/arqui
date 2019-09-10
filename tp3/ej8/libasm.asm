GLOBAL sys_write
GLOBAL strlen

ALIGN 4
sys_write:
    push ebp
    mov ebp, esp

    push ebx

    mov eax, 0x4 ;syscall write
    mov ebx, [ebp+8] ;fd
    mov ecx, [ebp+12] ;buffer
    mov edx, [ebp+16] ;length
    int 80h

    pop ebx

    mov esp, ebp
    pop ebp
    ret

strlen:
    push ebp
    mov ebp, esp

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

    leave
    ret