inp = [str.strip(x) for x in open('q14_input.txt', 'r')]

def change_mask_1(mask):
    new_mask = {}
    for count, letter in enumerate(mask[::-1]):
        if letter == '0':
            new_mask[count] = 0
        elif letter == '1':
            new_mask[count] = 1
    return new_mask

def apply_mask_1(number, mask):
    for power, value in mask.items():
        if value == 1:
            number = number | (1 << power)
        else:
            number = number & ~ (1 << power)
    return number

current_mask = {}
memory = {}

for line in inp:
    if line[:4] == 'mask':
        current_mask = change_mask_1(line[7:])
    else:
        parts = line.split(' ')
        address = int(parts[0][4 : parts[0].index(']')])
        value = int(parts[2])
        memory[address] = apply_mask_1(value, current_mask)

print(sum(memory.values()))


