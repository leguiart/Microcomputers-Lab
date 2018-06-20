#include <16f877.h>
#fuses HS,NOPROTECT,
#use delay(clock= 20000000)
#use rs232(baud = 9600, xmit = PIN_C6, rcv=PIN_C7)
#org 0x1F00, 0x1FFF void loader16F877(void){}

#int_rb
   port_rb(){
       if(input(PIN_B4)){
         printf("Interrupcion PB4 Activada\n");
       }else printf("Pulso de bajada PB4\n");
       if(input(PIN_B5)){
         printf("Interrupcion PB5 Activada\n");
       }else printf("Pulso de bajada PB5\n");
       if(input(PIN_B6)){
         printf("Interrupcion PB6 Activada\n");
       }else printf("Pulso de bajada PB6\n");
       if(input(PIN_B7)){
         printf("Interrupcion PB7 Activada\n");
       }else printf("Pulso de bajada PB7\n");
  
   }

void main(){
set_timer0(0);
setup_counters(RTCC_INTERNAL,RTCC_DIV_256);
enable_interrupts(GLOBAL);
enable_interrupts(INT_RB);
while(1){}
   
}
