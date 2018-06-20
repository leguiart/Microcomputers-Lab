processor 16f877
include <p16f877.inc>

org 0 
goto inicio 
org5
inicio:
	clrf PORTA
	clrf PORTB
	BSF STATUS, RP0
	BCF STATUS, RP1
	movlw 06h
	movwf ADCON1
	movlw B'00111111'
	movwf TRISA
	movlw B'00000000'
	movwf TRISB
	BCF STATUS, RP0
ciclo:
	btfss PORTA, 0
	goto apagar
	goto prender
prender:
	movlw H'FF'
	movwf TRISB
	goto ciclo
apagar:
	movlw H'00'
	movwf TRISB
	goto ciclo
end