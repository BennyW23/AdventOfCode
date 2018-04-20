inp ="4	10	4	1	8	4	9	14	5	1	14	15	0	15	3	5"
"0	2	7	0"
banks = inp.split("\t")
print banks
for num in range(len(banks)-1, -1, -1):
	try:
		banks[num] = int(banks[num])
	except:
		banks.pop(num)

#now we have a list of the banks with the respective values
seen = []
cycles = 0
#the values will be represented as a tuple in the list seen and if it corresponds then it's been seen before
while True:
	print tuple(banks)
	if tuple(banks) in seen:
		break
	seen.append(tuple(banks))
	cycles += 1
	largest = 0
	for num in range(1,len(banks)):
		if banks[num] > banks[largest]:
			largest = num
	
	quotient = banks[largest] / len(banks)
	remainder = banks[largest] % len(banks)
	banks[largest] = quotient
	index = largest
	
	if index == len(banks) - 1:
		index = 0
	else:
		index += 1
	
	while index != largest:
		if remainder > 0:
			banks[index] = banks[index] + quotient + 1
			remainder -= 1
		else:
			banks[index] = banks[index] + quotient
		if index == len(banks) - 1:
			index = 0
		else:
			index += 1
	

print cycles
ind = seen.index(tuple(banks))
print cycles - ind
