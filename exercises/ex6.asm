; Exercise 6:
; This exercise covers the increment and decrement instructions on 6502

; Adds the iNES header
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A,$02,$01,0,0,0,0,0,0,0,0,0,0

.segment "CODE"
.org $8000

Reset:
    ; TODO:
    
    lda #1  ; Load the A register with the decimal 1
    ldx #2  ; Load the X register with the decimal 2
    ldy #3  ; Load the Y register with the decimal 3

    inx     ; Increment X
    iny     ; Increment Y
    clc     
    adc #1  ; Increment A

    dex     ; Decrement X
    dey     ; Decrement Y
    sec
    sbc #1  ; Decrement A
    
    ; in the 6502, we can increment both X and Y, but not A.
    ; We can only ADC #1 and SBC #1 from A.
    ; This makes X and Y great choices to control Loops.
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ