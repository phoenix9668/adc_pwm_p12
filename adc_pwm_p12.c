#include<pic.h>
#define uchar unsigned char
#define uint unsigned int
__CONFIG(0x3F34);
//WDTE_OFF:disable watchdog timer
//LVP_OFF:low voltage programming disabled
//INTOSCIO oscillator: I/O function on GP4/OSC2/CLKOUT pin, I/O function on GP5/OSC1/CLKIN
//PWRTDIS:disable power up timer
//BOREN_OFF:disable brown out reset

void Delay(uint x);
void Init(void);
void ADC_Init(void);
uint Get_Ad(void);
void PWM_Open(void);
void Time2_Config(void);

void main()
{
	uint adnum;

	Init();
	ADC_Init();

	adnum=Get_Ad();
	if(adnum > 210)//8.6V
	{GPIO2=1;}
	else
	{GPIO2=0;}

	Delay(2);//2ms
	adnum=Get_Ad();

	// stage one 15.2ms
	if(adnum > 210 && adnum <= 310)
	{GPIO2=1;}
	else if(adnum > 310 && adnum <= 450)//[(1.4V~2.2V)/5V]*1023  Vin = 12.4V~20V
	{
		Time2_Config();
		PWM_Open();
		PR2 = 249;//stage one 250us
		if(adnum <= 330)
		{CCPR1L = 190;}
		else if(adnum > 330 && adnum <= 350)
		{CCPR1L = 180;}
		else if(adnum > 350 && adnum <= 370)
		{CCPR1L = 170;}
		else if(adnum > 370 && adnum <= 390)
		{CCPR1L = 160;}
		else if(adnum > 390 && adnum <= 410)
		{CCPR1L = 150;}
		else if(adnum > 410 && adnum <= 430)
		{CCPR1L = 140;}
		else
		{CCPR1L = 130;}
	}
	else if(adnum > 450)//[(2.2V~4V)/5V]*1023  Vin = 20V~36V
	{
		Time2_Config();
		PWM_Open();
		PR2 = 249;//stage one 250us
		if(adnum <= 530)
		{CCPR1L = 130;}
		else if(adnum > 530 && adnum <= 610)
		{CCPR1L = 120;}
		else if(adnum > 610 && adnum <= 690)
		{CCPR1L = 110;}
		else if(adnum > 690 && adnum <= 770)
		{CCPR1L = 100;}
		else
		{CCPR1L = 90;}
	}
	else
	{GPIO2=0;}
	Delay(15);//15ms

	// stage two 82ms
	if(adnum > 310 && adnum <= 450)
	{
		PR2 = 50;//stage2 50us
		if(adnum <= 330)
		{CCPR1L = 25;}
		else if(adnum > 330 && adnum <= 350)
		{CCPR1L = 23;}
		else if(adnum > 350 && adnum <= 370)
		{CCPR1L = 21;}
		else if(adnum > 370 && adnum <= 390)
		{CCPR1L = 20;}
		else if(adnum > 390 && adnum <= 410)
		{CCPR1L = 19;}
		else if(adnum > 410 && adnum <= 430)
		{CCPR1L = 18;}
		else
		{CCPR1L = 17;}
	}
	else if(adnum > 450)
	{
		PR2 = 50;//stage2 50us
		if(adnum <= 530)
		{CCPR1L = 16;}
		else if(adnum > 530 && adnum <= 610)
		{CCPR1L = 15;}
		else if(adnum > 610 && adnum <= 690)
		{CCPR1L = 14;}
		else if(adnum > 690 && adnum <= 770)
		{CCPR1L = 13;}
		else
		{CCPR1L = 12;}
	}
	Delay(82);//82ms

	adnum=Get_Ad();
	if(adnum > 210 && adnum <= 310)
	{
		Time2_Config();
		PWM_Open();
	}

	while(1)
	{
		adnum=Get_Ad();
		if(adnum > 210 && adnum <= 310)//[(1V~1.4V)/5V]*1023  Vin = 8.6V~12.4V
		{
			PR2 = 50;//50us
			if(adnum <= 235)
			{CCPR1L = 20;}
			else if(adnum > 235 && adnum <= 260)
			{CCPR1L = 19;}
			else if(adnum > 260 && adnum <= 285)
			{CCPR1L = 18;}
			else
			{CCPR1L = 17;}
		}
		else if(adnum > 310 && adnum <= 450)//[(1.4V~2.2V)/5V]*1023  Vin = 12.4V~20V
		{
			PR2 = 50;//stage2 50us
			if(adnum <= 380)
			{CCPR1L = 9;}
			else
			{CCPR1L = 8;}
		}
		else if(adnum > 450)//[(2.2V~4V)/5V]*1023  Vin = 20V~36V
		{
			PR2 = 50;//stage2 50us
			CCPR1L = 7;
		}
		else
		{
			GPIO2=0;
		}
	}
}

void Delay(uint x)
{
	uint a,b;
	for(a=x;a>0;a--)
		for(b=110;b>0;b--);
}

void Init(void)
{
	OSCCON=0x60;//4MHz
	TRISIO4=1;
	TRISIO2=0;
	GPIO2=0;
}

void ADC_Init(void)
{
	ADCON0=0x8D;//10001101
	ANSEL=0x18;//00011000
}

uint Get_Ad(void)
{
	uint adval;
	GODONE=1;
	while(GODONE);
	adval=ADRESH;
	adval=adval<<8|ADRESL;
	return(adval);
}

void PWM_Open(void)
{
    CCPR1L = 0x7F;
    CCP1CON = CCP1CON | 0x3C;
}

void Time2_Config(void)
{
    T2CON = 0x04;//Prescaler1:1
}