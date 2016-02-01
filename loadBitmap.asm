        !cpu 6502
        !to "build/load_bitmap.prg",cbm

        ; Allow us to run the program just launching 'RUN'
        * = $0801
        !byte $0d,$08,$dc,$07,$9e,$20,$34,$39
        !byte $31,$35,$32,$00,$00,$00
        * = $c000

        jsr init_screen

        jsr loadbitmap

        ; Disable interrupt
        sei

        ldy #$7f
        sty $dc0d
        sty $dd0d
        lda $dc0d
        lda $dd0d

        lda #$01
        sta $d01a

        lda $d011
        and #$7f
        sta $d011

        lda #<irq
        ldx #>irq
        sta $314
        stx $315

        lda #$00
        sta $d012

        cli
        jmp *

; custom interrupt routine
irq     dec $d019

        inc $d020 ; Flash the boarder

        jmp $ea81


        * = $2000                              ; bitmap data address
        !bin "res/bitmap/tentacles.map"        ; bitmap data file
        * = $3F40                              ; bitmap characters address
        !bin "res/bitmap/tentacles.scr"        ; bitmap characters file
        * = $4328                              ; bitmap color address
        !bin "res/bitmap/tentacles.col"        ; bitmap color file

; load source
!source "src/rut_clear_screen.asm"
!source "src/rut_load_bitmap.asm"
