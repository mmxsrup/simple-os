void print(char* message, int color);
void clear();

void kernel_main(void) {
	print("Hello Protected Mode", 0xf);
}

void print(char* message, int color) {
	char* mem = (char*)(0xb8000);
	while (*message != 0) {
		*mem = *message;
		mem++;
		message++;
		*mem = (char*)color;
		mem++;
	}
}

void clear(void) {
	char *mem = (char*)(0xb8000);
	while (*mem != 0) {
		*mem = 0;
		mem++;
	}
}