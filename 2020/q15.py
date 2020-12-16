numbers = [0,3,6]

while len(numbers) < 2020:
    last_number = numbers[-1]
    if numbers.count(last_number) == 1:
        next_number = 0
    else:
        for i in range(len(numbers) - 2, -1, -1):
            if numbers[i] == last_number:
                next_number = len(numbers) - i - 1
                break

    numbers.append(next_number)


print(numbers[-1])
print(numbers)


numbers = [0,3,6]
dict = {}
cur_index = 0
for num in numbers:
    dict[num] = cur_index
    cur_index += 1

print(dict, cur_index)
number = 0

for i in range(2):
    new_num = cur_index - dict.get(number, cur_index)
    dict[number] = cur_index
    print(number, new_num)
    number = new_num
    cur_index += 1
    print(dict, cur_index)
