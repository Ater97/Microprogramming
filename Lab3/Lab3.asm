.MODEL small
.DATA
Ciguales DB 13,10, 'Si los numeros son iguales $'
Cprimero DB 13,10, 'El primero es mayor al segundo $'
Csegundo DB 13,10, 'El segundo es mayor al primero $'
producto DB 13,10, 'Producto: $'
cociente DB 13,10, 'Cociente: $'
residuo DB 13,10, 'Residuo: $'
salto DB 13,10, ' $'
num1 db ?
num2 db ?
rst db ?
rst2 db ?
.code
programa:
    MOV AX,@DATA
    MOV DS,AX
    ;leer el digito
    XOR AX, AX
    MOV AH , 01h
    INT 21h
    SUB AL,30h ;obtener el valor real
    MOV num1, AL
    XOR AX,AX
    MOV AH, 01h
    int 21h
    sub AL,30h
    MOV num2, AL
    
    XOR DX,DX;clean
    XOR AX,AX
;------------------------------------------------------------
    MOV AL, num1
    MOV BL, num2
    CMP AL,BL
    JE iguales
    JS segundo
    JMP primero
    
; imprimir iguales
    iguales:
    MOV DX, offset Ciguales
    MOV AH, 09h
    INT 21h
    jmp fin
; imprimir primero
    primero:
    MOV DX, offset Cprimero
    MOV AH, 09h
    INT 21h
    jmp fin
; imprimir segundo
    segundo:
    MOV DX, offset Csegundo
    MOV AH, 09h
    INT 21h

;--------------------------------------------------------------------------    
    fin:    
    mov AL, num1
    mov BL, num2
    dec BL
    ;multiplicacion
    mult:
    add AL, num1
    dec BL
    cmp BL,0
    jg mult
    MOV rst, AL
    ;imprimir
    MOV DX, offset producto
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
;clean
    XOR DX,DX
    XOR AX,AX
    MOV Al, rst 
    MOV BL, 10
    DIV BL
    
    MOV rst, AL
    MOV rst2, AH
    XOR DX,DX;clean

    ;print result
    MOV AH,02h
    MOV Dl, rst
    ADD Dl,30h
    int 21h
    
    XOR DX,DX ;clean
    MOV AH,02h
    MOV Dl, rst2
    ADD Dl,30h
    int 21h
    
    MOV DX, offset salto
    MOV AH, 09h
    INT 21h
;-------------------------------------------------------------------------------
    ;Div
    mov AL, num1
    mov BL, 0
    cmp al,num2
    JAE div
    
    mov rst, 0
    mov rst2,al
    jmp printrst
    
    div:
    sub al,num2
    inc BL
    cmp al,num2
    JAE div
    
    mov rst, bl
    mov rst2,al
    
    printrst:
    ;imprimir
    MOV DX, offset cociente
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
    ;print result
    MOV AH,02h
    MOV Dl, rst
    ADD Dl,30h
    int 21h
    
    ;imprimir
    MOV DX, offset residuo
    MOV AH, 09h
    INT 21h
    ;print result
    MOV AH,02h
    MOV Dl, rst2
    ADD Dl,30h
    int 21h
    XOR DX,DX;clean
    MOV DX, offset salto
    MOV AH, 09h
    INT 21h
;imprimir valores por referencia
;clean
    XOR DX,DX
    XOR AX,AX
    
    MOV AH,02h
    MOV Dl, num1
    ADD Dl,30h
    int 21h


;clean
    XOR DX,DX
    XOR AX,AX
    
    MOV AH,02h
    MOV Dl,num2
    ADD Dl,30h
    int 21h
    
;finalizar el programa
    ;fin:
    MOV AH,4ch
    INT 21h
.STACK
END programa