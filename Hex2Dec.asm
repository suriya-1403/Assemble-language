ASSUME CS:CODE,DS:DATA
DATA SEGMENT
    NUM DW 0AAH
    RES DB 10 DUP ('$')
DATA ENDS
CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,NUM
    LEA SI,RES
    MOV CX,0000H
    MOV BX,10
L1:
    MOV DX,0
    DIV BX
    ADD DL,30H
    PUSH DX
    INC CX
    CMP AX,9
    JG L1
    ADD AL,30H
    MOV [SI],AL
L2:
    POP AX
    INC SI
    MOV [SI],AL
    LOOP L2

    LEA DX,RES
    MOV AH,9
    INT 21H
HLT
CODE ENDS
END START
