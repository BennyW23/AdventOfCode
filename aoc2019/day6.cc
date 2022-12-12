#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string>
#include <vector>
#include <unordered_map>
#include <set>


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

struct Mass {
	public:
		Mass(std::string n): parent(NULL), name(n), depth(0), children(0) {}
		Mass * parent;
		std::vector<Mass *> children;
		int depth;
		std::string name;
};

// EFFECTS: recursively sets the depths from the top of the tree for each node
//			returns the sum of the depths
// ASSUMES that the root already has a given depth
int set_depths_and_sum(Mass * root) {
	int sum = root->depth;
	if (root == NULL)
		return 0;
	for (size_t i = 0; i < root->children.size(); i++) {
		root->children.at(i)->depth = root->depth + 1;
		sum += set_depths_and_sum(root->children.at(i));
	}
	return sum;
}

void free_the_masses(Mass* root) {
	if (root == NULL)
		return;
	for (size_t i = 0; i < root->children.size(); i++) {
		free_the_masses(root->children.at(i));
	}
	delete root;
}

int main() {
	std::vector<std::string> input = read_input("day6.txt");
	//print(input);

	// kind of cheating here and taking advantage of the formatting
	// assuming it's always a 3 digit string on either side
	// other way would be to look for the )
	std::unordered_map < std::string, Mass * > map;

	Mass * root;
	Mass * parent_mass;
	Mass * child_mass;
	std::string parent_key;
	std::string child_key;

	for (std::string line : input) {
		//displaying and parsing the line
		//std::cout << line.substr(0,3) << ' ' << line.substr(4,7) << std::endl;
		parent_key = line.substr(0,3);
		child_key = line.substr(4,7);

		// making sure the nodes exist
		auto parent_it = map.find(parent_key);
		auto child_it = map.find(child_key);
		// set up parent node
		if (parent_it == map.end()) {
			//std::cout << "Made a new mass with key: " << parent_key << std::endl;
			parent_mass = new Mass(parent_key);
			map.insert(std::make_pair(parent_key, parent_mass));
		} else {
			parent_mass = parent_it->second;
		}
		// set up child node
		if (child_it == map.end()) {
			//std::cout << "Made a new mass with key: " << child_key << std::endl;
			child_mass = new Mass(child_key);
			map.insert(std::make_pair(child_key, child_mass));
		} else {
			child_mass = child_it->second;
		}

		// set up the links between child and parent
		child_mass->parent = parent_mass;
		parent_mass->children.push_back(child_mass);
	}

	// find the root of the system. ASSUMES that everything is linked together in a tree structure
	root = parent_mass;
	while (root->parent != NULL) {
		root = root->parent;
		//std::cout << root->name << std::endl;
	}

	// PART 1: find the sum of the depths of the tree
	root->depth = 0;
	std::cout << set_depths_and_sum(root) << std::endl;

	// PART 2: find the common ancestor between the two
	// Then, add the differences in depths between the parent of "YOU", the ancestor, and the parent of "SAN"
	Mass * san = map.find("SAN")->second;
	Mass * you = map.find("YOU")->second;
	Mass * temp;
	std::set <Mass *> san_to_root;

	//find the path from "SAN" to the root
	temp = san;
	while (temp->parent != NULL) {
		temp = temp->parent;
		san_to_root.insert(temp);
		//std::cout << temp->name << ' ';
	}
	//std::cout << std::endl;

	// find the first common ancestor, it will be kept in temp
	temp = you;
	while (temp->parent != NULL) {
		temp = temp->parent;
		//std::cout << temp->name << ' ';
		if (san_to_root.count(temp)) {
			break;
		}
	}
	//std::cout << std::endl;
	std::cout << abs((you->depth - 1) - temp->depth) + abs(temp->depth - (san->depth - 1)) << std::endl;
	free_the_masses(root);
}