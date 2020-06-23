def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


def sort_input(l):
    ans = []
    for line in l:
        i = 0
        while True:
            if i == len(ans):
                ans.append(line)
                break
            elif before(line, ans[i]):
                ans.insert(i, line)
                break
            else:
                i += 1
    return ans


def before(l1, l2):
    mo1, mo2 = int(l1[6:8]), int(l2[6:8])
    d1, d2 = int(l1[9:11]), int(l2[9:11])
    h1, h2 = int(l1[12:14]), int(l2[12:14])
    m1, m2 = int(l1[15:17]), int(l2[15:17])
    if mo1 == mo2:
        if d1 == d2:
            if h1 == h2:
                return m1 < m2
            else:
                return h1 < h2
        else:
            return d1 < d2
    else:
        return mo1 < mo2


l = read_input("day4.txt")
guard_number = 0
time_asleep = {}
# l = read_input('day4ex.txt')


inp = sort_input(l)
for line in inp:
    if line[19] == "G":
        guard_number = int(line[26:].split(" ", 1)[0])
    elif line[19] == "f":
        begintime = int(line[15:17])
    elif line[19] == "w":
        if guard_number in time_asleep:
            time_asleep[guard_number] += int(line[15:17]) - begintime
        else:
            time_asleep[guard_number] = int(line[15:17]) - begintime
    else:
        print "error"
        break

maxvalue = 0
maxkey = 0
for key, value in time_asleep.items():
    if value > maxvalue:
        maxkey = key
        maxvalue = value
print maxkey, maxvalue

asleep = []
for i in range(0, 60):
    asleep.append(0)

skip = True
for line in inp:
    if line[19] == "G":
        if maxkey == int(line[26:].split(" ", 1)[0]):
            skip = False
        else:
            skip = True
    if skip == True:
        continue
    elif line[19] == "f":
        begintime = int(line[15:17])
    elif line[19] == "w":
        for i in range(begintime, int(line[15:17])):
            asleep[i] += 1

maxvalue = 0
maxindex = 0
for i in range(0, 60):
    if asleep[i] > maxvalue:
        maxindex = i
        maxvalue = asleep[i]

print maxvalue
print maxindex * maxkey
