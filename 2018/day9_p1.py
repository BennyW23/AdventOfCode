def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

def minus_seven(current, game):
	if current - 7 > -1:
		return current - 7
	else:
		return current + len(game) - 7

def add_1(current,game):
	if current + 1 < len(game):
		return current + 1
	else:
		return 0

l = read_input('day9.txt')
#example = (9, 25)
#example = (10,1618)
#example = (13, 7999)
#example = (17,1104)
#example = (21, 6111)
#example = (30, 5807)
#players, marbles = example[0], example[1]
l = l[0].split()
players, marbles = int(l[0]), int(l[6])
game = [0]
current = 0
scores = {}

for i in xrange(1, marbles+1):
	if i % 500000 == 0:
		print i
	player = i % players
	if i % 23 == 0:
		current = minus_seven(current, game)
		score = i + game.pop(current)
		if player in scores:
			scores[player] += score
		else:
			scores[player] = score
	else:
		current = add_1(current, game)
		game.insert(current + 1, i)
		current = add_1(current, game)

print max(scores.values())

