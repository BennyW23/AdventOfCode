package day01

import (
	"fmt"
	"sort"
	"strconv"

	"goutil"
)

func Solve() {
	fmt.Printf("\nDay 01: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day01.txt")

	elves := make([]int, 0)
	elf := 0
	for _, str := range stringData {
		if str == "" {
			elves = append(elves, elf)
			elf = 0
			continue
		}
		val, err := strconv.Atoi(str)
		if err != nil {
			fmt.Printf("invalid value:%v", str)
		}

		elf += val
	}
	elves = append(elves, elf)

	sort.Sort(sort.Reverse(sort.IntSlice(elves)))

	partOneAns := elves[0]
	fmt.Printf("Part 1: %v\n", partOneAns)

	partTwoAns := elves[0] + elves[1] + elves[2]
	fmt.Printf("Part 2: %v\n", partTwoAns)
}
