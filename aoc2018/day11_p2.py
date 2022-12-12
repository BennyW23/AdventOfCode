inp = 7511
grid = []
GRIDSIZE = 301

for x in range(1, GRIDSIZE):
    line = []
    for y in range(1, GRIDSIZE):
        power = ((x + 10) * (((x + 10) * y) + inp) % 1000 / 100) - 5
        line.append(power)
    grid.append(line)
"""
for line in grid:
	print line
"""

summedAreaTable = []
# sets up first line
line = [grid[0][0]]
for col in range(1, len(grid[0])):
    line.append(line[col - 1] + grid[0][col])
summedAreaTable.append(line)
# sets up the rest of the table
for row in range(1, len(grid)):
    line = [grid[row][0] + summedAreaTable[row - 1][0]]
    for col in range(1, len(grid[row])):
        line.append(
            grid[row][col]
            + line[col - 1]
            + summedAreaTable[row - 1][col]
            - summedAreaTable[row - 1][col - 1]
        )
    summedAreaTable.append(line)
"""
print
for line in summedAreaTable:
	print line
"""

xmax, ymax, sizemax = -1, -1, -1
powermax = -999

for x in range(0, len(grid)):
    for y in range(0, len(grid)):
        if grid[x][y] > powermax:
            # print x,y, 0, grid[x][y]
            powermax = grid[x][y]
            xmax, ymax, sizemax = x + 1, y + 1, 1
        for size in range(0, 300):
            if x + size >= len(grid) or y + size >= len(grid):
                continue
            botRight = summedAreaTable[x + size][y + size]
            if x > 0 and y > 0:
                topLeft = summedAreaTable[x - 1][y - 1]
            else:
                topLeft = 0
            if x > 0:
                topRight = summedAreaTable[x - 1][y + size]
            else:
                topRight = 0
            if y > 0:
                botLeft = summedAreaTable[x + size][y - 1]
            else:
                botLeft = 0

            power = topLeft + botRight - topRight - botLeft
            if power > powermax:
                # print x,y, size, power
                powermax = power
                xmax, ymax, sizemax = x + 1, y + 1, size + 1

print xmax, ymax, sizemax, powermax
