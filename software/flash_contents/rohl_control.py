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
				print (params["ch"])
				n = int(params["ch"])
				print ("channel is " + str(n))
				
				if n >= self.ch_num:
					raise
				
				brt = params["val"]
				self.brightness[n] = brt
				print ("set brightness value " + str(brt))
				return True
			except Exception as e: 
				print(e)
				return False
				
		return False