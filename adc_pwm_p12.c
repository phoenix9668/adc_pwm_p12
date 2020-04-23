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
	if(adnum > 204)//9V
	{GPIO2=1;}
	else
	{GPIO2=0;}

	Delay(2);//2ms
	adnum=Get_Ad();

	// stage one 15.2ms
	if(adnum > 204 && adnum <= 286)
	{GPIO2=1;}
	else if(adnum > 286 && adnum <= 450)////[(1.4V~2.2V)/5V]*1023  Vin = 13V~20V
	{
		Time2_Config();
		PWM_Open();
		PR2 = 249;//stage one 250us
		if(adnum <= 310)
		{CCPR1L = 190;}
		else if(adnum > 310 && adnum <= 333)
		{CCPR1L = 180;}
		else if(adnum > 333 && adnum <= 356)
		{CCPR1L = 170;}
		else if(adnum > 356 && adnum <= 380)
		{CCPR1L = 160;}
		else if(adnum > 380 && adnum <= 403)
		{CCPR1L = 150;}
		else if(adnum > 403 && adnum <= 426)
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
	if(adnum > 286 && adnum <= 450)
	{
		PR2 = 50;//stage2 50us
		if(adnum <= 310)
		{CCPR1L = 25;}
		else if(adnum > 310 && adnum <= 333)
		{CCPR1L = 23;}
		else if(adnum > 333 && adnum <= 356)
		{CCPR1L = 21;}
		else if(adnum > 356 && adnum <= 380)
		{CCPR1L = 20;}
		else if(adnum > 380 && adnum <= 403)
		{CCPR1L = 19;}
		else if(adnum > 403 && adnum <= 426)
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
	if(adnum > 204 && adnum <= 286)
	{
		Time2_Config();
		PWM_Open();
	}

	while(1)
	{
		adnum=Get_Ad();
		if(adnum > 204 && adnum <= 286)//[(1V~1.4V)/5V]*1023  Vin = 9V~13V
		{
			PR2 = 50;//50us
			if(adnum <= 224)
			{CCPR1L = 13;}
			else if(adnum > 224 && adnum <= 244)
			{CCPR1L = 12;}
			else if(adnum > 244 && adnum <= 264)
			{CCPR1L = 11;}
			else
			{CCPR1L = 10;}
		}
		else if(adnum > 286 && adnum <= 450)//[(1.4V~2.2V)/5V]*1023  Vin = 13V~20V
		{
			PR2 = 50;//stage2 50us
			if(adnum <= 368)
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