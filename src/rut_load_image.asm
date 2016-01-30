; load picture routine
; it will load the img data with the label 'pictureN'
load_image      ldx #$00
draw            lda #$20
                sta $0400,x
                sta $0500,x
                sta $0600,x
                sta $06e8,x
                lda picture0,x
                sta $d800,x
                lda picture1,x
                sta $d900,x
                lda picture2,x
                sta $da00,x
                lda picture3,x
                sta $db00,x
                inx
                bne draw
                rts
