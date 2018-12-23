def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

l = read_input('day6.txt')
#l = read_input('day6ex.txt')
MAXDIST = 10000

coords = []
for line in l:
	x,y = line.split(',')
	x = int(x.strip())
	y = int(y.strip())
	coords.append((x,y))

def find_boundaries(coords):
	left, right, top, bottom = coords[0][0], coords[0][0], coords[0][1], coords[0][1]
	for coordinate in coords:
		if coordinate[0] < left:
			left = coordinate[0]
		elif coordinate[0] > right:
			right = coordinate[0]
		if coordinate[1] < top:
			top = coordinate[1]
		elif coordinate[1] > bottom:
			bottom = coordinate[1]
	return (left, right, top, bottom)

def distance(a,b):
	return abs(b[0] - a[0]) + abs(b[1]- a[1])

def total_dist(a, loc):
	s = 0
	for coordinate in loc:
		s += distance(a, coordinate)
	return s

def printgrid(grid):
	for line in grid:
		print line

def make_grid(n, coords):
	# makes a grid with a border of size n
	left,right,top,bottom = find_boundaries(coords)
	grid = [[0 for j in range(left, right + 2*n + 1)] for i in range(top, bottom + 2*n + 1)]

	for i in range(len(coords)):
		coords[i] = (coords[i][0] - left + n, coords[i][1] - top+ n)

	for i in range(len(grid)):
		for j in range(len(grid[i])):
			grid[i][j] = total_dist((j,i), coords)

	return grid

def count_less_than(n, grid):
	count = 0
	for i in range(len(grid)):
		for j in range(len(grid[i])):
			if grid[i][j] < n:
				count += 1
	return count

grid = make_grid(0, coords)
#this gave the correct answer for my input, my initial strategy was to increase until it stayed the same
print count_less_than(MAXDIST, grid)

