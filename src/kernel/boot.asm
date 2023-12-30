[org 0x7c00]

; Initialize somethings.
mov ax, 3
int 0x10 ; set screen mode and clear screen

mov ax, 0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00

; Call the print function.
mov si, str_helloworld
call print

; The print function.
; void print(addr si);
print:
    mov ah, 0x0e
.start:
    mov al, [si]
    cmp al, 0 
    jz .done
    int 0x10
    inc si
    jmp .start
.done:
    ret

str_helloworld:
    db "Hello world!", 10, 13, 0

hlt ; Stop here.

times 510 - ($ - $$) db 0
dw 0xaa55