import socket 
import rohl_control

#4 channels
rohl_ctl = rohl_control.ctl(4)
debug = True

#TODO: all conn actions should be in try block (connection can be closed)

def send_file (conn, fi):
	with open(fi, 'r') as html:
		conn.send(html.read())
		
def send_file_200 (conn, fi):
	conn.sendall(bytearray('HTTP/1.1 200 OK\r\nConnection: close\r\nServer: ROHL\r\nContent-Type: text/html\r\n\r\n'))
	send_file (conn, fi)
	
def send_file_css (conn, fi):
	conn.sendall(bytearray('HTTP/1.1 200 OK\r\nConnection: close\r\nServer: ROHL\r\nContent-Type: text/css\r\n\r\n'))
	send_file (conn, fi)
	
def send_file_js (conn, fi):
	conn.sendall(bytearray('HTTP/1.1 200 OK\r\nConnection: close\r\nServer: ROHL\r\nContent-Type: application/javascript\r\n\r\n'))
	send_file (conn, fi)

def send_file_400 (conn):
	conn.sendall(bytearray('HTTP/1.1 400 Bad Request\r\nConnection: close\r\nServer: ROHL\r\nContent-Type: text/html\r\n\r\n'))
	send_file (conn, "400.htm")
	
def process_string_purified (conn, req_string_purified):
	#check if options, preceded with "?" symbol are present
	if "?" in req_string_purified:
		#split by "?" symbol. Left part - file name, right - parameters
		#limit number of splits to 1, which results in exactly two substrings
		#in example case file_str="test.js", param_str="a=b&c=d"
		file_str, param_str = req_string_purified.split("?",1)
		print ("param string: '" + param_str + "'\n")
		
		#output 400 error if there are parameters, but no equal signs
		if not "=" in param_str:
			send_file_400(conn)
			return
		
		#OK, equal symbol present. Check if there is only one parameter by absence of & symbol
		if not "&" in param_str:
			params = dict([param_str.split("=",1)])
		else:
			params = dict(item.split("=") for item in param_str.split("&"))
		print ("parameters dictionary: ")
		print (params)
	else:
		file_str = req_string_purified
		
	print ("file string: '" + file_str + "'\n")
	if (file_str=="control.htm"):
		if not rohl_ctl.process_request(params):
			send_file_200 (conn, "400.htm")
	elif ".css" in file_str:
		send_file_css (conn, file_str)
	elif ".js" in file_str:
		send_file_js (conn, file_str)
	else:
		send_file_200 (conn, file_str)

def server_start ():
	print("web_server start")

	#Setup Socket WebServer
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.bind(('', 80))
	s.listen(5)
	while True:
		conn, addr = s.accept()
		print("Got a connection from %s" % str(addr))
		request = conn.recv(1024)

		try:
			#separate first line of request
			#example result: GET /test.js?a=b&c=d HTTP/1.1\r
			first_str = str(request).split("\\n",1)[0]
			if debug:
				print("first_str: \n" + first_str + "\n")
			
			#split line by slashes, results in "test.js?a=b&c=d HTTP"
			req_string = first_str.split("/")[1]
			if debug:
				print("request part of first string with trash: \n" + req_string + "\n")
				
			#cut "HTTP" from the end by splitting on space symbol
			req_string_purified = req_string.split(" ")[0]
			if debug:
				print("request part of first string: \n" + req_string_purified + "\n")
				
			#if request is root page ("/" only) we'll get empty req_string_purified here.
			if not req_string_purified:
				if debug:
					print("slash only request detected. sending index.htm\n")
				send_file_200 (conn, "index.htm")
			else:
				process_string_purified(conn, req_string_purified)

				
		except:
			send_file_400 (conn)
			
		
		#conn.sendall('\n')
		conn.close()
		print("Connection wth %s closed" % str(addr))