package main

import (
	"2021/util"
	"fmt"
	"strconv"
	"strings"
)

func Day2() {
	fmt.Printf("\nDay 2: \n")
	stringData := util.ReadInput("./day2.txt")

	xPos, yPos := int64(0), int64(0)
	for _, command := range stringData {
		pieces := strings.Split(command, " ")
		val, err := strconv.ParseInt(pieces[1], 10, 64)
		if err != nil {
			continue
		}

		switch pieces[0] {
		case "forward":
			xPos += val
		case "up":
			yPos -= val
		case "down":
			yPos += val
		}
	}
	fmt.Printf("Part 1: %d\n", xPos * yPos)

	aim := int64(0)
	xPos, yPos = int64(0), int64(0)
	for _, command := range stringData {
		pieces := strings.Split(command, " ")
		val, err := strconv.ParseInt(pieces[1], 10, 64)
		if err != nil {
			continue
		}

		switch pieces[0] {
		case "forward":
			xPos += val
			yPos += val * aim
		case "up":
			aim -= val
		case "down":
			aim += val
		}
	}
	fmt.Printf("Part 2: %d\n", xPos * yPos)
}