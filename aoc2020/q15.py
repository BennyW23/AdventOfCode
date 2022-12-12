numbers = [2, 0, 1, 9, 5, 19]
dict = {}
cur_index = 1
for i in range(len(numbers) - 1):
    dict[numbers[i]] = cur_index
    cur_index += 1

last_number = numbers[-1]

while cur_index < 2020:
    new_number = cur_index - dict.get(last_number, cur_index)
    dict[last_number] = cur_index
    last_number = new_number
    cur_index += 1

print(new_number)

while cur_index < 30000000:
    new_number = cur_index - dict.get(last_number, cur_index)
    dict[last_number] = cur_index
    last_number = new_number
    cur_index += 1

print(new_number)
