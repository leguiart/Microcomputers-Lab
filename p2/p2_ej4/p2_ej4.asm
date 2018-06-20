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

inicio: bsf STATUS,5 ; BIT5=1
		bcf STATUS,6 ; BIT6=0 moviendonos al banco 1
		movlw h'0' ;pasando 0 a W
		movwf TRISB ;pasando W a TRISB, configurando al puerto B como salida
		bcf STATUS,5 ; regresando al banco 0
		clrf PORTB ; limpiando lo que haya en PORTB
loop2: movlw h'0' ;coloca cero en W
	   movwf PORTB ;Todos los bits de PORTB en cero
	   bsf PORTB,0 ;Prende el bit 0 de PORTB
	   movlw h'80' ;Pasa un 80h a W
	   movwf h'20' ;Pasa el 80h en W a la localidad 20h

loop1: movlw h'20';pasa a W lo que hay en 20h
	   movwf PORTB; pasa lo que hay en W a PORTB
	   rrf h'20',1 ;rotamiento de un bit a la derecha
	   call retardo ;retardo para observar el cambio
	   btfss h'20',0 
	   goto loop1 ;Si el bit 0 esta apagado ir a loop1
	   goto loop2 ;Si el bit 1 esta prendido ir a loop2

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
		



