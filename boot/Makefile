TARGET = loader.img

NASM = nasm


$(TARGET): loader.s Makefile
	$(NASM) loader.s -o $(TARGET)

clean:
	rm -rf $(TARGET)

.PHONY: clean