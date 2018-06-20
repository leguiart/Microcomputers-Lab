processor 16f877
include <p16f877.inc>


tempo equ h'40'
valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 20h
cte2 equ 50h
cte3 equ 60h


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
	movf PORTA,W ; W = PORTA
	XORLW H'00'
	btfsc STATUS, Z
	goto op0
	movf PORTA,W ; W = PORTA
	XORLW H'01'
	btfsc STATUS, Z
	goto op1
	movf PORTA,W ; W = PORTA
	XORLW H'02'
	btfsc STATUS, Z
	goto op2
	movf PORTA,W ; W = PORTA
	XORLW H'03'
	btfsc STATUS, Z
	goto op3
	movf PORTA,W ; W = PORTA
	XORLW H'04'
	btfsc STATUS, Z
	goto op4
	movf PORTA,W ; W = PORTA
	XORLW H'05'
	btfsc STATUS, Z
	goto op5
	clrf PORTA
	goto ciclo
op0:
	movlw h'00'
	movwf PORTB
	goto ciclo
op1:
	movlw h'FF'
	movwf PORTB
	goto ciclo
op2:
	movlw h'00' ; W = 0x00
	movwf PORTB ; no se prende ningun led
	call retardo
	goto izquierda
izquierda:
	rlf W ; desplazamiento de Carry a la izquierda
	btfsc W,7 ; (el carry no esta en el bit 7)
	goto ciclo ; En caso contrario
	movwf PORTB; PORTB = W -> se prende el led donde este el carry
	call retardo
	goto izquierda ; regresa al ciclo de desplazamiento a la izquierda
op3:
	movlw h'80';
	movwf PORTB; se prende el bit 7
	call retardo
	goto derecha
derecha:
	rrf W; desplazamiento del carry a la derecha
	btfsc W,0	; (el carry no esta en el bit 0)
	goto ciclo ; En caso contrario
	movwf PORTB; se prende el led donde este el carry
	call retardo
	goto derecha ; regresa al ciclo derecha
op4:
	movlw h'80' 
	movwf PORTB; se prende el bit 7
	call retardo
	goto sig
sig:
	btfsc W,0 ; el carry no esta en el bit 0
	goto sag ; en caso contrario
	rrf W; desplazamiento a la derecha
	movwf PORTB 
	call retardo
	goto sig
sag:
	btfsc W,7 ; el carry no esta en el bit 7
	goto ciclo ; en caso contrario
	rlf W; desplazamiento a la izquierda
	movwf PORTB
	call retardo
	goto sag
op5:
	movlw h'00'
	movwf PORTB
	call retardo
	movlw h'FF'
	movwf PORTB
	call retardo
	goto ciclo

retardo:
	movlw cte1
	movwf valor1
tres	movlw cte2
		movwf valor2
dos		movlw cte3
		movwf valor3
uno		decfsz valor3
		goto uno
		decfsz valor2
		goto dos
		decfsz valor1
		goto tres
		return
end