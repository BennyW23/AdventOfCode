package main

import (
	"fmt"
	"strconv"

	"goutil"
)

func Day1() {
	fmt.Printf("\nDay 1: \n")
	stringData := goutil.ReadFile("./aoc2021/day01.txt")

	// make slice of ints
	intData := make([]int64, len(stringData))
	for i, v := range stringData {
		intData[i], _ = strconv.ParseInt(v, 10, 64)
	}

	partOneAns := 0
	for i := 1; i < len(intData); i++ {
		if intData[i] > intData[i-1] {
			partOneAns++
		}
	}
	fmt.Printf("Part 1: %d\n", partOneAns)

	partTwoAns := 0
	for i := 3; i < len(intData); i++ {
		if intData[i] > intData[i-3] {
			partTwoAns++
		}
	}
	fmt.Printf("Part 2: %d\n", partTwoAns)
}
