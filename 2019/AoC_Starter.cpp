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