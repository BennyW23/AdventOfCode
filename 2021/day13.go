package main

import (
	"2021/util"
	"fmt"
	"math"
	"strconv"
	"strings"
)

type PointDay13 struct {
	x int
	y int
}

type FoldDay13 struct {
	axis string
	value int
}

func Day13() {
	fmt.Printf("\nDay 13: \n")
	stringData := util.ReadInput("./day13_input.txt")

	points := make(map[PointDay13]bool)
	folds := make([]FoldDay13, 0)
	foldData := false
	for _, line := range stringData {
		if line == "" {
			foldData = true
		} else if foldData {
			folds = append(folds, getFold(line))
		} else {
			points[getPoint(line)] = true
		}
	}

	fold(points, folds[0])
	fmt.Printf("Part 1: %d\n", len(points))

	yMax := math.MaxInt
	xMax := math.MaxInt
	for i := 1; i < len(folds); i++ {
		if folds[i].axis == "x" && folds[i].value < xMax {
			xMax = folds[i].value
		} else if folds[i].axis == "y" && folds[i].value < yMax {
			yMax = folds[i].value
		}
		fold(points, folds[i])
	}

	fmt.Println("Part 2:")

	// picture is inverted?
	for col := 0; col < yMax; col++ {
		for row := 0; row < xMax; row++ {
			val := points[PointDay13{row, col}]
			if val {
				fmt.Printf("%c", 0x2588)
			} else {
				fmt.Printf("%c", 0x20)
			}
		}
		fmt.Println()
	}
	fmt.Println()

}

func getPoint(coordinates string) PointDay13 {
	pieces := strings.Split(coordinates, ",")
	x, _ := strconv.Atoi(pieces[0])
	y, _ := strconv.Atoi(pieces[1])
	return PointDay13{x, y}
}

func getFold(line string) FoldDay13 {
	pieces := strings.Split(line, " ")
	data := strings.Split(pieces[2], "=")
	value, _ := strconv.Atoi(data[1])
	return FoldDay13{data[0], value}
}

func fold(points map[PointDay13]bool, fold FoldDay13) {

	for point := range points {
		if fold.axis == "x" && point.x >= fold.value {
			xnew := fold.value - (point.x - fold.value)
			if xnew >= 0 {
				points[PointDay13{xnew, point.y}] = true
			}
		} else if fold.axis == "y" && point.y >= fold.value {
			ynew := fold.value - (point.y - fold.value)
			if ynew >= 0 {
				points[PointDay13{point.x, ynew}] = true
			}

		} else {
			continue
		}
		delete(points, point)
	}

}
