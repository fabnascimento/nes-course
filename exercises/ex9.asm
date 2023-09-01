; Exercise 8:
; Your goal in this exercise is to create a simple loop that goes from 1 to 10. If possible,
; try using the CMP instruction. This instruction that can be used to compare the value of 
; the accumulator with a certain literal number. Once the comparison is done, the processor
; flags will be set (zero if the compared values are eqaul, non-zero if different).

; Adds the iNES header
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A,$02,$01,0,0,0,0,0,0,0,0,0,0

.segment "CODE"
.org $8000

Reset:
    lda #1     ; Initialize the A register with dec 1

Loop:
    ; TODO:
    clc
    adc #1      ; Increment A
    cmp #10     ; Compare the value in A with the decimal value 10
    bne Loop    ; Branch back to "Loop" if the comparison was not equals to zero

NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ