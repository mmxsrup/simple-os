TARGET = loader.img

NASM = nasm

include = print.s \
			disk_load.s \
			gdt.s \
			switch_to_pmod.s \
			enable_a20.s

$(TARGET): loader.s $(include) Makefile
	$(NASM) loader.s -o $(TARGET)

clean:
	rm -rf $(TARGET)

.PHONY: clean