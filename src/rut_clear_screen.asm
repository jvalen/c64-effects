; Clear screen routine
; Will set the screen ram with the ' ' char and color ram with black color
init_screen     ldx #$00
                stx $d021
                stx $d020

clear           lda #$20
                sta $0400,x
                sta $0500,x
                sta $0600,x
                sta $06e8,x
                lda #$00
                sta $d800,x
                sta $d900,x
                sta $da00,x
                sta $dae8,x
                inx
                bne clear

                rts
