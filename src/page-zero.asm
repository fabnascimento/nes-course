;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The iNES header (contains a total of 16 bytes with the flags)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "HEADER"
.org $7FF0                  ; $7FF0 is 16 bytes before $8000 so it is placing the header
                            ; before the bytes of PRG-ROM

.byte $4E,$45,$53,$1A       ; 4 bytes with the chars 'N', 'E', 'S', '\n'
.byte $02                   ; How many 16KB of PRG-ROM we'll use (32KB)
.byte $01                   ; How many 8KB of CHR-ROM we'll use (8KB)
.byte %00000000             ; Horz mirrorring, no battery, mapper 0
.byte %00000000             ; mapper 0, playchoice
.byte $00                   ; No PRG-RAM if the cartridge has RAM
.byte $00                   ; NTSC TV Format
.byte $00                   ; No PGR-RAM
.byte $00,$00,$00,$00,$00   ; Unused padding to complete 16bytes of the header

.segment "CODE"
.org $8000 ; where the program ROM is mapped

RESET:
    ; TODO what happens when we reset
    sei         ; Disable all IRQ interrupts
    cld         ; Clear decimal mode flag (not supported by NES)
    ldx #$FF    ; Initialize the stack pointer at $01FF (bottom of the stack)
    txs

    lda #0      ; A = 0
    inx         ; increment X from $FF to $0
MemLoop:
    sta $0,x    ; stores 0 at "index" of X
    dex         ; decrement X register, X--, since we start a 0 it will wrap around
                ; jumping to FF
    bne MemLoop ; If x is not zero, we loop back to MemLoop

NMI:            ; NMI Handler'
    rti ; return
IRQ:            ; IRQ handler
    rti ; return


; 6502 processor will always go to $FFFA first and check for
; vectors that are addresses that point to the handlers
.segment "VECTORS"
.org $FFFA
.word NMI   ; address of the NMI handler 16bits
.word RESET ; address of the RESET handler 16bits
.word IRQ   ; address of the IRQ handler 16bits