EXTERN print
EXTERN numtostr
EXTERN exit
GLOBAL _start

section .text
_start:
;El stack se organiza asi al inicio de la llamada:
	;
	;----------------------------
	; ESP          |   Cantidad de args
	;----------------------------
	; ESP + 4      |   Path
	;----------------------------
	; ESP + 8 	   |   Arg 2
	;----------------------------
	; ESP + 12     |   Arg 3 
	;----------------------------
	;   ...
	;----------------------------
	; ESP + 4(n+1) |   Arg n
	;----------------------------
	; NULL (4 bytes)
	;----------------------------
	; Punteros a variables de entorno
	;-----------------------------
	; ...
	;-----------------------------
	; NULL (4 bytes)
	;---------------------------
	;
	; Este programa recorre el stack de a 4 bytes, acumulando la cantidad de bytes
	; recorridos en EAX e imprimiendo los contenidos del stack por salida estandar
	; Primero se imprime la cantidad de argumentos, luego los argumentos y finalmente 
	; las variables de entorno.
	; El ciclo interno arranca con ESI en ESP + 8 (Path) 
	; y corta cuando encuentra un NULL (no arranca en ESP para no )
	; El externo luego de dos iteraciones (ECX empieza en 2)
	; Es decir, llegamos hasta el final de las variables de entorno (segundo NULL)
	; Mientras se van imprimiendo, y en EAX se acumulan los bytes recorridos

    mov esi, esp
    mov eax, 0

    mov ebx, msg0
    call print_nice_message

    mov ebx, msg_args
    call print

    mov ebx, aux
    mov eax, [esi]
    call numtostr

    mov ebx, barra_n
    call print
    call print

    add esi, 4
    mov eax, 4

    call print_till_null

    mov ebx, msg1
    call print_nice_message

    call print_till_null

    call print_final_message
    call exit



print_nice_message:
    push edx
    push ebx

    mov edx, ebx

    mov ebx, barra_n
    call print

    mov ebx, separador
    call print

    mov ebx, edx
    call print

    mov ebx, separador

    call print
    pop ebx
    pop edx
    ret

print_final_message:
    push edx
    push ebx

    mov edx, msg2

    mov ebx, barra_n
    call print

    mov ebx, separador
    call print

    mov ebx, edx
    call print

    mov ebx, aux
    call numtostr

    mov ebx, separador
    call print

    pop ebx
    pop edx
    ret

print_till_null:
    .loop:
    mov ebx, [esi]
    call print_it

    add esi, 4
    add eax, 4

    test ebx, ebx
    jnz .loop
    ret

print_it:
    push ebx

    test ebx, ebx
    jz .fin
    call print
    mov ebx, barra_n
    call print
    call print

    .fin:
    pop ebx
    ret

section .data
barra_n db 10,0
separador db 10, " -----------------------------------------------------",10,0
msg0 db "          PATH Y ARGUMENTOS",0
msg1 db "       VARIABLES DE ENTORNO",0
msg2 db "     CANTIDAD DE BYTES EN EL STACK: ",0
msg_args db "        CANTIDAD DE ARGUMENTOS: ",0

section .bss
aux resb 10