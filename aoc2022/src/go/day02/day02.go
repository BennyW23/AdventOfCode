package day02

import (
	"fmt"
	"strings"

	"goutil"
)

const (
	rock = iota
	paper
	scissors
	loss
	draw
	win
)

func Solve() {
	fmt.Printf("\nDay 02: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day02.txt")

	partOneAns := 0
	partTwoAns := 0
	for _, round := range stringData {
		values := strings.Split(round, " ")
		partOneAns += parseRoundPart1(values)
		partTwoAns += parseRoundPart2(values)
	}

	fmt.Printf("Part 1: %v\n", partOneAns)

	fmt.Printf("Part 2: %v\n", partTwoAns)
}

func parseRoundPart1(values []string) int {
	opponentMap := map[string]int{
		"A": rock,
		"B": paper,
		"C": scissors,
	}
	opponent := opponentMap[values[0]]

	yourMap := map[string]int{
		"X": rock,
		"Y": paper,
		"Z": scissors,
	}
	symbol := yourMap[values[1]]

	if symbol == opponent {
		return getGameScore(symbol, draw)
	} else if symbol == (opponent+1)%3 {
		return getGameScore(symbol, win)
	}
	return getGameScore(symbol, loss)
}

func parseRoundPart2(values []string) int {
	opponentMap := map[string]int{
		"A": rock,
		"B": paper,
		"C": scissors,
	}
	opponent := opponentMap[values[0]]

	yourMap := map[string]int{
		"X": loss,
		"Y": draw,
		"Z": win,
	}
	result := yourMap[values[1]]

	symbol := getSymbol(opponent, result)

	return getGameScore(symbol, result)
}

func getGameScore(symbol int, result int) int {
	score := symbol + 1
	if result == win {
		return score + 6
	}
	if result == draw {
		return score + 3
	}
	return score
}

func getSymbol(opponent int, result int) int {
	if result == draw {
		return opponent
	} else if result == win {
		return (opponent + 1) % 3
	}
	return (opponent + 2) % 3
}
