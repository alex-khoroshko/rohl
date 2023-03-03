from machine import Pin, PWM

pwm1 = PWM(Pin(18), freq=1000, duty=0)
pwm2 = PWM(Pin(19), freq=1000, duty=0)
pwm3 = PWM(Pin(21), freq=1000, duty=0)
pwm4 = PWM(Pin(22), freq=1000, duty=0)
pwm5 = PWM(Pin(23), freq=1000, duty=0)

def set (ch, val):
	val = int(val*10.23)
	if (ch==0):
		pwm1.duty(val)
	elif (ch==1):
		pwm2.duty(val)
	elif (ch==2):
		pwm3.duty(val)
	elif (ch==3):
		pwm4.duty(val)
		pwm5.duty(val)
	elif (ch==4):
		pwm5.duty(val)
		pwm4.duty(val)
