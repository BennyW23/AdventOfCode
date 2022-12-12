package main

import (
	"2021/util"
	"fmt"
	"strconv"
	"strings"
)

func Day3() {
	fmt.Printf("\nDay 3: \n")
	stringData := util.ReadInput("./day03.txt")

	var frequencies = countAllFrequencies(stringData)

	stringLength := len(stringData[0])
	numStrings := len(stringData)
	var gammaBuilder strings.Builder
	var epsilonBuilder strings.Builder
	for i := 0; i < stringLength; i++ {
		if frequencies[i] > numStrings/2 {
			gammaBuilder.WriteString("1")
			epsilonBuilder.WriteString("0")
		} else {
			gammaBuilder.WriteString("0")
			epsilonBuilder.WriteString("1")
		}
	}

	gamma, _ := strconv.ParseInt(gammaBuilder.String(), 2, 32)
	epsilon, _ := strconv.ParseInt(epsilonBuilder.String(), 2, 32)
	fmt.Printf("Part 1: %d\n", gamma*epsilon)

	oxygenFilter, carbonFilter := make([]string, 0), make([]string, 0)
	var mostFrequentFirstChar byte = '0'
	if frequencies[0] >= numStrings/2 {
		mostFrequentFirstChar = '1'
	}

	// initialize the lists with the first elements
	for _, str := range stringData {
		if str[0] == mostFrequentFirstChar {
			oxygenFilter = append(oxygenFilter, str)
		} else {
			carbonFilter = append(carbonFilter, str)
		}
	}

	for index := 1; index < stringLength; index++ {
		if len(oxygenFilter) < 2 {
			break
		}

		frequency := countOnesAtIndex(oxygenFilter, index)
		numOxygen := len(oxygenFilter)

		var mostCommon byte = '0'
		if 2*frequency >= numOxygen {
			mostCommon = '1'
		}

		oxygenFilter = applyFilter(oxygenFilter, mostCommon, index)
	}

	for index := 1; index < stringLength; index++ {
		if len(carbonFilter) < 2 {
			break
		}

		frequency := countOnesAtIndex(carbonFilter, index)
		numCarbon := len(carbonFilter)

		var leastCommon byte = '1'
		if 2*frequency >= numCarbon {
			leastCommon = '0'
		}

		carbonFilter = applyFilter(carbonFilter, leastCommon, index)
	}

	oxygenValue, _ := strconv.ParseInt(oxygenFilter[0], 2, 32)
	carbonValue, _ := strconv.ParseInt(carbonFilter[0], 2, 32)

	fmt.Printf("Part 2: %d", oxygenValue*carbonValue)
}

func countAllFrequencies(data []string) []int {
	stringLength := len(data[0])
	var frequencies = make([]int, stringLength)
	for _, str := range data {
		for i, v := range str {
			if v == '1' {
				frequencies[i]++
			}
		}
	}
	return frequencies
}

func countOnesAtIndex(data []string, index int) int {
	frequency := 0
	for _, v := range data {
		if v[index] == '1' {
			frequency++
		}
	}
	return frequency
}

func applyFilter(data []string, filterValue uint8, index int) []string {
	filtered := make([]string, 0)
	for _, v := range data {
		if v[index] == filterValue {
			filtered = append(filtered, v)
		}
	}
	return filtered
}
