EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L LED D17
U 1 1 5BF1CC73
P 4950 1800
F 0 "D17" H 4950 1900 50  0000 C CNN
F 1 "white" H 4950 1700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4950 1800 50  0001 C CNN
F 3 "" H 4950 1800 50  0000 C CNN
	1    4950 1800
	0    -1   -1   0   
$EndComp
$Comp
L LED D12
U 1 1 5BF1CC7F
P 4650 1800
F 0 "D12" H 4650 1900 50  0000 C CNN
F 1 "blue" H 4650 1700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4650 1800 50  0001 C CNN
F 3 "" H 4650 1800 50  0000 C CNN
	1    4650 1800
	0    -1   -1   0   
$EndComp
$Comp
L LED D22
U 1 1 5BF1CC85
P 5250 1800
F 0 "D22" H 5250 1900 50  0000 C CNN
F 1 "white_warm" H 5250 1700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 5250 1800 50  0001 C CNN
F 3 "" H 5250 1800 50  0000 C CNN
	1    5250 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 3500 4050 3700
Wire Wire Line
	4050 3700 5250 3700
Wire Wire Line
	5250 3700 5250 3500
Wire Wire Line
	4950 3500 4950 3700
Connection ~ 4950 3700
Wire Wire Line
	4650 3500 4650 3700
Connection ~ 4650 3700
Wire Wire Line
	4350 3500 4350 3700
Connection ~ 4350 3700
$Comp
L GND #PWR1
U 1 1 5BF1CDFE
P 4950 3700
F 0 "#PWR1" H 4950 3450 50  0001 C CNN
F 1 "GND" H 4950 3550 50  0000 C CNN
F 2 "" H 4950 3700 50  0000 C CNN
F 3 "" H 4950 3700 50  0000 C CNN
	1    4950 3700
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 5BF1E84F
P 4050 1800
F 0 "D2" H 4050 1900 50  0000 C CNN
F 1 "royal blue" H 4050 1700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4050 1800 50  0001 C CNN
F 3 "" H 4050 1800 50  0000 C CNN
	1    4050 1800
	0    -1   -1   0   
$EndComp
$Comp
L LED D7
U 1 1 5BF1F172
P 4350 1800
F 0 "D7" H 4350 1900 50  0000 C CNN
F 1 "royal blue" H 4350 1700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4350 1800 50  0001 C CNN
F 3 "" H 4350 1800 50  0000 C CNN
	1    4350 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 2000 5250 2100
Wire Wire Line
	4650 2000 4650 2100
Wire Wire Line
	4350 2000 4350 2100
Wire Wire Line
	4950 2000 4950 2100
Wire Wire Line
	4050 2000 4050 2100
$Comp
L LED D18
U 1 1 5BF1FA87
P 4950 2300
F 0 "D18" H 4950 2400 50  0000 C CNN
F 1 "white" H 4950 2200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4950 2300 50  0001 C CNN
F 3 "" H 4950 2300 50  0000 C CNN
	1    4950 2300
	0    -1   -1   0   
$EndComp
$Comp
L LED D13
U 1 1 5BF1FA8D
P 4650 2300
F 0 "D13" H 4650 2400 50  0000 C CNN
F 1 "blue" H 4650 2200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4650 2300 50  0001 C CNN
F 3 "" H 4650 2300 50  0000 C CNN
	1    4650 2300
	0    -1   -1   0   
$EndComp
$Comp
L LED D23
U 1 1 5BF1FA93
P 5250 2300
F 0 "D23" H 5250 2400 50  0000 C CNN
F 1 "white_warm" H 5250 2200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 5250 2300 50  0001 C CNN
F 3 "" H 5250 2300 50  0000 C CNN
	1    5250 2300
	0    -1   -1   0   
$EndComp
$Comp
L LED D3
U 1 1 5BF1FA99
P 4050 2300
F 0 "D3" H 4050 2400 50  0000 C CNN
F 1 "royal blue" H 4050 2200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4050 2300 50  0001 C CNN
F 3 "" H 4050 2300 50  0000 C CNN
	1    4050 2300
	0    -1   -1   0   
$EndComp
$Comp
L LED D8
U 1 1 5BF1FA9F
P 4350 2300
F 0 "D8" H 4350 2400 50  0000 C CNN
F 1 "royal blue" H 4350 2200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4350 2300 50  0001 C CNN
F 3 "" H 4350 2300 50  0000 C CNN
	1    4350 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 2500 5250 2600
Wire Wire Line
	4650 2500 4650 2600
Wire Wire Line
	4350 2500 4350 2600
Wire Wire Line
	4950 2500 4950 2600
Wire Wire Line
	4050 2500 4050 2600
$Comp
L LED D19
U 1 1 5BF1FDDE
P 4950 2800
F 0 "D19" H 4950 2900 50  0000 C CNN
F 1 "white" H 4950 2700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4950 2800 50  0001 C CNN
F 3 "" H 4950 2800 50  0000 C CNN
	1    4950 2800
	0    -1   -1   0   
$EndComp
$Comp
L LED D14
U 1 1 5BF1FDE4
P 4650 2800
F 0 "D14" H 4650 2900 50  0000 C CNN
F 1 "blue" H 4650 2700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4650 2800 50  0001 C CNN
F 3 "" H 4650 2800 50  0000 C CNN
	1    4650 2800
	0    -1   -1   0   
$EndComp
$Comp
L LED D24
U 1 1 5BF1FDEA
P 5250 2800
F 0 "D24" H 5250 2900 50  0000 C CNN
F 1 "white_warm" H 5250 2700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 5250 2800 50  0001 C CNN
F 3 "" H 5250 2800 50  0000 C CNN
	1    5250 2800
	0    -1   -1   0   
$EndComp
$Comp
L LED D4
U 1 1 5BF1FDF0
P 4050 2800
F 0 "D4" H 4050 2900 50  0000 C CNN
F 1 "royal blue" H 4050 2700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4050 2800 50  0001 C CNN
F 3 "" H 4050 2800 50  0000 C CNN
	1    4050 2800
	0    -1   -1   0   
$EndComp
$Comp
L LED D9
U 1 1 5BF1FDF6
P 4350 2800
F 0 "D9" H 4350 2900 50  0000 C CNN
F 1 "royal blue" H 4350 2700 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4350 2800 50  0001 C CNN
F 3 "" H 4350 2800 50  0000 C CNN
	1    4350 2800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 3000 5250 3100
Wire Wire Line
	4650 3000 4650 3100
Wire Wire Line
	4350 3000 4350 3100
Wire Wire Line
	4950 3000 4950 3100
Wire Wire Line
	4050 3000 4050 3100
$Comp
L LED D20
U 1 1 5BF1FE01
P 4950 3300
F 0 "D20" H 4950 3400 50  0000 C CNN
F 1 "white" H 4950 3200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4950 3300 50  0001 C CNN
F 3 "" H 4950 3300 50  0000 C CNN
	1    4950 3300
	0    -1   -1   0   
$EndComp
$Comp
L LED D15
U 1 1 5BF1FE07
P 4650 3300
F 0 "D15" H 4650 3400 50  0000 C CNN
F 1 "blue" H 4650 3200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4650 3300 50  0001 C CNN
F 3 "" H 4650 3300 50  0000 C CNN
	1    4650 3300
	0    -1   -1   0   
$EndComp
$Comp
L LED D25
U 1 1 5BF1FE0D
P 5250 3300
F 0 "D25" H 5250 3400 50  0000 C CNN
F 1 "white_warm" H 5250 3200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 5250 3300 50  0001 C CNN
F 3 "" H 5250 3300 50  0000 C CNN
	1    5250 3300
	0    -1   -1   0   
$EndComp
$Comp
L LED D5
U 1 1 5BF1FE13
P 4050 3300
F 0 "D5" H 4050 3400 50  0000 C CNN
F 1 "royal blue" H 4050 3200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4050 3300 50  0001 C CNN
F 3 "" H 4050 3300 50  0000 C CNN
	1    4050 3300
	0    -1   -1   0   
$EndComp
$Comp
L LED D10
U 1 1 5BF1FE19
P 4350 3300
F 0 "D10" H 4350 3400 50  0000 C CNN
F 1 "royal blue" H 4350 3200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4350 3300 50  0001 C CNN
F 3 "" H 4350 3300 50  0000 C CNN
	1    4350 3300
	0    -1   -1   0   
$EndComp
$Comp
L LED D16
U 1 1 5BF201E0
P 4950 1300
F 0 "D16" H 4950 1400 50  0000 C CNN
F 1 "white" H 4950 1200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4950 1300 50  0001 C CNN
F 3 "" H 4950 1300 50  0000 C CNN
	1    4950 1300
	0    -1   -1   0   
$EndComp
$Comp
L LED D11
U 1 1 5BF201E6
P 4650 1300
F 0 "D11" H 4650 1400 50  0000 C CNN
F 1 "blue" H 4650 1200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4650 1300 50  0001 C CNN
F 3 "" H 4650 1300 50  0000 C CNN
	1    4650 1300
	0    -1   -1   0   
$EndComp
$Comp
L LED D21
U 1 1 5BF201EC
P 5250 1300
F 0 "D21" H 5250 1400 50  0000 C CNN
F 1 "white_warm" H 5250 1200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 5250 1300 50  0001 C CNN
F 3 "" H 5250 1300 50  0000 C CNN
	1    5250 1300
	0    -1   -1   0   
$EndComp
$Comp
L LED D1
U 1 1 5BF201F2
P 4050 1300
F 0 "D1" H 4050 1400 50  0000 C CNN
F 1 "royal blue" H 4050 1200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4050 1300 50  0001 C CNN
F 3 "" H 4050 1300 50  0000 C CNN
	1    4050 1300
	0    -1   -1   0   
$EndComp
$Comp
L LED D6
U 1 1 5BF201F8
P 4350 1300
F 0 "D6" H 4350 1400 50  0000 C CNN
F 1 "royal blue" H 4350 1200 50  0000 C CNN
F 2 "LEDs:LED-XP-G_CREE" H 4350 1300 50  0001 C CNN
F 3 "" H 4350 1300 50  0000 C CNN
	1    4350 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 1500 4050 1600
Wire Wire Line
	4950 1500 4950 1600
Wire Wire Line
	4350 1500 4350 1600
Wire Wire Line
	4650 1500 4650 1600
Wire Wire Line
	5250 1500 5250 1600
$EndSCHEMATC
