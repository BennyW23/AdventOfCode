#include <iostream>
#include <fstream>
#include <string>
#include <vector>

std::vector<std::string> read_input(std::string filename) {
	std::fstream inputFile;
	std::vector<std::string> result;
	inputFile.open(filename);
	if (inputFile.is_open()) {
		std::string line;
		while (getline(inputFile,line)) {
	      result.push_back(line);
		}
	    inputFile.close();
	}
	return result;
}

void print(std::vector<std::string> v, std::string name = "") {
	if (!name.empty()) {
		name = name.append(" ");
	}
	for (size_t i = 0; i < v.size(); i++) {
		std::cout << name << "index "  << i << ": " << v.at(i) << std::endl;
	}
	std::cout << std::endl;
}

int main() {
	std::vector<std::string> input;
	input = read_input("day1.txt");
	//print(input, "input");

	int s1 = 0;
	int s2 = 0;
	int f;
	int cur;
	for (size_t i = 0; i < input.size(); i++) {
		cur = stoi(input.at(i));
		f = (cur / 3) - 2;
		s1 += f;
		while (f > 0) {
			s2 += f;
			f = (f/3) - 2;
		}
	}

	std::cout << "Part 1: " << s1 << std::endl << "Part 2: " << s2 << std::endl;
	return 0;
}

/*read_input(inp):
	f = open (inp, 'r')
	l = f.readlines()
	for i in range(len(l)):
		l[i] = l[i].strip('\n')
	return l

l = read_input('day1.txt')

# part 1
s = 0;
for i in l:
	i = int(i)
	s += (i /3) -2
print s


#part 2
f = 0
s = 0
for i in l:
	i = int(i)
	f = (i /3) - 2
	while (f > 0):
		s += f
		f = (f/3) - 2

print s
*/