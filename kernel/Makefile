TARGET = kernel.img

CC = gcc
CFLAGS = -Wall -Wextra -fno-builtin
CFLAGS += -fno-common -nostdlib -nostdinc -nostartfiles -nodefaultlibs 
CFLAGS += -m32
CFLAGS += -mno-red-zone -ffreestanding -fno-stack-protector
LD = ld
LDFLAGS = -T kernel.ld
LDFLAGS += -m elf_i386

objs = main.o

all: $(objs)
	$(LD) $(LDFLAGS) $(objs) -o $(TARGET)
	# ld -m elf_i386 -o $(TARGET)

%.o : %.c Makefile
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf *.o *.img

.PHONY: clean