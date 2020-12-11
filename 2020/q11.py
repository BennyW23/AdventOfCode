def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


def pretty_print(generation):
    for line in generation:
        print("".join(line))
    print()


def occupied_next_gen_1(current, row, col):
    count = 0
    for dx, dy in dirs:
        checked_row = row + dx
        checked_col = col + dy
        if 0 <= checked_row <= last_row and 0 <= checked_col <= last_col:
            if current[checked_row][checked_col] == "#":
                count += 1

    if current[row][col] == "L" and count == 0:
        return "#"
    elif current[row][col] == "#" and count >= 4:
        return "L"
    return current[row][col]


def occupied_next_gen_2(current, row, col):
    count = 0
    for dx, dy in dirs:
        checked_row = row + dx
        checked_col = col + dy
        while 0 <= checked_row <= last_row and 0 <= checked_col <= last_col:
            if current[checked_row][checked_col] == ".":
                checked_row = checked_row + dx
                checked_col = checked_col + dy
            else:
                count += current[checked_row][checked_col] == "#"
                break

    if current[row][col] == "L" and count == 0:
        return "#"
    elif current[row][col] == "#" and count >= 5:
        return "L"
    return current[row][col]


def get_next_gen(current):
    next_values = []
    for row in range(len(current)):
        new_row = []
        for col in range(len(current[row])):
            if current[row][col] == ".":
                new_row.append(".")
                continue
            new_row.append(occupied_next_gen_1(current, row, col))
        next_values.append(new_row)
    return next_values


dirs = ((1, 1), (1, 0), (1, -1), (0, 1), (0, -1), (-1, 1), (-1, 0), (-1, -1))
values = read_input("q11_input.txt")
arr = []
for i in range(len(values)):
    arr.append([char for char in values[i]])

last_row = len(values) - 1
last_col = len(values[0]) - 1

seen_before = set()

while True:
    as_tuple = tuple(map(tuple, arr))
    if as_tuple in seen_before:
        break
    seen_before.add(as_tuple)
    arr = get_next_gen(arr)

occupied_seats = 0
for row in arr:
    occupied_seats += row.count("#")

print(occupied_seats)
