class Node:
    def __init__(self, value, next_node=None):
        self.value = value
        self.next = next_node


inp = "284573961"

for part in range(1, 3):
    if part == 1:
        num_cups = 9
        num_turns = 100

    if part == 2:
        num_cups = 1000000
        num_turns = 10000000

    cups = {}

    current = Node(int(inp[0]))

    cups[int(inp[0])] = current
    prev_node = current
    for val in [int(let) for let in inp[1:]]:
        cups[val] = Node(val)
        prev_node.next = cups[val]
        prev_node = cups[val]

    for val in range(len(cups) + 1, num_cups + 1):
        cups[val] = Node(val)
        prev_node.next = cups[val]
        prev_node = cups[val]

    prev_node.next = current

    picked_up = []
    for turn in range(num_turns):
        destination = current.value
        picked_up = current.next
        current.next = picked_up.next.next.next
        current = current.next

        valid_dest = False
        while not valid_dest:
            valid_dest = True

            if destination <= 1:
                destination = num_cups
            else:
                destination -= 1
            node = picked_up
            for i in range(3):
                if node.value == destination:
                    valid_dest = False
                    break
                node = node.next

        destination_node = cups[destination]
        final_node = destination_node.next
        destination_node.next = picked_up
        picked_up.next.next.next = final_node

    cup = cups[1]

    if part == 1:
        for i in range(num_cups - 1):
            cup = cup.next
            print(cup.value, end="")
        print()
    else:
        print(cup.next.value * cup.next.next.value)
