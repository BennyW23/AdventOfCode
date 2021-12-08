package main

import (
	"2021/util"
	"fmt"
	"math"
	"math/rand"
	"strconv"
	"strings"
)

func Day7() {
	fmt.Printf("\nDay 7: \n")
	stringData := util.ReadInput("./day07.txt")

	initialCrabs := make([]int, 0)
	for _, crabString := range strings.Split(stringData[0], ",") {
		crab, _ := strconv.Atoi(crabString)
		initialCrabs = append(initialCrabs, crab)
	}


	// part 1 is equivalent to finding the absolute differences to the median

	// sortedCrabs := insertionSort(initialCrabs)
	// median := sortedCrabs[len(sortedCrabs)/2]

	median := quickSelect(initialCrabs, 0, len(initialCrabs) - 1, len(initialCrabs) / 2)
	total := 0
	for _, v := range initialCrabs {
		if v > median {
			total += v - median
		} else {
			total += median - v
		}
	}
	fmt.Printf("Part 1: %d\n", total)

	// part 2 solution is around the mean
	total = 0
	for _, v := range initialCrabs {
		total += v
	}
	// rounded down, try this and mean+1
	mean := total / len(initialCrabs)
	minFuel := math.MaxInt
	for i := mean; i < mean + 2; i++ {
		fuel := 0
		for _, v := range initialCrabs {
			diff := i - v
			if v > i {
				diff = v - i
			}
			fuel += (diff * (diff + 1)) / 2
		}

		if fuel < minFuel {
			minFuel = fuel
		}
	}

	fmt.Printf("Part 2: %d\n", minFuel)
}

// basic quickSelect implementation, finds the k-th smallest element within left..right, inclusive
func quickSelect(list []int, left int, right int, k int) int {
	if left == right {
		return list[left]
	}
	pivotIndex := left + (rand.Int() % (right - left + 1))
	pivotIndex = partition(list, left, right, pivotIndex)
	if k == pivotIndex {
		return list[k]
	} else if k < pivotIndex {
		return quickSelect(list, left, pivotIndex - 1, k)
	} else {
		return quickSelect(list, pivotIndex + 1, right, k)
	}

}

// partitions array[left...right] based on the pivot and returns the new index of the pivot
func partition(list []int, left int, right int, pivotIndex int) int {
	pivotValue := list[pivotIndex]
	list[right], list[pivotIndex] = list[pivotIndex], list[right]
	swapIndex := left
	for i := left; i < right; i++ {
		if list[i] < pivotValue {
			list[swapIndex], list[i] = list[i], list[swapIndex]
			swapIndex++
		}
	}
	list[right], list[swapIndex] = list[swapIndex], list[right]
	return swapIndex
}

// initially did it with insertion sort
func insertionSort(list []int) []int {
	result := make([]int, 0)
	for itemNum, value := range list {
		found := false
		for index := 0 ; index < itemNum; index++ {
			if value < result[index] {
				found = true
				result = append(result[:index + 1], result[index:]...)
				result[index] = value
				break
			}
		}
		if !found {
			result = append(result, value)
		}
	}

	return result
}
