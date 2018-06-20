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
	andlw B'00000111'
	addwf PCL
	goto UNO
	goto DOS
	goto TRES
	goto CUATRO
	goto CINCO
	goto SEIS
	goto SIETE
	goto OCHO

UNO:
	movlw b'00000000'
	movwf PORTB
	goto ciclo
DOS:
	movlw b'00000001'
	movwf PORTB
	goto ciclo
TRES:
	movlw b'00000010'
	movwf PORTB
	goto ciclo
CUATRO:
	movlw b'00000011'
	movwf PORTB
	goto ciclo
CINCO:
	movlw b'00000100'
	movwf PORTB
	goto ciclo
SEIS:
	movlw b'00000101'
	movwf PORTB
	goto ciclo
SIETE:
	movlw b'00000110'
	movwf PORTB
	goto ciclo
OCHO:
	movlw b'00000111'
	movwf PORTB
	goto ciclo
end

