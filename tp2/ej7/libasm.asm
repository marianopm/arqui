GLOBAL print
GLOBAL exit
GLOBAL uppercase
GLOBAL numtostr
GLOBAL sum
GLOBAL multn_1_to_k
GLOBAL fact
GLOBAL min

section .text

print:
    pushad ;guardo los registros

    call strlen
    mov ecx, ebx ;al ecx le paso la palabra
    mov edx, eax ;al edx la longitud

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
    
uppercase:
    push ebx
    push eax

    .loop:
    mov al, [ebx]
    test al, al
    jz .fin
    cmp al, 97
    jl .next
    cmp al, 122
    jg .next
    sub al, 32
    mov [ebx], al 

    .next:
    inc ebx
    jmp .loop

    .fin:
    pop eax
    pop ebx
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
    call print
    popad
    mov esp, ebp
    ret

sum:
    mov ebp, esp
    push ecx
    mov eax, 0
    .siguesum:
    add eax,ecx
    loop .siguesum
    
    pop ecx
    mov esp, ebp
    ret
multn_1_to_k:
    mov ebp, esp
    push ecx
    push edx
    push ebx
    
    ;xor eax,eax
    
    .next:
    mov ebx, result
    add eax,edx
    cmp ecx, eax
    jl .fin
    call numtostr
    mov ebx, barra_n
    call print
    cmp ecx,eax
    je .fin
    jmp .next
    
    .fin:
    pop ebx
    pop edx
    pop ecx
    mov esp, ebp

    mov ebx, 0
    call exit

fact:
    mov ebp, esp
    push ecx
    push ebx

    .next:
    mul dword ecx
    dec dword ecx
    jz .fin
    jmp .next

    .fin:
    call numtostr
    mov ebx, barra_n
    call print
    pop ebx
    pop ecx
    mov esp, ebp

    mov ebx, 0
    call exit

min:
    mov ebp, esp
    push edx
    push ebx
    push ecx

    mov edx, 0
    mov eax, [ebx]

    .findmin:
    dec ecx
    cmp eax, [ebx + 4*ecx]
    jle .next
    mov eax, [ebx + 4*ecx]
    .next:
    test ecx, ecx
    jnz .findmin
    
    pop ecx
    pop ebx
    pop edx
    mov esp, ebp
    ret

section .rodata
barra_n db 10, 0

section .bss
result resb 10


