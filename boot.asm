[org 0x7c00]
mov bx, outputString    ; move string to buffer

printString:            ; print buffer
    mov ah, 0x0e            ; set mode to input/output
    mov al, [bx]        ; move bx pointer to al 
    cmp al, 0           ; check if al is null, string is done
    je startInputString      ; if is, jump to input string
    int 0x10            ; interupt CPU to print al to screen
    inc bx              ; change pointer to next char
    jmp printString     ; loop

inputString:            ; insert into buffer input from keyboard
    mov ah, 0
    int 0x16            ; get char
    cmp al, 13          ; see if it is carrige return
    je printInput       ; Print input string
    mov ah, 0x0e        ; set mode to i/o
    int 0x10            ; print al, inputted char, to screen
    mov [bx], al        ; add al to bx buffer
    inc bx              ; increment buffer
    jmp inputString     ; loop


startInputString:       ; save where start of input is
    mov dx, bx
    jmp inputString

printInput:             ; Load where start of input is, print string
    mov bx, dx
    jmp printString

foreverLoop:
jmp $

outputString:
    db "Space Heater OS", 0

times 510-($-$$) db 0
db 0x55, 0xaa