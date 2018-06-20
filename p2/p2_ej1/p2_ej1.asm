processor 16f877 ;indicar la version del procesador a utilizar
include<p16f877.inc> ;indicar la libreria del procesador
contador equ h'20'
valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 20h
cte2 equ 50h
cte3 equ 60h
org 0 ;carga al vector reset la direccion de inicio
goto inicio
org 5
inicio  ;direccion de inicio del programa
		bsf STATUS,5  ;prender el bit 5 de STATUS R0
		BCF STATUS,6 ;apagar el bit 6 de STATUS R1, Con esto paso al banco 1
		MOVLW H'0' ;Mover al registro de trabajo un 0
		MOVWF TRISB ;Mover a TRISB	el cero de W para modificar al puerto B como salida
		BCF STATUS,5 ;Regresa al banco 0
		clrf PORTB ; Limpiar lo que haya en PORTB

loop2 bsf PORTB,0 ; Prender el bit 0 de PORTB
	  call retardo ;retardo para observar el cambio
	  bcf PORTB,0 ; Apagar el bit 0 de PORTB
	  call retardo ;retardo para observar el cambio
	  goto loop2 ; Repite
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