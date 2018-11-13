.MODEL small
.DATA 
cadena DB 13,10, 'Inserte caracteres en minuscula luego presione enter: $'
cadena2 db 13,10, 'Ingrese cadena1: $'
cadena3 db 13,10, 'Ingrese cadana2: $'
igual db 13,10,'Son iguales $'
diferente db 13,10,'Son diferentes $'
Entrada DB 100 dup('$')
Entrada2 DB 100 dup('$')
lenght1 db ?
lenght2 db ?
.code 
programa:
    MOV AX, @Data   
    MOV DS, AX      
    LEA DX,cadena
    MOV AH, 09h 
    INT 21h

    lea di,Entrada   
    mov ah,01
leer:
    int 21h
    cmp al,0dh
    je finalizar
    sub al,32d
    mov [DI],al
    inc DI
    jmp leer
    
finalizar:  
    mov al, 00
    mov ah, 00
    int 10h
    xor dx,dx
    LEA DX,Entrada
    MOV AH, 09h 
    INT 21h
    
    xor dx,dx
    LEA DX,cadena2
    MOV AH, 09h 
    INT 21h
            
    lea di,Entrada   
    mov ah,01
leer2:
    int 21h
    cmp al,0dh
    je finalizar2
    
    mov [DI],al
    inc DI
    jmp leer2
    
finalizar2:    
    xor dx,dx
    LEA DX,cadena3
    MOV AH, 09h 
    INT 21h
    
    lea di,Entrada2   
    lea si,Entrada
    mov ah,01
leer3:
    int 21h
    cmp al,0dh
    je finalizar3
    mov [DI],al
    cmp al,[si]
    jne direferente
    inc si
    inc DI
    jmp leer3
finalizar3:    
    LEA DX,igual
    MOV AH, 09h 
    INT 21h
    jmp finish
direferente:
    LEA DX,diferente
    MOV AH, 09h 
    INT 21h
    
    mov ah,01
    int 21h
finish:
    mov ah, 4ch
    int 21h
.STACK
END programa