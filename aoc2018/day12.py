def read_input(inp):
    file_to_read = open(inp, "r")
    lines = file_to_read.readlines()
    for i in range(len(lines)):
        lines[i] = lines[i].strip("\n")
    return lines


def next_generation(current, index):
    next_gen = set()
    for position in range(min(current) - 2, max(current) + 2):
        position_status = []
        for relative_pos in range(-2, 3):
            if position + relative_pos in current:
                position_status.append(relative_pos)
        if tuple(position_status) in rules:
            next_gen.add(position)
    return next_gen


def pretty_print_generation(generation, minimum, maximum):
    output_string = ""
    for position in range(minimum, maximum):
        if position in generation:
            output_string += "#"
        else:
            output_string += "."
    print(output_string)


PROBLEM_INPUT = read_input("day12.txt")

rules = set()
for input_rule in PROBLEM_INPUT[2:]:
    if input_rule[9] == "#":
        valid = []
        for i in range(5):
            if input_rule[i] == "#":
                valid.append(i - 2)
        rules.add(tuple(valid))

INITIAL_GENERATION = set()
for i in range(len(PROBLEM_INPUT[0][15:])):
    if PROBLEM_INPUT[0][i + 15] == "#":
        INITIAL_GENERATION.add(i)

sums = []
current_generation = INITIAL_GENERATION
sums.append(sum(current_generation))
for i in range(300):
    # look for the first two indexes where it repeats
    # this forms a cycle
    current_generation = next_generation(current_generation, i)
    sums.append(sum(current_generation))

# this finds patterns in the arithmetic sequence
# i is a value where the pattern starts
# j is the interval between values - minimizing j gives a smaller modulus
"""
for j in range(1,int(len(sums)/2)+ 1):
    previous = sums[j] - sums[0]
    for i in range(2 * j, len(sums),j):
        #print((i,j))
        if previous == (sums[i] - sums[i-j]):
            print(i)
            print(j)
            print(previous)
            print()
        previous = sums[i] - sums[i-j]

print(sums)
"""

# in this one actually j=2 adds 52 each time on even numbers
print(sums[20])
print(sums[200] + (50000000000 - 200) * 26)
