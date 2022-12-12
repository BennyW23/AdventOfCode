def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


#
l = read_input("day5.txt")
inp = l[0]
# inp = 'dabAcCaCBAcCcaDA'
i = 0
while i < len(inp) - 1:
    if inp[i].lower() == inp[i + 1].lower() and inp[i] != inp[i + 1]:
        inp = inp[:i] + inp[i + 2 :]
        i = max(0, i - 1)
    else:
        i += 1

print len(inp)
