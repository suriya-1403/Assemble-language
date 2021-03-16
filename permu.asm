DATA SEGMENT
N EQU 05H
R EQU 03H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:
    mov ax,DATA
    mov DS,ax
    mov al,N
    mov ah,00H
    mov dl,N
    NUM:
        dec dl
        mul dl
        mov cl,dl
        cmp cl,01
        jnz NUM
    mov bl,al
    mov al,N
    sub al,R
    mov dh,al
    mov al,dh
    DEN:
        dec dh
        mul dh
        mov cl,dh
        cmp cl,01
        jnz DEN
    xchg bl,al
    div bl
HLT
    CODE ENDS
    END START

