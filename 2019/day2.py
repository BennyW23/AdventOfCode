#input parsing
def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

#reads the instruction at given index of the array
def read_instruction(index, arr):
	# opcode 1: add
	if arr[index] == 1:
		arr[arr[index + 3]] = arr[arr[index + 1]] + arr[arr[index + 2]]
	#opcode 2: multiply
	elif arr[index] == 2:
		arr[arr[index + 3]] = arr[arr[index + 1]] * arr[arr[index + 2]]
	#opcode 99: quit
	elif arr[index] == 99:
		return 0
	else:
		return -1
	return 1

#setup
l = read_input('day2.txt')
arr = l[0].split(',')
for i in range(len(arr)):
	arr[i] = int(arr[i])
data = list(arr)

#part 1
arr[1] = 12
arr[2] = 2
index = 0
while read_instruction(index, arr):
	index += 4
print arr[0]

#part 2
searchValue = 19690720
for noun in xrange(100):
	for verb in xrange(100):
		arr = list(data)
		arr[1] = noun
		arr[2] = verb
		index = 0
		while read_instruction(index, arr):
			index += 4
		#print arr[0]
		if arr[0] == searchValue:
			print 100 * noun + verb
