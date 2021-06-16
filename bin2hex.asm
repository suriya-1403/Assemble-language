ASSUME CS:CODE,DS:DATA
DATA SEGMENT
NUM DB '1010','$'
DATA ENDS
CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AX,0000H
    MOV CX,0000H
    MOV SI,OFFSET NUM
L1:
    MOV AX,[SI]
    CMP AX,'$'
    JE LV2
    INC CX
    INC SI
    JMP L1
LV2:
    DEC SI
    MOV BX,0000
    MOV AX,0001
L2:
    MOV DX,[SI]
    CMP DL,'1'
    JE L3
    JMP ENDLOOP
L3:
    ADD BX,AX
ENDLOOP:
    MOV DX,0002
    MUL DX
    DEC SI
    LOOP L2
    MOV AX,BX
HLT
CODE ENDS
END START
