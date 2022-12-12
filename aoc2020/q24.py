raw_tiles = [line.strip() for line in open("q24_input.txt", "r").read().strip().split("\n")]

tiles = {}
for tile in raw_tiles:
    x, y = 0, 0
    prev = ""
    for let in tile:
        if let == "e" or let == "w":
            change_by = 1
            if prev == "n":
                y += 1
            elif prev == "s":
                y -= 1
            else:
                change_by = 2
            if let == "e":
                x += change_by
            else:
                x -= change_by
            prev = ""
        else:
            prev += let
    tiles[(x, y)] = tiles.get((x, y), 0) + 1

black_tiles = set()
for key, value in tiles.items():
    if value == 1 % 2:
        black_tiles.add(key)
print(len(black_tiles))

neighbor_gaps = set([(2, 0), (-2, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)])
for day in range(100):
    next_gen_active = set()
    neighbors = {}

    for tile in black_tiles:
        for neighbor in neighbor_gaps:
            nbr_tile = (tile[0] + neighbor[0], tile[1] + neighbor[1])
            neighbors[nbr_tile] = neighbors.get(nbr_tile, 0) + 1

    for tile, value in neighbors.items():
        if tile in black_tiles:
            if value in range(1, 3):
                next_gen_active.add(tile)
        else:
            if value == 2:
                next_gen_active.add(tile)

    black_tiles = next_gen_active
print(len(black_tiles))
