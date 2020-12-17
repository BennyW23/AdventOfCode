def merge(ranges):
    collapsed_ranges = []
    current_min = ranges[0][0]
    current_max = ranges[0][1]
    for i in range(1, len(ranges)):
        if ranges[i][0] <= current_max + 1:
            current_max = max(current_max, ranges[i][1])
        else:
            collapsed_ranges.append((current_min, current_max))
            current_min = ranges[i][0]
            current_max = ranges[i][1]
    collapsed_ranges.append((current_min, current_max))
    return collapsed_ranges


sections = open("q16_input.txt", "r").read().split("\n\n")

rules = [[part.strip() for part in line.split(":")] for line in sections[0].split("\n")]

for rule in rules:
    first, second = rule[1].split(" or ")
    rule.append(tuple([int(value) for value in first.split("-")]))
    rule.append(tuple([int(value) for value in second.split("-")]))
    rule.pop(1)

ticket_lines = [line.strip() for line in sections[2].strip().split("\n")]
tickets = set()
for i in range(1, len(ticket_lines)):
    tickets.add(tuple([int(val) for val in ticket_lines[i].split(",")]))

ranges = [rule[1] for rule in rules] + [rule[2] for rule in rules]
ranges.sort()
collapsed_ranges = set(merge(ranges))

error_sum = 0
valid_tickets = []
for ticket in tickets:
    works = True
    for value in ticket:
        in_range = False
        for possible_range in collapsed_ranges:
            if value in range(possible_range[0], possible_range[1] + 1):
                in_range = True
                break
        if not in_range:
            error_sum += value
            works = False
            break
    if works:
        valid_tickets.append(ticket)

print(error_sum)


indexes = []
for rule in rules:
    possible_indexes = []
    for possible_index in range(len(valid_tickets[0])):
        works = True
        for ticket in valid_tickets:
            value = ticket[possible_index]
            if value not in range(rule[1][0], rule[1][1] + 1) and value not in range(
                rule[2][0], rule[2][1] + 1
            ):
                works = False
                break
        if works:
            possible_indexes.append(possible_index)
    indexes.append((rule[0], possible_indexes))

indexes.sort(key=lambda x: len(x[1]))
departure_indexes = []
used_indexes = set()
for i in indexes:
    for possible_value in i[1]:
        if possible_value not in used_indexes:
            used_indexes.add(possible_value)
            if "departure" in i[0]:
                departure_indexes.append(possible_value)
                break

product = 1
my_ticket = [int(val) for val in sections[1].split("\n")[1].split(",")]
for idx in departure_indexes:
    product *= my_ticket[idx]

print(product)
