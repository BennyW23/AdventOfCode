def inverse(value, modulus):
    return pow(value, -1, modulus)


def solve_two_crt_equations(value1, mod1, value2, mod2):
    """
    Solves the equations modulo M = mod1 * mod2
        x = value1 (mod mod1)
        x = value2 (mod mod2)
    """
    coeff1 = inverse(mod1, mod2)
    coeff2 = int((((coeff1 * mod1) - 1) * -1) / mod2)
    return (value2 * coeff1 * mod1 + value1 * coeff2 * mod2) % (mod1 * mod2)


def solve_crt_equation(inputs):
    """
    Takes a list of tuples:
    [ (value1, mod1), (value2, mod2), ..., (value{n}, mod{n}) ]
    which represents the equation
        x = value1 (mod mod1)
        x = value2 (mod mod2)
        ...
        x = value{n} (mod mod{n})
    and finds the unique solution modulo the product of the moduli

    Returns a tuple (value, mod)
    """
    while len(inputs) > 1:
        first = inputs.pop()
        second = inputs.pop()
        value = solve_two_crt_equations(first[0], first[1], second[0], second[1])
        modulo = first[1] * second[1]
        inputs.append((value, modulo))
    return inputs[0]


inputs = [i.strip() for i in open("q13_input.txt", "r")]

timestamp = int(inputs[0])
bus_ids = list(filter(lambda x: x != "x", [value for value in inputs[1].split(",")]))


min_diff = 9999
min_id = -1
for value in bus_ids:
    id = int(value)
    if (id - timestamp % id) < min_diff:
        min_diff = id - timestamp % id
        min_id = id

print(min_id * min_diff)

times = [value for value in inputs[1].split(",")]
mods = []

for count, value in enumerate(times):
    if value != "x":
        mods.append((-1 * count, int(value)))

print(solve_crt_equation(mods)[0])
