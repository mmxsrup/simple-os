#ifndef __DISPLAY_H__
#define __DISPLAY_H__

#define VRAM_ADDR 0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80
#define WHITE_ON_BLACK 0x0f

void flash_screen();

void put_char(char c, int row, int col, int color);


#endif