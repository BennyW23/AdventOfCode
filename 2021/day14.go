package main

import (
	"2021/util"
	"fmt"
	"math"
	"strings"
)

func Day14() {
	fmt.Printf("\nDay 14: \n")
	stringData := util.ReadInput("./day14_input.txt")

	pairs := make(map[string]string)
	polymer := []rune(stringData[0])

	for i := 2; i < len(stringData); i++ {
		values := strings.Split(stringData[i], " -> ")
		pairs[values[0]] = values[1]
	}

	evolution := make(map[string]struct{first string; second string})
	for pair, result := range pairs {
		evolution[pair] = struct{first string; second string} {
			string(pair[0]) + result,
			result + string(pair[1]),
		}
	}
	_, _ = polymer, evolution

	frequencies := make(map[string]int64)
	for i := 0; i < len(polymer) - 1; i++ {
		frequencies[string(polymer[i:i+2])]++
	}

	for iter := 0; iter < 10; iter++ {
		frequencies = frequencyEvolution(frequencies, evolution)
	}

	individualFreq := parsePairFrequencyToIndividual(frequencies, polymer[0], polymer[len(polymer) - 1])

	maxFreq := int64(0)
	minFreq := int64(math.MaxInt64)
	for _, val := range individualFreq {
		trueValue := val / 2
		if trueValue > maxFreq {
			maxFreq = trueValue
		}
		if trueValue < minFreq {
			minFreq = trueValue
		}
	}

	fmt.Printf("Part 1: %d\n", maxFreq - minFreq)

	for iter := 0; iter < 30; iter++ {
		frequencies = frequencyEvolution(frequencies, evolution)
	}

	individualFreq = parsePairFrequencyToIndividual(frequencies, polymer[0], polymer[len(polymer) - 1])

	maxFreq = int64(0)
	minFreq = int64(math.MaxInt64)
	for _, val := range individualFreq {
		trueValue := val / 2
		if trueValue > maxFreq {
			maxFreq = trueValue
		}
		if trueValue < minFreq {
			minFreq = trueValue
		}
	}

	fmt.Printf("Part 2: %d\n", maxFreq - minFreq)
}

func frequencyEvolution(frequencies map[string]int64, evolution map[string]struct{first string; second string}) map[string]int64{
	newFreq := make(map[string]int64)

	for key, val := range frequencies {
		result, exists := evolution[key]
		if exists {
			newFreq[result.first] += val
			newFreq[result.second] += val
		} else {
			newFreq[key] += val
		}
	}

	return newFreq
}

func parsePairFrequencyToIndividual(frequencies map[string]int64, first rune, last rune) map[rune]int64 {
	individualFreq := make(map[rune]int64)
	// this will double count all the letters except for the first and last
	for pair, val := range frequencies {
		firstVal, secondVal := []rune(pair)[0],[]rune(pair)[1]
		individualFreq[firstVal] += val
		individualFreq[secondVal] += val
	}

	// make all values double counted
	individualFreq[first]++
	individualFreq[last]++

	return individualFreq

}