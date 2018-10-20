.Model small
.Data
String1 DB 13,10, 'Enter number: $'
String2 DB 13,10, '=: $'
Salto DB 13,10, ' $'
num  DB 0
num1 DB 0
num2 DB 0
num3 DB 0
Mult DB 216 dup(0)
ArrU DB 216 dup(0)
ArrD DB 216 dup(0)
ArrC DB 216 dup(0)
tmp DB 0

.Code
programa:
    MOV AX, @Data   
    MOV DS, AX      
    LEA DX,String1
    MOV AH, 09h 
    INT 21h
    ;Read Digits
    XOR AX,AX
    XOR DX,DX
    mov AH, 01h  
    int 21h 
    SUB AL, 30h
    MOV num3, AL 

    XOR AL,AL
    mov AH, 01h  
    int 21h 
    
    SUB AL, 30h
    MOV num2, AL 
    
    XOR AL,AL
    mov AH, 01h  
    int 21h 
    
    SUB AL, 30h
    
    MOV num1, AL 
;----------------------------------------------------------------------------------
    MOV AL, num3
    MOV BL, 100
    MUL BL
    MOV num, AL
    MOV AL, num2
    MOV BL, 10
    MUL BL
    ADD num, AL
    MOV AL,num1
    ADD num, AL
;----------------------------------------------------------------------------------   
    MOV Mult[0], 1
    MOV num3,0
    MOV num2, 0
    MOV num1,1
    MOV CL, num
;----------------------------------------------------------------------------------
Fact:                 
    CALL CLEAN
    
Producto1:                  
    MOV AL, Mult[SI]
    MOV BL, num1
    MUL BL
    ADD AL, tmp
    AAM
    MOV ArrU[SI], AL       ;unidades 
    CMP SI, 215D
    JE finish1               
    MOV tmp, AH
    INC SI
    JMP Producto1
finish1:
    MOV ArrU[216], AH
    CALL CLEAN
    
Producto2:                  
    MOV AL, Mult[SI]
    MOV BL, num2
    MUL BL
    ADD AL, tmp
    AAM
    INC SI                      
    MOV ArrD[SI], AL
    DEC SI
    CMP SI, 215D
    JE finish2                
    MOV tmp, AH
    INC SI
    JMP Producto2
finish2:
    MOV ArrD[216], AH
    CALL CLEAN
    
Producto3:                  
    MOV AL, Mult[SI]
    MOV BL, num3
    MUL BL
    ADD AL, tmp
    AAM
    INC SI                      
    INC SI
    MOV ArrC[SI], AL
    DEC SI
    DEC SI
    CMP SI, 215D
    JE finish3                
    MOV tmp, AH
    INC SI
    JMP Producto3
;------------------------------------
Fact2:
    JMP Fact
;------------------------------------
finish3:
    MOV ArrC[216], AH
    CALL CLEAN             

Sumar:                      
    MOV AL,ArrU[SI]
    ADD AL,ArrD[SI]
    ADD AL,ArrC[SI]
    ADD AL,tmp
    AAM
    MOV Mult[SI],AL
    CMP SI, 215D
    JE finish                
    MOV tmp, AH
    INC SI
    JMP Sumar
finish:
    MOV Mult[216], AH
    MOV AL, num1            
    INC AL
    AAM
    MOV num1,AL
    ADD num2, AH
    MOV AL, num2
    AAM
    MOV num2, AL
    ADD num3, AH 
    DEC CL
    CMP CL,0
    JG Fact2              
    XOR CX,CX
    MOV CX,216
    LEA DX,String2
    MOV AH, 09h 
    INT 21h
    CALL CLEAN
    MOV SI,215
;---------------------------------------------------
Print:                    
    MOV DL, Mult[SI]
    ;print result
    ADD DL,30h
    MOV AH, 02h 
    INT 21h
    DEC SI
    LOOP Print
    JMP END
    
CLEAN:
    ;clean
    XOR AX,AX
    XOR BX,BX
    XOR DX,DX
    MOV SI,0
    MOV tmp,0 
RET
END:
    ; finish
    MOV AH, 4Ch
    INT 21h
 .Stack
END programa