[bits 16]

switch_to_pmod:
	mov si, msg_switch_pmod
	call print
	cli
	mov eax, cr0
	or eax, 1
	mov cr0, eax
	jmp CODE_SEG:init_pmod


[bits 32]

init_pmod:
	; init segment selector and stack
	mov ax, DATA_SEG
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	mov ebp, 0x9000
	mov esp, ebp

	jmp start_pmod

msg_switch_pmod: db "Switching to 32-bit protected mode", 0x0a, 0x0d, 0