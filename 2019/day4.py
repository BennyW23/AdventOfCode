minimum = 402328
maximum = 864247


list_of_nums = []
# brute force algorithm for part 1
for digit1 in range(4, 10):
    for digit2 in range(digit1, 10):
        for digit3 in range(digit2, 10):
            for digit4 in range(digit3, 10):
                for digit5 in range(digit4, 10):
                    for digit6 in range(digit5, 10):
                        s = set()
                        s.add(digit1)
                        s.add(digit2)
                        s.add(digit3)
                        s.add(digit4)
                        s.add(digit5)
                        s.add(digit6)
                        num = int(
                            str(digit1)
                            + str(digit2)
                            + str(digit3)
                            + str(digit4)
                            + str(digit5)
                            + str(digit6)
                        )
                        if len(s) < 6 and num <= 864247:
                            list_of_nums.append(num)

print len(list_of_nums)

# helper function that does all the work for part 2
def check_for_double(num):
    cur = 1
    num_string = str(num)
    for index in range(len(num_string) - 1):
        if num_string[index] == num_string[index + 1]:
            cur += 1
        else:
            if cur == 2:
                return True
            cur = 1
    return cur == 2


# filter the list
filtered_nums = filter(check_for_double, list_of_nums)
print len(filtered_nums)
