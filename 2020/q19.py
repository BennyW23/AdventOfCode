import re


def get_regex(rule_num):
    if rule_num in regex:
        return regex[rule_num]
    rule_content = rules.get(rule_num)
    regex_content = None
    if type(rule_content) == str:
        regex_content = rule_content
    elif type(rule_content) == tuple:
        regex_content = "".join([get_regex(rule_num) for rule_num in rule_content])
    elif type(rule_content) == list:
        possibilities = []
        for individual_rule in rule_content:
            possible_rule = "".join([get_regex(rule_num) for rule_num in individual_rule])
            possibilities.append(possible_rule)
        regex_content = "(" + "|".join(possibilities) + ")"

    regex[rule_num] = regex_content
    return regex_content


lines = [line.strip() for line in open("q19_input.txt", "r").read().split("\n\n")[0].strip().split("\n")]

regex = {}
rules = {}
pattern = re.compile('"[a-z]"')

for line in lines:
    values = line.split()
    rule_num = values[0][:-1]
    entry = None
    if pattern.match(values[1]):
        entry = values[1][1]
    elif "|" not in values:
        entry = tuple(values[1:])
    else:
        entry = []
        entry.append(tuple(values[1 : values.index("|")]))
        entry.append(tuple(values[values.index("|") + 1 :]))

    rules[rule_num] = entry


values = [line.strip() for line in open("q19_input.txt", "r").read().split("\n\n")[1].strip().split("\n")]


pattern_part_1 = re.compile(get_regex("0"))

regex_content = "((" + get_regex("42") + ")+)(" + get_regex("31") + ")+"
pattern_part_2 = re.compile(regex_content)
pattern_42 = re.compile(get_regex("42"))
pattern_31 = re.compile(get_regex("31"))

total_1 = 0
total_2 = 0
for value in values:
    if pattern_part_1.fullmatch(value) is not None:
        total_1 += 1
    if pattern_part_2.fullmatch(value) is not None:
        idx = len(pattern_part_2.fullmatch(value).group(1))
        count1 = sum(1 for m in re.finditer(get_regex("42"), value[:idx]))
        count2 = sum(1 for m in re.finditer(get_regex("31"), value[idx:]))
        if count1 > count2:
            total_2 += 1

print(total_1)
print(total_2)
