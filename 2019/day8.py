def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

def debug_print(inp):
	#print inp
	pass

# prints a message as a 6x25 message given a input string of size 25
def display_grid(str):
	for i in range(0,6):
		string = ""
		for j in range(0,25):
			if str[25*i + j] == "1":
				string = string + chr(64)
			else:
				string = string + " "
		print string

inp = read_input('day8.txt')
inp = str(inp[0])

layers = [inp[j:j+150] for j in range(0, len(inp), 150)]

# part 1
min_index = 0
min_zeros = layers[0].count("0")
for index in range(1, len(layers)):
	debug_print(str(index) + " has " + str(layers[index].count("0")))
	if layers[index].count("0") < min_zeros:
		min_zeros = layers[index].count("0")
		min_index = index

print (layers[min_index].count("1") * layers[min_index].count("2"))

# part 2
image = ""
for i in range(150):
	layer_index = 0
	while layers[layer_index][i] == "2":
		layer_index += 1
	image = image + layers[layer_index][i]

display_grid(image)