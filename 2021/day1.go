package main

import (
	"2021/util"
	"fmt"
	"strconv"
)

func Day1() {
	fmt.Printf("\nDay 1: \n")
	stringData := util.ReadInput("./day1.txt")

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

