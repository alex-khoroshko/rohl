class rohl_control:
	def __init__(self, ch_num):
		self.ch_num = ch_num
		self.brightness = [0.0] * ch_num
		
	def process_request(self, request):
		print("got request\n")
		print(request)
		try:
			param_str = request.readline().split("?")[1]
			print ("separated parameters: \n")
			print (param_str)
			params = dict(item.split("=") for item in param_str.split("&"))
			print ("parameters dictionary: \n")
			print (param_str)
		except:
			return;
			
		if not "cmd" in params:
			return;
			
		if params["cmd"] == "set_brightn":
			print ("set_brightn command\n")
			try:
				n = params["ch"]
				
				if n >= self.ch_num:
					raise
				print ("channel is " + n)
				brt = float(params["val"])
				self.brightness[n] = brt
				print ("set brightness value" + brt)
			except:
				return
				
				
				
			
	def bad_request (self, resp):
		
		
		