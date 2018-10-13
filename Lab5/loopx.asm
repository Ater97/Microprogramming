.MODEL small
.DATA
Cadena1 DB 'X$'
salto DB 13,10, ' $'
entrada db ?
.code
programa:
    MOV AX,@DATA
    MOV DS,AX
    
Print:
    ;imprimir
    MOV DX, offset Cadena1
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
    mov bl, cadena1
    ;check for a key 
    mov ah, 0bh
    int 21h
    cmp al,0
    je  Print
    jmp Read   
    
Read:    
;leer caracter
    XOR AX, AX
    MOV AH , 01h
    INT 21h
    ;SUB AL,30h ;obtener el valor real
    MOV entrada, AL
    XOR AX,AX   
    cmp entrada,13d
    je  finish 
    jmp Print
finish:
    ;clean screen
    mov al, 00h
    mov ah, 00h
    int 10h
    
;finalizar el programa
    ;fin:
    MOV AH,4ch
    INT 21h
.STACK
END programa