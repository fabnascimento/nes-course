; Exercise 7:
; This exercise covers the increment and decrement using zero-page addressing mode.
; The zero-page addressing mode helps us directly increment and decrement values
; inside memory positions. The zero-page in the 6502 are addresses between 0 and 255.
; These addresses are special for the 6502 prcoessor because we can store them using
; only 1 byte (8bits), which also means they can be performed relatively fast by the CPU.

; Adds the iNES header
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A,$02,$01,0,0,0,0,0,0,0,0,0,0

.segment "CODE"
.org $8000

Reset:
    ; TODO:
    
    lda #10     ; Load the A register with the decimal 10
    sta $80     ; Store the value from A into memory pos $80

    inc $80     ; Increment the value inside a (zero-page) memory position $80
    dec $80     ; Decrement the value inside a (zero-page) memory position $80
    
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ