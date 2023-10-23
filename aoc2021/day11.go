package main

import (
	"goutil"
	"fmt"
)

func Day11() {
	fmt.Printf("\nDay 11: \n")
	stringData := goutil.ReadFile("./day11_input.txt")

	octopi := [10][10]int{}
	for row, data := range stringData {
		for col, letter := range data {
			octopi[row][col] = int(letter - '0')
		}
	}

	totalFlashes := 0
	numFlashed := 0
	iter := 0
	for ; iter < 100; iter++ {
		octopi, numFlashed = iterate(octopi)
		totalFlashes += numFlashed
	}

	for ; numFlashed < 100; iter++ {
		octopi, numFlashed = iterate(octopi)

	}

	fmt.Printf("Part 1: %d\n", totalFlashes)
	fmt.Printf("Part 2: %d\n", iter)
}

func iterate(octopi [10][10]int) ([10][10]int, int) {
	toFlash := make([]struct {
		x int
		y int
	}, 0)
	flashed := make([]struct {
		x int
		y int
	}, 0)
	for row := 0; row < 10; row++ {
		for col := 0; col < 10; col++ {
			octopi[row][col]++
			if octopi[row][col] == 10 {
				toFlash = append(toFlash, struct {
					x int
					y int
				}{row, col})
			}
		}
	}

	for len(toFlash) > 0 {
		coordinate := toFlash[len(toFlash)-1]
		toFlash = toFlash[:len(toFlash)-1]
		flashed = append(flashed, coordinate)
		xMin, xMax, yMin, yMax := findBounds(coordinate)

		for row := xMin; row <= xMax; row++ {
			for col := yMin; col <= yMax; col++ {
				octopi[row][col]++
				if octopi[row][col] == 10 {
					toFlash = append(toFlash, struct {
						x int
						y int
					}{row, col})
				}
			}
		}

	}

	for _, coordinate := range flashed {
		octopi[coordinate.x][coordinate.y] = 0
	}
	return octopi, len(flashed)
}

func findBounds(coordinate struct {
	x int
	y int
}) (int, int, int, int) {

	xMin := coordinate.x - 1
	if xMin < 0 {
		xMin = 0
	}
	xMax := coordinate.x + 1
	if xMax > 9 {
		xMax = 9
	}
	yMin := coordinate.y - 1
	if yMin < 0 {
		yMin = 0
	}
	yMax := coordinate.y + 1
	if yMax > 9 {
		yMax = 9
	}

	return xMin, xMax, yMin, yMax
}

func prettyPrint(octopi [10][10]int) {
	for _, row := range octopi {
		for _, val := range row {
			fmt.Printf("%d ", val)
		}
		fmt.Println()
	}
	fmt.Println()
}
