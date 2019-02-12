#include "display.h"

int get_offset(int row, int col);

void flash_screen() {
	char* addr = (char*)VRAM_ADDR;
	for (int i = 0; i < MAX_COLS * MAX_ROWS; ++i) {
		addr[i * 2] = ' ';
		addr[i * 2 + 1] = WHITE_ON_BLACK;
	}
}

void put_char(char c, int row, int col, int color) {
	int offset = get_offset(row, col);
	char* addr = (char*)VRAM_ADDR;
	addr[offset] = c;
	addr[offset + 1] = color;
}


// Private function
int get_offset(int row, int col) {
	return 2 * (row * MAX_COLS + col);
}