#include <16f877.h>
#device adc=8
#fuses HS,NOPROTECT,
#use delay(clock= 20000000)
#use rs232(baud = 9600, xmit = PIN_C6, rcv=PIN_C7)
#org 0x1F00, 0x1FFF void loader16F877(void){}

int conv;

void main(){
float a;
setup_port_a(ALL_ANALOG);
setup_adc(ADC_CLOCK_INTERNAL);
set_adc_channel(a);
delay_us(20);
while(1){
   a= input_a();
   conv = read_adc();
   output_b(conv);
   printf("%X ,%u, %2.2f  \n",conv, conv, conv/51.00);
}
}

