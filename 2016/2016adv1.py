inp = " R3, L5, R2, L1, L2, R5, L2, R2, L2, L2, L1, R2, L2, R4, R4, R1, L2, L3, R3, L1, R2, L2, L4, R4, R5, L3, R3, L3, L3, R4, R5, L3, R3, L5, L1, L2, R2, L1, R3, R1, L1, R187, L1, R2, R47, L5, L1, L2, R4, R3, L3, R3, R4, R1, R3, L1, L4, L1, R2, L1, R4, R5, L1, R77, L5, L4, R3, L2, R4, R5, R5, L2, L2, R2, R5, L2, R194, R5, L2, R4, L5, L4, L2, R5, L3, L2, L5, R5, R2, L3, R3, R1, L4, R2, L1, R5, L1, R5, L1, L1, R3, L1, R5, R2, R5, R5, L4, L5, L5, L5, R3, L2, L5, L4, R3, R1, R1, R4, L2, L4, R5, R5, R4, L2, L2, R5, R5, L5, L2, R4, R4, L4, R1, L3, R1, L1, L1, L1, L4, R5, R4, L4, L4, R5, R3, L2, L2, R3, R1, R4, L3, R1, L4, R3, L3, L2, R2, R2, R2, L1, L4, R3, R2, R2, L3, R2, L3, L2, R4, L2, R3, L4, R5, R4, R1, R5, R3"
steps = inp.split(',')
index = 0
directions = [0, 0, 0, 0] #north east south west
ind = 0
print steps

''' 
#part 2
for step in steps:
	if step == '':
		continue
	while step[ind] == ' ':
		ind +=1
	if step[ind] == 'R':
		index += 1
	else:
		index -=1
	if index == -1:
		index = 3
	elif index == 4:
		index = 0
	
	directions[index] += int(step[ind+1:])
	print directions
print directions[0] - directions[2]
print directions[1] - directions[3]
print 106+137
'''

'''
#part 2
for step in steps:
	place = (directions[0] - directions[2], (directions[1] - directions[3]))
	if step == '':
		continue
	while step[ind] == ' ':
		ind +=1
	if step[ind] == 'R':
		index += 1
	else:
		index -=1
	if index == -1:
		index = 3
	elif index == 4:
		index = 0
	
	num = int(step[ind+1:])
	
	while place not in been:
		while num > 0:
			if place in been:
				break
			else:
				been.append(place)	
			directions[index] += 1
			num -=1
			place = (directions[0] - directions[2], (directions[1] - directions[3]))
			print place, directions
		if num == 0:
			break
	

print place
'''
