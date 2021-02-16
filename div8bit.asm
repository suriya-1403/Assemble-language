code segment
assume cs:code
mov ax, 0000H
mov bx, 0000H
mov al,06h
mov bl,03h
div bl
hlt
code ends
end