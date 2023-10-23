package main

import (
	"goutil"
	"fmt"
	"math"
	"strconv"
	"strings"
)

func Day17() {
	fmt.Printf("\nDay 17: \n")
	stringData := goutil.ReadFile("./day17_input.txt")[0]

	pieces := strings.Split(stringData, " ")
	xValues := strings.Split(pieces[2][2:len(pieces[2])-1], "..")
	yValues := strings.Split(pieces[3][2:len(pieces[2])], "..")

	xMin, _ := strconv.Atoi(xValues[0])
	xMax, _ := strconv.Atoi(xValues[1])
	yMin, _ := strconv.Atoi(yValues[0])
	yMax, _ := strconv.Atoi(yValues[1])

	// kind of a dumb trick, not sure if it generalizes
	// idea is that we have a parabola, if we want to maximize y then we'll fall straight down for a while
	// so x doesn't matter as long as there exists an x value that becomes stable inside the target range
	// the following code would prove that such an x exists:
	/*
		for x := 0; x * (x + 1) / 2 < xMax; x++ {
			if x * (x + 1) / 2 > xMin {
				fmt.Println(x)
			}
		}
	*/
	// So we only need to care about the y-value, and since it's a parabola and the target is negative
	// Therefore we know that the max is given by (vel)(vel + 1)/ 2 and that it hits y=0 after some time by symmetry
	// we want to maximize velocity so that it lands in the target, since it's negative it must go from 0 to
	// somewhere in the target so the max velocity we can pick is -yMin - 1. The max ends up being the following.
	fmt.Printf("Part 1: %d\n", (yMin)*(yMin+1)/2)

	numTrajectories := 0

	x := 0
	// skip the ones that never get to the target area
	for ; ; x++ {
		if x*(x+1)/2 >= xMin {
			break
		}
	}

	// bruteforce it
	for ; x <= xMax; x++ {
		for y := yMin; y <= int(math.Abs(float64(yMin)))-1; y++ {
			if testVelocities(x, y, xMin, xMax, yMin, yMax) {
				numTrajectories++
			}

		}
	}
	fmt.Printf("Part 2 %d\n", numTrajectories)
}

func testVelocities(xVel int, yVel int, xMin int, xMax int, yMin int, yMax int) bool {

	numIters := xVel
	xPos, yPos := 0, 0
	for t := 0; t <= numIters; t++ {
		xPos += xVel
		yPos += yVel
		if xVel > 0 {
			xVel--
		} else if xVel < 0 {
			xVel++
		}
		yVel--
		if xPos >= xMin && xPos <= xMax && yPos >= yMin && yPos <= yMax {
			return true
		} else if xPos > xMax || yPos < yMin {
			return false
		}
	}

	// at this point the x coordinate will be stable
	for yPos >= yMin {
		yPos += yVel
		yVel--
		if yPos >= yMin && yPos <= yMax {
			return true
		} else if yPos < yMin {
			return false
		}
	}
	return false
}
