f = open("day1.txt", "r")
s = 0

l = f.readlines()
print l
for line in l:
    val = int("".join(line.strip("\n")))
    print val
    s += val

print s
