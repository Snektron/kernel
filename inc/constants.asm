; TI-8x constants
.macro define_mask(name, bitN)
    BIT_name .equ bitN \
    name .equ 1 << bitN
.endmacro

; Port numbers and outputs
    ; bit masks
    PORT_INT_MASK       .equ 3
        define_mask(INT_ON, 0)
        define_mask(INT_TIMER1, 1)
        define_mask(INT_TIMER2, 2)
        define_mask(INT_LINK, 3)
    
    ; read
    ; bit values
    PORT_INT_TRIG       .equ 4
        define_mask(INT_TRIG_ON, 0)
        define_mask(INT_TRIG_TIMER1, 1)
        define_mask(INT_TRIG_TIMER2, 2)
        define_mask(INT_TRIG_ON_HELD, 3)
        define_mask(INT_TRIG_LINK, 4)
        ; 83+ SE/84+ only
        define_mask(INT_TRIG_CRYS1, 5)
        define_mask(INT_TRIG_CRYS2, 6)
        define_mask(INT_TRIG_CRYS3, 7)
    ; write
    ; bit masks
    PORT_MEM_TIMER      .equ 4
        define_mask(MEM_TIMER_MODE1, 0)
        define_mask(MEM_TIMER_SPEED, 1)
        ; 83+ SE/84+ only
        define_mask(MEM_TIMER_BATTERY, 6)
        
        
    PORT_RAM_PAGING     .equ 5
    
    PORT_USB_INT        .equ 0x55
        define_mask(USB_INT_BUS, 0)
        define_mask(USB_INT_UNKNOWN1, 1)
        define_mask(USB_INT_LINE, 2)
        define_mask(USB_INT_VIEWSCREEN_MISS, 3)
        define_mask(USB_INT_PROTOCOL, 4)
        define_mask(USB_INT_UNKNOWN5, 5)
        define_mask(USB_INT_UNKNOWN6, 6)
        define_mask(USB_INT_UNKNOWN7, 7)
        
    PORT_USB_LINE       .equ 0x56
        define_mask(USB_LINE_DPLOW, 0)
        define_mask(USB_LINE_DPHIGH, 1)
        define_mask(USB_LINE_DMLOW, 2)
        define_mask(USB_LINE_DMHIGH, 3)
        define_mask(USB_LINE_IDLOW, 4)
        define_mask(USB_LINE_IDHIGH, 5)
        ; note the order
        define_mask(USB_LINE_VBUSHIGH, 6)
        define_mask(USB_LINE_VBUSLOW, 7)
        
    PORT_USB_LINE_MASK  .equ 0x57
        define_mask(USB_LINE_MASK_DPLOW, 0)
        define_mask(USB_LINE_MASK_DPHIGH, 1)
        define_mask(USB_LINE_MASK_DMLOW, 2)
        define_mask(USB_LINE_MASK_DMHIGH, 3)
        define_mask(USB_LINE_MASK_IDLOW, 4)
        define_mask(USB_LINE_MASK_IDHIGH, 5)
        ; again, note the order
        define_mask(USB_LINE_MASK_VBUSHIGH, 6)
        define_mask(USB_LINE_MASK_VBUSLOW, 7)
        
    PORT_USB_WRPIPE1    .equ 0x82
    
    PORT_USB_WRPIPE2    .equ 0x83
    
    PORT_USB_RDPIPE1    .equ 0x84
    
    PORT_USB_RDPIPE2    .equ 0x85
    
    PORT_USB_MISC_EVENTS .equ 0x86
    
; System constants
    DEFAULT_STACK_SIZE  .equ 20
    MONO_LCD_WIDTH      .equ 96
    MONO_LCD_HEIGHT     .equ 64
    MONO_BUF_SIZE       .equ 0x300
    COLOR_LCD_WIDTH     .equ 320
    COLOR_LCD_HEIGHT    .equ 240
    LEGACY_BG_COLOR     .equ 0x4108

; KFS stuff
    KFS_BLOCK_SIZE      .equ 0x100

    FILE_HANDLE_SIZE    .equ 16

    FILE_FLAGS          .equ 0
    FILE_BUFFER         .equ 1
    FILE_STREAM         .equ 3
    FILE_SECTION_ID     .equ 4
    FILE_FINAL_LENGTH   .equ 6
    FILE_ENTRY_PAGE     .equ 7
    FILE_ENTRY_PTR      .equ 8
    FILE_WORKING_SIZE   .equ 10
    FILE_WRITE_FLAGS    .equ 13
    FILE_PREV_SECTION   .equ 14