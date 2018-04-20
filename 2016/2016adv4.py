inp = '''aaaaa-bbb-z-y-x-123[abxyz]'''
lines = inp.split('\n')

for line in lines:
	if line == '':
		continue
	letters = []
	freq = {}
	idlen = 0
	index = 0
	testchecksum = []
	while True:
		index +=1
		print index
		if line[index].isalpha():
			print line[index]
			if line[index] not in letters:
				letters.append(line[index])	
				freq[line[index]] = 1
			else:
				freq[line[index]] += 1
		elif line[index] == '-':
			line = line[:index] + line[index + 1:]
		else:
			break
	print line
	while True:
		try:
			idlen += 1
			secid = int(line[index:index+idlen])
		except ValueError:
			idlen -=1
			break
	
	checksum = line[index + idlen + 1: -1]
	print checksum, secid
	print freq
	print letters
	while len(letters)>0:
		largest = 0
		for let in range(len(letters)):
			if freq[line[let]] > freq[line[largest]]:
				largest = let
		testchecksum.append(line[largest])
		line = line[:largest] + line[largest+1:]
	
	print testchecksum
