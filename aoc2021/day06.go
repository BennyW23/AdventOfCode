package main

import (
	"2021/util"
	"fmt"
	"strconv"
	"strings"
)

func Day6() {
	fmt.Printf("\nDay 6: \n")
	stringData := util.ReadInput("./day06.txt")
	initialFish := strings.Split(stringData[0], ",")
	numDaysPart1 := 80
	numDaysPart2 := 256

	fishCount := make(map[int]int)
	for _, val := range initialFish {
		days, _ := strconv.Atoi(val)
		fishCount[days]++
	}

	for i := 0; i < numDaysPart1; i++ {
		numZeros := fishCount[0]
		for day := 0; day < 8; day++ {
			fishCount[day] = fishCount[day+1]
		}
		fishCount[8] = numZeros
		fishCount[6] += numZeros
	}

	total := 0
	for _, numFish := range fishCount {
		total += numFish
	}

	fmt.Printf("Part 1: %d\n", total)

	for i := 0; i < numDaysPart2-numDaysPart1; i++ {
		numZeros := fishCount[0]
		for day := 0; day < 8; day++ {
			fishCount[day] = fishCount[day+1]
		}
		fishCount[8] = numZeros
		fishCount[6] += numZeros
	}

	total = 0
	for _, numFish := range fishCount {
		total += numFish
	}

	fmt.Printf("Part 2: %d\n", total)
}
