def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


# l = read_input('day7example.txt')
l = read_input("day7.txt")


def get_num(let):
    return ord(let) - 65


def get_let(num):
    return chr(num + 65)


def available(required, done):
    for item in required:
        if item not in done:
            return False
    return True


required = [[] for i in range(26)]
for i in range(len(l)):
    before, after = l[i].split()[1], l[i].split()[7]

    required[get_num(after)].append(get_num(before))
# if something in required is empty, then it is available to be done

done = []
i = 0
while True:
    if i in done:
        i += 1
    elif i >= len(required):
        break
    elif available(required[i], done):
        done.append(i)
        i = 0
    else:
        i += 1

order = ""
for num in done:
    order = order + get_let(num)
print order
