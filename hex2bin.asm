ASSUME CS:CODE,DS:DATA
DATA SEGMENT
    STR DB 'BINARY NUMBER: $'
    BSTR DB 20 DUP('$')
    RSTR DB 20 DUP('$')
    NL DB 13,10,'$'
    CNT DB 0
    N DB 2
    H DB 16
    D DB 10H
    NUM DB ?
    SNUM DB ?
    HNUM DB 19H
DATA ENDS
CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX
    MOV CX,0000
    MOV DX,0000

L1:
    MOV AX,00
    MOV AL,HNUM
    DIV D
    MOV HNUM,AL
    MOV BX,AX
    MOV CL,CNT
    MOV AX,1
L2:
    CMP CL,00
    JE L3
    MUL H
    SUB CL,1
    JMP L2
L3:
    MUL BH
    ADD DX,AX
    ADD CNT,1
    CMP HNUM,0
    JG L1
    MOV NUM,DL
    LEA SI,BSTR
    LEA DI,RSTR
L4:
    MOV AX,00
    MOV AL,NUM
    DIV N
    ADD AH,30H
    MOV BYTE PTR[SI],AH
    INC SI
    MOV NUM,AL
    CMP AL,0
    JG L4
    DEC SI
L5:
    MOV BL,BYTE PTR[SI]
    MOV BYTE PTR[DI],BL
    DEC SI
    INC DI
    CMP SI,0
    JNE L5
    MOV AH,09H
    LEA DX,STR
    INT 21H

    MOV AH,09H
    LEA DX,RSTR
    INT 21H
HLT
CODE ENDS
END START
