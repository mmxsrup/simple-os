TARGET = kernel.img
LDSCRIPT = kernel.ld

CC = gcc
CFLAGS = -Wall -Wextra -fno-builtin
CFLAGS += -fno-common -nostdlib -nostdinc -nostartfiles -nodefaultlibs 
CFLAGS += -m32
CFLAGS += -mno-red-zone -ffreestanding -fno-stack-protector -fno-pie
LD = ld
LDFLAGS = -T $(LDSCRIPT) --oformat binary
LDFLAGS += -m elf_i386

objs = main.o

all: $(objs) $(LDSCRIPT)
	$(LD) $(LDFLAGS) $(objs) -o $(TARGET)

%.o : %.c Makefile
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf *.o *.img

.PHONY: clean