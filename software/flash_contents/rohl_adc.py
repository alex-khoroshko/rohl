from machine import ADC
import math

Rpu = 100000
R0	= 10000
#T0 is converted to Kelvins 
T0	= 25 + 273.15
B	= 3435
coeff_11db = 3.5481

#to reach 3.3v range ADC has 11db attenuation mode. We'll use that.
thermist_board = ADC(Pin(35))
thermist_board.atten(ADC.ATTN_11DB) 

thermist_led = ADC(Pin(34))
thermist_led.atten(ADC.ATTN_11DB) 

#here voltage is in volts
def v_to_t (voltage):
	#divider formula: V = Vin*R/(Rpu+R) -> V*(Rpu+R) = Vin*R -> 
	#Vin*R - V*R = V*Rpu -> R*(Vin-V) = V*Rpu -> R = V*Rpu/(Vin-V)
	R = voltage*Rpu/(voltage - 3.3)
	
	#from wikipedia - 1/T = 1/T0 + (1/B)*ln(R/R0), here T and T0 - absolute temperatures!
	rev_t = 1/T0 + (1/B) * math.log(R/R0)
	return (1/rev_t) - 273.15

def adc_to_t (adc_val):
	v = adc_val * coeff_11db / 4095.0
	#protection to avoid problems when calculating temperature.
	if (v>3.3):
		v = 3.3
	return v_to_t (v)
	

def get ():
	t_b = adc_to_t(thermist_board.read())
	t_led = adc_to_t(thermist_led.read())
	return {t_b, t_led}