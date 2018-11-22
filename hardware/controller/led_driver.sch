EESchema Schematic File Version 4
LIBS:controller-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:CP C21
U 1 1 5BF939D5
P 4300 4250
AR Path="/5BF937F4/5BF939D5" Ref="C21"  Part="1" 
AR Path="/5BF9993D/5BF939D5" Ref="C24"  Part="1" 
AR Path="/5BF9A82B/5BF939D5" Ref="C27"  Part="1" 
AR Path="/5BF9B719/5BF939D5" Ref="C30"  Part="1" 
AR Path="/5BF9C747/5BF939D5" Ref="C33"  Part="1" 
F 0 "C21" H 4418 4296 50  0000 L CNN
F 1 "100u" H 4418 4205 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_10x7.9" H 4338 4100 50  0001 C CNN
F 3 "~" H 4300 4250 50  0001 C CNN
	1    4300 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C22
U 1 1 5BF93A79
P 4700 4250
AR Path="/5BF937F4/5BF93A79" Ref="C22"  Part="1" 
AR Path="/5BF9993D/5BF93A79" Ref="C25"  Part="1" 
AR Path="/5BF9A82B/5BF93A79" Ref="C28"  Part="1" 
AR Path="/5BF9B719/5BF93A79" Ref="C31"  Part="1" 
AR Path="/5BF9C747/5BF93A79" Ref="C34"  Part="1" 
F 0 "C22" H 4815 4296 50  0000 L CNN
F 1 "0.1u" H 4815 4205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4738 4100 50  0001 C CNN
F 3 "~" H 4700 4250 50  0001 C CNN
	1    4700 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:L L3
U 1 1 5BF93BA6
P 6950 4100
AR Path="/5BF937F4/5BF93BA6" Ref="L3"  Part="1" 
AR Path="/5BF9993D/5BF93BA6" Ref="L4"  Part="1" 
AR Path="/5BF9A82B/5BF93BA6" Ref="L5"  Part="1" 
AR Path="/5BF9B719/5BF93BA6" Ref="L6"  Part="1" 
AR Path="/5BF9C747/5BF93BA6" Ref="L7"  Part="1" 
F 0 "L3" V 7140 4100 50  0000 C CNN
F 1 "47u" V 7049 4100 50  0000 C CNN
F 2 "led:L_12x12mm_H6mm" H 6950 4100 50  0001 C CNN
F 3 "https://katalog.we-online.com/pbs/datasheet/744771147.pdf" H 6950 4100 50  0001 C CNN
	1    6950 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C23
U 1 1 5BF93C4A
P 7350 3550
AR Path="/5BF937F4/5BF93C4A" Ref="C23"  Part="1" 
AR Path="/5BF9993D/5BF93C4A" Ref="C26"  Part="1" 
AR Path="/5BF9A82B/5BF93C4A" Ref="C29"  Part="1" 
AR Path="/5BF9B719/5BF93C4A" Ref="C32"  Part="1" 
AR Path="/5BF9C747/5BF93C4A" Ref="C35"  Part="1" 
F 0 "C23" H 7465 3596 50  0000 L CNN
F 1 "1u" H 7465 3505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7388 3400 50  0001 C CNN
F 3 "~" H 7350 3550 50  0001 C CNN
	1    7350 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D7
U 1 1 5BF93D75
P 5950 3450
AR Path="/5BF937F4/5BF93D75" Ref="D7"  Part="1" 
AR Path="/5BF9993D/5BF93D75" Ref="D8"  Part="1" 
AR Path="/5BF9A82B/5BF93D75" Ref="D9"  Part="1" 
AR Path="/5BF9B719/5BF93D75" Ref="D10"  Part="1" 
AR Path="/5BF9C747/5BF93D75" Ref="D11"  Part="1" 
F 0 "D7" H 5950 3666 50  0000 C CNN
F 1 "SS14FL" H 5950 3575 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 5950 3450 50  0001 C CNN
F 3 "~" H 5950 3450 50  0001 C CNN
	1    5950 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 5BF93DE8
P 4900 3400
AR Path="/5BF937F4/5BF93DE8" Ref="R16"  Part="1" 
AR Path="/5BF9993D/5BF93DE8" Ref="R18"  Part="1" 
AR Path="/5BF9A82B/5BF93DE8" Ref="R20"  Part="1" 
AR Path="/5BF9B719/5BF93DE8" Ref="R22"  Part="1" 
AR Path="/5BF9C747/5BF93DE8" Ref="R24"  Part="1" 
F 0 "R16" H 4970 3446 50  0000 L CNN
F 1 "0.11" H 4970 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4830 3400 50  0001 C CNN
F 3 "~" H 4900 3400 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
Text HLabel 4100 3900 0    50   Input ~ 0
LED_Vin
Text HLabel 7900 3150 2    50   Input ~ 0
LED+
Text HLabel 7900 4100 2    50   Input ~ 0
LED-
Text HLabel 4100 4550 0    50   Input ~ 0
LED_GND
Text HLabel 5300 4100 0    50   Input ~ 0
LED_ADJ
Connection ~ 4300 3900
Wire Wire Line
	4300 3900 4100 3900
Wire Wire Line
	4300 3900 4300 4100
Wire Wire Line
	4100 4550 4300 4550
Wire Wire Line
	5900 4550 5900 4300
Wire Wire Line
	4300 4400 4300 4550
Connection ~ 4300 4550
Wire Wire Line
	4900 3550 4900 3900
Connection ~ 4900 3900
Wire Wire Line
	4900 3250 4900 3150
Wire Wire Line
	4900 3150 6500 3150
Wire Wire Line
	6500 3150 6500 3900
Wire Wire Line
	6500 3900 6300 3900
Wire Wire Line
	5800 3450 5300 3450
Wire Wire Line
	5300 3450 5300 3900
Connection ~ 5300 3900
Wire Wire Line
	5300 3900 4900 3900
Wire Wire Line
	5300 3900 5550 3900
$Comp
L Driver_LED:IS31LT3360 U6
U 1 1 5BF938D1
P 5900 4100
AR Path="/5BF937F4/5BF938D1" Ref="U6"  Part="1" 
AR Path="/5BF9993D/5BF938D1" Ref="U7"  Part="1" 
AR Path="/5BF9A82B/5BF938D1" Ref="U8"  Part="1" 
AR Path="/5BF9B719/5BF938D1" Ref="U9"  Part="1" 
AR Path="/5BF9C747/5BF938D1" Ref="U10"  Part="1" 
F 0 "U6" H 5925 4567 50  0000 C CNN
F 1 "IS31LT3360" H 5925 4476 50  0000 C CNN
F 2 "led:SOT-89-5" H 5950 3950 50  0001 L CIN
F 3 "http://www.issi.com/WW/pdf/31LT3360.pdf" H 5900 3600 50  0001 C CNN
	1    5900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 3450 6600 3450
Wire Wire Line
	6600 3450 6600 4100
Wire Wire Line
	6600 4100 6300 4100
Connection ~ 6600 4100
Wire Wire Line
	7350 3700 7350 4100
Connection ~ 7350 4100
Wire Wire Line
	7350 4100 7900 4100
Wire Wire Line
	7850 3150 7350 3150
Connection ~ 6500 3150
Wire Wire Line
	7350 3400 7350 3150
Connection ~ 7350 3150
Wire Wire Line
	7350 3150 6500 3150
Wire Wire Line
	7100 4100 7350 4100
Wire Wire Line
	6600 4100 6800 4100
Wire Wire Line
	4300 3900 4700 3900
Wire Wire Line
	4300 4550 4700 4550
Wire Wire Line
	4700 3900 4700 4100
Wire Wire Line
	4700 4400 4700 4550
Connection ~ 4700 3900
Wire Wire Line
	4700 3900 4900 3900
Connection ~ 4700 4550
Wire Wire Line
	4700 4550 5450 4550
$Comp
L Device:R R17
U 1 1 5BF96E51
P 5450 4350
AR Path="/5BF937F4/5BF96E51" Ref="R17"  Part="1" 
AR Path="/5BF9993D/5BF96E51" Ref="R19"  Part="1" 
AR Path="/5BF9A82B/5BF96E51" Ref="R21"  Part="1" 
AR Path="/5BF9B719/5BF96E51" Ref="R23"  Part="1" 
AR Path="/5BF9C747/5BF96E51" Ref="R25"  Part="1" 
F 0 "R17" H 5520 4396 50  0000 L CNN
F 1 "1k" H 5520 4305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5380 4350 50  0001 C CNN
F 3 "~" H 5450 4350 50  0001 C CNN
	1    5450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4100 5450 4100
Wire Wire Line
	5450 4100 5450 4200
Connection ~ 5450 4100
Wire Wire Line
	5450 4100 5550 4100
Wire Wire Line
	5450 4500 5450 4550
Connection ~ 5450 4550
Wire Wire Line
	5450 4550 5900 4550
$EndSCHEMATC
