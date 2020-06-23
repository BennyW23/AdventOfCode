steps = 349

l = [0]
pos = 0

for num in range(1, 2018):
    diff = steps % len(l)
    for iteration in range(diff):
        if pos == len(l) - 1:
            pos = 0
        else:
            pos += 1
    pos += 1
    l.insert(pos, num)

print l[pos + 1]

pos = 0
cur = 0

for num in range(1, 50000000):
    diff = steps % num
    if diff != 0:
        if diff > num - pos - 1:
            pos = diff - (num - pos - 1) - 1
            diff = 0
        else:
            pos += diff
            diff = 0
    if pos == 0:
        cur = num
    pos += 1

print cur
