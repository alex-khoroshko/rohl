class ctl:
	def __init__(self, ch_num, debug=False):
		self.ch_num = ch_num
		self.brightness = [0.0] * ch_num
		
	def process_request(self, params):
		if not "cmd" in params:
			return False
			
		if params["cmd"] == "set_brightn":
			print ("set_brightn command\n")
			try:
				n = params["ch"]
				
				if n >= self.ch_num:
					raise
				print ("channel is " + n)
				brt = float(params["val"])
				self.brightness[n] = brt
				print ("set brightness value " + brt)
				return True
			except:
				return False
				
		return False