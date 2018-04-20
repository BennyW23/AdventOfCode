#include <iostream>
#include <string>
#include <vector>
#include <locale>
#include <sstream>

int main(){
	int sum = 0;
	std::locale loc;
	std::string line;
	int index;
	std::vector <char> letters;

	while (std:: getline(std::cin, line)) {
		std::stringstream ss; 
		letters.clear();
		index = 0;
		std::string numbers;
		int checksum = 0;
		
		//iterates through the first part with letters and dashes, takes out the letters
		while (line.at(index) != '['){
			
			if (std::isalpha(line.at(index), loc))
				letters.push_back(line.at(index));
			else if (std::isdigit(line.at(index)))
				numbers += line.at(index);
			index += 1;
		}
		
		ss << numbers;
		ss >> checksum;
		
		
		for (unsigned int i = 0; i < letters.size(); i++)
			std::cout << letters[i];
		
		std::cout << ' ' << ' ' <<  checksum << std::endl;
		
		
		
	}
	return 0;
	
}
