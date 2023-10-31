package day06

import (
	"fmt"

	"goutil"
)

func Solve() {
	fmt.Printf("\nDay 06: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day06.txt")

	partOneAns := findFirstWindow(stringData[0], 4)
	fmt.Printf("Part 1: %v\n", partOneAns)

	partTwoAns := findFirstWindow(stringData[0], 14)
	fmt.Printf("Part 2: %v\n", partTwoAns)
}

func findFirstWindow(str string, n int) int {
	if len(str) < n {
		return -1
	}

	bytes := []byte(str)
	count := make(map[byte]int, n)

	for i := 0; i < n-1; i++ {
		count[bytes[i]] = count[bytes[i]] + 1
	}

	for i := n - 1; i < len(bytes); i++ {
		count[bytes[i]] = count[bytes[i]] + 1
		if len(count) == n {
			return i + 1
		}
		if count[bytes[i-n+1]] == 1 {
			delete(count, bytes[i-n+1])
		} else {
			count[bytes[i-n+1]] = count[bytes[i-n+1]] - 1
		}
	}

	return -1
}
