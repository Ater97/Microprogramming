.MODEL small
.DATA
Cadena1 DB 13,10, 'Enter number:$'
Cadena2 DB 13,10, 'Factores: $'
Salto DB 13,10, ' $'
num1 db ?
modul db ?
half db ?
count db ?
rst  db ?
rst2 db ?
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
    MOV modul, AL
    
    mov al,10
    mul num1    ;a base 10
    add al,modul  
    mov num1, al 
;---------------------------------------------------------------    
    MOV BL, 2
    DIV BL
    MOV half,AL ;half of the number
    MOV modul,AH 
    XOR DX,DX;clean
;clean screen
    mov al, 00h
    ;mov ah, 00h
    int 10h
;imprimir
    MOV DX, offset Cadena2
    MOV AH, 09h
    INT 21h
    XOR DX,DX    ;clean
    XOR AX,AX
    
    ;imprimir
    MOV AH,02h
    MOV Dl,1
    ADD Dl,30h
    int 21h
    XOR DX,DX    ;clean
    XOR AX,AX
;----------------------------------------------------------------
    MOV count,1  ;set i = 1
Check:
    inc count
    XOR DX,DX;clean  
    XOR AX,AX
    
    MOV AL,half  ;set n/2
    cmp count,AL ;check i= n/2
    je  Finish
    
    mov al,num1  ;set n
    mov bl,count ;set i
    
    div bl
    MOV rst,AL
    MOV modul,AH
    
    XOR DX,DX;clean  
    XOR AX,AX
    cmp modul,0 ; n%i == 0
    je Print
    jmp Check  
    
Print:   
    ;imprimir
    MOV DX, offset Salto
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
    XOR AX,AX
    
    MOV Al, rst
    MOV BL, 10 
    DIV BL  
    
    MOV rst,AL
    MOV rst2,AH
    XOR DX,DX;clean

    ;print result
    MOV AH,02h
    MOV Dl,rst
    ADD Dl,30h
    int 21h
    
    XOR DX,DX ;clean
    MOV AH,02h
    MOV Dl,rst2
    ADD Dl,30h
    int 21h

    jmp Check
;finalizar el programa
Finish:
    ;imprimir
    MOV DX, offset Salto
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
    XOR AX,AX
    MOV Al, num1
    MOV BL, 10 
    DIV BL  
    
    MOV rst,AL
    MOV rst2,AH
    XOR DX,DX;clean

    ;print result
    MOV AH,02h
    MOV Dl,rst
    ADD Dl,30h
    int 21h
    
    XOR DX,DX ;clean
    MOV AH,02h
    MOV Dl,rst2
    ADD Dl,30h
    int 21h

    MOV AH,4ch
    INT 21h
.STACK
END programa