processor 16f877
include <p16f877.inc>

org 0
goto inicio
org 5
inicio:
	bsf STATUS,RP0
	movlw H'07'
	movwf ADCON1
	movlw B'11111111'
	movwf TRISA
	movlw B'00000000'
	movwf TRISB
	bcf STATUS,RP0
	clrf PORTA
	clrf PORTB
ciclo:
	movf PORTA, W
	andlw B'0000011'
	addwf PCL
	goto UNO
	goto DOS
	goto TRES
	goto CUATRO
	goto ciclo

UNO:
	movlw b'00001110'
	movwf PORTB
	goto ciclo
DOS:
	movlw b'00001010'
	movwf PORTB
	goto ciclo
TRES:
	movlw b'00001011'
	movwf PORTB
	goto ciclo
CUATRO:
	movlw b'00000000'
	movwf PORTB
	goto ciclo


end

