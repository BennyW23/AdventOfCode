inp = 7511
grid = []

for x in range(1,301):
	line = []
	for y in range(1,301):
		power = ((x + 10) * (((x + 10) * y) + inp) % 1000 / 100) -5
		line.append(power)
	grid.append(line)

xmax, ymax = -1,-1
powermax = -999 

#part 1
for x in range(1,len(grid)-2):
	for y in range(1,len(grid)-2):
		power = grid[x-1][y-1] + grid[x][y-1] + grid[x+1][y-1]
		power += grid[x-1][y] + grid[x][y] + grid[x+1][y]
		power += grid[x-1][y+1] + grid[x][y+1] + grid[x+1][y+1]
		if power > powermax:
			powermax = power
			xmax,ymax = x,y

print xmax, ymax