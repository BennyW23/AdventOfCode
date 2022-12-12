import itertools


def print_generation(gen, four_dimensions):
    x_min = min([val[0] for val in gen])
    x_max = max([val[0] for val in gen])
    y_min = min([val[1] for val in gen])
    y_max = max([val[1] for val in gen])
    z_min = min([val[2] for val in gen])
    z_max = max([val[2] for val in gen])
    if four_dimensions:
        w_min = min([val[2] for val in gen])
        w_max = max([val[2] for val in gen])
    else:
        w_min = 0
        w_max = 0

    for w in range(w_min, w_max + 1):
        for z in range(z_min, z_max + 1):
            print("z=%d, w=%d" % (z, w))
            for y in range(y_min, y_max + 1):
                for x in range(x_min, x_max + 1):
                    if (x, y, z) in gen:
                        print("#", end="")
                    else:
                        print(".", end="")
                print()
            print()


def get_next_gen(active, neighbor_directions, dimensions):
    next_gen = set()
    neighbors = {}

    for active_cube in active:
        for direction in neighbor_directions:
            neighbor = tuple([active_cube[dim] + direction[dim] for dim in range(dimensions)])
            neighbors[neighbor] = neighbors.get(neighbor, 0) + 1

    for cube, count in neighbors.items():
        if cube in active:
            if count in range(2, 4):
                next_gen.add(cube)
        elif count == 3:
            next_gen.add(cube)
    return next_gen


inp = open("q17_input.txt", "r").read().split()

directions = set(itertools.product(range(-1, 2), repeat=3))
directions.remove((0, 0, 0))

active = set()
for y in range(len(inp)):
    for x in range(len(inp[y])):
        if inp[y][x] == "#":
            active.add((x, y, 0))

for iteration in range(6):
    active = get_next_gen(active, directions, 3)

print(len(active))

directions = set(itertools.product(range(-1, 2), repeat=4))
directions.remove((0, 0, 0, 0))

active = set()
for y in range(len(inp)):
    for x in range(len(inp[y])):
        if inp[y][x] == "#":
            active.add((x, y, 0, 0))

for iteration in range(6):
    active = get_next_gen(active, directions, 4)

print(len(active))
