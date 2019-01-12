#!/usr/bin/python
# -*- coding: <utf-8> -*-

import socket 
import json
import rohl_rtc
import _thread

#4 channels
debug = True
ch_num = 4
brightness = [0.0] * ch_num
ch_cfg = [
	{"color":"white", "name":"Cold white", 	"val":0.0},
	{"color":"white", "name":"Warm white", 	"val":0.0},
	{"color":"white", "name":"Blue", 		"val":0.0},
	{"color":"white", "name":"Royal blue", 	"val":0.0}
]

def send_file (conn, fi):
	with open(fi, 'rb') as html:
		data = html.read()
		conn.sendall(data)
		
def send_file_w_header (conn, fi, cont_type):
	try:
		conn.sendall(('HTTP/1.1 200 OK\r\nConnection: close\r\nServer: ROHL\r\nContent-Type: ' + cont_type + '\r\n\r\n').encode('utf-8'))
		send_file (conn, fi)
	except:
		pass
		
	try:
		conn.close()
	except:
		pass
		
def send_file_200 (conn, fi):
	send_file_w_header (conn, fi, "text/html")
	
def send_file_css (conn, fi):
	send_file_w_header (conn, fi, "text/css")
	
def send_file_js (conn, fi):
	send_file_w_header (conn, fi, "application/javascript")

def send_file_ico (conn, fi):
	send_file_w_header (conn, fi, "image/x-icon")

def send_json_contents (conn, content):
	try:
		conn.sendall(b'HTTP/1.1 200 OK\r\nConnection: close\r\nServer: ROHL\r\nContent-Type: application/json\r\n\r\n')
		conn.sendall(content)
	except:
		pass
		
	try:
		conn.close()
	except:
		pass

def send_file_400 (conn):
	try:
		conn.sendall(b'HTTP/1.1 400 Bad Request\r\nConnection: close\r\nServer: ROHL\r\nContent-Type: text/html\r\n\r\n')
		send_file (conn, "400.htm")
	except:
		pass
		
	try:
		conn.close()
	except:
		pass
	
def process_string_purified (conn, req_string_purified):
	#variable params is used to check, if there were parameters in request. Define in to avoid exceptions
	params = ""

	#check if options, preceded with "?" symbol are present
	if "?" in req_string_purified:
		#split by "?" symbol. Left part - file name, right - parameters
		#limit number of splits to 1, which results in exactly two substrings
		#in example case file_str="test.js", param_str="a=b&c=d"
		file_str, param_str = req_string_purified.split("?",1)
		#print ("param string: '" + param_str + "'\n")
		
		#output 400 error if there are parameters, but no equal signs
		if not "=" in param_str:
			send_file_400(conn)
			return
		
		#OK, equal symbol present. Check if there is only one parameter by absence of & symbol
		if not "&" in param_str:
			params = dict([param_str.split("=",1)])
		else:
			params = dict(item.split("=") for item in param_str.split("&"))
		#print ("parameters dictionary: ")
		#print (params)
	else:
		file_str = req_string_purified
		
	#print ("file string: '" + file_str + "'\n")
	if (file_str=="control.htm"):
		#if parameters are not present - just send confirmation (used for connection check, for example)
		if not params:
			send_file_200 (conn, "200.htm")
			return
		
		#params exist. process them
		if not "cmd" in params:
			send_file_400 (conn, "400.htm")
			return False
			
		if params["cmd"] == "set_brightn":
			#print ("set_brightn command\n")
			try:
				#print (params["ch"])
				n = int(params["ch"])
				#print ("channel is " + str(n))
				
				if n >= ch_num:
					raise
				
				brt = params["val"]
				brightness[n] = brt
				#print ("set brightness value " + str(brt))
				#brigness is set. Send confirmation
				send_file_200 (conn, "200.htm")

			except Exception as e: 
				print(e)
				send_file_400 (conn, "400.htm")
		elif params["cmd"] == "set_time":
			print ("set_time command\n")
			try:
				h = int(params["hour"])
				print ("hour is " + str(h))
				if (h > 23) or (h < 0):
					raise
					
				m = int(params["minutes"])
				print ("minutes is " + str(m))
				if (m > 59) or (m < 0):
					raise
					
				s = int(params["secs"])
				print ("seconds is " + str(s))
				if (s > 59) or (s < 0):
					raise
				
				dov = int(params["day_of_week"])
				print ("day_of_week is " + str(dov))
				if (dov > 7) or (dov < 1):
					raise
				
				rohl_rtc.rtc.set_time(h,m,s,dov)
				#time is set. Send confirmation
				send_file_200 (conn, "200.htm")

			except Exception as e: 
				print(e)
				send_file_400 (conn, "400.htm")
		else: send_file_400 (conn, "400.htm")

	elif (file_str=="ch_cfg.json"):
		for i in range(ch_num):
			 ch_cfg[i]['val'] = brightness[i]
		#print (ch_cfg)
		send_json_contents(conn, json.dumps(ch_cfg).encode('utf-8'))
		
	elif (file_str=="time.json"):
		send_json_contents(conn, json.dumps(rohl_rtc.time_values).encode('utf-8'))
		
	elif ".css" in file_str:
		send_file_css (conn, file_str)
	elif ".js" in file_str:
		send_file_js (conn, file_str)
	elif ".ico" in file_str:
		send_file_ico (conn, file_str)
	else:
		send_file_200 (conn, file_str)

def server_thread ():
	print("web_server start")

	#Setup Socket WebServer
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.bind(('', 80))
	s.listen(5)
	while True:
		conn, addr = s.accept()
		#print("Got a connection from %s" % str(addr))
		request = conn.recv(1024)

		try:
			#separate first line of request
			#example result: GET /test.js?a=b&c=d HTTP/1.1\r
			first_str = str(request).split("\\n",1)[0]
			#print("first_str: \n" + first_str + "\n")
			
			#split line by slashes, results in "test.js?a=b&c=d HTTP"
			req_string = first_str.split("/")[1]
			#print("request part of first string with trash: \n" + req_string + "\n")
				
			#cut "HTTP" from the end by splitting on space symbol
			req_string_purified = req_string.split(" ")[0]
			#print("request part of first string: \n" + req_string_purified + "\n")
				
			#if request is root page ("/" only) we'll get empty req_string_purified here.
			if not req_string_purified:
				#print("slash only request detected. sending index.htm\n")
				send_file_200 (conn, "index.htm")
			else:
				process_string_purified(conn, req_string_purified)
				
		except Exception as e: 
			print(e)
			send_file_400 (conn)
			
		#print("Connection wth %s closed" % str(addr))

_thread.start_new_thread(server_thread, ())