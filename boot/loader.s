global _start
extern kernel_main

org 0x7c00

_start:
	mov si, msg_booting
	call print

msg_booting:
	db "Booting...", 0

print:
	mov ah, 0x0E
	mov bl, 0x07
	mov bh, 0x00
print_loop:
	lodsb
	test al, al
	jz print_end
	int 0x10
	jmp print_loop
print_end:
	ret

times 510 - ($ - $$) DB 0
dw 0xAA55