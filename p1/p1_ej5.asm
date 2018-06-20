processor 16f877
include <p16f877.inc>
K equ H'41'; numero menor
org 0
goto inicio
inicio:
		org 5
		movlw 0x20; W = 20
		movwf FSR; FSR = W =20
		movf INDF, W; W = [FSR] = INDF
		movwf K; K=W
evalua:
		btfsc FSR,6 ; FSR[6] = 0? 
		goto inicio		
		movf K,W ; W = K
		subwf INDF,Q ; Q=INDF-W en complemento a 2
		btfsc STATUS, C; C=0? es negativo?		
		goto conserva ;resultado positivo de la operación subwf
		goto cambia	;resultado negativo de la operación subwf
cambia:
		movf INDF,W; W = INDF
		movwf K; K= número menor = W
		incf FSR ; FSR + 1
		goto evalua
conserva:
		incf FSR ; FSR +1
		goto evalua		
end
