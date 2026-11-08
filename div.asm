.model small
.stack 100h
.data

dividend db 13,10,"Enter Dividend: $"
divisor db 13,10,"Enter Divisor: $"
quotient db 13,10,"Your Quotient: $"
remainder db 13,10,"Your Remainder: $"
error db 13,10,"Undefined!!! $"

.code

main proc

    mov ax, @data
    mov ds, ax

    ; Dividend input
    lea dx, dividend
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h

    sub al, 30h
    mov bl, al       ; BL = dividend

    ; Divisor input
    lea dx, divisor
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h

    sub al, 30h
    mov bh, al       ; BH = divisor

    ; Check divisor = 0
    cmp bh, 0
    je undefined

    ; Division
    mov al, bl
    xor ah, ah
    div bh

    mov cl, al       ; CL = quotient
    mov ch, ah       ; CH = remainder

    ; Display quotient
    lea dx, quotient
    mov ah, 9h
    int 21h

    mov dl, cl
    add dl, 30h
    mov ah, 2h
    int 21h

    ; Display remainder
    lea dx, remainder
    mov ah, 9h
    int 21h

    mov dl, ch
    add dl, 30h
    mov ah, 2h
    int 21h

    jmp exit

    ; Undefined case
    undefined:
    lea dx, error
    mov ah, 9h
    int 21h

    ; Exit
    exit:
    mov ah, 4ch
    int 21h

main endp
end main
