from collections import defaultdict

d = defaultdict(int)


def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


#
l = read_input("day3.txt")
# = ['#1 @ 1,3: 4x4',  '#2 @ 3,1: 4x4' ,'#3 @ 5,5: 2x2']
c = []  # entries in c are (x,y,w,h) where x,y are pos and w,h are width and height

for i in range(len(l)):
    l[i] = l[i][l[i].index("@") :]
    c.append(
        (
            int(l[i][2 : l[i].index(",")]),
            int(l[i][l[i].index(",") + 1 : l[i].index(":")]),
            int(l[i][l[i].index(":") + 2 : l[i].index("x")]),
            int(l[i][l[i].index("x") + 1 :]),
        )
    )

for claim in c:
    for i in range(claim[0], claim[0] + claim[2]):
        for j in range(claim[1], claim[1] + claim[3]):
            d[(i, j)] += 1

count = 1
for claim in c:
    ok = True
    for i in range(claim[0], claim[0] + claim[2]):
        for j in range(claim[1], claim[1] + claim[3]):
            if d[(i, j)] > 1:
                ok = False
                break
        if ok == False:
            break
    if ok == True:
        print count
    count += 1


ans = 0
for (r, c), v in d.items():
    if v >= 2:
        ans += 1
print ans
