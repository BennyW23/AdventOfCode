package day08

import (
	"fmt"

	"goutil"
)

type coord struct {
	x int
	y int
}

func Solve() {
	fmt.Printf("\nDay 08: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day08.txt")

	trees := parseTrees(stringData)
	visibleTrees := findVisibleTrees(trees)

	partOneAns := len(visibleTrees)
	fmt.Printf("Part 1: %v\n", partOneAns)

	partTwoAns := findMaxScenicScore(trees)
	fmt.Printf("Part 2: %v\n", partTwoAns)
}

func parseTrees(stringData []string) [][]int {
	trees := make([][]int, 0, len(stringData))
	for _, str := range stringData {
		row := make([]int, 0, len(str))
		for _, rune := range str {
			row = append(row, int(rune-'0'))
		}
		trees = append(trees, row)
	}
	return trees
}

func findVisibleTrees(trees [][]int) map[coord]bool {
	visible := make(map[coord]bool)

	m := len(trees)
	n := len(trees[0])

	for row := 0; row < m; row++ {
		height := -1
		for col := 0; col < n; col++ {
			if trees[row][col] > height {
				visible[coord{x: row, y: col}] = true
				height = trees[row][col]
				if height == 9 {
					break
				}
			}
		}
		height = -1
		for col := n - 1; col > 0; col-- {
			if trees[row][col] > height {
				visible[coord{x: row, y: col}] = true
				height = trees[row][col]
				if height == 9 {
					break
				}
			}
		}
	}

	for col := 0; col < n; col++ {
		height := -1
		for row := 0; row < m; row++ {
			if trees[row][col] > height {
				visible[coord{x: row, y: col}] = true
				height = trees[row][col]
				if height == 9 {
					break
				}
			}
		}
		height = -1
		for row := m - 1; row > 0; row-- {
			if trees[row][col] > height {
				visible[coord{x: row, y: col}] = true
				height = trees[row][col]
				if height == 9 {
					break
				}
			}
		}
	}

	return visible
}

type direction struct {
	dx int
	dy int
}

func findMaxScenicScore(trees [][]int) int {
	best := -1
	m := len(trees)
	n := len(trees[0])

	directions := []direction{
		direction{1, 0},
		direction{-1, 0},
		direction{0, 1},
		direction{0, -1},
	}

	subscores := make([]int, len(directions))
	for row := 0; row < m; row++ {
		for col := 0; col < n; col++ {
			for i, dir := range directions {
				subscores[i] = findDirectionScore(trees, coord{row, col}, dir)
			}

			score := 1
			for _, subscore := range subscores {
				score *= subscore
			}
			if score >= best {
				best = score
			}
		}
	}

	return best
}

func findDirectionScore(trees [][]int, coord coord, dir direction) int {
	val := trees[coord.x][coord.y]

	m := len(trees)
	n := len(trees[0])

	numTrees := 0
	for row, col := coord.x+dir.dx, coord.y+dir.dy; inBounds(row, col, m, n); row, col = row+dir.dx, col+dir.dy {
		numTrees += 1
		if val <= trees[row][col] {
			break
		}
	}
	return numTrees
}

func inBounds(row int, col int, m int, n int) bool {
	return row >= 0 && row < m && col >= 0 && col < n
}
