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
# returns tuple (opCodeJump, returnValue)
def read_instruction(index, arr, inp):
    # parse the instruction itself at the index given
    debug_print("At index " + str(index) + " is : " + str(arr[index]))
    debug_print("The inputs are: " + str(inp))
    a = (arr[index] / 10000) % 10
    b = (arr[index] / 1000) % 10
    c = (arr[index] / 100) % 10
    opcode = arr[index] % 100

    param1 = index + 1
    param2 = index + 2
    param3 = index + 3

    try:
        if not c:
            param1 = arr[param1]
        if not b:
            param2 = arr[param2]
        if not a:
            param3 = arr[param3]
    except IndexError:
        pass

    offset = 0
    return_value = None

    # opcode 1: add
    if opcode == 1:
        arr[param3] = arr[param1] + arr[param2]
        offset = 4
    # opcode 2: multiply
    elif opcode == 2:
        arr[param3] = arr[param1] * arr[param2]
        offset = 4
    # opcode 3: set param1 to input value
    elif opcode == 3:
        arr[param1] = inp[0]
        offset = 2
        inp.pop(0)
    # opcode 4: display value
    elif opcode == 4:
        return_value = arr[param1]
        debug_print(return_value)
        debug_print("")
        offset = 2
    # opcode 5: jump if true
    elif opcode == 5:
        if arr[param1] != 0:
            offset = arr[param2] - index
        else:
            offset = 3
    # opcode 6: jump if false
    elif opcode == 6:
        if arr[param1] == 0:
            offset = arr[param2] - index
        else:
            offset = 3
    # opcode 7: less than
    elif opcode == 7:
        if arr[param1] < arr[param2]:
            arr[param3] = 1
        else:
            arr[param3] = 0
        offset = 4
    # opcode 8: equals
    elif opcode == 8:
        if arr[param1] == arr[param2]:
            arr[param3] = 1
        else:
            arr[param3] = 0
        offset = 4
    # opcode 99: quit
    elif opcode == 99:
        offset = -1
    else:
        raise Exception("OpCode not found.")

    return offset, return_value


def run_program(setting, input_given):
    data = list(arr)
    index = 0
    return_value = None
    inp = [setting, input_given]
    inp_index = 0
    while index < len(data):
        debug_print(data)
        offset, value = read_instruction(index, data, inp)
        if value is not None:
            return_value = value
        if offset == -1:
            break
        index += offset
    return return_value


def run_program_pt2(inputs):
    # need to track when we hit a 99
    offset = 0
    # which machine is currently running
    machine_index = 0
    # the opcode of the machines
    op_code_indexes = [0, 0, 0, 0, 0]
    # whether or not a machine is halted
    runnable = [1, 1, 1, 1, 1]
    # the current value of the amplified signal
    input_value = 0
    # put the inputs in a list to match part 1
    inp = []
    for i in range(len(inputs)):
        inp.append([inputs[i]])
    inp[0].append(0)
    # reset the data
    data = [[x for x in arr] for i in range(len(inputs))]

    last_value = 0

    running = True
    while running:
        # for iters in range(10000):
        for machine_index in range(len(inputs)):
            if runnable[machine_index]:
                if (
                    len(inp[machine_index]) == 0
                    and data[machine_index][op_code_indexes[machine_index]] % 100 == 3
                ):
                    continue
                offset, value = read_instruction(
                    op_code_indexes[machine_index],
                    data[machine_index],
                    inp[machine_index],
                )

                op_code_indexes[machine_index] += offset

                if value is not None:
                    # move to next machine
                    inp[(machine_index + 1) % len(inputs)].append(value)
                    last_value = value
                    continue
                if offset == -1:
                    runnable[machine_index] = 0
                if 1 not in runnable:
                    running = False

    return last_value


# setup
l = read_input("day9.txt")
arr = l[0].split(",")
for i in range(len(arr)):
    arr[i] = int(arr[i])

data = list(arr)
