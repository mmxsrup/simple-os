#ifndef __IDT_H__
#define __IDT_H__

#include "types.h"

#define MAX_IDT_ENTRY 256
#define KERNEL_CS 0x08

typedef struct idt_entry {
	uint16_t offset_low;
	uint16_t select;
	uint8_t zero;
	uint8_t flags;
	uint16_t offset_high;
} __attribute__((packed)) idt_entry_t;

typedef struct idt_ptr {
	uint16_t limit;
	uint32_t base;
} __attribute__((packed)) idt_ptr_t;

void set_idt_entry(uint8_t num, uint32_t handler);
void init_idt(void);

#endif
