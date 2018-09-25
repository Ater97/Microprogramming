.MODEL small
.DATA
cadena DB 'Hola Mundo$' ;Strings end with $
.code
programa: ;At the end of tag :
;Iniciar programa
    MOV AX,@DATA ; se obtiene la direccion de inicio del segmento de datos
        MOV DS, AX ;asignamos al registro data segment la direccion de  inicio de segmento
; imprimir cadena
    MOV DX, offset cadena
    MOV AH, 09h
    INT 21h
;finalizar programa
    MOV AH, 4ch
    INT 21h
.STACK 
END programa
