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
	movf PORTA,W
	ANDLW b'00000111'
	ADDWF PCL,1
	goto cero
	goto uno
	goto dos
	goto tres
	goto cuatro
	goto ciclo
	goto ciclo
	goto ciclo


cuatro:
	movlw B'00001011'
	movwf PORTB;
	goto ciclo
tres:
	movlw B'00001110'
	movwf PORTB;
	goto ciclo
dos:
	movlw B'00001010'
	movwf PORTB;
	goto ciclo
uno:
	movlw B'00001111'
	movwf PORTB;
	goto ciclo
cero:
	movlw B'00000000'
	movwf PORTB;
	goto ciclo
end
