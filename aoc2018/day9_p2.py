class Node:
    def __init__(self, before, after, value):
        self.value = value
        self.before = before
        self.after = after

    def set_before(self, node):
        self.before = node

    def set_after(self, node):
        self.after = node

    def print_node(self, amount):
        """
		used for debugging
		"""
        if amount == 0:
            return
        print self.value,
        self.after.print_node(amount - 1)


def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


l = read_input("day9.txt")
# example = (9, 25)
# example = (10,1618)
# example = (13, 7999)
# example = (17,1104)
# example = (21, 6111)
# example = (30, 5807)
# players, marbles = example[0], example[1]
l = l[0].split()
players, marbles = int(l[0]), int(l[6])
marbles *= 100
a = Node(None, None, 0)
a.set_after(a)
a.set_before(a)
current = a
scores = {}
for i in xrange(1, marbles + 1):
    if i % 23 == 0:
        for x in range(7):
            current = current.before
        current.before.set_after(current.after)
        current.after.set_before(current.before)
        score = i + current.value
        current = current.after
        player = i % players
        if player in scores:
            scores[player] += score
        else:
            scores[player] = score
    else:
        current = current.after
        new = Node(current, current.after, i)
        current.after.set_before(new)
        current.set_after(new)
        current = current.after
print max(scores.values())
