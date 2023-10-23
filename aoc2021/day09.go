package main

import (
	"goutil"
	"fmt"
)

type IntPoint struct {
	x int
	y int
}

func Day9() {
	fmt.Printf("\nDay 9: \n")
	stringData := goutil.ReadFile("./aoc2021/day09_input.txt")

	heights := make([][]int, 0)
	for _, str := range stringData {
		rowHeights := make([]int, 0)
		for _, letter := range str {
			rowHeights = append(rowHeights, int(letter-'0'))
		}
		heights = append(heights, rowHeights)
	}

	rowlen := len(heights[0])

	sinks := make([]IntPoint, 0)
	risk := 0
	for i := 0; i < len(stringData); i++ {
		for j := 0; j < rowlen; j++ {
			currentVal := heights[i][j]
			if i > 0 && currentVal >= heights[i-1][j] {
				continue
			} else if j > 0 && currentVal >= heights[i][j-1] {
				continue
			} else if i < len(stringData)-1 && currentVal >= heights[i+1][j] {
				continue
			} else if j < rowlen-1 && currentVal >= heights[i][j+1] {
				continue
			}
			sinks = append(sinks, IntPoint{i, j})
			risk += 1 + currentVal
		}
	}
	fmt.Printf("Part 1: %d\n", risk)

	accessed := make([][]bool, 0)
	for i := 0; i < len(heights); i++ {
		accessed = append(accessed, make([]bool, rowlen))
	}

	basinSizes := make([]int, 0)
	for _, sink := range sinks {
		basinSizes = append(basinSizes, findBasinSizeDfs(heights, sink, accessed))
	}

	largest, secondLargest, thirdLargest := findThreeLargestValues(basinSizes)

	fmt.Printf("Part 2: %d\n", largest*secondLargest*thirdLargest)
}

func findBasinSizeDfs(heights [][]int, sink IntPoint, accessed [][]bool) int {
	x := sink.x
	y := sink.y
	if accessed[x][y] {
		return 0
	}
	val := heights[x][y]
	if val == 9 {
		return 0
	}
	accessed[x][y] = true
	total := 1
	if x > 0 {
		total += findBasinSizeDfs(heights, IntPoint{x - 1, y}, accessed)
	}
	if x < len(heights)-1 {
		total += findBasinSizeDfs(heights, IntPoint{x + 1, y}, accessed)
	}
	if y > 0 {
		total += findBasinSizeDfs(heights, IntPoint{x, y - 1}, accessed)
	}
	if y < len(heights[0])-1 {
		total += findBasinSizeDfs(heights, IntPoint{x, y + 1}, accessed)
	}
	return total
}

func findThreeLargestValues(nums []int) (int, int, int) {
	largest := -1
	secondLargest := -1
	thirdLargest := -1
	for _, val := range nums {
		if val > largest {
			thirdLargest = secondLargest
			secondLargest = largest
			largest = val
		} else if val > secondLargest {
			thirdLargest = secondLargest
			secondLargest = val
		} else if val > thirdLargest {
			thirdLargest = val
		}
	}
	return largest, secondLargest, thirdLargest
}
