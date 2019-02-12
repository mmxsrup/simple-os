global _start

org 0x7c00
%define KERNEL_SRC 0x1000
%define KERNEL_DEST 0x100000
%define LOAD_SECTOR_SIZE 0x10

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
	call enable_a20
	call switch_to_pmod

[bits 32]
start_pmod:
	call reloc_kernel
	call boot_kernel

	cli
	hlt
end_pmod:

reloc_kernel:
	cld
	mov ecx, LOAD_SECTOR_SIZE
	shl ecx, 9 ;sector -> bytes
	mov esi, KERNEL_SRC
	mov edi, KERNEL_DEST
	rep movsb
	ret

boot_kernel:
	call KERNEL_DEST; kerenl.img addr
	ret

%include "print.s"
%include "disk_load.s"
%include "gdt.s"
%include "enable_a20.s"
%include "switch_to_pmod.s"

msg_booting: db "Booting...", 0x0a, 0x0d, 0
msg_started_16: db "Started in 16-bit real mode (16bit)", 0x0a, 0x0d, 0

times 510 - ($ - $$) DB 0
dw 0xAA55