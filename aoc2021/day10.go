package main

import (
	"goutil"
	"fmt"
	"math/rand"
)

func Day10() {
	fmt.Printf("\nDay 10: \n")
	stringData := goutil.ReadFile("./day10_input.txt")

	expectedLetter := map[rune]rune{
		'(': ')',
		'[': ']',
		'{': '}',
		'<': '>',
	}

	part1Scores := map[rune]int{
		')': 3,
		']': 57,
		'}': 1197,
		'>': 25137,
	}

	part2Scores := map[rune]int{
		'(': 1,
		'[': 2,
		'{': 3,
		'<': 4,
	}

	total := 0
	scores := make([]int, 0)
	for _, line := range stringData {
		corrupt := false
		stack := make([]rune, 0)
		for _, letter := range line {
			switch letter {
			case '(', '[', '{', '<':
				stack = append(stack, letter)
			case ')', ']', '}', '>':
				if len(stack) == 0 {
					panic("nothing to pop!!")
				}
				last := stack[len(stack)-1]
				stack = stack[:len(stack)-1]
				if letter != expectedLetter[last] {
					total += part1Scores[letter]
					corrupt = true
				}
			}
			if corrupt {
				break
			}
		}
		if !corrupt {
			score := 0
			for len(stack) > 0 {
				score *= 5
				last := stack[len(stack)-1]
				stack = stack[:len(stack)-1]
				score += part2Scores[last]
			}
			scores = append(scores, score)
		}
	}

	midpoint := len(scores) / 2

	fmt.Printf("Part 1: %d\n", total)
	fmt.Printf("Part 2: %d\n", quickSelectDay10(scores, 0, len(scores)-1, midpoint))
}

func quickSelectDay10(array []int, left int, right int, k int) int {
	if left == right {
		return array[left]
	}
	pivot := left + rand.Int()%(right-left+1)
	pivot = partitionDay10(array, left, right, pivot)
	if k == pivot {
		return array[k]
	} else if k > pivot {
		return quickSelectDay10(array, pivot+1, right, k)
	} else {
		return quickSelectDay10(array, left, pivot-1, k)
	}
}

func partitionDay10(array []int, left int, right int, pivot int) int {
	swapIndex := left
	pivotValue := array[pivot]
	array[right], array[pivot] = array[pivot], array[right]
	for i := left; i < right; i++ {
		if array[i] < pivotValue {
			array[swapIndex], array[i] = array[i], array[swapIndex]
			swapIndex++
		}
	}
	array[swapIndex], array[right] = array[right], array[swapIndex]
	return swapIndex
}
