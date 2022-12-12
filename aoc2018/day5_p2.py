def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


#
l = read_input("day5.txt")
original = l[0]
# original = 'dabAcCaCBAcCcaDA'
inp = original

shortest = 10368

i = 0
while i < len(inp) - 1:
    if inp[i].lower() == inp[i + 1].lower() and inp[i] != inp[i + 1]:
        inp = inp[:i] + inp[i + 2 :]
        i = max(0, i - 1)
    else:
        i += 1

shortest = len(inp)
shortestlet = ""

alphabet = [chr(i) for i in range(97, 123)]
for let in alphabet:
    inp = original
    i = 0
    while i < len(inp) - 1:
        if inp[i].lower() == let:
            inp = inp[:i] + inp[i + 1 :]
            i = max(0, i - 1)
        elif inp[i].lower() == inp[i + 1].lower() and inp[i] != inp[i + 1]:
            inp = inp[:i] + inp[i + 2 :]
            i = max(0, i - 1)
        else:
            i += 1
    if inp[-1].lower() == let:
        inp = inp[:-1]
    if len(inp) < shortest:
        shortest = len(inp)
        shortestlet = let

print shortest
print shortestlet
