#include <16f877.h>
#fuses HS,NOPROTECT,
#use delay(clock=20000000)
#use rs232(baud=9600, xmit=PIN_C6, rcv=PIN_C7)
#org 0x1F00, 0x1FFF void loader16F877(void) {}
void main(){
   char a;
   int ciclo;
     while(1){
      printf("/nIngresa un numero del 0 al 5");
      a = getchar();
      printf("/nTu numero es: ");
      putchar(a);
      switch(a){
         case '0':
            output_b(0x00);
         break;
         case '1':
             output_b(0xFF);
         break;
         case '2':
            output_b(0x01);
            delay_ms(500);
            for(ciclo=1;ciclo<255;ciclo*=2){
               output_b(ciclo);
               delay_ms(500);
            }
         break;
         case '3':
            for(ciclo=128;ciclo>1;ciclo/=2){
               output_b(ciclo);
               delay_ms(500);
            }
               output_b(0x01);
         break;
         case '4':
            output_b(0x80);
            delay_ms(500);
            for(ciclo=128;ciclo>1;ciclo/=2){
               output_b(ciclo);
               delay_ms(500);
            }
            output_b(0x01);
            delay_ms(500);
            for(ciclo=1;ciclo<255;ciclo*=2){
               output_b(ciclo);
               delay_ms(500);
            }
         break;
         default:
            output_b(0x00);
            delay_ms(500);
            output_b(0xFF);     
         ;
      }
   }
}
