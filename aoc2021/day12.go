package main

import (
	"goutil"
	"fmt"
	"strings"
)

func Day12() {
	fmt.Printf("\nDay 12: \n")
	stringData := goutil.ReadFile("./aoc2021/day12_input.txt")

	neighbors := make(map[string][]string)
	for _, line := range stringData {
		caves := strings.Split(line, "-")
		if caves[1] != "start" && caves[0] != "end" {
			neighbors[caves[0]] = append(neighbors[caves[0]], caves[1])
		}
		if caves[0] != "start" && caves[1] != "end" {
			neighbors[caves[1]] = append(neighbors[caves[1]], caves[0])
		}
	}

	part1 := caveDepthFirstSearchOnceOnly("start", make([]string, 0), neighbors)
	fmt.Printf("Part 1: %d\n", part1)
	part2 := caveDepthFirstSearchAllowTwice("start", make([]string, 0), neighbors, false)
	fmt.Printf("Part 2: %d\n", part2)

}

func caveDepthFirstSearchOnceOnly(node string, seen []string, neighbors map[string][]string) int {
	if node == "end" {
		return 1
	}
	neighborCaves := neighbors[node]
	newSeen := append(seen, node)

	total := 0
	for _, cave := range neighborCaves {
		if strings.ToLower(cave) == cave {
			skip := false
			for _, val := range seen {
				if cave == val {
					skip = true
					break
				}
			}
			if skip {
				continue
			}
		}
		total += caveDepthFirstSearchOnceOnly(cave, newSeen, neighbors)
	}
	return total
}

func caveDepthFirstSearchAllowTwice(node string, seen []string, neighbors map[string][]string, twiceUsed bool) int {
	if node == "end" {
		return 1
	}
	neighborCaves := neighbors[node]
	total := 0
	newSeen := append(seen, node)
	for _, cave := range neighborCaves {
		newTwice := twiceUsed
		if strings.ToLower(cave) == cave {
			found := false
			for _, val := range seen {
				if cave == val {
					found = true
					break
				}
			}
			if found {
				if twiceUsed {
					continue
				} else {
					newTwice = true
				}
			}
		}
		total += caveDepthFirstSearchAllowTwice(cave, newSeen, neighbors, newTwice)
	}
	return total
}
