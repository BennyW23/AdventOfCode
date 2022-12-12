package main

import (
	"2021/util"
	"fmt"
	"strconv"
	"strings"
)

func Day4() {
	fmt.Printf("\nDay 4: \n")
	stringData := util.ReadInput("./day04.txt")
	numbers := strings.Split(stringData[0], ",")

	index := 2
	bestNumNumbers := len(numbers) + 1
	bestScore := int64(-1)
	worstNumNumbers := 0
	worstScore := int64(-1)
	for ; index < len(stringData); index += 6 {
		board := Board{make(map[string]int), make(map[int]string)}
		for row := 0; row < 5; row++ {
			rowOffset := 5 * row
			for col, value := range strings.Fields(stringData[index+row]) {
				board.values[value] = rowOffset + col
				board.indexes[rowOffset+col] = value
			}
		}

		numNumbers, score := board.calculateScore(numbers)
		if numNumbers < bestNumNumbers {
			bestNumNumbers = numNumbers
			bestScore = score
		}
		if numNumbers > worstNumNumbers {
			worstNumNumbers = numNumbers
			worstScore = score
		}
	}

	winningNum, _ := strconv.ParseInt(numbers[bestNumNumbers], 10, 64)
	losingNum, _ := strconv.ParseInt(numbers[worstNumNumbers], 10, 64)
	fmt.Printf("Part 1: %d\n", bestScore*winningNum)
	fmt.Printf("Part 2: %d\n", worstScore*losingNum)
}

type Board struct {
	values  map[string]int
	indexes map[int]string
}

func (board Board) calculateScore(numbers []string) (int, int64) {
	usedIndexes := make(map[int]bool)
	for i, number := range numbers {
		index, exists := board.values[number]
		if !exists {
			continue
		}
		usedIndexes[index] = true
		if checkWin(usedIndexes) {
			return i, board.sumUnusedIndexes(usedIndexes)
		}

	}
	return len(numbers) + 1, -1
}

func checkWin(indexes map[int]bool) bool {
	// check each row
	for row := 0; row < 5; row++ {
		win := true
		for col := 0; col < 5; col++ {
			if !indexes[5*row+col] {
				win = false
				break
			}
		}
		if win {
			return true
		}
	}

	// check each col
	for col := 0; col < 5; col++ {
		win := true
		for row := 0; row < 5; row++ {
			if !indexes[5*row+col] {
				win = false
				break
			}
		}
		if win {
			return true
		}
	}

	return false
}

func (board Board) sumUnusedIndexes(used map[int]bool) int64 {
	sum := int64(0)
	for i := 0; i < 25; i++ {
		if !used[i] {
			val, _ := strconv.ParseInt(board.indexes[i], 10, 64)
			sum += val
		}
	}
	return sum
}
