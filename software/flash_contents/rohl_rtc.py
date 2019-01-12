import machine
import _thread
import time

rtc_addr = 0x68
rtc = 0

def start():
	rtc = rohl_rtc_()


class rohl_rtc_:
	def __init__(self):
		self.scl_pin = machine.Pin(26)
		self.sda_pin = machine.Pin(27)
		self.i2c = machine.I2C(sda=self.sda_pin, scl=self.scl_pin)
		self.sec = 0
		self.min = 0
		self.hour = 0
		self.day_of_week = 0
		_thread.start_new_thread(self.thread, ())
		
	def decode (self, bcd):
		v10 = bcd >> 4
		v = bcd & 0xF
		return v10 * 10 + v
		
	def encode (self, val):
		v10, v = divmod(val, 10)
		return (v10 << 4) + v
		
	def decode_hour (self, val):
		h = (val & 0xF) + ((val>>4)&0x1) * 10
		if (val & (1<<6)):
			#12 hour mode
			bit5_weight = 12
		else:
			bit5_weight = 20
		return h + ((val>>5)&0x1) * bit5_weight
			
	
	def thread(self):
		print("RTC thread started")
		while True:
			data = self.i2c.readfrom_mem(rtc_addr, 0, 4)
			self.sec = self.decode(data[0])
			self.min = self.decode(data[1])
			self.hour = self.decode_hour(data[2])
			self.day_of_week =data[3]
			print("sec:" + str (self.sec) + " ")
			print("min:" + str (self.min) + " ")
			print("hour:" + str (self.hour) + " ")
			print("day_of_week:" + str (self.day_of_week) + "\n")
			time.sleep(1)
		