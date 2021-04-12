ASSUME CS:CODE,DS:DATA
DATA SEGMENT
    FILENAME DB 'SURIYA.TXT',0
    DATABLOCK DW ?
    MSG DB 'YEA ITS TRUE!'
    BUFFER DB 13 DUP(?)
    COUNT DB 13
DATA ENDS

CODE SEGMENT
START:
                                    ; File creation
    MOV AX,DATA
    MOV DS,AX                       ; Intialize data segment
    LEA DX,FILENAME                 ; Offset of File Name
    MOV CX,00H                      ; file creation starts from here
    MOV AH,3CH
    INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    ; Write into the file
    MOV AX,DATA                     ; file opens and write
    MOV DS,AX
    MOV AH,3DH                      ; Open file Cmd
    LEA DX,FILENAME                 ; file name from FILENAME
    MOV AL,1                        ; Access mode 1 FOR WRITTING
    INT 21H
    MOV DATABLOCK,AX

    MOV AH,40H                      ; Write to file or device
    MOV BX,DATABLOCK                
    MOV CX,13                       ; cx = number of bytes to be written
    LEA DX,MSG                      ; message
    INT 21H

    MOV AH,3EH                      ; Close the file
    MOV DX,DATABLOCK
    INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    ; Read from the file and store it to "Buffer"
    MOV AX,DATA                     ; file opens and write
    MOV DS,AX
    MOV AH,3DH                      ; OPEN FILE COMMAND
    LEA DX,FILENAME                 ; FILE NAME FROM "FILENAME"
    MOV AL,0                        ; ACCESS MODE 0 FOR READING
    INT 21H
    MOV DATABLOCK,AX

    MOV AH,3FH                      ; READ FILE
    MOV BX,DATABLOCK
    LEA DX,BUFFER                   ; STORING IT IN "BUFFER"
    MOV CX,13                       ; NUMBER OF BYTES TO BE READ
    INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    ; DISPLAYING THE BUFFER TO CRT SCREEN
    LEA SI,BUFFER
LPT:
    MOV AH,2                        ; A Character Output
    MOV DL,[SI]
    INT 21H
    INC SI
    DEC COUNT
    JNZ LPT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                    ; File deletion
    MOV AX,DATA
    MOV DS,AX
    LEA DX,FILENAME                 
    MOV AH,41H                      ; DELETE FILE
    INT 21H
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOV AH,4CH                      ; Terminate with return code
    INT 21H
CODE ENDS
END START
