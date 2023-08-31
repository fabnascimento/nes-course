;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; The iNES header (contains a total of 16 bytes with the flags)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.segment "HEADER"
.org $7FF0
.byte $4E,$45,$53,$1A       ; 4 bytes with the chars 'N', 'E', 'S', '\n'
.byte $02                   ; How many 16KB of PRG-ROM we'll use (32KB)
.byte $01                   ; How many 8KB of CHR-ROM we'll use (8KB)
.byte %00000000             ; Horz mirrorring, no battery, mapper 0
.byte %00000000             ; mapper 0, playchoice
.byte $00                   ; No PRG-RAM if the cartridge has RAM
.byte $00                   ; NTSC TV Format
.byte $00                   ; No PGR-RAM
.byte $00,$00,$00,$00,$00   ; Unused padding to complete 16bytes of the header
