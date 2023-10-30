[org 0x7c00]
mov ah, 0x0e
mov bx, outputString

printString:
    mov al, [bx]
    cmp al, 0
    je foreverLoop
    int 0x10
    inc bx
    jmp printString

foreverLoop:

jmp $

outputString:
    db "Space Heater OS", 0

times 510-($-$$) db 0
db 0x55, 0xaa