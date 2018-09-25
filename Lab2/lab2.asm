.MODEL small
.DATA
total DB 13,10, 'Total: $'
diferencia DB 13,10, 'Diferencia: $'
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
    ;SUMA
    ; imprimir cadena
    MOV DX, offset total
    MOV AH, 09h
    INT 21h
    
    MOV AL, num1
    ADD AL, num2
    MOV rst, AL
    
    XOR AX,AX; clean
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
  
;RESTA
    ; imprimir cadena
    MOV DX, offset diferencia
    MOV AH, 09h
    INT 21h
    
    MOV AL, num1
    SUB AL, num2
    MOV rst, AL
    ;clean
    XOR DX,DX
    XOR AX,AX
    
    XOR AX,AX; clean
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
    
;Multiplicacion
    ; imprimir cadena
    MOV DX, offset producto
    MOV AH, 09h
    INT 21h
    
    MOV AL, num1
    MOV BL, num2
    MUL BL
    MOV rst, AL
    
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
  
;Division    
    ; imprimir cadena
    MOV DX, offset cociente
    MOV AH, 09h
    INT 21h
    
    XOR AX,AX;clean
    XOR DX,DX

    MOV AL, num1
    MOV BL, num2
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
    ; imprimir cadena
    MOV DX, offset residuo
    MOV AH, 09h
    INT 21h
    
    MOV AH,02h
    MOV Dl, rst2
    ADD Dl,30h
    int 21h
;--------------------------------------------------------------------------    
    ;imprimir cadena
    MOV DX, offset salto
    MOV AH, 09h
    INT 21h
    ;imprimir valores por referencia
    XOR DX,DX
    XOR AX,AX
    
    MOV AH,02h
    MOV Dl, num1
    ADD Dl,30h
    int 21h
    
    XOR DX,DX
    XOR AX,AX
    
    MOV AH,02h
    MOV Dl,num2
    ADD Dl,30h
    int 21h
    
    
;finalizar el programa
    MOV AH,4ch
    INT 21h
.STACK
END programa