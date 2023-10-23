package main

import (
	"goutil"
	"fmt"
	"strconv"
	"strings"
)

func Day8() {
	fmt.Printf("\nDay 8: \n")
	stringData := goutil.ReadFile("./aoc2021/day08_input.txt")

	counter := 0
	for _, line := range stringData {
		signals := strings.Fields(strings.Split(line, " | ")[1])
		for _, signal := range signals {
			if len(signal) == 2 || len(signal) == 3 || len(signal) == 4 || len(signal) == 7 {
				counter++
			}
		}
	}

	fmt.Printf("Part 1: %d\n", counter)

	total := 0
	for _, line := range stringData {
		data := strings.Split(line, " | ")

		rawStrings := strings.Fields(data[0])
		oneTemplate := NewSet()
		fourTemplate := NewSet()
		size5Templates := make([]RuneSet, 0)
		size6Templates := make([]RuneSet, 0)

		for _, templateString := range rawStrings {
			switch len(templateString) {
			case 2:
				oneTemplate.AddMulti([]rune(templateString)...)
			case 4:
				fourTemplate.AddMulti([]rune(templateString)...)
			case 5:
				newTemplate := NewSet()
				newTemplate.AddMulti([]rune(templateString)...)
				size5Templates = append(size5Templates, newTemplate)
			case 6:
				newTemplate := NewSet()
				newTemplate.AddMulti([]rune(templateString)...)
				size6Templates = append(size6Templates, newTemplate)
			}
		}

		configuration := getConfiguration(oneTemplate, fourTemplate, size5Templates, size6Templates)
		result := parseSignals(data[1], configuration)
		total += result
	}
	fmt.Printf("Part 2: %d\n", total)
}

func NewSet() RuneSet {
	s := &RuneSet{}
	s.list = make(map[rune]struct{})
	return *s
}

type RuneSet struct {
	list map[rune]struct{}
}

func (s *RuneSet) Has(v rune) bool {
	_, ok := s.list[v]
	return ok
}

func (s *RuneSet) Add(v rune) {
	s.list[v] = struct{}{}
}

//AddMulti Add multiple values in the set
func (s *RuneSet) AddMulti(list ...rune) {
	for _, v := range list {
		s.Add(v)
	}
}

type Configuration struct {
	topLeft  rune
	topRight rune
	middle   rune
	botRight rune
}

func getConfiguration(one RuneSet, four RuneSet, size5 []RuneSet, size6 []RuneSet) Configuration {
	configuration := Configuration{}

	// 1 uses the topRight and botRight
	topRightCandidates := make([]rune, 0)
	// 4 uses the topLeft and middle compared to 1
	topLeftCandidates := make([]rune, 0)

	for key := range four.list {
		if one.Has(key) {
			topRightCandidates = append(topRightCandidates, key)
		} else {
			topLeftCandidates = append(topLeftCandidates, key)
		}
	}

	// botRight is used in all of 0,1,6,9 but topRight is not used in one of them
	candidate := topRightCandidates[0]
	found := false
	for _, letterRunes := range size6 {
		if !letterRunes.Has(candidate) {
			// this must be the topRight
			found = true
			configuration.topRight = candidate
			configuration.botRight = topRightCandidates[1]
			break
		}
	}
	if !found {
		// otherwise, it's the other way around
		configuration.topRight = topRightCandidates[1]
		configuration.botRight = candidate
	}

	// middle is used in all the size 5's, but the top left is not
	candidate = topLeftCandidates[0]
	found = false
	for _, letterRunes := range size5 {
		if !letterRunes.Has(candidate) {
			// this must be the top left
			found = true
			configuration.topLeft = candidate
			configuration.middle = topLeftCandidates[1]
			break
		}
	}
	if !found {
		configuration.topLeft = topLeftCandidates[1]
		configuration.middle = candidate
	}

	return configuration
}

func parseSignals(signals string, configuration Configuration) int {
	var builder strings.Builder
	for _, signal := range strings.Fields(signals) {
		var let rune
		switch len(signal) {
		case 2:
			let = '1'
		case 3:
			let = '7'
		case 4:
			let = '4'
		case 5:
			if strings.ContainsRune(signal, configuration.botRight) {
				if strings.ContainsRune(signal, configuration.topLeft) {
					let = '5'
				} else {
					let = '3'
				}
			} else {
				let = '2'
			}
		case 6:
			if strings.ContainsRune(signal, configuration.middle) {
				if strings.ContainsRune(signal, configuration.topRight) {
					let = '9'
				} else {
					let = '6'
				}
			} else {
				let = '0'
			}
		case 7:
			let = '8'
		}
		builder.WriteRune(let)
	}
	res, _ := strconv.Atoi(builder.String())
	return res
}
