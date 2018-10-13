.MODEL small
.DATA
Cadena1 DB 13,10, 'Ingrese dos numeros: $'
Cadena2 DB 13,10, 'el numero en base 8 es: $'
salto DB 13,10, ' $'
num1 db ?
num2 db ?
rst db ?
rst2 db ?
rst3 db ?
.code
programa:
    MOV AX,@DATA
    MOV DS,AX
    ;imprimir
    MOV DX, offset Cadena1
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
    ;leer el digito
    XOR AX, AX
    MOV AH , 01h
    INT 21h
    SUB AL,30h ;obtener el valor real
    MOV num1, AL
    XOR AX,AX
    ;leer el digito
    MOV AH, 01h
    int 21h
    sub AL,30h ;obtener el valor real
    MOV num2, AL
    
    XOR DX,DX;clean
    XOR AX,AX
;------------------------------------------------------------
    ;imprimir
    MOV DX, offset Cadena2
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
    
    mov al,10
    mul num1    ;a base 10
    add al,num2
    MOV BL, 8   ;a base 8
    DIV BL
    MOV rst3, AH
    cmp al,8
    jg tag1
    
    mov rst, 0
    mov rst2,al
    jmp finish
    
    tag1:
    div BL
    mov rst, al
    mov rst2,ah
    

    finish:
    ;clean screen
    mov al, 00h
    mov ah, 00h
    int 10h
    
    XOR DX,DX;clean    
    ;print result
    MOV AH,02h
    MOV Dl, rst
    sub Dl,30h
    int 21h
    
    XOR DX,DX ;clean
    MOV AH,02h
    MOV Dl, rst2
    ADD Dl,30h
    int 21h
    
    XOR DX,DX ;clean
    MOV AH,02h
    MOV Dl, rst3
    ADD Dl,30h
    int 21h

;finalizar el programa
    ;fin:
    MOV AH,4ch
    INT 21h
.STACK
END programa