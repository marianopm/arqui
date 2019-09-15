global _start
extern main

section .text
_start:
    ;
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


	;
	;Tengo que dejarselo a main así:
	;----------------------------
	; RET _start              |   
	;----------------------------
	; cantidad de argumentos  |  
	;----------------------------
	; char * argv[] 	      |   Puntero a los strings
	;----------------------------

    mov eax, [esp] ;la cantidad de args
    lea ebx, [esp+4] ;el puntero a los strings

    push ebx
    push eax

    call main

    mov ebx, eax    ;valor de ret que devuelve main
    mov eax, 1      ;syscall exit
    int 80h         ;syscall