;
; AssemblerApplication2.asm
;
; Created: 12/02/2024 11:33:23 p. m.
; Author : DoniMaki
;Program to generate 4 frequencies
;programming with two inputs
;using internal Timer16
;
.def in1=r16
.def in2=r17
.def freq_1=r18
.def freq_2=r19
.def freq_3=r20
.def freq_4=r21

;init code segment
.cseg
.org 0x00
	;init stack in1
	ldi in1, high(RAMEND)
	out SPH,in1
	ldi in1,low(RAMEND)
	out SPL,in1
	;init stack in2
	ldi in1, high(RAMEND)
	out SPH,in2
	ldi in1,low(RAMEND)
	out SPL,in2

	;sbi DDRB,PB5 ; PB5 ->output
	ldi in1,0b00100000
	out DDRB,in1

	;Init Timer16 (datasheet pag.143)
	ldi in1,1 << CS12 | 1 << CS10 ;Prescaler=1024
	out TCCR1C, in1
