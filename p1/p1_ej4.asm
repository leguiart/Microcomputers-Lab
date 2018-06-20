processor 16f877     ;Procesador a utilizar
  include<p16f877.inc> ;Libreria
 
  org 0                ;Vector de RESET
  goto INICIO
  org 5
  
LIMPIA           
       clrf h'20'     ;Limpia la localidad 20h
INICIO
       incf h'20',1   ;Incrementa el valor que haya en 20h
       movlw h'9'     ;Carga en W el valor de 9h
       xorwf h'20',w  ;Realiza XOR  del contenido de W con el
                      ;contenido de 20h 
       btfss STATUS,Z ;Verifica si el resultado de Xor=0 (z=1)
       goto INICIO    ;No,Repite el ciclo
                      ;Si, entocess llegamos a 9
DIEZ
       movlw h'7'     ;Carga en W el valor de 7
       addwf h'20'    ;Suma W+Loc h'20' para obtener el numero
                      ;siguiente para seguir la secuencia de 
                      ;números decimales
INC
       movlw h'20'    ;Carga el valor de 20h en W
       xorwf h'20',w  ;Realiza XOR  del contenido de W con el 
                      ;contenido de 20h
       btfsc STATUS,Z ;Verifica si el resultado de Xor!=0 (z=0)
       goto  LIMPIA   ;NO,entonces llegamos al 20 y vuelve a 
                      ;empezar la cuenta
       incf h'20'     ;Si,incrementa 
       movlw h'19'    ;Carga el valor de 19h en W
       xorwf h'20',w  ;Realiza XOR  del contenido de W con el
                      ;contenido de 20h
       btfsc STATUS,Z ;Verifica si el resultado de Xor!=0 (z=0)
       goto DIEZ      ;No,ve a DIEZ 
       goto INC       ;Si,repite el ciclo
       end