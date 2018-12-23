def read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

#l = read_input('day7example.txt')
l = read_input('day7.txt')

def get_num(let):
	return ord(let) - 65

def available(required, done):
	for item in required:
		if item not in done:
			return False
	return True

def find_not_busy(workers):
	for i in range(len(workers)):
		if workers[i] == (-1,-1):
			return i
	return False

def find_min_time(workers):
	min_time = 1000
	for i in range(len(workers)):
		if workers[i][1] != -1:
			if workers[i][1] < min_time:
				min_time = workers[i][1]
	return min_time

required = [[] for i in range(26)]
for i in range(len(l)):
	before, after = l[i].split()[1],l[i].split()[7]

	required[get_num(after)].append(get_num(before))
#if something in required is empty, then it is available to be done

'''
todo = []
i = 0
while True:
	if i in todo:
		i += 1
	elif i >= len(required):
		break
	elif available(required[i], todo):
		todo.append(i)
		i = 0
	else:
		i += 1
print todo
''' #part 1 code, how I had it originally
todo = range(26)

t = 0
workers = [(-1,-1)] * 5
done = []
#each entry will be (task #, time left)
#(-1, -1) means not busy
while len(todo) > 0:
	#load up all the workers I can with tasks
	for i in range(len(workers)):
		if workers[i] == (-1,-1):
			for task in todo:
				if available(required[task], done):
					workers[i] = (task, 61 + task)
					todo.remove(task)
					break
	time_elapsed = find_min_time(workers)
	#instead of going second by second, skip to the next time that a task finishes
	t += time_elapsed
	for i in range(len(workers)):
		if workers[i][0] == -1:
			#ignore idle workers
			pass
		elif workers[i][1] - time_elapsed > 0:
			workers[i] = (workers[i][0], workers[i][1] - time_elapsed)
		elif workers[i][1] - time_elapsed == 0:
			#finished workers become idle
			done.append(workers[i][0])
			workers[i] = (-1,-1)

print t
