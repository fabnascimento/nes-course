; Exercise 1:
; Your goal here is to simply load the processor registers A, X, and Y with some values

; Adds the iNES header
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A,$02,$01,0,0,0,0,0,0,0,0,0,0

.segment "CODE"
.org $8000

Reset:
    ; TODO:
    ; Load the A register with the liberal Hex value $82
    LDA #$82
    ; Load the X regsiter with the literal decimal 82
    LDX #82
    ; Load the Y register with the value that is inside memory pos $82
    LDY $82
    
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ