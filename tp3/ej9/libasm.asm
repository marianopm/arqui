GLOBAL sys_write
GLOBAL strlen
GLOBAL numtostr
GLOBAL sys_getchar
GLOBAL sys_fopen
GLOBAL sys_fclose


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

    mov ebx, [ebp + 8]
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

numtostr:
    mov ebp, esp ;para que el stack quede desafectada cuando termino
    pushad
    mov ecx, 10 ;voy a dividir siempre por ecx, aka 10
    mov edx, 0 ;al principio el resto lo voy a dejar en 0
    add ebx, 9 ;me muevo a la posicion final para hacer todo al reves
    mov byte [ebx], 0 ; comienzo el string con 0 
    dec ebx ; comienzo a recorrer de atras para adelante 
    .loop:
    div ecx
    or dl, 0x30 ; convierto el resto menor a 10 a ascii
    mov byte [ebx], dl ; 
    dec ebx ;voy al proximo caracter, si el cociente es mayor a 0 sigo dividiendo
    cmp al, 0 ;me fijo si ya termine, lo hago con el resultado almacenado en eax
    jz .fin
    mov edx, 0
    jmp .loop
    .fin:
    inc ebx
    
    popad
    mov esp, ebp
    ret

sys_getchar:
    push ebp
    mov ebp,esp

    mov eax, 0x3
    mov edx, 1
    mov ebx,[ebp + 8]
    mov ecx, charbuf

    int 80h

    test eax, eax
    jnz .next
    mov eax, -1
    jmp .fin
    
    .next:
    xor eax, eax
    mov al, byte[charbuf]

    .fin:
    leave
    ret
sys_fopen:
    push ebp
    mov ebp, esp
    push ecx
    push ebx

    mov ebx, [ebp+8]
    mov ecx, [ebp+12]

    mov eax, 5
    int 80h

    pop ebx
    pop ecx
    leave
    ret

sys_fclose:
    push ebp
    mov ebp, esp
    push ebx

    mov ebx,[ebp+8]
    mov eax,6
    int 80h

    pop ebx
    leave 
    ret

section .bss
charbuf resb 4