#include "idt.h"

static idt_entry idt[MAX_IDT_ENTRY];
static idt_ptr idt_p;

void set_idt_entry(uint8_t num, uint32_t handler) {
	idt[num].offset_low = handler & 0xffff;
	idt[num].select = KERNEL_CS;
	idt[num].zero = 0;
	idt[num].flags = 0x8e;
	idt[num].offset_high = (handler >> 16) & 0xffff;
}

void init_idt(void) {
	idt_p.limit = MAX_IDT_ENTRY * sizeof(idt_entry) - 1;
	idt_p.base = (uint32_t*)&idt;
	__asm__ __volatile__("lidt idt_p");
}
