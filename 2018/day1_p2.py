f = open("day1.txt", "r")
s = 0

part1 = 505
cache = []
flag = False
l = f.readlines()
for line in l:
    val = int("".join(line.strip("\n")))
    s += val
    if s in cache:
        print s
        flag = True
        break
    else:
        cache.append(s)

iters = 1
while flag == False:
    for item in cache:
        val = item + iters * part1
        if val in cache:
            print item + iters * part1
            flag = True
            break

    iters += 1
