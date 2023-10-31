package day05

import (
	"fmt"
	"strconv"
	"strings"

	"goutil"
)

func Solve() {
	fmt.Printf("\nDay 05: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day05.txt")

	stacks, line := parseStacks(stringData)
	executeCommandsSequentially(stringData[line+1:], stacks)

	partOneAns := getTopOfStacks(stacks)
	fmt.Printf("Part 1: %v\n", partOneAns)

	stacks, line = parseStacks(stringData)
	executeCommandsTogether(stringData[line+1:], stacks)

	partTwoAns := getTopOfStacks(stacks)
	fmt.Printf("Part 2: %v\n", partTwoAns)
}

func getTopOfStacks(stacks [][]string) string {
	stackTop := ""
	for i := 1; i < len(stacks); i++ {
		stackTop = stackTop + stacks[i][len(stacks[i])-1]
	}
	return stackTop
}

func parseStacks(stringData []string) ([][]string, int) {
	stacks := make([][]string, 0)

	line := 0
	for ; strings.TrimSpace(stringData[line]) != ""; line += 1 {
		str := stringData[line]
		offset := 0

		idx := strings.IndexRune(str[offset:], '[')
		for ; idx != -1 && offset < len(str); idx = strings.IndexRune(str[offset:], '[') {
			pos := idx + offset
			stackNum := int(pos / 4)
			for len(stacks) <= stackNum {
				stacks = append(stacks, make([]string, 0))
			}
			stacks[stackNum] = append([]string{str[pos+1 : pos+2]}, stacks[stackNum]...)

			offset = offset + idx + 1
		}
	}
	return append([][]string{[]string{}}, stacks...), line
}

func executeCommandsSequentially(commands []string, stacks [][]string) {
	for _, command := range commands {
		words := strings.Split(command, " ")
		amount, _ := strconv.Atoi(words[1])
		source, _ := strconv.Atoi(words[3])
		dest, _ := strconv.Atoi(words[5])

		for i := 0; i < amount; i++ {
			sourceLen := len(stacks[source])
			stacks[dest] = append(stacks[dest], stacks[source][sourceLen-1])
			stacks[source] = stacks[source][:sourceLen-1]
		}
	}
}

func executeCommandsTogether(commands []string, stacks [][]string) {
	for _, command := range commands {
		words := strings.Split(command, " ")
		amount, _ := strconv.Atoi(words[1])
		source, _ := strconv.Atoi(words[3])
		dest, _ := strconv.Atoi(words[5])

		sourceLen := len(stacks[source])
		stacks[dest] = append(stacks[dest], stacks[source][sourceLen-amount:]...)
		stacks[source] = stacks[source][:sourceLen-amount]
	}
}
