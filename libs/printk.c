#include "printk.h"
#include "../drivers/vram/display.h"

void printk(char *message, int row, int col) {
	while (*message != '\0') {
		if (*message == '\n') {
			row++;
			col = 0;
		} else {
			put_char(*message, row, col, WHITE_ON_BLACK);
			col++;
		}
		message++;
	}
}