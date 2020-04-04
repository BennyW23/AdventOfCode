def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

def gcd(a,b):
	larger = a if a > b else b
	smaller = a if a < b else b
	while smaller != 0:
		temp = larger % smaller
		larger = smaller
		smaller = temp
	return larger

l = read_input('day10.txt')

asteroids = []
for i in range(len(l)):
	for j in range(len(l[i])):
		if l[i][j] == '#':
			asteroids.append((i,j))

#part 1
most_asteroids = 0
for i in range(len(asteroids)):

	asteroids_seen = set()
	base = asteroids[i]

	for j in range(len(asteroids)):
		#asteroids can't see themselves
		if i == j:
			continue

		other = asteroids[j]
		dx = base[0] - other[0]
		dy = base[1] - other[1]
		scaling_factor = gcd(abs(dx), abs(dy))
		dx = dx / scaling_factor
		dy = dy / scaling_factor
		asteroids_seen.add((dx,dy))

	if len(asteroids_seen) > most_asteroids:
		most_asteroids = len(asteroids_seen)
		base_index = i

print most_asteroids
print i
print asteroids[i]