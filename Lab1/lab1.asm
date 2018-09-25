MODEL small
.DATA
cadena1 Db 'Sebastian Orantes$'
cadena2 Db '1085816 $'

.code
programa: 
;Iniciar programa
    MOV AX,@DATA ; se obtiene la direccion de inicio del segmento de datos
    MOV DS, AX ;asignamos al registro data segment la direccion de  inicio de segmento
; imprimir cadena1
    MOV DX, offset cadena1
    MOV AH, 09h
    INT 21h
; imprimir cadena2
    MOV DX, offset cadena2
    MOV AH, 09h
    INT 21h
;get lenght    
    mov di, offset cadena1
    mov al, '$'
    mov cx, 255
    repnz scasb
    sub di, offset cadena1
    mov cx, di
;switch variables
    ;MOV    AL,cadena1
    ;MOV    BL,cadena2
    ;XCHG   AL,cadena2
    ;XCHG   BL,cadena1
    MOV cx,17 ;count
    
    MOV bx,0
sv:
    MOV    AL,[cadena1+bx]
    XCHG   AL,[cadena2+bx]
    MOV    [cadena1+bx],AL
    
    inc bx
    loop sv
; imprimir cadena1
    MOV DX, offset cadena1
    MOV AH, 09h
    INT 21h
; imprimir cadena2
    MOV DX, offset cadena2
    MOV AH, 09h
    INT 21h
;finalizar programa
    MOV AH, 4ch
    INT 21h
.STACK 
END programa