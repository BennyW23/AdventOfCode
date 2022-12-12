import itertools

inp = [str.strip(x) for x in open("q14_input.txt", "r")]


def change_mask_1(mask):
    new_mask = {}
    for count, letter in enumerate(mask[::-1]):
        if letter == "0":
            new_mask[count] = 0
        elif letter == "1":
            new_mask[count] = 1
    return new_mask


def apply_mask_1(number, mask):
    for power, value in mask.items():
        if value == 1:
            number = number | (1 << power)
        else:
            number = number & ~(1 << power)
    return number


current_mask = {}
memory = {}

for line in inp:
    if line[:4] == "mask":
        current_mask = change_mask_1(line[7:])
    else:
        parts = line.split(" ")
        address = int(parts[0][4 : parts[0].index("]")])
        value = int(parts[2])
        memory[address] = apply_mask_1(value, current_mask)

print(sum(memory.values()))


def change_mask_2(mask):
    new_overwritten = set()
    new_floating = []
    for count, letter in enumerate(mask[::-1]):
        if letter == "1":
            new_overwritten.add(count)
        elif letter == "X":
            new_floating.append(count)
    return new_overwritten, new_floating


def apply_mask_2(address, stored_value, overwritten, floating):
    addresses = set()
    for power in overwritten:
        address = address | (1 << power)
    for permutation in list(itertools.product([0, 1], repeat=len(floating))):
        new_address = address
        for count, value in enumerate(permutation):
            power = floating[count]
            if value == 1:
                new_address = new_address | (1 << power)
            else:
                new_address = new_address & ~(1 << power)
        addresses.add(new_address)
    for location in addresses:
        memory[location] = stored_value


overwritten = set()
floating = set()
memory = {}
for line in inp:
    if line[:4] == "mask":
        overwritten, floating = change_mask_2(line[7:])
    else:
        parts = line.split(" ")
        address = int(parts[0][4 : parts[0].index("]")])
        value = int(parts[2])
        apply_mask_2(address, value, overwritten, floating)

print(sum(memory.values()))
