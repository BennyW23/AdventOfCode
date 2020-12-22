equations = open("q18_input.txt", "r").read().strip().split("\n")


def eval_helper_1(equation):
    # print("eval_helper", ''.join(equation))
    while len(equation) > 1:
        result = eval(equation[0] + equation[1] + equation[2])
        equation.pop(0)
        equation.pop(0)
        equation.pop(0)
        equation.insert(0, str(result))
    return equation[0]


def eval_helper_2(equation):
    # print("eval_helper", ''.join(equation))
    if len(equation) == 1:
        return equation[0]
    if "*" in equation:
        index = equation.index("*")
        return str(
            eval(eval_helper_2(equation[:index]) + "*" + eval_helper_2(equation[index + 1 :]))
        )
    return str(eval("".join(equation)))


def evaluate(string, version):
    # print('evaluate: ', string)
    while "(" in string:
        beginning_index, ending_index = find_matching_parentheses(string)
        string = (
            string[:beginning_index]
            + evaluate(string[beginning_index + 1 : ending_index], version)
            + string[ending_index + 1 :]
        )
    if version == 2:
        result = eval_helper_2(string.split(" "))
    else:
        result = eval_helper_1(string.split(" "))
    return result


def find_matching_parentheses(string):
    beginning_index = string.index("(")
    index = beginning_index
    count = 1
    while count != 0:
        index += 1
        if string[index] == "(":
            count += 1
        elif string[index] == ")":
            count -= 1
    return beginning_index, index


total_1 = 0
total_2 = 0
for equation in equations:
    total_1 += int(evaluate(equation, 1))
    total_2 += int(evaluate(equation, 2))

print(total_1)
print(total_2)
