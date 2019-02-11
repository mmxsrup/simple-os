TARGET = myos.img
IMGS = $(BOOT)/loader.img $(KERNEL)/kernel.img

BOOT = boot
KERNEL = kernel

all: build

build:
	cd $(BOOT) && make
	cd $(KERNEL) && make
	cat $(IMGS) > $(TARGET)

run:
	qemu-system-i386 -fda $(TARGET)

clean:
	cd $(BOOT) && make clean
	rm -rf $(TARGET)

.PHONY: clean