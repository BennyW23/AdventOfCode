from operator import xor
baseinp = "wenycdww-"
#inp = "1,2,3"
#inp = ""
#numbers  = range(5)
def is_connected(string, connected = []):
	if string in connected:
		return []
	connected.append(string)
	for value in links[string]:
		if value not in connected:
			connected = is_connected(value, connected)
	return connected

def find_group(r, c, group):




answers = []

for rows in range(128):
	numbers = range(256)
	skipsize = 0
	curpos = 0
	lengths = []
	inp = baseinp + str(rows)

	for let in inp:
		lengths.append(ord(let))
	lengths += [17,31,73,47,23]


	for iterations in range(64):
		for num in lengths:
			reverseme = []
			newpos = curpos
			for i in range(num):
				try:
					reverseme.append(numbers[newpos])
					newpos += 1
				except IndexError:
					reverseme.append(numbers[0])
					newpos = 1

			newpos -= 1
			#at this point the indexes are correct
			for i in range(num):
				numbers[newpos] = reverseme[i]
				newpos -= 1
				if newpos <= -1:
					newpos = len(numbers) - 1

			curpos = (curpos + num + skipsize) % (256)
			skipsize += 1

	ans = []


	for i in range(16):
		cur = numbers[i * 16]
		for ind in range(1, 16):
			cur = xor(cur, numbers[i*16 + ind])
		ans.append(cur)

	for ind in range(len(ans)):
		new = ''
		ans[ind] = hex(ans[ind])[2:]
		if len(ans[ind]) == 1:
			ans[ind] = "0" + ans[ind]
		for let in range(2):
			if ans[ind][let].isdigit():
				temp = str(bin(int(ans[ind][let])))[2:]
			elif ans[ind][let] == 'a':
				temp = str(bin(10))[2:]
			elif ans[ind][let] == 'b':
				temp = str(bin(11))[2:]
			elif ans[ind][let] == 'c':
				temp = str(bin(12))[2:]
			elif ans[ind][let] == 'd':
				temp = str(bin(13))[2:]
			elif ans[ind][let] == 'e':
				temp = str(bin(14))[2:]
			elif ans[ind][let] == 'f':
				temp = str(bin(15))[2:]

			while len(temp) < 4:
				temp = '0' + temp
			new += temp
		ans[ind] = new
	answers.append(''.join(ans))

used = 0
for answer in answers:
	for let in answer:
		if let == '1':
			used +=1

print used
groups = [] #numbers stored as row, col
connected = find_group(0,0,[])
print connected