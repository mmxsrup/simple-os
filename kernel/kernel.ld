ENTRY(kernel_main)
SECTIONS
{
	. = 0x100000;

    .text :
    {
        _text_start = .;
        *(.text)
        _text_end = .;
    }

    .rodata :
    {
        _rodata_start = .;
        *(.rodata)
        _rodata_end = .;
    }

    .data :
    {
        _data_start = .;
        *(.data)
        _data_end = .;
    }

    . = ALIGN(4096);

    .bss :
    {
        _bss_start = .;
        *(.bss)
        _bss_end = .;
    }
 }