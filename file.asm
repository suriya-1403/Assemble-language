ASSUME CS:CODE,DS:DATA
DATA SEGMENT
    DATABLOCK DB 200H DUP (?)
    FILENAME DB "HELLO.txt",0
    MESS DB 0AH,0DH,"FILE NOT CREATED SUCCESSFULLY",0AH,0DH,"$"
    SUCC DB 0AH,0DH,"FILE CREATED SUCCESSFULLY",0AH,0DH,"$"
DATA ENDS

CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX                       ; Intialize data segment
    LEA DX,FILENAME          ; Offset of File Name
    MOV CX,00H                      ; file creation starts from here
    MOV AH,3CH
    INT 21H
    JNC WRITE                      ; file created and needed to write in it

    MOV AX,DATA                     ; else part of file creation (i.e) not created
    MOV DS,AX
    LEA DX,MESS
    MOV AH,09H
    INT 21H
    JMP STOP

WRITE:
    MOV BX,AX
    MOV CX,0200H
 
    LEA DX,DATABLOCK
    MOV AH,40H

    LEA DX,SUCC
    MOV AH,09H

    INT 21H
STOP:
    MOV AH,4CH
    INT 21H
CODE ENDS
END START