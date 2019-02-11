global _start

org 0x7c00
%define KERNEL_OFFSET 0x1000

[bits 16]
_start:
	; set stack
	mov ax, 0x00
	mov ss, ax
	mov bp, 0x9000
	mov sp, bp

	; change display to text mode
	mov ax, 0x3
	int 0x13

	mov si, msg_booting
	call print

	mov si, msg_started_16
	call print

	call disk_load
	call setup_gdt
	call switch_to_pmod

[bits 32]
start_pmod:
	call boot_kernel

	cli
	hlt
end_pmod:

boot_kernel:
	cli
	mov ebp,  KERNEL_OFFSET; kerenl.img (ELF file) addr
	add ebp, [ebp + 0x18] ; entry addr

	call ebp
	ret

%include "print.s"
%include "disk_load.s"
%include "gdt.s"
%include "switch_to_pmod.s"

msg_booting: db "Booting...", 0x0a, 0x0d, 0
msg_started_16: db "Started in 16-bit real mode (16bit)", 0x0a, 0x0d, 0

times 510 - ($ - $$) DB 0
dw 0xAA55