#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <set>
#include <map>
#include <stdlib.h>


std::string up_string = "U";
std::string down_string = "D";
std::string left_string = "L";
std::string right_string = "R";

std::vector<std::string> read_input(std::string filename) {
	std::fstream input_file;
	std::vector<std::string> result;
	input_file.open(filename);
	if (input_file.is_open()) {
		std::string line;
		while (getline(input_file,line)) {
	      result.push_back(line);
		}
	    input_file.close();
	}
	return result;
}

std::vector<std::string> split_on_comma(std::string input) {
	std::vector< std::string > result;
	size_t first_index = 0;
	size_t second_index = input.find(",");

	while ( second_index != std::string::npos) {
		result.push_back(input.substr(first_index, second_index - first_index));
		first_index = second_index + 1;
		second_index = input.find(",", first_index, 1);
	}
	result.push_back(input.substr(first_index, second_index));

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

void get_direction(std::string str, int &dx, int &dy) {
	if (str.compare(0, 1, right_string) == 0) {
		dx = 1;
		dy = 0;
	} else if (str.compare(0, 1, left_string) == 0) { 
		dx = -1;
		dy = 0;
	} else if (str.compare(0, 1, up_string) == 0) { 
		dx = 0;
		dy = -1;
	} else if (str.compare(0, 1, down_string) == 0) { 
		dx = 0;
		dy = 1;
	}
}

int main() {
	// parsing input
	std::vector<std::string> input;
	input = read_input("day3.txt");
	std::vector<std::string> wire1 = split_on_comma(input.at(0));
	std::vector<std::string> wire2 = split_on_comma(input.at(1));

	std::set< std::pair< int, int > > first_set; // stores the set of positions reached
	std::map< std::pair< int, int >, int> map; // stores the count for part 2
	int dx;
	int dy;

	int x_pos = 0;
	int y_pos = 0;
	int count = 0;

	// iterate through first set of wires
	for (size_t i = 0; i < wire1.size(); i++) {
		get_direction(wire1.at(i), dx, dy);
		int iterations = stoi(wire1.at(i).substr(1));
		for (int i = 0; i < iterations; i++) {
			x_pos += dx;
			y_pos += dy;
			count++;
			std::pair<int,int> position = std::make_pair(x_pos,y_pos);
			first_set.insert(position);
			map[position] = count;
		}
	}

	// reset variables
	x_pos = 0;
	y_pos = 0;
	count = 0;
	int min_dist = 999999;
	int min_count = 9999999;

	// iterate through the second set of wires
	for (size_t i = 0; i < wire2.size(); i++) {
		get_direction(wire2.at(i), dx, dy);
		int iterations = stoi(wire2.at(i).substr(1));
		for (int i = 0; i < iterations; i++) {
			x_pos += dx;
			y_pos += dy;
			count++;
			std::pair<int,int> position= std::make_pair(x_pos,y_pos);
			if (first_set.find(position) != first_set.end()) {
				if (abs(position.first) + abs(position.second) < min_dist) {
					min_dist = abs(position.first) + abs(position.second);
				}
				if (map[position] + count < min_count) {
					min_count = map[position] + count;
				}
			}
		}
	}

	std::cout << "Part 1: " << min_dist << std::endl;
	std::cout << "Part 2: " << min_count << std::endl;

}