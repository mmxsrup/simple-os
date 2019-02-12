; load kernel image from disk

[bits 16]
disk_load:
	pusha

	mov ah, 0x02 ; read sectors from drive
	mov al, LOAD_SECTOR_SIZE ; sectors to read count
	mov ch, 0x00 ; cylinder
	mov cl, 0x02 ; sector
	mov dh, 0x00 ; head
	mov dl, 0x00 ; drive

	; buffer address pointer (es:bx)
	mov bx, 0x0000
	mov es, bx
	mov bx, KERNEL_SRC

	int 0x13

	jc load_error

load_success:
	mov si, msg_load_disk
	call print

	popa
	ret

load_error:
	cli
	hlt


msg_load_disk: db "Loaded kernel img from disk to memory", 0x0a, 0x0d, 0