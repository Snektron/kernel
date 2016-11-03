logStrF:
	call logStr
	jp logFlush
	
logStr:
    push af
    push hl
.loop:
        ld a, (hl)
        or a
        jp z, .exit
        out (PORT_LOG_OUT), a
        inc hl
        jp .loop
.exit:
    pop af
    pop hl
    ret

logChrF:
    out (PORT_LOG_OUT), a
    
logFlush:
    push af
        ld a, 0
        out (PORT_LOG_OUT), a
    pop af
	ret
	
; log value of a in hex
logA:
    push af
    push bc
    push de
    push hl
        ld d, 0
        ld b, a
        ld a, '0'
        out (PORT_LOG_OUT), a
        ld a, 'x'
        out (PORT_LOG_OUT), a
        
        ld a, b
        and 0xF0
        rlca \ rlca \ rlca \ rlca
        ld hl, hex_table
        ld e, a
        add hl, de
        ld a, (hl)
        out (PORT_LOG_OUT), a
        ld a, b
        and 0x0F
        ld hl, hex_table
        ld e, a
        add hl, de
        ld a, (hl)
        out (PORT_LOG_OUT), a
    pop hl
    pop de
    pop bc
    pop af
	ret

hex_table:
	.db "0123456789ABCDEF"