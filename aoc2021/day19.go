package main

import (
	"2021/util"
	"fmt"
	"strconv"
	"strings"
)

func Day19() {
	fmt.Printf("\nDay 19: \n")
	stringData := util.ReadInput("./day19_example.txt")

	scannerData := make([][][3]int, 0)

	scanner := make([][3]int, 0)
	for _, line := range stringData {
		if strings.Contains(line, "scanner") {
			if len(scanner) > 0 {
				scannerData = append(scannerData, scanner)
				scanner = make([][3]int, 0)
			}
			continue
		}

		if strings.ContainsRune(line, ',') {
			values := strings.Split(line, ",")
			xVal, _ := strconv.Atoi(values[0])
			yVal, _ := strconv.Atoi(values[1])
			zVal, _ := strconv.Atoi(values[2])
			scanner = append(scanner, [3]int{xVal, yVal, zVal})
		}
	}

	fmt.Println(scannerData)

}
