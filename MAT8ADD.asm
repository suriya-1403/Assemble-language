DATA SEGMENT 
N1 DB 01H,02H,03H,04H,05H,06H,07H,08H,09H
N2 DB 09H,08H,07H,06H,05H,04H,03H,02H,01H
RES DB 09H DUP(?)
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
    MOV AX,0000H
    MOV AX,DATA
    MOV DS,AX
    MOV CX,0009H
    MOV AX,0000H
LPT:
    ADD AL,N1[SI]
    ADD AL,N2[SI]
    MOV RES[SI],AL
    MOV AX,0000H
    INC SI
    LOOP LPT
HLT
CODE ENDS
END START