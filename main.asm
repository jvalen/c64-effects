        !cpu 6502
        !to "build/demo.prg",cbm

        ; Allow us to run the program just launching 'RUN'
        * = $0801
        !byte $0d,$08,$dc,$07,$9e,$20,$34,$39
        !byte $31,$35,$32,$00,$00,$00
        * = $c000

        jsr init_screen
        jsr sid_init
        jsr load_image

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

        jsr sid_play
        inc $d020
        jsr show_img

        jmp $ea81

; load source
!source "src/constants.asm"

!source "src/rut_clear_screen.asm"
!source "src/rut_load_image.asm"
!source "src/rut_show_image.asm"

!source "src/data_img_rclogo.asm"

!source "src/load_res.asm"
