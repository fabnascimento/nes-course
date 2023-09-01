; Exercise 5:
; The ADC and SBC instructions can also be userd with different addressing modes.
; The 4th exercise used ADC with immediate mode (adding a literal value directly into the acc),
; but we can also ask ADC to add va value from a (zero-page) memory pos into the acc

; Adds the iNES header
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A,$02,$01,0,0,0,0,0,0,0,0,0,0

.segment "CODE"
.org $8000

Reset:
    ; TODO:
    
    lda #$A         ; Load the A register with the hex $A
    ldx #%1010      ; Load the X register with the binary %1010

    sta $80         ; Store the value in the A register into (zero page) mem address $80
    stx $81         ; Store the value in the X register into (zero page) mem address $81

    lda #10         ; Load A register with the decimal 10
    clc             ; Clears carry flag
    adc $80         ; Add to A the value inside RAM address $80
    adc $81         ; Add to A the value inside RAM address $81
    
    ; A should contain (#10 + $A + %1010) = #30 ($1E)

    sta $82         ; Store the value of A into RAM pos $82
    
NMI:
    rti

IRQ:
    rti

.segment "VECTORS"
.org $FFFA
.word NMI
.word Reset
.word IRQ