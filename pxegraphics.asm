USE16
org 0x7C00

start:
	cli
	xor eax, eax
	mov ss, ax
	mov es, ax
	mov ds, ax
	mov sp, 0x7C00
	sti

; set 640x480 graphics mode, 16 colors
	mov ax, 0x0012 ; subfunction 0 - set mode, mode 0x12
	int 0x10

; draw a pixel
    mov ah, 0x01 ; colour: blue
    mov al, 0x0C ; int subfunction: put pixel
; put coords into the cx,dx registers
    mov cx, 0x000F
    mov dx, 0x000F
    int 0x10

infinite:
    jmp infinite

; pad
times 510-$+$$ db 0			

sign dw 0xAA55

