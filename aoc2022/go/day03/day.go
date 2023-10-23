package day03

import (
	"fmt"
	"unicode/utf8"

	"goutil"
)

func Solve() {
	fmt.Printf("\nDay 03: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day03.txt")

	prioSum := 0
	for _, rucksack := range stringData {
		firstCompartment := rucksack[:len(rucksack)/2]
		secondCompartment := rucksack[len(rucksack)/2:]

		shared := findShared(firstCompartment, secondCompartment)
		r, _ := utf8.DecodeRuneInString(shared)
		prioSum += priority(r)
	}

	partOneAns := prioSum
	fmt.Printf("Part 1: %v\n", partOneAns)

	prioSum = 0
	for i := 0; i < len(stringData); i += 3 {
		shared := findShared(stringData[i], stringData[i+1])
		shared = findShared(shared, stringData[i+2])
		r, _ := utf8.DecodeRuneInString(shared)
		prioSum += priority(r)
	}
	partTwoAns := prioSum
	fmt.Printf("Part 2: %v\n", partTwoAns)
}

func findShared(a string, b string) string {
	seen := make(map[rune]bool, len(a))
	for _, r := range a {
		seen[r] = true
	}
	result := make([]rune, 0)
	for _, r := range b {
		if seen[r] {
			result = append(result, r)
		}
	}

	return string(result)
}

func priority(r rune) int {
	if 'a' <= r && r <= 'z' {
		return int(r - 'a' + 1)
	}
	if 'A' <= r && r <= 'Z' {
		return int(r - 'A' + 27)
	}
	panic("illegal priority")
}
