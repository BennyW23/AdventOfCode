def read_input(inp):
    f = open(inp, "r")
    l = f.readlines()
    for i in range(len(l)):
        l[i] = l[i].strip("\n")
    return l


# l = read_input('day8ex.txt')
l = read_input("day8.txt")

inp = l[0].split()
inp = map(lambda x: int(x), inp)


class Node:
    def __init__(self):
        self.metadata = []
        self.children = []

    def add_child(self, child):
        self.children.append(child)

    def add_metadata(self, data):
        self.metadata.append(data)

    def print_node(self):
        print self.metadata


def parse_input(node, inp, index):
    """
	parses the input, starting at the index given
	returns the node created and the amount of numbers used
	"""
    num_children = inp[index]
    num_meta = inp[index + 1]
    while num_children > 0:
        newnode = Node()
        newnode, used = parse_input(newnode, inp, index + 2)
        node.add_child(newnode)
        index = used
        num_children -= 1

    for i in range(num_meta):
        node.add_metadata(inp[index + 2 + i])
    return node, index + num_meta


def sum_metadata(node):
    s = 0
    for item in node.metadata:
        s += item
    for node in node.children:
        s += sum_metadata(node)
    return s


def value_node(node):
    s = 0
    if len(node.children) == 0:
        for item in node.metadata:
            s += item
        return s
    else:
        for item in node.metadata:
            if item > len(node.children) or item <= 0:
                pass
            else:
                s += value_node(node.children[item - 1])
    return s


a = Node()
a, useless = parse_input(a, inp, 0)
print sum_metadata(a)
print value_node(a)
