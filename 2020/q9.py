def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


original_input = [int(i) for i in read_input("q9_input.txt")]

index = 25
print(original_input[index - 25 : index])
while index < len(original_input):
    found = False
    for x in original_input[index - 25 : index]:
        for y in original_input[index - 25 : index]:
            if original_input[index] == x + y:
                found = True
    if not found:
        break
    index += 1

value = original_input[index]

done = False
for size in range(2, len(original_input)):
    for starting_index in range(len(original_input) - size):
        total = 0
        for i in range(starting_index, starting_index + size):
            total += original_input[i]
        if total == value:
            print(
                max(
                    [
                        original_input[i]
                        for i in range(starting_index, starting_index + size)
                    ]
                )
                + min(
                    [
                        original_input[i]
                        for i in range(starting_index, starting_index + size)
                    ]
                )
            )
            done = True
            break
    if done == True:
        break
