inp = """set i 31
set a 1
mul p 17
jgz p p
mul a 2
add i -1
jgz i -2
add a -1
set i 127
set p 735
mul p 8505
mod p a
mul p 129749
add p 12345
mod p a
set b p
mod b 10000
snd b
add i -1
jgz i -9
jgz a 3
rcv b
jgz b -1
set f 0
set i 126
rcv a
rcv b
set p a
mul p -1
add p b
jgz p 4
snd a
set a b
jgz 1 3
snd b
set f 1
add i -1
jgz i -11
snd a
jgz f -16
jgz a -19
"""


"""set a 1
add a 2
mul a a
mod a 5
snd a
set a 0
rcv a
jgz a -1
set a 1
jgz a -2"""

"""#part 1
lines = inp.split('\n')
registers = {}
played = 0

cur = 0 
index = 0
while index < len(lines):
	line = lines[index]
	if line == '':
		continue
	command = line[:3]
	regindex = line[4]
	try:
		register = registers[regindex]
	except KeyError:
		register = 0
	
	rem = line[6:].strip()
	if rem == '':
		pass
	elif rem.isalpha() == True:
		try:
			rem = registers[rem]
		except KeyError:
			registers[rem] = 0 
			rem = 0
	else:
		rem = int(rem)

	if command == 'snd':
		played = register

	elif command == 'set':
		register = rem

	elif command == 'add':
		register += rem
	
	elif command == 'mul':
		register *= rem
		
	elif command == 'mod':
		register = register % rem
		
	elif command == 'rcv':
		if register != 0:
			print played
			break

	elif command == 'jgz':
		if register > 0:
			index += rem - 1 
	registers[regindex] = register
	index += 1
"""


def swap(cur):
    if cur == 0:
        cur = 1
    elif cur == 1:
        cur = 0
    return cur


# part 2
lines = inp.split("\n")
registers = [{}, {}]
sent = [[], []]

cur = 0
index = [0, 0]
while index[cur] < len(lines):
    line = lines[index[cur]]
    if line == "":
        continue
    command = line[:3]
    regindex = line[4]
    try:
        register = registers[cur][regindex]
    except KeyError:
        register = 0

    rem = line[6:].strip()
    if rem == "":
        pass
    elif rem.isalpha() == True:
        try:
            rem = registers[cur][rem]
        except KeyError:
            registers[cur][rem] = 0
            rem = 0
    else:
        rem = int(rem)

    if command == "snd":
        sent[cur].append(register)
        # change this for pt2

    elif command == "set":
        register = rem

    elif command == "add":
        register += rem

    elif command == "mul":
        register *= rem

    elif command == "mod":
        register = register % rem

    elif command == "rcv":
        # code this for pt2
        if register != 0:
            print played
            break

    elif command == "jgz":
        if register > 0:
            index[cur] += rem - 1
    registers[cur][regindex] = register
    index[cur] += 1
