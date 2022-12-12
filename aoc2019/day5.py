# input parsing
def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


def debug_print(inp):
    # print inp
    pass


# reads the instruction at given index of the array
# return values correspond to sizes of instructions used
def read_instruction(index, arr, inp):
    # parse the instruction itself at the index given
    debug_print("At index " + str(index) + " is : " + str(arr[index]))
    a = (arr[index] / 10000) % 10
    b = (arr[index] / 1000) % 10
    c = (arr[index] / 100) % 10
    opcode = arr[index] % 100

    param1 = index + 1
    param2 = index + 2
    param3 = index + 3

    try:
        if not a:
            param3 = arr[param3]
        if not b:
            param2 = arr[param2]
        if not c:
            param1 = arr[param1]
    except IndexError:
        pass

    # opcode 1: add
    if opcode == 1:
        arr[param3] = arr[param1] + arr[param2]
        return 4
    # opcode 2: multiply
    elif opcode == 2:
        arr[param3] = arr[param1] * arr[param2]
        return 4
    # opcode 3: set param1 to input value
    elif opcode == 3:
        arr[param1] = inp
        return 2
    # opcode 4: display value
    elif opcode == 4:
        print arr[param1]
        return 2
    # opcode 5: jump if true
    elif opcode == 5:
        if arr[param1] != 0:
            return arr[param2] - index
        else:
            return 3
    # opcode 6: jump if false
    elif opcode == 6:
        if arr[param1] == 0:
            return arr[param2] - index
        else:
            return 3
    # opcode 7: less than
    elif opcode == 7:
        if arr[param1] < arr[param2]:
            arr[param3] = 1
        else:
            arr[param3] = 0
        return 4
    # opcode 8: equals
    elif opcode == 8:
        if arr[param1] == arr[param2]:
            arr[param3] = 1
        else:
            arr[param3] = 0
        return 4
    # opcode 99: quit
    elif opcode == 99:
        return -1
    else:
        raise Exception("OpCode not found.")


# setup
l = read_input("day5.txt")
arr = l[0].split(",")
for i in range(len(arr)):
    arr[i] = int(arr[i])
data = list(arr)

# part 1
index = 0
return_value = 0
while index < len(data):
    return_value = read_instruction(index, data, 1)
    if return_value == -1:
        break
    index += return_value

print
print

# part 2
data = list(arr)
index = 0
return_value = 0
while index < len(data):
    return_value = read_instruction(index, data, 5)
    debug_print("The size of the instruction was: " + str(return_value))
    if return_value == -1:
        break
    index += return_value
