package main

import (
	"fmt"
)

func Day21() {
	// Puzzle input goes here
	position1Input := 8
	position2Input := 10

	fmt.Printf("\nDay 21: \n")
	positions := []int{position1Input, position2Input}
	scores := make([]int, 2)

	dice := 6
	nextTurn := 0

	turns := 0
	for scores[0] < 1000 && scores[1] < 1000 {
		positions[nextTurn] = ((positions[nextTurn] + dice - 1) % 10) + 1
		scores[nextTurn] += positions[nextTurn]

		dice--
		if dice < 0 {
			dice += 10
		}
		nextTurn = 1 - nextTurn
		turns += 3
	}

	losingScore := scores[0]
	if scores[0] >= 1000 {
		losingScore = scores[1]
	}
	fmt.Printf("Part 1: %d\n", losingScore*turns)

	p1wins, p2wins := findNumUniverses(position1Input, position2Input)
	soln := p1wins
	if p2wins > soln {
		soln = p2wins
	}
	fmt.Printf("Part 2: %d\n", soln)

}

type DiracDiceState struct {
	pos1   int
	pos2   int
	score1 int
	score2 int
}

func findNumUniverses(pos1 int, pos2 int) (int64, int64) {
	cache := make(map[DiracDiceState]int64)
	totalScoreCache := make(map[int][]DiracDiceState)

	initialState := DiracDiceState{pos1, pos2, 0, 0}
	totalScoreCache[0] = []DiracDiceState{initialState}
	cache[initialState] = 1

	// find the number of combinations of three rolls that give each possible combination of dice
	probability := make(map[int]int64)
	for i := 1; i <= 3; i++ {
		for j := 1; j <= 3; j++ {
			for k := 1; k <= 3; k++ {
				probability[i+j+k]++
			}
		}
	}

	for i := 0; i < 42; i++ {
		states := totalScoreCache[i]
		for _, state := range states {
			if state.score1 >= 21 || state.score2 >= 21 {
				continue
			}
			for firstRoll := 3; firstRoll <= 9; firstRoll++ {
				newFirstPos := (((state.pos1 + firstRoll) - 1) % 10) + 1
				newFirstScore := state.score1 + newFirstPos
				if newFirstScore >= 21 {
					newState := DiracDiceState{newFirstPos, state.pos2, newFirstScore, state.score2}
					if _, ok := cache[newState]; !ok {
						totalScoreCache[newFirstScore+state.score2] = append(totalScoreCache[newFirstScore+state.score2], newState)
					}
					cache[newState] = cache[newState] + (cache[state] * probability[firstRoll])
				} else {
					for secondRoll := 3; secondRoll <= 9; secondRoll++ {
						newSecondPos := (((state.pos2 + secondRoll) - 1) % 10) + 1
						newSecondScore := state.score2 + newSecondPos
						newState := DiracDiceState{newFirstPos, newSecondPos, newFirstScore, newSecondScore}
						if _, ok := cache[newState]; !ok {
							totalScoreCache[newFirstScore+newSecondScore] = append(totalScoreCache[newFirstScore+newSecondScore], newState)
						}
						cache[newState] = cache[newState] + (cache[state] * probability[firstRoll] * probability[secondRoll])
					}
				}
			}
		}
	}

	player1Wins := int64(0)
	player2Wins := int64(0)
	for key, value := range cache {
		if key.score1 >= 21 {
			player1Wins += value
		} else if key.score2 >= 21 {
			player2Wins += value
		}
	}
	return player1Wins, player2Wins
}
