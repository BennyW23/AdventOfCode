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
time_asleep = {}  # entries in this are lists of 60 long
# l = read_input('day4ex.txt')


inp = sort_input(l)
for line in inp:
    if line[19] == "G":
        guard_number = int(line[26:].split(" ", 1)[0])
    elif line[19] == "f":
        begintime = int(line[15:17])
    elif line[19] == "w":
        if guard_number in time_asleep:
            tup = time_asleep[guard_number]
            for i in range(begintime, int(line[15:17])):
                tup[i] += 1
            time_asleep[guard_number] = tup
        else:
            tup = [0 for i in range(0, 60)]
            for i in range(begintime, int(line[15:17])):
                tup[i] += 1
            time_asleep[guard_number] = tup

maxid = 0
maxminute = 0
maxvalue = 0

for key, tup in time_asleep.items():
    for i in range(60):
        if tup[i] > maxvalue:
            maxvalue = tup[i]
            maxminute = i
            maxid = key

print maxvalue, maxminute, maxid
print maxminute * maxid
