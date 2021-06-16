data segment
op1 db "Choice-1: Add                                                                   $"
op2 db "Choice-2: Subtract                                                              $"
op3 db "Choice-3: Multiply                                                              $"
op4 db "Choice-4: Division                                                              $"
op5 db "Choice-5: Square Root                                                           $"
sq1 db "                                                 Square Root of First Number: $"
sq2 db "                                                  Square Root of Second Number: $"
space db "                                                          $"
space1 db "                                                         $"
space2 db "                                      $"
space3 db "                                   $"
space4 db "                                $"
space5 db "                                                    $"
str db "Enter the Choice: $"
res db "                   Result: $"
num1 db 01H dup(?)
num2 db 01H dup(?)
num3 db 01H dup(?)
num4 db 01H dup(?)
num5 db 01H dup(?)
number1 db "Enter the First Number: $"
number2 db "                                                       Enter the Second Number: $"
str1 db "                                                             Addition Done$"
str2 db "                                                             Subtraction Done$"
str3 db "                                                             Multiplication Done$"
str4 db "                                                             Division Done$"
str5 db "                                                             Square Root Done$"
str6 db "                                                             Invalid Choice$"

data ends
code segment
assume cs:code,ds:data
start:
MOV AX,data
MOV DS,AX
MOV AX,0000H
MOV BX,0000H
LEA DX,op1
MOV AH,09H
INT 21H
LEA DX,op2
MOV AH,09H
INT 21H
LEA DX,op3
MOV AH,09H
INT 21H
LEA DX,op4
MOV AH,09H
INT 21H
LEA DX,op5
MOV AH,09H
INT 21H
; ************* taking Numbers ***********

;First Number
LEA DX,number1
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
MOV BL,AL
SUB BL,30H
MOV num1[si],BL
;MOV AH,2
;MOV DL,num1[si]
;ADD DX,30H
;INT 21H



;Second Number
LEA DX,number2
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
MOV BL,AL
SUB BL,30H
MOV num2[si],BL
;MOV AH,2
;MOV DL,num2[si]
;ADD DX,30H
;INT 21H

MOV AX,0000H
MOV BX,0000H
MOV AL,num1[si]
MOV BL,num2[si]
DIV BL
MOV num4[si],AL

; ********** taking option ***********
LEA DX,space
MOV AH,09H
INT 21H
LEA DX,str
MOV AH,09H
INT 21H
MOV AH,01H
INT 21H
MOV BL,AL
SUB BL,30H


;***** Checking option1 *****
CMP BL,01H
JG option2
LEA DX,str1
MOV AH,09H
INT 21H
LEA DX,space1
MOV AH,09H
INT 21H
LEA DX,res
MOV AH,09H
INT 21H
MOV BL,num1[si]
ADD BL,num2[si]
MOV num3[si],BL
MOV AH,2
MOV DL,num3[si]
ADD DX,30H
INT 21H
MOV AH,4CH
INT 21H


;***** Checking option2 *****
option2:
CMP BL,02H
JG option3
LEA DX,str2
MOV AH,09H
INT 21H
LEA DX,space1
MOV AH,09H
INT 21H
LEA DX,res
MOV AH,09H
INT 21H
MOV BL,num1[si]
SUB BL,num2[si]
MOV num3[si],BL
MOV AH,2
MOV DL,num3[si]
ADD DX,30H
INT 21H
MOV AH,4CH
INT 21H



;***** Checking option3 *****
option3:
CMP BL,03H
JG option4
LEA DX,str3
MOV AH,09H
INT 21H
LEA DX,space4
MOV AH,09H
INT 21H
LEA DX,res
MOV AH,09H
INT 21H
MOV AL,num1[si]
MOV BL,num2[si]
MUL BL
MOV num3[si],AL
MOV AH,2
MOV DL,num3[si]
ADD DX,30H
INT 21H
MOV AH,4CH
INT 21H



;***** Checking option4 *****
option4:
CMP BL,04H
JG option5
LEA DX,str4
MOV AH,09H
INT 21H
LEA DX,space2
MOV AH,09H
INT 21H
LEA DX,res
MOV AH,09H
INT 21H
MOV AH,2
MOV DL,num4[si]
ADD DX,30H
INT 21H
MOV AH,4CH
INT 21H




;***** Checking option5 *****
option5:
CMP BL,05H
JG option6
LEA DX,str5
MOV AH,09H
INT 21H
MOV AX,0000H
MOV BX,0000H
MOV CL,00H
MOV AL,num1[si]
MOV BL,02H
L1:
INC CL
SUB AL,BL
ADD BL,02H
CMP AX,BX
JG L1
MOV AL,CL
ADD AL,01H
MOV num3[si],AL
LEA DX,sq1
MOV AH,09H
INT 21H
MOV AH,2
MOV DL,num3[si]
ADD DX,30H
INT 21H

MOV AX,0000H
MOV BX,0000H
MOV CL,00H
MOV AL,num2[si]
MOV BL,02H
L2:
INC CL
SUB AL,BL
ADD BL,02H
CMP AX,BX
JG L2
MOV AL,CL
ADD AL,01H
MOV num5[si],AL
LEA DX,sq2
MOV AH,09H
INT 21H
MOV AH,2
MOV DL,num5[si]
ADD DX,30H
INT 21H


MOV AH,4CH
INT 21H


;***** Invalid Option *****
option6:
LEA DX,str6
MOV AH,09H
INT 21H
MOV AH,4CH
INT 21H


exit:
hlt
code ends
end start