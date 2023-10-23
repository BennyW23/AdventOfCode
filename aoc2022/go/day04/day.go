package day04

import (
	"fmt"
	"strconv"
	"strings"

	"goutil"
)

func Solve() {
	fmt.Printf("\nDay 04: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day04.txt")

	containsPairs := 0
	overlappingPairs := 0
	for _, pair := range stringData {
		data := strings.Split(pair, ",")
		a := strings.Split(data[0], "-")
		b := strings.Split(data[1], "-")

		aStart, _ := strconv.Atoi(a[0])
		aEnd, _ := strconv.Atoi(a[1])
		bStart, _ := strconv.Atoi(b[0])
		bEnd, _ := strconv.Atoi(b[1])

		aContainsB, bContainsA := eachContains([]int{aStart, aEnd}, []int{bStart, bEnd})
		if aContainsB || bContainsA {
			containsPairs += 1
		}

		if hasOverlap([]int{aStart, aEnd}, []int{bStart, bEnd}) {
			overlappingPairs += 1
		}
	}

	partOneAns := containsPairs
	fmt.Printf("Part 1: %v\n", partOneAns)

	partTwoAns := overlappingPairs
	fmt.Printf("Part 2: %v\n", partTwoAns)
}

func eachContains(a []int, b []int) (aContainsB bool, bContainsA bool) {
	if a[0] <= b[0] && b[1] <= a[1] {
		aContainsB = true
	}
	if b[0] <= a[0] && a[1] <= b[1] {
		bContainsA = true
	}

	return aContainsB, bContainsA
}

func hasOverlap(a []int, b []int) bool {
	if a[0] <= b[0] && b[0] <= a[1] {
		return true
	}
	if a[0] <= b[1] && b[1] <= a[1] {
		return true
	}
	if b[0] <= a[0] && a[0] <= b[1] {
		return true
	}
	if b[0] <= a[1] && a[1] <= b[1] {
		return true
	}

	return false
}
