; Show image routine
; It will change the characters stored in the screen ram with the $e0 char
show_img        lda #$e0
screenram       sta $0400
                inc screenram+1
                bne skip
                inc screenram+2
skip
                rts
