; si is address of string

[bits 16]
print:
	pusha
	; tty mode
	mov ah, 0x0E
	mov bl, 0x07 ; color code
	mov bh, 0x00

print_loop:
	lodsb
	test al, al
	jz print_end
	int 0x10
	jmp print_loop

print_end:
	popa
	ret