processor 16f877     ;Procesador a utilizar
   include<p16f877.inc> ;Incluir libreria
 
J  equ h'20'         ;Reservación de localidades en memoria
K  equ h'21'
R1 equ h'22'
C1 equ h'23'

     org 0           ;Vector de RESET
     goto INICIO
     org 5
 
INICIO:
     movf K,w        ;Carga el contenido de K en W
     addwf J,w       ;Suma W+J y guarda en W
     movwf R1        ;Guarda el contenido de W en R1
     btfss STATUS,DC ;Verifica si hubo medio acarreo
     goto INICIO     ;No, ve a Inicio
     movlw 0x01      ;Si,Carga 0x1 en W
     movwf C1        ;Pon el contenido de W en C1
     goto INICIO     ;Vuelve a iniciar el ciclo
     end             ;Fin de programa
 