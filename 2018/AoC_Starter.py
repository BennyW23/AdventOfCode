def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l
#
l = read_input('day.txt')

'''
Purpose of this is to put functions that are commonly needed as a starter kit
So far, only the read_input function has been universal
'''