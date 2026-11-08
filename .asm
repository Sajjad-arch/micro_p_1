.model small
.stack 100h
.data

multiplicand db 13,10,"Enter Multiplicand: $"
multiplier db 13,10,"Enter Multiplier: $"
product db 13,10,"Your Product: $"

.code

main proc

    mov ax, @data
    mov ds, ax

    ; Multiplicand input
    lea dx, multiplicand
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h

    sub al, 30h
    mov bl, al       ; BL = multiplicand

    ; Multiplier input
    lea dx, multiplier
    mov ah, 9h
    int 21h

    mov ah, 1h
    int 21h

    sub al, 30h
    mov bh, al       ; BH = multiplier

    ; Multiplication
    mov al, bl
    mul bh           ; AX = AL * BH

    mov cl, al       ; Save product

    ; Display product
    lea dx, product
    mov ah, 9h
    int 21h

    mov dl, cl
    add dl, 30h      ; Decimal to ASCII
    mov ah, 2h
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h

main endp
end main
