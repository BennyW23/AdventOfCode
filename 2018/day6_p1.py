def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

l = read_input('day6.txt')
#l = read_input('day6ex.txt')

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

def closest_coord(a, loc):
	#find the closest coordinate to a from a list of coordinates
	#returns -1 if a tie
	min_dist = distance(a, loc[0])
	index = 0
	tie = False
	for i in range(1,len(loc)):
		if distance(a,loc[i]) < min_dist:
			min_dist = distance(a,loc[i])
			index = i
			tie = False
		elif distance(a, loc[i]) == min_dist:
			tie = True
	if tie == True:
		return -1
	return index

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
			grid[i][j] = closest_coord((j,i), coords)

	return grid

def count_values(grid):
	nums = []
	for line in grid:
		for num in line:
			if num not in nums:
				nums.append(num)

	count = {}
	for num in nums:
		count[num] = 0
	for i in range(len(grid)):
		for j in range(len(grid[i])):
			if grid[i][j] in nums:
				count[grid[i][j]] += 1
	return count


reg = make_grid(0, coords)
larger = make_grid(1, coords)

reg = count_values(reg)
larger = count_values(larger)

max_area = 0
for key in reg.keys():
	if key != -1:
		if reg[key] > max_area and reg[key] == larger[key]:
			max_area = reg[key]

print max_area
