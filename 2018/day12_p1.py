def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

class Pot:
	def __init__(self, id, plant):
		self.id = id
		self.plant = plant


def getPlant WithId(plants, id):
	for pot in plants:
		if pot.id == id:
			return pot

plants = []
