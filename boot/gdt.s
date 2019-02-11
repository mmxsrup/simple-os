[bits 16]
setup_gdt:
	cli
	pusha
	lgdt [gdt_ptr]
	sti

	mov si, msg_gdt
	call print

	popa
	ret


align 8

gdt_start:

; offset 0x0
gdt_null:
	dd 0x0
	dd 0x0

; offset 0x8
gdt_code: ; base = 0x0 segment_limit = 0xfffff000 RW Eexecute
	dw 0xffff ; segment limit (0-15 bits)
	dw 0x0 ; segment base (0-15 bits)
	db 0x0 ; segment base (16-23 bits)
	db 0x9a ; access type
	db 0xcf ; flag + segment limit (16-19 bits)
	db 0x0 ; segment base (24-31 bits)

; offset 0x10
gdt_data: ; base = 0x0 segment_limit = 0xfffff000 RW
	dw 0xffff ; segment limit (0-15 bits)
	dw 0x0 ; segment base (0-15 bits)
	db 0x0 ; segment base (16-23 bits)
	db 0x92 ; access type
	db 0xcf ; flag + segment limit (16-19 bits)
	db 0x0 ; segment base (24-31 bits)

gdt_end:

align 8
gdt_ptr:
	dw gdt_end - gdt_start - 1
	dd gdt_start

msg_gdt: db "Set up GDT", 0xa, 0xd, 0,

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start