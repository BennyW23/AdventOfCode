package main

import (
	"2021/util"
	"fmt"
	"strconv"
	"strings"
)

type Int64Point struct {
	x int64
	y int64
}

func Day5() {
	fmt.Printf("\nDay 5: \n")
	stringData := util.ReadInput("./day05.txt")

	counter := make(map[Int64Point]int)
	diagonalCounter := make(map[Int64Point]int)

	for lineNum := 0; lineNum < len(stringData); lineNum++ {
		line := strings.Fields(stringData[lineNum])
		firstPoint := strings.Split(line[0], ",")
		secondPoint := strings.Split(line[2], ",")

		commonCoordinateIndex := -1
		if firstPoint[0] == secondPoint[0] {
			commonCoordinateIndex = 0
		} else if firstPoint[1] == secondPoint[1] {
			commonCoordinateIndex = 1
		}

		if commonCoordinateIndex >= 0 {
			// handle straight lines
			otherIndex := 1 - commonCoordinateIndex
			commonCoord, _ := strconv.ParseInt(firstPoint[commonCoordinateIndex], 10, 64)
			firstValue, _ := strconv.ParseInt(firstPoint[otherIndex], 10, 64)
			secondValue, _ := strconv.ParseInt(secondPoint[otherIndex], 10, 64)

			start, end := firstValue, secondValue
			if secondValue < firstValue {
				start, end = secondValue, firstValue
			}

			if commonCoordinateIndex == 0 {
				for i := start; i <= end; i++ {
					point := Int64Point{commonCoord, i}
					counter[point]++
				}
			} else {
				for i := start; i <= end; i++ {
					point := Int64Point{i, commonCoord}
					counter[point]++
				}
			}
		} else {
			// handle diagonals
			firstCoordX, _ := strconv.ParseInt(firstPoint[0], 10, 64)
			firstCoordY, _ := strconv.ParseInt(firstPoint[1], 10, 64)
			secondCoordX, _ := strconv.ParseInt(secondPoint[0], 10, 64)
			secondCoordY, _ := strconv.ParseInt(secondPoint[1], 10, 64)

			dx := int64(1)
			dy := int64(1)
			numPoints := secondCoordX - firstCoordX
			if firstCoordX > secondCoordX {
				dx = -1
				numPoints = firstCoordX - secondCoordX
			}
			if firstCoordY > secondCoordY {
				dy = -1
			}

			for i := int64(0); i <= numPoints; i++ {
				point := Int64Point{firstCoordX + (dx * i), firstCoordY + (dy * i)}
				diagonalCounter[point]++
			}
		}
	}

	numDangerPoints := 0
	for _, value := range counter {
		if value >= 2 {
			numDangerPoints++
		}
	}
	fmt.Printf("Part 1: %d\n", numDangerPoints)

	for point, value := range diagonalCounter{
		counter[point] += value
	}
	numDangerPoints = 0
	for _, value := range counter {
		if value >= 2 {
			numDangerPoints++
		}
	}
	fmt.Printf("Part 2: %d\n", numDangerPoints)
}
