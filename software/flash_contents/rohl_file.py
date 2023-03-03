import mutex
mutex = mutex.Mutex()

data = {}
file = open ("rohl_data.json", "w")
changed = False

def change (param, val):
	with mutex:
		data[param] = val
		changed = True
		
def saved ():
	with mutex:
		saved_mark = not changed
	return saved_mark

def file_thread ():
	with mutex:
		data = file.read()
	while True:
		with mutex:
			if (changed==True):
				file.write(data)
				changed = False
		time.sleep(5)

_thread.start_new_thread(file_thread, ())
