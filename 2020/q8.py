def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


original_input = read_input("q8_input.txt")

seen_before = set()
acc = 0
index = 0
lines = original_input
while (index < len(lines)):
    if (index in seen_before):
        break
    seen_before.add(index)
    command, value = lines[index].split(' ')
    if command == 'jmp':
        index += int(value)
        continue
    elif command == 'acc':
        acc += int(value)
    index += 1

print(acc)

changed_index = 0
while (changed_index < len(lines)):
    lines = [i for i in original_input]
    if (lines[changed_index][:3] == 'acc'):
        changed_index += 1
        continue
    elif (lines[changed_index][:3] == 'nop'):
        lines[changed_index] = 'jmp' + lines[changed_index][3:]
    else:
        lines[changed_index] = 'nop' + lines[changed_index][3:]

    seen_before = set()
    acc = 0
    index = 0
    while (index < len(lines)):
        if (index in seen_before):
            break
        seen_before.add(index)
        command, value = lines[index].split(' ')
        if command == 'jmp':
            index += int(value)
            continue
        elif command == 'acc':
            acc += int(value)
        index += 1
    if (index >= len(lines)):
        print(acc)
        break
    changed_index += 1