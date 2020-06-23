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

l = read_input("day7.txt")
arr = l[0].split(",")
for i in range(len(arr)):
    arr[i] = int(arr[i])

# arr = [3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5]
# arr = [3,52,1001,52,-5,52,3,53,1,52,56,54,1007,54,5,55,1005,55,26,1001,54,-5,54,1105,1,12,1,53,54,53,1008,54,0,55,1001,55,1,55,2,53,55,53,4,53,1001,56,-1,56,1005,56,6,99,0,0,0,0,10]

data = list(arr)


# part 1
max_thrust = 0
for input1 in range(5):
    # result will be reused
    result1 = run_program(input1, 0)

    for input2 in range(5):
        # skip duplicates
        if input2 == input1:
            continue

        result2 = run_program(input2, result1)

        for input3 in range(5):
            # skip duplicates
            if input3 in (input1, input2):
                continue

            result3 = run_program(input3, result2)

            for input4 in range(5):
                # skip duplicates
                if input4 in (input1, input2, input3):
                    continue
                result4 = run_program(input4, result3)

                for input5 in range(5):
                    # skip duplicates
                    if input5 in (input1, input2, input3, input4):
                        continue
                    result5 = run_program(input5, result4)
                    if result5 > max_thrust:
                        max_thrust = result5
                    debug_print(
                        str(input1)
                        + " "
                        + str(input2)
                        + " "
                        + str(input3)
                        + " "
                        + str(input4)
                        + " "
                        + str(input5)
                        + " "
                        + str(result5)
                    )

debug_print("")
debug_print("")
print max_thrust

# part 2
max_thrust = 0

for input1 in xrange(5, 10):
    for input2 in xrange(5, 10):
        # skip duplicates
        if input2 == input1:
            continue
        for input3 in xrange(5, 10):
            # skip duplicates
            if input3 in (input1, input2):
                continue
            for input4 in xrange(5, 10):
                # skip duplicates
                if input4 in (input1, input2, input3):
                    continue
                for input5 in xrange(5, 10):
                    # skip duplicates
                    if input5 in (input1, input2, input3, input4):
                        continue

                    # code begins here
                    inputs = [input1, input2, input3, input4, input5]
                    thrust = run_program_pt2(inputs)
                    debug_print([thrust, inputs])
                    if thrust > max_thrust:
                        max_thrust = thrust

debug_print("")
debug_print("")
print max_thrust
