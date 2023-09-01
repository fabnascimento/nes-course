; Exercise 3:
; This exercise is about transferring values from registers to other registers.

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
    LDA #15     ; Load the A register wit hthe literal decimal 15

    TAX         ; Transfer the value from A to X
    TAY         ; Transfer the value from A to Y
    TXA         ; Transfer the value from X to A
    TYA         ; Transfer the value from Y to A

    LDX #6      ; Load X with the decimal value 6
    TXA         ; Transfer the value from X to Y therefore we transfer to A first
    TAY         ; And finally from A to Y
    
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ