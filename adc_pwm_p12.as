opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 6738"

opt pagewidth 120

	opt pm

	processor	12F683
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 4 "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	dw 0x3F34 ;#
	FNCALL	_main,_Init
	FNCALL	_main,_ADC_Init
	FNCALL	_main,_Get_Ad
	FNCALL	_main,_Delay
	FNCALL	_main,_Time2_Config
	FNCALL	_main,_PWM_Open
	FNROOT	_main
	global	_ADCON0
psect	text75,local,class=CODE,delta=2
global __ptext75
__ptext75:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	21
	global	_CCPR1L
_CCPR1L	set	19
	global	_T2CON
_T2CON	set	18
	global	_GODONE
_GODONE	set	249
	global	_GPIO2
_GPIO2	set	42
	global	_ADRESL
_ADRESL	set	158
	global	_ANSEL
_ANSEL	set	159
	global	_OSCCON
_OSCCON	set	143
	global	_PR2
_PR2	set	146
	global	_TRISIO2
_TRISIO2	set	1066
	global	_TRISIO4
_TRISIO4	set	1068
	file	"adc_pwm_p12.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Init
?_Init:	; 0 bytes @ 0x0
	global	??_Init
??_Init:	; 0 bytes @ 0x0
	global	?_ADC_Init
?_ADC_Init:	; 0 bytes @ 0x0
	global	??_ADC_Init
??_ADC_Init:	; 0 bytes @ 0x0
	global	?_Delay
?_Delay:	; 0 bytes @ 0x0
	global	?_Time2_Config
?_Time2_Config:	; 0 bytes @ 0x0
	global	??_Time2_Config
??_Time2_Config:	; 0 bytes @ 0x0
	global	?_PWM_Open
?_PWM_Open:	; 0 bytes @ 0x0
	global	??_PWM_Open
??_PWM_Open:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Get_Ad
?_Get_Ad:	; 2 bytes @ 0x0
	global	Delay@x
Delay@x:	; 2 bytes @ 0x0
	ds	2
	global	??_Get_Ad
??_Get_Ad:	; 0 bytes @ 0x2
	global	??_Delay
??_Delay:	; 0 bytes @ 0x2
	global	Delay@a
Delay@a:	; 2 bytes @ 0x2
	ds	1
	global	Get_Ad@adval
Get_Ad@adval:	; 2 bytes @ 0x3
	ds	1
	global	Delay@b
Delay@b:	; 2 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
	global	main@adnum
main@adnum:	; 2 bytes @ 0x6
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8       8
;; BANK0           80      0       0
;; BANK1           32      0       0

;;
;; Pointer list with targets:

;; ?_Get_Ad	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_Delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     975
;;                                              6 COMMON     2     2      0
;;                               _Init
;;                           _ADC_Init
;;                             _Get_Ad
;;                              _Delay
;;                       _Time2_Config
;;                           _PWM_Open
;; ---------------------------------------------------------------------------------
;; (1) _PWM_Open                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Time2_Config                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Delay                                                6     4      2      75
;;                                              0 COMMON     6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _Get_Ad                                               5     3      2      30
;;                                              0 COMMON     5     3      2
;; ---------------------------------------------------------------------------------
;; (1) _ADC_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Init                                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Init
;;   _ADC_Init
;;   _Get_Ad
;;   _Delay
;;   _Time2_Config
;;   _PWM_Open
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      8       8       1       57.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      0       0       4        0.0%
;;BANK1               20      0       0       5        0.0%
;;ABS                  0      0       0       6        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;DATA                 0      0       0       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 19 in file "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adnum           2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Init
;;		_ADC_Init
;;		_Get_Ad
;;		_Delay
;;		_Time2_Config
;;		_PWM_Open
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	line	19
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	22
	
l872:	
;adc_pwm_p12.c: 20: unsigned int adnum;
;adc_pwm_p12.c: 22: Init();
	fcall	_Init
	line	23
;adc_pwm_p12.c: 23: ADC_Init();
	fcall	_ADC_Init
	line	25
	
l874:	
;adc_pwm_p12.c: 25: adnum=Get_Ad();
	fcall	_Get_Ad
	movf	(1+(?_Get_Ad)),w
	movwf	(main@adnum+1)
	movf	(0+(?_Get_Ad)),w
	movwf	(main@adnum)
	line	26
	
l876:	
;adc_pwm_p12.c: 26: if(adnum > 210)
	movlw	high(0D3h)
	subwf	(main@adnum+1),w
	movlw	low(0D3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u41
	goto	u40
u41:
	goto	l367
u40:
	line	27
	
l878:	
;adc_pwm_p12.c: 27: {GPIO2=1;}
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	goto	l880
	line	28
	
l367:	
	line	29
;adc_pwm_p12.c: 28: else
;adc_pwm_p12.c: 29: {GPIO2=0;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	line	31
	
l880:	
;adc_pwm_p12.c: 31: Delay(2);
	movlw	02h
	movwf	(?_Delay)
	clrf	(?_Delay+1)
	fcall	_Delay
	line	32
	
l882:	
;adc_pwm_p12.c: 32: adnum=Get_Ad();
	fcall	_Get_Ad
	movf	(1+(?_Get_Ad)),w
	movwf	(main@adnum+1)
	movf	(0+(?_Get_Ad)),w
	movwf	(main@adnum)
	line	35
	
l884:	
;adc_pwm_p12.c: 35: if(adnum > 210 && adnum <= 310)
	movlw	high(0D3h)
	subwf	(main@adnum+1),w
	movlw	low(0D3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u51
	goto	u50
u51:
	goto	l890
u50:
	
l886:	
	movlw	high(0137h)
	subwf	(main@adnum+1),w
	movlw	low(0137h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u61
	goto	u60
u61:
	goto	l890
u60:
	line	36
	
l888:	
;adc_pwm_p12.c: 36: {GPIO2=1;}
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	goto	l964
	line	37
	
l890:	
;adc_pwm_p12.c: 37: else if(adnum > 310 && adnum <= 450)
	movlw	high(0137h)
	subwf	(main@adnum+1),w
	movlw	low(0137h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u71
	goto	u70
u71:
	goto	l934
u70:
	
l892:	
	movlw	high(01C3h)
	subwf	(main@adnum+1),w
	movlw	low(01C3h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u81
	goto	u80
u81:
	goto	l934
u80:
	line	39
	
l894:	
;adc_pwm_p12.c: 38: {
;adc_pwm_p12.c: 39: Time2_Config();
	fcall	_Time2_Config
	line	40
;adc_pwm_p12.c: 40: PWM_Open();
	fcall	_PWM_Open
	line	41
	
l896:	
;adc_pwm_p12.c: 41: PR2 = 249;
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	42
	
l898:	
;adc_pwm_p12.c: 42: if(adnum <= 330)
	movlw	high(014Bh)
	subwf	(main@adnum+1),w
	movlw	low(014Bh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u91
	goto	u90
u91:
	goto	l902
u90:
	line	43
	
l900:	
;adc_pwm_p12.c: 43: {CCPR1L = 190;}
	movlw	(0BEh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	44
	
l902:	
;adc_pwm_p12.c: 44: else if(adnum > 330 && adnum <= 350)
	movlw	high(014Bh)
	subwf	(main@adnum+1),w
	movlw	low(014Bh)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u101
	goto	u100
u101:
	goto	l908
u100:
	
l904:	
	movlw	high(015Fh)
	subwf	(main@adnum+1),w
	movlw	low(015Fh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u111
	goto	u110
u111:
	goto	l908
u110:
	line	45
	
l906:	
;adc_pwm_p12.c: 45: {CCPR1L = 180;}
	movlw	(0B4h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	46
	
l908:	
;adc_pwm_p12.c: 46: else if(adnum > 350 && adnum <= 370)
	movlw	high(015Fh)
	subwf	(main@adnum+1),w
	movlw	low(015Fh)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u121
	goto	u120
u121:
	goto	l914
u120:
	
l910:	
	movlw	high(0173h)
	subwf	(main@adnum+1),w
	movlw	low(0173h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u131
	goto	u130
u131:
	goto	l914
u130:
	line	47
	
l912:	
;adc_pwm_p12.c: 47: {CCPR1L = 170;}
	movlw	(0AAh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	48
	
l914:	
;adc_pwm_p12.c: 48: else if(adnum > 370 && adnum <= 390)
	movlw	high(0173h)
	subwf	(main@adnum+1),w
	movlw	low(0173h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u141
	goto	u140
u141:
	goto	l920
u140:
	
l916:	
	movlw	high(0187h)
	subwf	(main@adnum+1),w
	movlw	low(0187h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u151
	goto	u150
u151:
	goto	l920
u150:
	line	49
	
l918:	
;adc_pwm_p12.c: 49: {CCPR1L = 160;}
	movlw	(0A0h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	50
	
l920:	
;adc_pwm_p12.c: 50: else if(adnum > 390 && adnum <= 410)
	movlw	high(0187h)
	subwf	(main@adnum+1),w
	movlw	low(0187h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u161
	goto	u160
u161:
	goto	l926
u160:
	
l922:	
	movlw	high(019Bh)
	subwf	(main@adnum+1),w
	movlw	low(019Bh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u171
	goto	u170
u171:
	goto	l926
u170:
	line	51
	
l924:	
;adc_pwm_p12.c: 51: {CCPR1L = 150;}
	movlw	(096h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	52
	
l926:	
;adc_pwm_p12.c: 52: else if(adnum > 410 && adnum <= 430)
	movlw	high(019Bh)
	subwf	(main@adnum+1),w
	movlw	low(019Bh)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u181
	goto	u180
u181:
	goto	l932
u180:
	
l928:	
	movlw	high(01AFh)
	subwf	(main@adnum+1),w
	movlw	low(01AFh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u191
	goto	u190
u191:
	goto	l932
u190:
	line	53
	
l930:	
;adc_pwm_p12.c: 53: {CCPR1L = 140;}
	movlw	(08Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	55
	
l932:	
;adc_pwm_p12.c: 54: else
;adc_pwm_p12.c: 55: {CCPR1L = 130;}
	movlw	(082h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	57
	
l934:	
;adc_pwm_p12.c: 57: else if(adnum > 450)
	movlw	high(01C3h)
	subwf	(main@adnum+1),w
	movlw	low(01C3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u201
	goto	u200
u201:
	goto	l385
u200:
	line	59
	
l936:	
;adc_pwm_p12.c: 58: {
;adc_pwm_p12.c: 59: Time2_Config();
	fcall	_Time2_Config
	line	60
;adc_pwm_p12.c: 60: PWM_Open();
	fcall	_PWM_Open
	line	61
	
l938:	
;adc_pwm_p12.c: 61: PR2 = 249;
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	62
	
l940:	
;adc_pwm_p12.c: 62: if(adnum <= 530)
	movlw	high(0213h)
	subwf	(main@adnum+1),w
	movlw	low(0213h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u211
	goto	u210
u211:
	goto	l944
u210:
	goto	l932
	line	64
	
l944:	
;adc_pwm_p12.c: 64: else if(adnum > 530 && adnum <= 610)
	movlw	high(0213h)
	subwf	(main@adnum+1),w
	movlw	low(0213h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u221
	goto	u220
u221:
	goto	l950
u220:
	
l946:	
	movlw	high(0263h)
	subwf	(main@adnum+1),w
	movlw	low(0263h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u231
	goto	u230
u231:
	goto	l950
u230:
	line	65
	
l948:	
;adc_pwm_p12.c: 65: {CCPR1L = 120;}
	movlw	(078h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	66
	
l950:	
;adc_pwm_p12.c: 66: else if(adnum > 610 && adnum <= 690)
	movlw	high(0263h)
	subwf	(main@adnum+1),w
	movlw	low(0263h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u241
	goto	u240
u241:
	goto	l956
u240:
	
l952:	
	movlw	high(02B3h)
	subwf	(main@adnum+1),w
	movlw	low(02B3h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u251
	goto	u250
u251:
	goto	l956
u250:
	line	67
	
l954:	
;adc_pwm_p12.c: 67: {CCPR1L = 110;}
	movlw	(06Eh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	68
	
l956:	
;adc_pwm_p12.c: 68: else if(adnum > 690 && adnum <= 770)
	movlw	high(02B3h)
	subwf	(main@adnum+1),w
	movlw	low(02B3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u261
	goto	u260
u261:
	goto	l962
u260:
	
l958:	
	movlw	high(0303h)
	subwf	(main@adnum+1),w
	movlw	low(0303h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u271
	goto	u270
u271:
	goto	l962
u270:
	line	69
	
l960:	
;adc_pwm_p12.c: 69: {CCPR1L = 100;}
	movlw	(064h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	71
	
l962:	
;adc_pwm_p12.c: 70: else
;adc_pwm_p12.c: 71: {CCPR1L = 90;}
	movlw	(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l964
	line	73
	
l385:	
	line	74
;adc_pwm_p12.c: 73: else
;adc_pwm_p12.c: 74: {GPIO2=0;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	line	75
	
l964:	
;adc_pwm_p12.c: 75: Delay(15);
	movlw	0Fh
	movwf	(?_Delay)
	clrf	(?_Delay+1)
	fcall	_Delay
	line	78
	
l966:	
;adc_pwm_p12.c: 78: if(adnum > 310 && adnum <= 450)
	movlw	high(0137h)
	subwf	(main@adnum+1),w
	movlw	low(0137h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u281
	goto	u280
u281:
	goto	l1006
u280:
	
l968:	
	movlw	high(01C3h)
	subwf	(main@adnum+1),w
	movlw	low(01C3h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u291
	goto	u290
u291:
	goto	l1006
u290:
	line	80
	
l970:	
;adc_pwm_p12.c: 79: {
;adc_pwm_p12.c: 80: PR2 = 50;
	movlw	(032h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	81
;adc_pwm_p12.c: 81: if(adnum <= 330)
	movlw	high(014Bh)
	subwf	(main@adnum+1),w
	movlw	low(014Bh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u301
	goto	u300
u301:
	goto	l974
u300:
	line	82
	
l972:	
;adc_pwm_p12.c: 82: {CCPR1L = 25;}
	movlw	(019h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	83
	
l974:	
;adc_pwm_p12.c: 83: else if(adnum > 330 && adnum <= 350)
	movlw	high(014Bh)
	subwf	(main@adnum+1),w
	movlw	low(014Bh)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u311
	goto	u310
u311:
	goto	l980
u310:
	
l976:	
	movlw	high(015Fh)
	subwf	(main@adnum+1),w
	movlw	low(015Fh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u321
	goto	u320
u321:
	goto	l980
u320:
	line	84
	
l978:	
;adc_pwm_p12.c: 84: {CCPR1L = 23;}
	movlw	(017h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	85
	
l980:	
;adc_pwm_p12.c: 85: else if(adnum > 350 && adnum <= 370)
	movlw	high(015Fh)
	subwf	(main@adnum+1),w
	movlw	low(015Fh)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u331
	goto	u330
u331:
	goto	l986
u330:
	
l982:	
	movlw	high(0173h)
	subwf	(main@adnum+1),w
	movlw	low(0173h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u341
	goto	u340
u341:
	goto	l986
u340:
	line	86
	
l984:	
;adc_pwm_p12.c: 86: {CCPR1L = 21;}
	movlw	(015h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	87
	
l986:	
;adc_pwm_p12.c: 87: else if(adnum > 370 && adnum <= 390)
	movlw	high(0173h)
	subwf	(main@adnum+1),w
	movlw	low(0173h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u351
	goto	u350
u351:
	goto	l992
u350:
	
l988:	
	movlw	high(0187h)
	subwf	(main@adnum+1),w
	movlw	low(0187h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u361
	goto	u360
u361:
	goto	l992
u360:
	line	88
	
l990:	
;adc_pwm_p12.c: 88: {CCPR1L = 20;}
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	89
	
l992:	
;adc_pwm_p12.c: 89: else if(adnum > 390 && adnum <= 410)
	movlw	high(0187h)
	subwf	(main@adnum+1),w
	movlw	low(0187h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u371
	goto	u370
u371:
	goto	l998
u370:
	
l994:	
	movlw	high(019Bh)
	subwf	(main@adnum+1),w
	movlw	low(019Bh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u381
	goto	u380
u381:
	goto	l998
u380:
	line	90
	
l996:	
;adc_pwm_p12.c: 90: {CCPR1L = 19;}
	movlw	(013h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	91
	
l998:	
;adc_pwm_p12.c: 91: else if(adnum > 410 && adnum <= 430)
	movlw	high(019Bh)
	subwf	(main@adnum+1),w
	movlw	low(019Bh)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u391
	goto	u390
u391:
	goto	l1004
u390:
	
l1000:	
	movlw	high(01AFh)
	subwf	(main@adnum+1),w
	movlw	low(01AFh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u401
	goto	u400
u401:
	goto	l1004
u400:
	line	92
	
l1002:	
;adc_pwm_p12.c: 92: {CCPR1L = 18;}
	movlw	(012h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	94
	
l1004:	
;adc_pwm_p12.c: 93: else
;adc_pwm_p12.c: 94: {CCPR1L = 17;}
	movlw	(011h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	96
	
l1006:	
;adc_pwm_p12.c: 96: else if(adnum > 450)
	movlw	high(01C3h)
	subwf	(main@adnum+1),w
	movlw	low(01C3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u411
	goto	u410
u411:
	goto	l1032
u410:
	line	98
	
l1008:	
;adc_pwm_p12.c: 97: {
;adc_pwm_p12.c: 98: PR2 = 50;
	movlw	(032h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	99
;adc_pwm_p12.c: 99: if(adnum <= 530)
	movlw	high(0213h)
	subwf	(main@adnum+1),w
	movlw	low(0213h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u421
	goto	u420
u421:
	goto	l1012
u420:
	line	100
	
l1010:	
;adc_pwm_p12.c: 100: {CCPR1L = 16;}
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	101
	
l1012:	
;adc_pwm_p12.c: 101: else if(adnum > 530 && adnum <= 610)
	movlw	high(0213h)
	subwf	(main@adnum+1),w
	movlw	low(0213h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l1018
u430:
	
l1014:	
	movlw	high(0263h)
	subwf	(main@adnum+1),w
	movlw	low(0263h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u441
	goto	u440
u441:
	goto	l1018
u440:
	line	102
	
l1016:	
;adc_pwm_p12.c: 102: {CCPR1L = 15;}
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	103
	
l1018:	
;adc_pwm_p12.c: 103: else if(adnum > 610 && adnum <= 690)
	movlw	high(0263h)
	subwf	(main@adnum+1),w
	movlw	low(0263h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u451
	goto	u450
u451:
	goto	l1024
u450:
	
l1020:	
	movlw	high(02B3h)
	subwf	(main@adnum+1),w
	movlw	low(02B3h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u461
	goto	u460
u461:
	goto	l1024
u460:
	line	104
	
l1022:	
;adc_pwm_p12.c: 104: {CCPR1L = 14;}
	movlw	(0Eh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	105
	
l1024:	
;adc_pwm_p12.c: 105: else if(adnum > 690 && adnum <= 770)
	movlw	high(02B3h)
	subwf	(main@adnum+1),w
	movlw	low(02B3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u471
	goto	u470
u471:
	goto	l1030
u470:
	
l1026:	
	movlw	high(0303h)
	subwf	(main@adnum+1),w
	movlw	low(0303h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u481
	goto	u480
u481:
	goto	l1030
u480:
	line	106
	
l1028:	
;adc_pwm_p12.c: 106: {CCPR1L = 13;}
	movlw	(0Dh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1032
	line	108
	
l1030:	
;adc_pwm_p12.c: 107: else
;adc_pwm_p12.c: 108: {CCPR1L = 12;}
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	line	110
	
l1032:	
;adc_pwm_p12.c: 109: }
;adc_pwm_p12.c: 110: Delay(82);
	movlw	052h
	movwf	(?_Delay)
	clrf	(?_Delay+1)
	fcall	_Delay
	line	112
	
l1034:	
;adc_pwm_p12.c: 112: adnum=Get_Ad();
	fcall	_Get_Ad
	movf	(1+(?_Get_Ad)),w
	movwf	(main@adnum+1)
	movf	(0+(?_Get_Ad)),w
	movwf	(main@adnum)
	line	113
	
l1036:	
;adc_pwm_p12.c: 113: if(adnum > 210 && adnum <= 310)
	movlw	high(0D3h)
	subwf	(main@adnum+1),w
	movlw	low(0D3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u491
	goto	u490
u491:
	goto	l1042
u490:
	
l1038:	
	movlw	high(0137h)
	subwf	(main@adnum+1),w
	movlw	low(0137h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u501
	goto	u500
u501:
	goto	l1042
u500:
	line	115
	
l1040:	
;adc_pwm_p12.c: 114: {
;adc_pwm_p12.c: 115: Time2_Config();
	fcall	_Time2_Config
	line	116
;adc_pwm_p12.c: 116: PWM_Open();
	fcall	_PWM_Open
	line	121
	
l1042:	
;adc_pwm_p12.c: 120: {
;adc_pwm_p12.c: 121: adnum=Get_Ad();
	fcall	_Get_Ad
	movf	(1+(?_Get_Ad)),w
	movwf	(main@adnum+1)
	movf	(0+(?_Get_Ad)),w
	movwf	(main@adnum)
	line	122
	
l1044:	
;adc_pwm_p12.c: 122: if(adnum > 210 && adnum <= 310)
	movlw	high(0D3h)
	subwf	(main@adnum+1),w
	movlw	low(0D3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u511
	goto	u510
u511:
	goto	l1066
u510:
	
l1046:	
	movlw	high(0137h)
	subwf	(main@adnum+1),w
	movlw	low(0137h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u521
	goto	u520
u521:
	goto	l1066
u520:
	line	124
	
l1048:	
;adc_pwm_p12.c: 123: {
;adc_pwm_p12.c: 124: PR2 = 50;
	movlw	(032h)
	movwf	(146)^080h	;volatile
	line	125
;adc_pwm_p12.c: 125: if(adnum <= 235)
	movlw	high(0ECh)
	subwf	(main@adnum+1),w
	movlw	low(0ECh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u531
	goto	u530
u531:
	goto	l1052
u530:
	line	126
	
l1050:	
;adc_pwm_p12.c: 126: {CCPR1L = 20;}
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1042
	line	127
	
l1052:	
;adc_pwm_p12.c: 127: else if(adnum > 235 && adnum <= 260)
	movlw	high(0ECh)
	subwf	(main@adnum+1),w
	movlw	low(0ECh)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u541
	goto	u540
u541:
	goto	l1058
u540:
	
l1054:	
	movlw	high(0105h)
	subwf	(main@adnum+1),w
	movlw	low(0105h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u551
	goto	u550
u551:
	goto	l1058
u550:
	line	128
	
l1056:	
;adc_pwm_p12.c: 128: {CCPR1L = 19;}
	movlw	(013h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1042
	line	129
	
l1058:	
;adc_pwm_p12.c: 129: else if(adnum > 260 && adnum <= 285)
	movlw	high(0105h)
	subwf	(main@adnum+1),w
	movlw	low(0105h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u561
	goto	u560
u561:
	goto	l1064
u560:
	
l1060:	
	movlw	high(011Eh)
	subwf	(main@adnum+1),w
	movlw	low(011Eh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u571
	goto	u570
u571:
	goto	l1064
u570:
	line	130
	
l1062:	
;adc_pwm_p12.c: 130: {CCPR1L = 18;}
	movlw	(012h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1042
	line	132
	
l1064:	
;adc_pwm_p12.c: 131: else
;adc_pwm_p12.c: 132: {CCPR1L = 17;}
	movlw	(011h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1042
	line	134
	
l1066:	
;adc_pwm_p12.c: 134: else if(adnum > 310 && adnum <= 450)
	movlw	high(0137h)
	subwf	(main@adnum+1),w
	movlw	low(0137h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u581
	goto	u580
u581:
	goto	l1076
u580:
	
l1068:	
	movlw	high(01C3h)
	subwf	(main@adnum+1),w
	movlw	low(01C3h)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u591
	goto	u590
u591:
	goto	l1076
u590:
	line	136
	
l1070:	
;adc_pwm_p12.c: 135: {
;adc_pwm_p12.c: 136: PR2 = 50;
	movlw	(032h)
	movwf	(146)^080h	;volatile
	line	137
;adc_pwm_p12.c: 137: if(adnum <= 380)
	movlw	high(017Dh)
	subwf	(main@adnum+1),w
	movlw	low(017Dh)
	skipnz
	subwf	(main@adnum),w
	skipnc
	goto	u601
	goto	u600
u601:
	goto	l1074
u600:
	line	138
	
l1072:	
;adc_pwm_p12.c: 138: {CCPR1L = 9;}
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1042
	line	140
	
l1074:	
;adc_pwm_p12.c: 139: else
;adc_pwm_p12.c: 140: {CCPR1L = 8;}
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	goto	l1042
	line	142
	
l1076:	
;adc_pwm_p12.c: 142: else if(adnum > 450)
	movlw	high(01C3h)
	subwf	(main@adnum+1),w
	movlw	low(01C3h)
	skipnz
	subwf	(main@adnum),w
	skipc
	goto	u611
	goto	u610
u611:
	goto	l432
u610:
	line	144
	
l1078:	
;adc_pwm_p12.c: 143: {
;adc_pwm_p12.c: 144: PR2 = 50;
	movlw	(032h)
	movwf	(146)^080h	;volatile
	line	145
;adc_pwm_p12.c: 145: CCPR1L = 7;
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(19)	;volatile
	line	146
;adc_pwm_p12.c: 146: }
	goto	l1042
	line	147
	
l432:	
	line	149
;adc_pwm_p12.c: 147: else
;adc_pwm_p12.c: 148: {
;adc_pwm_p12.c: 149: GPIO2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	goto	l1042
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	152
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_PWM_Open
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:

;; *************** function _PWM_Open *****************
;; Defined at:
;;		line 186 in file "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text76
	file	"D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	line	186
	global	__size_of_PWM_Open
	__size_of_PWM_Open	equ	__end_of_PWM_Open-_PWM_Open
	
_PWM_Open:	
	opt	stack 7
; Regs used in _PWM_Open: [wreg+status,2+status,0]
	line	187
	
l868:	
;adc_pwm_p12.c: 187: CCPR1L = 0x7F;
	movlw	(07Fh)
	movwf	(19)	;volatile
	line	188
	
l870:	
;adc_pwm_p12.c: 188: CCP1CON = CCP1CON | 0x3C;
	movlw	(03Ch)
	iorwf	(21),f	;volatile
	line	189
	
l458:	
	return
	opt stack 0
GLOBAL	__end_of_PWM_Open
	__end_of_PWM_Open:
;; =============== function _PWM_Open ends ============

	signat	_PWM_Open,88
	global	_Time2_Config
psect	text77,local,class=CODE,delta=2
global __ptext77
__ptext77:

;; *************** function _Time2_Config *****************
;; Defined at:
;;		line 192 in file "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text77
	file	"D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	line	192
	global	__size_of_Time2_Config
	__size_of_Time2_Config	equ	__end_of_Time2_Config-_Time2_Config
	
_Time2_Config:	
	opt	stack 7
; Regs used in _Time2_Config: [wreg]
	line	193
	
l866:	
;adc_pwm_p12.c: 193: T2CON = 0x04;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	194
	
l461:	
	return
	opt stack 0
GLOBAL	__end_of_Time2_Config
	__end_of_Time2_Config:
;; =============== function _Time2_Config ends ============

	signat	_Time2_Config,88
	global	_Delay
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:

;; *************** function _Delay *****************
;; Defined at:
;;		line 155 in file "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
;; Parameters:    Size  Location     Type
;;  x               2    0[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  b               2    4[COMMON] unsigned int 
;;  a               2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         4       0       0
;;      Temps:          0       0       0
;;      Totals:         6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text78
	file	"D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	line	155
	global	__size_of_Delay
	__size_of_Delay	equ	__end_of_Delay-_Delay
	
_Delay:	
	opt	stack 7
; Regs used in _Delay: [wreg+status,2+status,0]
	line	157
	
l846:	
;adc_pwm_p12.c: 156: unsigned int a,b;
;adc_pwm_p12.c: 157: for(a=x;a>0;a--)
	movf	(Delay@x+1),w
	movwf	(Delay@a+1)
	movf	(Delay@x),w
	movwf	(Delay@a)
	
l848:	
	movf	((Delay@a+1)),w
	iorwf	((Delay@a)),w
	skipz
	goto	u21
	goto	u20
u21:
	goto	l852
u20:
	goto	l443
	line	158
	
l852:	
;adc_pwm_p12.c: 158: for(b=110;b>0;b--);
	movlw	06Eh
	movwf	(Delay@b)
	clrf	(Delay@b+1)
	
l858:	
	movlw	low(01h)
	subwf	(Delay@b),f
	movlw	high(01h)
	skipc
	decf	(Delay@b+1),f
	subwf	(Delay@b+1),f
	
l860:	
	movf	((Delay@b+1)),w
	iorwf	((Delay@b)),w
	skipz
	goto	u31
	goto	u30
u31:
	goto	l858
u30:
	line	157
	
l862:	
	movlw	low(01h)
	subwf	(Delay@a),f
	movlw	high(01h)
	skipc
	decf	(Delay@a+1),f
	subwf	(Delay@a+1),f
	goto	l848
	line	159
	
l443:	
	return
	opt stack 0
GLOBAL	__end_of_Delay
	__end_of_Delay:
;; =============== function _Delay ends ============

	signat	_Delay,4216
	global	_Get_Ad
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:

;; *************** function _Get_Ad *****************
;; Defined at:
;;		line 176 in file "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  adval           2    3[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 15F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          1       0       0
;;      Totals:         5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text79
	file	"D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	line	176
	global	__size_of_Get_Ad
	__size_of_Get_Ad	equ	__end_of_Get_Ad-_Get_Ad
	
_Get_Ad:	
	opt	stack 7
; Regs used in _Get_Ad: [wreg]
	line	178
	
l840:	
;adc_pwm_p12.c: 177: unsigned int adval;
;adc_pwm_p12.c: 178: GODONE=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	179
;adc_pwm_p12.c: 179: while(GODONE);
	
l452:	
	btfsc	(249/8),(249)&7
	goto	u11
	goto	u10
u11:
	goto	l452
u10:
	line	180
	
l842:	
;adc_pwm_p12.c: 180: adval=ADRESH;
	movf	(30),w	;volatile
	movwf	(Get_Ad@adval)
	clrf	(Get_Ad@adval+1)
	line	181
;adc_pwm_p12.c: 181: adval=adval<<8|ADRESL;
	movf	(Get_Ad@adval),w
	movwf	(??_Get_Ad+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(Get_Ad@adval)
	movf	(??_Get_Ad+0)+0,w
	movwf	(Get_Ad@adval+1)
	line	182
;adc_pwm_p12.c: 182: return(adval);
	movf	(Get_Ad@adval+1),w
	movwf	(?_Get_Ad+1)
	movf	(Get_Ad@adval),w
	movwf	(?_Get_Ad)
	line	183
	
l455:	
	return
	opt stack 0
GLOBAL	__end_of_Get_Ad
	__end_of_Get_Ad:
;; =============== function _Get_Ad ends ============

	signat	_Get_Ad,90
	global	_ADC_Init
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:

;; *************** function _ADC_Init *****************
;; Defined at:
;;		line 170 in file "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text80
	file	"D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	line	170
	global	__size_of_ADC_Init
	__size_of_ADC_Init	equ	__end_of_ADC_Init-_ADC_Init
	
_ADC_Init:	
	opt	stack 7
; Regs used in _ADC_Init: [wreg]
	line	171
	
l838:	
;adc_pwm_p12.c: 171: ADCON0=0x8D;
	movlw	(08Dh)
	movwf	(31)	;volatile
	line	172
;adc_pwm_p12.c: 172: ANSEL=0x18;
	movlw	(018h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	173
	
l449:	
	return
	opt stack 0
GLOBAL	__end_of_ADC_Init
	__end_of_ADC_Init:
;; =============== function _ADC_Init ends ============

	signat	_ADC_Init,88
	global	_Init
psect	text81,local,class=CODE,delta=2
global __ptext81
__ptext81:

;; *************** function _Init *****************
;; Defined at:
;;		line 162 in file "D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text81
	file	"D:\GitHub\adc_pwm_p12\adc_pwm_p12.c"
	line	162
	global	__size_of_Init
	__size_of_Init	equ	__end_of_Init-_Init
	
_Init:	
	opt	stack 7
; Regs used in _Init: [wreg]
	line	163
	
l830:	
;adc_pwm_p12.c: 163: OSCCON=0x60;
	movlw	(060h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	164
	
l832:	
;adc_pwm_p12.c: 164: TRISIO4=1;
	bsf	(1068/8)^080h,(1068)&7
	line	165
	
l834:	
;adc_pwm_p12.c: 165: TRISIO2=0;
	bcf	(1066/8)^080h,(1066)&7
	line	166
	
l836:	
;adc_pwm_p12.c: 166: GPIO2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(42/8),(42)&7
	line	167
	
l446:	
	return
	opt stack 0
GLOBAL	__end_of_Init
	__end_of_Init:
;; =============== function _Init ends ============

	signat	_Init,88
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
