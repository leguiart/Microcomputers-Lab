	processor 16f877
	include <p16f877.inc>
	
	REG equ H'44'
	org 00h
	goto inicio
	org 05h
inicio:
		clrf PORTA
		bsf STATUS,RP0
		movlw H'00'; ADCON1= 00h -> analogico
		movwf ADCON1
		movlw B'11111111'
		movwf TRISA
		movlw B'00000000'
		movwf TRISB
		bcf STATUS,RP0
		movlw B'11000001'; Configuracion de lectura de entrada digital
		movwf ADCON0
loop:
		bsf ADCON0,2; inicia conversion
		call retardo; retardo de 20mseg
		btfsc ADCON0,2	; verifica si ya acabo la conversion
		goto loop
		movf ADRESH, W ; parte alta de los 10 bits
		sublw B'01010100'
		btfsc STATUS,C
		goto unTercio 
		sublw B'10101000'
		btfsc STATUS,C
		goto dosTercio
		goto completo
		goto loop
unTercio:
		movlw H'01'
		movwf TRISB
		goto loop
dosTercio:
		movlw H'02'
		movwf TRISB
		goto loop
completo:
		movlw H'04'
		movwf TRISB
		goto loop
retardo:
		movlw 0x30
		movwf REG
loop2:
		decfsz REG
		goto loop2
		return
end
