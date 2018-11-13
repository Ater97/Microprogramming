Include LabMacro.lib
.model small
.data
a   db 8
b   db 3
c   db -5
rst  db ?
rst2 db ?
temp db ?
Salto DB 13,10, ' $'
.code
programa:
    Mov AX,@data           
    Mov DS, AX
    
    Suma 8,3,-5,dl
    call Printint
    OPERACION2 8,3,-5,dl
    mov rst,dl
    call PrintTwoInt
    OPERACION3 8,3,5,dl
    mov rst,dl
    call PrintTwoInt
finish:
    MOV AH, 4ch
    INT 21h

PrintTwoInt proc 
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
    ret
    endp

Printint proc
    mov AH,02h ;print dl
    ADD dl,30h
    int 21h
    MOV DX, offset Salto
    MOV AH, 09h
    INT 21h
    XOR DX,DX;clean
    XOR AX,AX
    ret
    endp
.STACK 
END programa