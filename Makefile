IMG = $(BOOT)/loader.img

BOOT = boot

all: build

build:
	cd $(BOOT) && make

run:
	qemu-system-i386 -m 4000 -fda $(IMG)

clean:
	cd $(BOOT) && make clean
	rm -rf $(TARGET)

.PHONY: clean