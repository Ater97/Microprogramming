Include macros.lib
.model small
.stack
.data
    Matriz DB 100 DUP(0) ;arreglo para mantener la matriz
    I DB 1; Contador de filas
    J DB 1; Contador de columnas
    K DB 1; Posici?n lexicogr?fica en la matriz
    TamanoMatriz DB 1; Variable para mantener el tama?o de la matriz
    MensajeFilas DB 'Ingrese cantidad de filas de la matriz: $';
    MensajeColumnas DB 'Ingrese cantidad de columnas de la matriz: $';
    MensajeTamanoMatriz DB 'Cantidad de posiciones de matriz: $'
    Celda DB '*$'
    CambioLinea DB 10,13,'$'
    Columna DB 1
    Fila DB 1
    X DB 1
    Y DB 1  
    aux DW 0
    Numero2 db ?
    temp db ?
    Salto DB 13,10, ' $'
    MensajeInsertar db 10,13, 'Ingresar numero o letras a las celdas de la matriz:$'

.code
programa:
        Mov AX,@data            ; Se obtiene la direcci?n de inicio del segmento de datos
        Mov DS, AX              ; Se asigna al registro data segment la direcci?n de inicio del segmento de datos
        call Clrscr
        GotoXY 5,5              ;Se llama al macro para mover el cursor     
        ImprimeCadena MensajeFilas      ;Se llama al macro de impresi?n de la cadena
        CapturaNumero I
        ;PrintNumero I
        GotoXY 5,6
        ImprimeCadena MensajeColumnas
        CapturaNumero J
        ;PrintNumero J
        call CleanV
        Mov AL,I
        Mov BL, J
        Mul BL
        Mov TamanoMatriz,AL
        GotoXY 5, 7
        ImprimeCadena MensajeTamanoMatriz
        PrintNumeroTwoDigits TamanoMatriz
        ;call clrscr 
        ImprimeCadena MensajeInsertar
        ImprimeCadena Salto
;----------Read---------------------------------------------------------------
        Mov Y,00
        Mov Fila,10
    CicloFilasr:
        Mov X,00
        Mov Columna, 30
    CicloColumnasr:
        MOV AH, 01h
        INT 21h
        SUB AL, 30h
        LEA SI, Matriz
        ADD SI, aux
        MOV [SI], AL 
        INC aux
    GotoXY Columna,Fila
        Mapeo Y,X,I,J,1
        Inc Columna
        Inc X
        Mov CL,X
        cmp CL,J
        jl CicloColumnasr
        inc Y       
        inc Fila
        Mov CL,Y
        cmp CL,I
        jl CicloFilasr

;----------Print---------------------------------------------------------------
        ;call clrscr 
        Mov Y,00
        Mov Fila,10
        MOV aux, 0
    CicloFilas:
        Mov X,00
        Mov Columna, 30
    CicloColumnas:
        GotoXY Columna,Fila
        Mapeo Y,X,I,J,1
        LEA SI, Matriz
        ADD SI, aux
        MOV AL, [SI]
        ADD AL, 1
        PrintNumero AL
        inc aux
        Inc Columna
        Inc X
        Mov CL,X
        cmp CL,J
        jl CicloColumnas
        inc Y       
        inc Fila
        Mov CL,Y
        cmp CL,I
        jl CicloFilas
        
        Mov AH,4CH              ; Se asigna el c?digo para finalizaci?n de programa
        int 21h

    Clrscr proc near
        Mov AH,0
        Mov Al,02
        int 10h
        ret
    endp

    CleanV proc
        xor dx,dx
        xor ax,ax
        xor bx,bx
        ret
    endp

end programa
