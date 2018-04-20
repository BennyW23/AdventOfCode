f= open('input.txt', 'r' )

l = []
direction = 'down'
index = [1,1]
letters = []
steps = 0

for line in f:
	line = ' ' + line + ' '
	l.append(line)

emptyLine = ' ' * len(l[0])
l.insert(0, emptyLine)
l.append(emptyLine)
print l

while l[index[0]][index[1]] == ' ':
	index[1] += 1

while True:
	steps += 1
	temp = index
	if direction == 'down':
		index[0] += 1
	elif direction == 'up':
		index[0] -= 1
	elif direction == 'left':
		index[1] -= 1	
	elif direction == 'right':
		index[1] += 1
	
	print index, l[index[0]][index[1]]
	if l[index[0]][index[1]].isalpha():
		letters.append(l[index[0]][index[1]])
	
	elif l[index[0]][index[1]] == '+':
		if direction == 'down' or direction == 'up':
			if l[index[0]][index[1] + 1] != ' ':
				direction = 'right'
			elif l[index[0]][index[1] - 1] != ' ':
				direction = 'left'
			
		elif direction == 'left' or direction == 'right':
			if l[index[0] + 1][index[1]] != ' ':
				direction = 'down'
			elif l[index[0] - 1][index[1]] != ' ':
				direction = 'up'
		
	elif l[index[0]][index[1]] == ' ':
		break

print letters
print ''.join(letters)
print steps
