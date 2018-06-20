processor 16f877     ;Procesador a utilizar
include<p16f877.inc> ;Incluir libreria
contador equ h'20'
valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 30h
cte2 equ 50h
cte3 equ 60h

org 0           ;Vector de RESET
goto inicio
org 5

inicio: bsf STATUS, 5
		bcf STATUS, 6
		movlw h'0' ;pasando 0 a W
		movwf TRISB ;pasando W a TRISB, configurando al puerto B como salida
		bcf STATUS,5 ; regresando al banco 0
		clrf PORTB ; limpiando lo que haya en PORTB
		movlw h'0'
		movwf h'30'
loop1:  movlw b'00000000'
		movwf PORTB
loop2:
		movlw h'30'
		movwf PORTB
		call retardo
		incf h'30', b'00000001'
		btfsc STATUS, C
		goto loop1
		goto loop2
		
		
retardo movlw cte1
	    movwf valor1
tres 	movlw cte2
		movwf valor2
dos 	movlw cte3
		movwf valor3
uno 	decfsz valor3
		goto uno
		decfsz valor2
		goto dos
		decfsz valor1
		goto tres
		return
		END