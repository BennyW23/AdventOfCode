def read_input(inp):
    f = open("day2.txt", "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


l = read_input("day2.txt")
# l = ["abcdef", "bababc", "abbcde", "abcccd","aabcdd", "abcdee", "ababab"]


def count_n_occurences(n, inp):
    # finds the amount of phrases in which a letter occurs exactly n times
    # assumes n is an integer > 0
    count = 0
    for line in inp:
        cache = {}
        for let in line:
            if let in cache.keys():
                cache[let] -= 1
            else:
                cache[let] = n - 1
        for key in cache:
            if cache[key] == 0:
                count += 1
                break
    return count


cs1 = count_n_occurences(2, l)
cs2 = count_n_occurences(3, l)

print cs1 * cs2


def differ_by(str1, str2):
    count = 0
    for i in range(len(str1)):
        if str1[i] != str2[i]:
            count += 1
    return count


print differ_by("abcde", "axcye")
"""
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
"""
for i in range(len(l)):
    for j in range(i + 1, len(l)):
        if differ_by(l[i], l[j]) == 1:
            print l[i]
            print l[j]
