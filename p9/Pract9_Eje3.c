#include <16f877.h>
#device adc=8
#fuses HS,NOPROTECT,
#use delay(clock= 20000000)
#use rs232(baud = 9600, xmit = PIN_C6, rcv=PIN_C7)
#org 0x1F00, 0x1FFF void loader16F877(void){}


long int contador;

#int_rtcc
clock_isr(){
      contador++;
      if(contador == 2166){
         printf("LABORATORIO DE MICROCOMPUTADORAS");
         delay_ms(3000);
         contador = 0;
      }
}


void main(){
float a;
int conv;
contador = 0;
set_timer0(0);
setup_counters(RTCC_INTERNAL,RTCC_DIV_256);
setup_port_a(ALL_ANALOG);
setup_adc(ADC_CLOCK_INTERNAL);
set_adc_channel(a);
delay_us(20);
enable_interrupts(GLOBAL);
enable_interrupts(INT_RTCC);

while(1){
      a= input_a();
      conv = read_adc();
      output_b(conv);
      printf("%X ,%u, %2.2f  \n",conv, conv, conv/51.00);
   }
}
