from operator import xor
inp = "106,16,254,226,55,2,1,166,177,247,93,0,255,228,60,36"
#inp = "1,2,3"
#inp = ""
numbers = range(256)
#numbers  = range(5)

curpos = 0
skipsize = 0
lengths = []

'''
#part 1
lengths = inp.split(',')
for num in range(len(lengths)):
	lengths[num] = int(lengths[num])
'''

#part 2 only
for let in inp:
	lengths.append(ord(let))
lengths += [17,31,73,47,23]
print lengths


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
			'''
			print numbers, reverseme
			print newpos
			print numbers[newpos]
			print reverseme[i]
			'''
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
	ans[ind] = hex(ans[ind])[2:]
	if len(ans[ind]) == 1:
		ans[ind] = "0" + ans[ind]

print '\n'
print ans
print ''.join(ans)
