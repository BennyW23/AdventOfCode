def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


l = read_input("day1.txt")

# part 1
s = 0
for i in l:
    i = int(i)
    s += (i / 3) - 2
print s


# part 2
f = 0
s = 0
for i in l:
    i = int(i)
    f = (i / 3) - 2
    while f > 0:
        s += f
        f = (f / 3) - 2

print s
