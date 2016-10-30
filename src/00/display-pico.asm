#ifndef PICO80

color16Supported:
clearColorLcd16:
updateLcd16:
    or 1
    ld a, errUnsupported
    ret

#else
initDisplay:
    ; TODO fancy animation?
    xor a
    out (PORT_SCRN_COL), a
    inc a ; ld a, SRCN_CMD_CLEAR
    out (PORT_SCRN_CMD), a
    dec a ; ld a, SRCN_CMD_SYNC
    out (PORT_SCRN_CMD), a
    ret
    
;; color16Supported [Color]
;;  Sets Z if 16-color mode is supported on this device.
;; Outputs:
;;  A: errUnsupported if 16-color is unsupported
;;  Z: Set if supported, reset if unsupported
color16Supported:
    cp a
    ret
    
;; clearScreen [Color]
;;  Sets all pixels on the internal buffer
;;  to a specified color in 16-color mode.
;; Inputs:
;;  A: Color (0x0-0xF)
clearScreen:
    out (PORT_SCRN_COL), a
    ld a, SRCN_CMD_CLEAR
    out (PORT_SCRN_CMD), a
    ret
    
;; updateScreen [Color]
;;  Copies the internal screen buffer to the screen.
updateScreen:
    ld a, SRCN_CMD_SYNC
    out (PORT_SCRN_CMD), a
    ret

fastCopy: ; Draws a 96x64 monochrome buffer on a color screen
    call hasLcdLock
    ret nz
fastCopy_skipCheck:
    ; Draw from [15, 31] to [111, 95]
    push bc
    push af
    push de
    push hl
        push iy \ pop hl
        ld a, 0xF
        call clearScreen
        ld d, 64
        ld c, PORT_SCRN_X
.loopy:
        ld a, 95
        sub d
        out (PORT_SCRN_Y), a
        
        ld b, 12
        ld e, 15
.loopx:
        ld a, (hl)
        inc hl
        
        ;bit 7
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        ;bit 6
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        ;bit 5
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        ;bit 4
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        ;bit 3
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        ;bit 2
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        ;bit 1
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        ;bit 0
        out (c), e \ inc e
        rla
        jp c, _
        dec c \ out (c), 0 \ inc c
_:
        djnz .loopx
        dec d
        jp nz, .loopy
        call updateScreen
    pop hl
    pop de
    pop af
    pop bc
    ret
#endif
