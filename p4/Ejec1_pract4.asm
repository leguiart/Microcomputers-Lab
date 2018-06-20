processor 16f877
include<p16f877.inc>


	org 00h
    goto inicio
	org 05h
inicio:
	clrf PORTA
	clrf PORTB
	bsf STATUS, 5
	bcf STATUS, 6
	movlw 07H
	movwf ADCON1
	movlw B'00000000'
	movwf TRISB
	movlw B'00111111'
	movwf TRISA
	bcf STATUS,5
ciclo:
	btfsc PORTA, 4
	goto cuatro
	btfsc PORTA,3
	goto tres
	btfsc PORTA,2
	goto dos
	btfsc PORTA,1
	goto uno
	goto cero

cuatro:
	movlw B'00001100'
	movwf PORTB;
	goto ciclo
tres:
	movlw B'00001000'
	movwf PORTB;
	goto ciclo
dos:
	movlw B'00000011'
	movwf PORTB;
	goto ciclo
uno:
	movlw B'00000010'
	movwf PORTB;
	goto ciclo
cero:
	movlw B'00000000'
	movwf PORTB;
	goto ciclo
end
