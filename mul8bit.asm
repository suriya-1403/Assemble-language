code segment
assume cs:code
mov ax, 0000H
mov bx, 0000H
mov al,05h
mov bl,03h
mul bl
hlt
code ends
end