#include "constants.asm"
; Dummy boot page to get emulators to boot the OS
    jr _
    .fill 0x0F - $
#ifdef PICO80
    .db "Pico-80", 0
#else
    .db "Emulated", 0
#endif
_:
#ifndef PICO80
#ifdef TI84p
    in a, (PORT_FLASHRAMSIZE)
    res BIT_FLASHRAMSIZE_FLASHCHIP, a
    out (PORT_FLASHRAMSIZE), a
#else
    in a, (PORT_FLASHRAMSIZE)
    set BIT_FLASHRAMSIZE_FLASHCHIP, a
    out (PORT_FLASHRAMSIZE), a
#endif
#endif
    jp 0x4000
