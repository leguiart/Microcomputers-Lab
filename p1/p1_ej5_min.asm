;Programa que encuentra el numero menor de un conjunto
;de datos ubicados entre las localidades 20h a 40h
;mostrar el valor en la direccion 41h
processor 16f877
include <p16f877.inc>

AUX equ H'41'

org 0
goto inicio

org 5
inicio:
	MOVLW H'20' ;direccion inicial cargada en W
	MOVWF FSR   ;carga en FSR la direccion contenida en W
	goto MAYOR
	
ETI1:
	INCF FSR ;incrementa apuntador
	MOVF INDF, W ;mueve a W el contenido del registro apuntado
	SUBWF AUX,W ;resta a AUX el valor del registro apuntado
	btfsc STATUS, C; compara si AUX es mayor que el dato apuntado
	goto MAYOR ; Si, AUX es mayor igual
	goto SALTO; no, AUX es menor
		
MAYOR:
	MOVF INDF, W ;mueve a W el contenido del registro apuntado
	MOVWF AUX ;carga en AUX el contenido de W

SALTO:
	btfss FSR,6   ;El bit 6 de FSR esta prendido?
	GOTO ETI1     ;No, borra el siguiente
	GOTO inicio
	END
		
		
