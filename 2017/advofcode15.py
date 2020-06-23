inpA = long(699)
inpB = long(124)
# inpA = long(65)
# inpB = long(8921)
count = 0

"""#part 1
for iters in xrange(40000000):
	inpA = (inpA * 16807) % 2147483647
	inpB = (inpB * 48271) % 2147483647
	endA = str(bin(inpA))[-16:]
	endB = str(bin(inpB))[-16:]
	if endA == endB:
		count += 1
		print count
print '\n'
print count
"""


for iters in xrange(5000000):
    inpA = (inpA * 16807) % 2147483647
    while inpA % 4 != 0:
        inpA = (inpA * 16807) % 2147483647

    inpB = (inpB * 48271) % 2147483647
    while inpB % 8 != 0:
        inpB = (inpB * 48271) % 2147483647

    endA = str(bin(inpA))[-16:]
    endB = str(bin(inpB))[-16:]
    if endA == endB:
        count += 1
        print count

print "\n"
print count
