class Tile:
    def __init__(self, boundaries, tile_id, data):
        self.tile_id = tile_id
        self.upper_bound = boundaries[0][0]
        self.lower_bound = boundaries[0][1]
        self.left_bound = boundaries[1][0]
        self.right_bound = boundaries[1][1]
        self.data = data
        self.up = None
        self.down = None
        self.left = None
        self.right = None

    def rotate(self):
        """
        clockwise
        """
        temp = self.upper_bound
        self.upper_bound = self.left_bound[::-1]
        self.left_bound = self.lower_bound
        self.lower_bound = self.right_bound[::-1]
        self.right_bound = temp
        self.data = rotate(self.data)

    def flip_vertically(self):
        temp = self.upper_bound
        self.upper_bound = self.lower_bound
        self.lower_bound = temp
        self.left_bound = self.left_bound[::-1]
        self.right_bound = self.right_bound[::-1]
        self.data = self.data[::-1]

    def flip_horizontally(self):
        temp = self.left_bound
        self.left_bound = self.right_bound
        self.right_bound = temp
        self.upper_bound = self.upper_bound[::-1]
        self.lower_bound = self.lower_bound[::-1]
        self.data = [row[::-1] for row in self.data]

    def add_tile(self, tile, direction):
        if direction == "u":
            self.up = tile
        elif direction == "d":
            self.down = tile
        elif direction == "l":
            self.left = tile
        elif direction == "r":
            self.right = tile

    def print_bounds(self):
        print("Tile ID: %s" % self.tile_id)
        print("up", self.upper_bound)
        print("down", self.lower_bound)
        print("left", self.left_bound)
        print("right", self.right_bound)
        print()

    def print_data(self):
        print("Tile ID: %s" % self.tile_id)
        for line in self.data:
            print(line)


def get_next_tile(current_tile, edge):
    if edge in tile_boundaries:
        tiles_with_edge = tile_boundaries[edge]
    else:
        tiles_with_edge = tile_boundaries[edge[::-1]]
    if len(tiles_with_edge) == 1:
        return (None, -1)
    if current_tile == tiles_with_edge[0][0]:
        return tiles_with_edge[1]
    return tiles_with_edge[0]


def print_grid(top_left):
    row_marker = top_left
    while row_marker is not None:
        cur = row_marker
        while cur is not None:
            print(cur.tile_id, end=" ")
            cur = cur.right
        print()
        row_marker = row_marker.down


def rotate(old_list):
    new_list = []
    for col in range(len(old_list[0])):
        new_row = []
        for row in range(len(old_list) - 1, -1, -1):
            new_row.append(old_list[row][col])
        new_list.append(new_row)
    return new_list


raw_tiles = [tile.strip() for tile in open("q20_input.txt", "r").read().strip().split("\n\n")]

tile_boundaries = {}
tiles = {}

for raw_tile in raw_tiles:
    tile_as_list = raw_tile.split("\n")
    tile_id = tile_as_list[0].split()[1][:-1]
    top = tile_as_list[1]
    bottom = tile_as_list[-1]
    left = "".join([row[0] for row in tile_as_list[1:]])
    right = "".join([row[-1] for row in tile_as_list[1:]])
    bounds = ((top, bottom), (left, right))
    tiles[tile_id] = Tile(bounds, tile_id, tile_as_list[1:])
    edges = [top, left, bottom, right]
    for direction, edge in enumerate(edges):
        if edge in tile_boundaries:
            tile_boundaries[edge].append((tile_id, direction))
        elif edge[::-1] in tile_boundaries:
            tile_boundaries[edge[::-1]].append((tile_id, direction))
        else:
            tile_boundaries[edge] = [(tile_id, direction)]

seen_before = set()
seen_twice = list()
unpaired_edges = set()
for key, value in tile_boundaries.items():
    if len(value) == 1:
        unpaired_edges.add(key)
        if not value[0][0] in seen_before:
            seen_before.add(value[0][0])
        else:
            seen_twice.append(value[0][0])

product = 1
for val in seen_twice:
    product *= int(val)
print(product)


# part 2

top_left = tiles[seen_twice[0]]

# orient the top left tile correctly
while (
    top_left.upper_bound not in unpaired_edges and top_left.upper_bound[::-1] not in unpaired_edges
) and (
    top_left.left_bound not in unpaired_edges and top_left.left_bound[::-1] not in unpaired_edges
):
    top_left.rotate()
if top_left.upper_bound not in unpaired_edges and top_left.upper_bound[::-1] not in unpaired_edges:
    top_left.flip_vertically()
elif top_left.left_bound not in unpaired_edges and top_left.left_bound[::-1] not in unpaired_edges:
    top_left.flip_horizontally()

# orient the top edge
cur_tile = top_left
grid_width = 1
grid_height = 1

next_tile_id, direction = get_next_tile(cur_tile.tile_id, cur_tile.right_bound)
while next_tile_id is not None:
    next_tile = tiles.get(next_tile_id)
    turns = (direction - 1) % 4
    for iteration in range(turns):
        next_tile.rotate()
    if cur_tile.right_bound != next_tile.left_bound:
        next_tile.flip_vertically()
    cur_tile.add_tile(next_tile, "r")
    next_tile.add_tile(cur_tile, "l")
    grid_width += 1

    # next_tile.print_bounds()
    cur_tile = next_tile
    next_tile_id, direction = get_next_tile(cur_tile.tile_id, cur_tile.right_bound)

# go through each column setting up the connections
for column in range(grid_width):
    cur_tile = top_left
    for shifts in range(column):
        cur_tile = cur_tile.right

    next_tile_id, direction = get_next_tile(cur_tile.tile_id, cur_tile.lower_bound)
    while next_tile_id is not None:
        if column == 0:
            grid_height += 1
        next_tile = tiles.get(next_tile_id)
        turns = direction % 4
        for iteration in range(turns):
            next_tile.rotate()
        if cur_tile.lower_bound != next_tile.upper_bound:
            next_tile.flip_horizontally()
        cur_tile.add_tile(next_tile, "d")
        next_tile.add_tile(cur_tile, "u")
        if cur_tile.left is not None:
            cur_tile.left.down.add_tile(next_tile, "r")
            next_tile.add_tile(cur_tile.left.down, "l")

        cur_tile = next_tile
        next_tile_id, direction = get_next_tile(cur_tile.tile_id, cur_tile.lower_bound)

# collapse into a list of lists
block_height = len(top_left.data)
full_rows = ["" for i in range(grid_height * block_height)]
for grid_row in range(grid_height):
    for col in range(grid_width):
        tile = top_left
        for iteration in range(col):
            tile = tile.right
        for iteration in range(grid_row):
            tile = tile.down
        for block_row in range(1, block_height - 1):
            row = grid_row * block_height + block_row
            full_rows[row] = full_rows[row] + "".join(tile.data[block_row][1:-1])


full_rows = list(filter(None, full_rows))

# iterate through every index looking for sea monsters, rotate if none found

monster_height = 3
monster_width = 20
monster_pieces = set(
    [
        (0, 18),
        (1, 0),
        (1, 5),
        (1, 6),
        (1, 11),
        (1, 12),
        (1, 17),
        (1, 18),
        (1, 19),
        (2, 1),
        (2, 4),
        (2, 7),
        (2, 10),
        (2, 13),
        (2, 16),
    ]
)

used_pieces = set()

# search by top left corner
correct_orientation = False
while not correct_orientation:
    for i in range(4):
        for row in range(len(full_rows) - monster_height):
            for col in range(len(full_rows[0]) - monster_width):
                monster = True
                for piece in monster_pieces:
                    if full_rows[row + piece[0]][col + piece[1]] != "#":
                        monster = False
                        break
                if monster:
                    correct_orientation = True
                    used_pieces.update(
                        [(row + piece[0], col + piece[1]) for piece in monster_pieces]
                    )
        full_rows = rotate(full_rows)
    full_rows = full_rows[::-1]

count_hashes = 0
for row in full_rows:
    count_hashes += row.count("#")
print(count_hashes - len(used_pieces))
