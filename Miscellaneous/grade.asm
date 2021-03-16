DATA SEGMENT
SCORE DW 11D,15D,18D,15D,10D,52D
MARKS DW 06H DUP(?)
TOTAL DW ?
GRADE DW ?
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX,DATA
    MOV DS,AX
    XOR AX,AX
    LEA SI, SCORE
    LEA DI, MARKS
    MOV AX, [SI]
    MOV BX,15D
    MUL BX
    MOV BX,30D
    DIV BX
    MOV [DI],AX
    INC SI
    INC SI
    INC DI
    INC DI
    XOR AX,AX  ; Clearing for next element
    MOV AX, [SI]
    MOV BX,15D
    MUL BX
    MOV BX,30D
    DIV BX
    MOV [DI],AX
    INC SI
    INC SI
    INC DI
    INC DI
    XOR AX,AX  ; Clearing for next element
    MOV AX, [SI]
    MOV BX,10D
    MUL BX
    MOV BX,20D
    DIV BX
    MOV [DI],AX
    INC SI
    INC SI
    INC DI
    INC DI
    XOR AX,AX  ; Clearing for next element
    MOV AX, [SI]
    MOV BX,10D
    MUL BX
    MOV BX,20D
    DIV BX
    MOV [DI],AX
    INC SI
    INC SI
    INC DI
    INC DI
    XOR AX,AX  ; Clearing for next element
    MOV AX, [SI]
    MOV BX,10D
    MUL BX
    MOV BX,20D
    DIV BX
    MOV [DI],AX
    INC SI
    INC SI
    INC DI
    INC DI
    XOR AX,AX  ; Clearing for next element
    MOV AX, [SI]
    MOV BX,40D
    MUL BX
    MOV BX,100D
    DIV BX
    MOV [DI],AX
    XOR AX,AX  ; Clearing for next Repeative addition
    MOV CX,06D ; because MARKS has 6 value
    LEA SI,MARKS
LP1:
    ADD AX,[SI]
    INC SI
    INC SI
    DEC CX
    JNZ LP1

    LEA DI,TOTAL
    MOV [DI],AX

    LEA DI,GRADE
 
    CMP TOTAL, 90D
    JNC GRADEs
    CMP TOTAL,80D
    JNC GRADEa
    CMP TOTAL, 70D
    JNC GRADEb
    CMP TOTAL,60D
    JNC GRADEc
    CMP TOTAL, 50D
    JNC GRADEd
    CMP TOTAL,40D
    JNC GRADEe
    CMP TOTAL,40D
    JC GRADEf
    
GRADEs:
    MOV AX,'S'
    MOV [DI],AX
    JMP STORE
GRADEa:
    MOV AX,'A'
    MOV [DI],AX
    JMP STORE
GRADEb:
    MOV AX,'B'
    MOV [DI],AX
    JMP STORE
GRADEc:
    MOV AX,'C' 
    MOV [DI],AX
    JMP STORE
GRADEd:
    MOV AX,'D'
    MOV [DI],AX
    JMP STORE
GRADEe:
    MOV AX,'E'
    MOV [DI],AX
    JMP STORE
GRADEf:
    MOV AX,'F'
    MOV [DI],AX
    JMP STORE    
STORE:
    MOV BX,AX
    INT 21H
CODE ENDS
END START