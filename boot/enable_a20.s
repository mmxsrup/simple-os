[bits 16]
enable_a20:
	mov ax, 0x2401
	int 0x15

	mov si, msg_enable_a20
	call print

	ret

msg_enable_a20: db "Enable A20", 0x0a, 0x0d, 0