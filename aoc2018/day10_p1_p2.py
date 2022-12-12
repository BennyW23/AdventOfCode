import time


class Point:
    def __init__(self, xpos, ypos, xvel, yvel):
        self.xpos = xpos
        self.ypos = ypos
        self.xvel = xvel
        self.yvel = yvel

    def tick(self):
        self.xpos += self.xvel
        self.ypos += self.yvel

    def print_point(self):
        print self.xpos, self.ypos, self.xvel, self.yvel


def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


def find_boundaries(points):
    left = points[0].xpos
    right = left
    top = points[0].ypos
    bottom = top
    for point in points:
        if point.xpos > right:
            right = point.xpos
        elif point.xpos < left:
            left = point.xpos
        if point.ypos > bottom:
            bottom = point.ypos
        elif point.ypos < top:
            top = point.ypos
    return left, right, top, bottom


def printgrid(grid):
    for line in grid:
        print line


l = read_input("day10.txt")
points = []
for line in l:
    pos = line[line.index("<") + 1 : line.index(">")]
    pos = pos.split(",")
    line = line[line.index(">") + 1 :]
    vel = line[line.index("<") + 1 : line.index(">")]
    vel = vel.split(",")
    points.append(Point(int(pos[0]), int(pos[1]), int(vel[0]), int(vel[1])))

left, right, top, bottom = find_boundaries(points)
minarea = (right - left) * (bottom - top)
value = 0
"""
for x in range(1, 100000): #correct solution was 10905
	for point in points:
		point.tick()
	left, right, top, bottom = find_boundaries(points)
	area = (right-left) * (bottom - top)
	if area < minarea:
		minarea = area
		value = x
		print "changed at ", x
"""
for x in range(10905):
    for point in points:
        point.tick()
left, right, top, bottom = find_boundaries(points)
grid = [["." for x in range(left, right + 1)] for y in range(top, bottom + 1)]
for point in points:
    grid[point.ypos - top][point.xpos - left] = "#"

printgrid(grid)
