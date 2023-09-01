; Exercise 4:
; This execise is about adding and subrtacting values
; Adding and subtracting are math operations that are done by the ALU
; Since the ALU can only manipulate valies from the (A)ccumulator
; all there additions and subtractions must be performed with the values in the A register

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
    LDA #100    ; Load the A register with the literal decimal 100
    
    CLC         ; when we do a fresh addition we need to make sure that the carry is cleared
    ADC #5      ; Add the decimal value 5 to the accumulator

    SEC
    SBC #10     ; Subtract the decimal value 10 from the acc
    ; Register A should containt 95 or $5F
    
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ