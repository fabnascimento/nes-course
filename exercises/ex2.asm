; Exercise 2:
; Your goal here is to just store some values into zero-page memory positions.

; Adds the iNES header
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A,$02,$01,0,0,0,0,0,0,0,0,0,0

.segment "CODE"
.org $8000

Reset:
    ldx #$FF    ; Initialize the stack pointer at $01FF (bottom of the stack)
    txs
    lda #0      ; A = 0
    inx         ; increment X from $FF to $0
MemLoop:
    sta $0,x    ; stores 0 at "index" of X
    dex         ; decrement X register, X--, since we start a 0 it will wrap around
                ; jumping to FF
    bne MemLoop ; If x is not zero, we loop back to MemLoop

    ; TODO:
    ; Load the A register with the hex $A
    LDA #$A
    ; Load the X regsiter with the binary %11111111
    LDX #%11111111
    
    STA $80 ; Stores the value in the A register into mem address $80
    STX $81 ; Stores the value in the X register into mem address $81
    
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ