section .text
GLOBAL _start

EXTERN print 
EXTERN exit
EXTERN uppercase

_start:
    mov ebx, cadena
    call print
    call uppercase
    call print

    mov ebx, 0
    call exit

section .data
cadena db "h4ppy c0d1ng",10,0

; la idea es que hagas un uppercase comparando con el ascii de a a z
; y ahi compares, si no es sigue, si es lo pasas a mayuscula con la diferencia entre A y a
; para pensar: lo meto en lib o no? Impresiones iniciales dirian que si, lo puedo usar despues