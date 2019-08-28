GLOBAL print
GLOBAL exit
GLOBAL uppercase
GLOBAL numtostr
GLOBAL sum
GLOBAL multn_1_to_k
GLOBAL fact
GLOBAL min
GLOBAL printArray
GLOBAL printNext
GLOBAL selection_sort
GLOBAL swap_with_last
GLOBAL findMaxIndex

section .text

;________________________________Función print__________________________________________
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

;_____________________________Función exit_____________________________________
exit:
    mov eax, 1 ; ID de Syscall EXIT
    int 80h

;___________________________________Función para calcular la longitud de una cadena___________
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

;____________________________Función para pasar todo de minuscula a mayuscula_________
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
;_________________________Función para pasar un número de entero a string____________________
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
;__________________________Función para la sumatoria de 1 a n______________________________
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

;______________________________Función para multiplos de n desde 1 a k______________________
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

;________________________Función para factorial de un número________________________
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

;__________________Función para encontrar mínimos______________________________
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
;________________Grupo de funciones print para arrays_____________________________________________
printArray:
    push ebx
    push ecx
    push edx
    push esi

    mov edx, 0
    mov esi, ebx

    mov ebx, cizq
    call print
    mov ebx, space
    call print

    .printCurrent:
    mov ebx, esi
    call printNext
    mov ebx, space
    call print
    inc edx
    loop .printCurrent

    mov ebx, cder
    call print
    mov ebx, esi

    mov ebx, barra_n
    call print
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

printNext:
    push eax
    push ebx

    mov eax, [esi + 4*edx]

    mov ebx, aux
    call numtostr

    pop ebx
    pop eax
    ret

;_____________________Grupo de funciones para hacer sorting____________
selection_sort:
    pushf
    pushad

    .call_funcs:
    call findMaxIndex
    call swap_with_last
    loop .call_funcs

    popad
    popf
    ret

swap_with_last:
    push edi
    push esi
    dec ecx

    mov edi, [ebx + 4*ecx]
    mov esi, [ebx + 4*eax]
    mov [ebx + 4*ecx], esi
    mov [ebx + 4*eax], edi

    inc ecx
    pop esi
    pop edi
    ret

findMaxIndex:
    push ebx
    push ecx
    push edx
    push esi

    test ecx, ecx
    jz .fin

    mov eax, 0
    mov esi, [ebx]

    .findmax:
    dec ecx
    cmp esi, [ebx + 4*ecx]
    jge .next

    mov esi, [ebx + 4*ecx]
    mov eax, ecx

    .next:
    test ecx, ecx
    jnz .findmax

    .fin:
    pop esi
    pop edx
    pop ecx
    pop ebx

    ret

section .rodata
barra_n db 10, 0
space db " ",0
cizq db "[",0
cder db "]",0

section .bss
result resb 10
aux resb 32


