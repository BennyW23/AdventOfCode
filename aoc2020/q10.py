def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


values = [int(i) for i in read_input("q10_input.txt")]
values.append(0)
values.append(max(values) + 3)
values = sorted(values)

one_off = 0
three_off = 0
for i in range(len(values) - 1):
    if values[i + 1] - values[i] == 1:
        one_off += 1
    elif values[i + 1] - values[i] == 3:
        three_off += 1

print(one_off * three_off)

values.reverse()
cache = {}
cache[values[0]] = 1

for number in values:
    if number == values[0]:
        continue
    cache[number] = cache.get(number + 1, 0) + cache.get(number + 2, 0) + cache.get(number + 3, 0)

print(cache[0])
