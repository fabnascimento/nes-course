; Exercise 8:
; Your goal here is to create a loop that counts down from 10 to 0.
; You should also fill the memory addresses from $80 to $8A with values from 0 to A.

; Adds the iNES header
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A,$02,$01,0,0,0,0,0,0,0,0,0,0

.segment "CODE"
.org $8000

Reset:
    ldy #10     ; Initialize the Y register with the decimal 10

Loop:
    ; TODO:
    tya         ; Transfer Y to A
    sta $80,y   ; Store the value in A inside memory pos $80+Y
    dey         ; Decrement Y
    bne Loop    ; Branch back to "Loop" until we are done
    
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ