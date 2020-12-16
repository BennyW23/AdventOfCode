inputs = [i.strip() for i in open("q13_input.txt", "r")]

# use mod
timestamp = int(inputs[0])
bus_ids = list(filter(lambda x : x != 'x', [value for value in inputs[1].split(',')]))

min_diff = 9999
min_id = -1
for value in bus_ids:
    id = int(value)
    if (id - timestamp % id) < min_diff:
        min_diff =(id - timestamp % id)
        min_id = id

print(min_id * min_diff)

times = [value for value in inputs[1].split(',')]
print(times)