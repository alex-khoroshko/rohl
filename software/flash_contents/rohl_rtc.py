import machine
import _thread
import time

rtc_addr = 0x68
time_values = {"hour":0, 
	"minutes":0,
	"secs":0, 
	"day_of_week":0}

class rohl_rtc_:
	def __init__(self):
		self.scl_pin = machine.Pin(26)
		self.sda_pin = machine.Pin(27)
		self.i2c = machine.I2C(sda=self.sda_pin, scl=self.scl_pin)
		_thread.start_new_thread(self.thread, ())
		
	def decode (self, val):
		v10 = val >> 4
		v = val & 0xF
		return v10 * 10 + v
		
	def encode (self, val):
		v10, v = divmod(val, 10)
		return bytearray([(v10 << 4) + v])
		
	def decode_hour (self, val):
		h = (val & 0xF) + ((val>>4)&0x1) * 10
		if (val & (1<<6)):
			#12 hour mode
			bit5_weight = 12
		else:
			bit5_weight = 20
		return h + ((val>>5)&0x1) * bit5_weight
		
	def encode_hour (self, val):
		v10, v = divmod(val, 10)
		#set bit 6 to 0 - select 24h mode
		return bytearray([(v10 << 4) + v])
			
	def set_time (self,h,m,s,dov):
		self.i2c.writeto_mem(rtc_addr, 0x0, self.encode(s))
		self.i2c.writeto_mem(rtc_addr, 0x1, self.encode(m))
		self.i2c.writeto_mem(rtc_addr, 0x2, self.encode_hour(h))
		self.i2c.writeto_mem(rtc_addr, 0x3, self.encode(dov))
		
	def thread(self):
		print("RTC thread started")
		while True:
			data = self.i2c.readfrom_mem(rtc_addr, 0, 4)
			time_values["secs"] = self.decode(data[0])
			time_values["minutes"] = self.decode(data[1])
			time_values["hour"] = self.decode_hour(data[2])
			time_values["day_of_week"] = data[3]
			#print(time_values)
			time.sleep(0.5)
		
		
rtc = rohl_rtc_()