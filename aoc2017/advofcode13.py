inp = """0: 3
1: 2
2: 4
4: 6
6: 5
8: 6
10: 6
12: 4
14: 8
16: 8
18: 9
20: 8
22: 6
24: 14
26: 12
28: 10
30: 12
32: 8
34: 10
36: 8
38: 8
40: 12
42: 12
44: 12
46: 12
48: 14
52: 14
54: 12
56: 12
58: 12
60: 12
62: 14
64: 14
66: 14
68: 14
70: 14
72: 14
80: 18
82: 14
84: 20
86: 14
90: 17
96: 20
98: 24"""


"""0: 3
1: 2
4: 4
6: 4"""


"""
def increment((index, scanrange)):
	if index == scanrange - 1:
		index = -(scanrange - 1)
	index += 1
	return (index, scanrange)


lines = inp.split('\n')

#the next two sections make the input into a list of a list of integers
for linenum in range(len(lines)):
	for num in range(len(lines[linenum]) - 1, -1, -1):
		if lines[linenum][num] == ":":
			lines[linenum] = lines[linenum][:num] + lines[linenum][num + 1:]

for line in range(len(lines)):
	lines[line] = lines[line].split()
	for num in range(len(lines[line])):
		lines[line][num] = int(lines[line][num])

#make the scanners a dictionary 
scanner = {}
for line in lines:
	scanner[line[0]] = (0, line[1])

#location = -1
#totalseverity = 0 #part 1
caught = True
delay = -1
cache = {}

while caught ==  True:
	caught = False
	delay += 1
	print delay
	location = -1
	for key in scanner:
		scanner[key] = (0, scanner[key][1])

	#delays the packet by advancing the scanners
	for iters in range(delay):
		for key in scanner:
			try:
				scanner[key] = cache[scanner[key]]
			except KeyError:
				cache[scanner[key]] = increment(scanner[key])
				scanner[key] = cache[scanner[key]]
	


	for iterations in range(lines[-1][0] + 1):
		location += 1
		#print scanner, location, delay
		try:
			if scanner[location][0] == 0: 
				#part 1
				severity = location * scanner[location][1]
				totalseverity += severity
				print location, severity
				caught = True
				break
		except KeyError:
			pass
		for key in scanner:
			try:
				scanner[key] = cache[scanner[key]]
			except KeyError:
				cache[scanner[key]] = increment(scanner[key])
				scanner[key] = cache[scanner[key]]


print '\n'
print delay
#print totalseverity
"""
dic = {}

lines = inp.split("\n")
values = []
for num in range(len(lines)):
    values += lines[num].split(": ")

for i in range(0, len(values), 2):
    dic[int(values[i])] = int(values[i + 1])

s = 0
for loc in dic.keys():
    if loc % (2 * (dic[loc] - 1)) == 0:
        s += loc * dic[loc]

print s

delay = 0
caught = True
while caught == True:
    caught = False
    for loc in dic.keys():
        if (loc + delay) % (2 * (dic[loc] - 1)) == 0:
            caught = True
            delay += 1
            break

print delay
