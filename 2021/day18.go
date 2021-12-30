package main

import (
	"2021/util"
	"fmt"
	"strconv"
	"strings"
)

type Snailfish struct {
	leftVal  int
	rightVal int

	leftPtr  *Snailfish
	rightPtr *Snailfish
	parent   *Snailfish
}

func Day18() {
	fmt.Printf("\nDay 18: \n")
	stringData := util.ReadInput("./day18_input.txt")

	var resultFish *Snailfish = nil
	for _, line := range stringData {
		newFish, _ := parseSnailfishNumber([]rune(line), 0)
		explodeAndSplit(newFish)
		resultFish = addSnailfish(resultFish, newFish)
	}

	fmt.Printf("Part 1: %d\n", getMagnitude(resultFish))

	bestMagnitude := -1
	for i := 0; i < len(stringData); i++ {
		for j := 0; j < len(stringData); j++ {
			if i == j {
				continue
			}
			leftFish, _ := parseSnailfishNumber([]rune(stringData[i]), 0)
			rightFish, _ := parseSnailfishNumber([]rune(stringData[j]), 0)
			magnitude := getMagnitude(addSnailfish(leftFish, rightFish))
			if magnitude > bestMagnitude {
				bestMagnitude = magnitude
			}
		}
	}
	fmt.Printf("Part 2: %d\n", bestMagnitude)
}

// Recursively parses the rune array starting at a given index into a snailfish number
// Returns a pointer to the resulting snailfish number
// and the first array index that is not used in the returned number
func parseSnailfishNumber(input []rune, index int) (*Snailfish, int) {
	snailfish := Snailfish{0, 0, nil, nil, nil}

	if input[index+1] != '[' {
		endIdx := index + 2
		for ; input[endIdx] != ','; endIdx++ {
		}
		leftVal, _ := strconv.Atoi(string(input[index+1 : endIdx]))
		snailfish.leftVal = leftVal
		index = endIdx
	} else {
		leftPtr, newIndex := parseSnailfishNumber(input, index+1)
		snailfish.leftPtr = leftPtr
		leftPtr.parent = &snailfish
		index = newIndex
	}

	if input[index+1] != '[' {
		endIdx := index + 2
		for ; input[endIdx] != ']'; endIdx++ {
		}
		rightVal, _ := strconv.Atoi(string(input[index+1 : endIdx]))
		snailfish.rightVal = rightVal
		index = endIdx
	} else {
		rightPtr, newIndex := parseSnailfishNumber(input, index+1)
		snailfish.rightPtr = rightPtr
		rightPtr.parent = &snailfish
		index = newIndex
	}
	return &snailfish, index + 1
}

func addSnailfish(leftFish *Snailfish, rightFish *Snailfish) *Snailfish {
	if leftFish == nil {
		return rightFish
	} else if rightFish == nil {
		return leftFish
	}
	newFish := Snailfish{0, 0, leftFish, rightFish, nil}
	leftFish.parent = &newFish
	rightFish.parent = &newFish

	explodeAndSplit(&newFish)

	return &newFish
}

func explodeAndSplit(snailfish *Snailfish) {
	running := true
	for running {
		running = explodeHelper(snailfish, 0)
		if !running {
			running = splitHelper(snailfish)
		}
	}
}

// helper that explodes, returns true if work was done
func explodeHelper(snailfish *Snailfish, depth int) bool {
	if depth == 4 {

		node := snailfish
		for ; node != nil; node = node.parent {
			if node.parent != nil && node.parent.leftPtr != node {
				if node.parent.leftPtr == nil {
					node.parent.leftVal = node.parent.leftVal + snailfish.leftVal
					break
				}
				if addToRightMost(node.parent.leftPtr, snailfish.leftVal) {
					break
				}
			}
		}

		node = snailfish
		for ; node != nil; node = node.parent {
			if node.parent != nil && node.parent.rightPtr != node {
				if node.parent.rightPtr == nil {
					node.parent.rightVal = node.parent.rightVal + snailfish.rightVal
					break
				}
				if addToLeftMost(node.parent.rightPtr, snailfish.rightVal) {
					break
				}
			}
		}

		if snailfish.parent.leftPtr == snailfish {
			snailfish.parent.leftPtr = nil
			snailfish.parent.leftVal = 0
		} else {
			snailfish.parent.rightPtr = nil
			snailfish.parent.rightVal = 0
		}
		snailfish.parent = nil
		return true
	}

	exploded := false
	if snailfish.leftPtr != nil {
		exploded = explodeHelper(snailfish.leftPtr, depth+1)
	}
	if exploded {
		return true
	}
	if snailfish.rightPtr != nil {
		return explodeHelper(snailfish.rightPtr, depth+1)
	}

	return false
}

// helper that splits, returns true if work was done
func splitHelper(snailfish *Snailfish) bool {
	if snailfish.leftPtr != nil {
		if splitHelper(snailfish.leftPtr) {
			return true
		}
	} else {
		if snailfish.leftVal >= 10 {
			left := snailfish.leftVal / 2
			right := snailfish.leftVal - left
			newSnailfish := Snailfish{left, right, nil, nil, snailfish}
			snailfish.leftVal = 0
			snailfish.leftPtr = &newSnailfish
			return true
		}
	}

	if snailfish.rightPtr != nil {
		return splitHelper(snailfish.rightPtr)
	} else {
		if snailfish.rightVal >= 10 {
			left := snailfish.rightVal / 2
			right := snailfish.rightVal - left
			newSnailfish := Snailfish{left, right, nil, nil, snailfish}
			snailfish.rightVal = 0
			snailfish.rightPtr = &newSnailfish
			return true
		}
	}

	return false
}

// returns true if it can add the value to the rightmost snailfish value
// otherwise return false if no such snailfish exists
func addToRightMost(snailfish *Snailfish, value int) bool {

	if snailfish == nil {
		return false
	}

	if snailfish.rightPtr != nil {
		if addToRightMost(snailfish.rightPtr, value) {
			return true
		}
	} else {
		snailfish.rightVal = snailfish.rightVal + value
		return true
	}

	if snailfish.leftPtr != nil {
		if addToRightMost(snailfish.leftPtr, value) {
			return true
		}
	} else {
		snailfish.leftVal = snailfish.leftVal + value
		return true
	}

	return false
}

// returns true if it can add the value to the leftmost snailfish value
// otherwise return false if no such snailfish exists
func addToLeftMost(snailfish *Snailfish, value int) bool {
	if snailfish == nil {
		return false
	}

	if snailfish.leftPtr != nil {
		if addToLeftMost(snailfish.leftPtr, value) {
			return true
		}
	} else {
		snailfish.leftVal = snailfish.leftVal + value
		return true
	}

	if snailfish.rightPtr != nil {
		if addToLeftMost(snailfish.rightPtr, value) {
			return true
		}
	} else {
		snailfish.rightVal = snailfish.rightVal + value
		return true
	}

	return false
}

func getMagnitude(snailfish *Snailfish) int {
	total := 0
	if snailfish == nil {
		return total
	}
	if snailfish.leftPtr != nil {
		total += 3 * getMagnitude(snailfish.leftPtr)
	} else {
		total += 3 * snailfish.leftVal
	}

	if snailfish.rightPtr != nil {
		total += 2 * getMagnitude(snailfish.rightPtr)
	} else {
		total += 2 * snailfish.rightVal
	}
	return total
}

func prettyPrintSnailfish(snailfish Snailfish, indent int) {
	indentString := strings.Repeat("  ", indent)
	fmt.Printf("%sFish\n", indentString)
	if snailfish.leftPtr == nil {
		fmt.Printf("%s  %d\n", indentString, snailfish.leftVal)
	} else {
		prettyPrintSnailfish(*snailfish.leftPtr, indent+1)
	}
	if snailfish.rightPtr == nil {
		fmt.Printf("%s  %d\n", indentString, snailfish.rightVal)
	} else {
		prettyPrintSnailfish(*snailfish.rightPtr, indent+1)
	}
}
