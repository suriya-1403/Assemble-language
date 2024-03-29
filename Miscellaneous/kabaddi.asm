DATA SEGMENT
LEAGU DB 08H,09H,0AH,04H,0CH,0DH,02H,00H,02H,05H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS: DATA
START:
    MOV AX,DATA
    MOV DS,AX
    MOV CH,09H
LP1:
    MOV CL,09H
    LEA SI, LEAGU
LP2:
    MOV AL,[SI]
    MOV BL,[SI+1]
    CMP AL,BL
    JNC DOWN
    MOV DL,[SI+1]
    XCHG [SI],DL
    MOV [SI+1],DL
DOWN:
    INC SI
    DEC CL
    JNZ LP2
    DEC CH
    JNZ LP1
    INT 3
    CODE ENDS
    END START
