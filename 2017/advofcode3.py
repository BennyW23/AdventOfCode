inp = 23
""" #manual, slow way
dist = 0
prev = 0
marker = 1
ring = 1
times = 0
while inp > marker:
    if inp == marker:
        pass
    elif times != 4:
        prev = marker
        marker += ring * 2
        times += 1
    elif times == 4:
        prev = marker
        ring += 1
        marker += ring * 2
        times = 1

print inp, marker, prev, ring

dist = (ring) * 2
while inp != marker and inp != prev:
    dist -= 1
    prev += 1
    marker -= 1
print dist
"""

for inp in range(1, 30):
    ring = (int((inp - 1) ** 0.5) + 1) / 2
    nearestroot = int((inp ** 0.5) + 0.5)
    nearestoddroot = int((inp ** 0.5) + 1)
    print inp, ring, nearestoddroot

    dist = (
        nearestroot - 1
    ) * 2  # subtract 1 to account for 1 being the 0th ring, multiply by 2 because manhattan distance
    # note that the amount of times subtracted as we go through the memory is the same as the amount added afterwards and is the same as the ring
    length = ring

    if inp > nearestroot ** 2:
        continue

    elif inp < nearestroot ** 2:
        continue

    print inp
