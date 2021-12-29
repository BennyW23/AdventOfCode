package main

import (
	"2021/util"
	"container/heap"
	"fmt"
)

func Day15() {
	fmt.Printf("\nDay 15: \n")
	stringData := util.ReadInput("./day15_input.txt")

	numRows := len(stringData)
	numCols := len(stringData[0])
	grid := make([][]int, numRows)
	visited := make([][]bool, numRows)

	for i, line := range stringData {
		gridRow := make([]int, numCols)
		visitedRow := make([]bool, numCols)
		for j := 0; j < numCols; j++ {
			gridRow[j] = int(line[j] - '0')
		}
		grid[i] = gridRow
		visited[i] = visitedRow
	}
	visited[0][0] = true

	directions := [4]struct {
		dx int
		dy int
	}{
		{1, 0},
		{-1, 0},
		{0, 1},
		{0, -1},
	}

	// initialize the heap data structure
	h := &GridHeap{}
	heap.Push(h, HeapEntry{0, 1, grid[0][1]})
	heap.Push(h, HeapEntry{1, 0, grid[1][0]})

	running := true
	for running && h.Len() > 0 {
		entry := heap.Pop(h).(HeapEntry)
		if visited[entry.x][entry.y] {
			continue
		}
		if entry.x == numCols-1 && entry.y == numRows-1 {
			fmt.Printf("Part 1: %d\n", entry.val)
			running = false
		} else {
			visited[entry.x][entry.y] = true
			for _, dir := range directions {
				xNext := entry.x + dir.dx
				yNext := entry.y + dir.dy
				if xNext < 0 || xNext >= numCols || yNext < 0 || yNext >= numRows || visited[xNext][yNext] {
					continue
				}
				heap.Push(h, HeapEntry{xNext, yNext, entry.val + grid[xNext][yNext]})
			}
		}
	}

	// Reset everything for part 2
	visited = make([][]bool, 5*numRows)
	for i := 0; i < 5*numRows; i++ {
		visited[i] = make([]bool, 5*numCols)
	}
	// initialize the heap data structure
	h = &GridHeap{}
	heap.Push(h, HeapEntry{0, 1, grid[0][1]})
	heap.Push(h, HeapEntry{1, 0, grid[1][0]})

	directions = [4]struct {
		dx int
		dy int
	}{
		{1, 0},
		{-1, 0},
		{0, 1},
		{0, -1},
	}
	running = true
	for running && h.Len() > 0 {
		entry := heap.Pop(h).(HeapEntry)
		if visited[entry.x][entry.y] {
			continue
		}
		if entry.x == (5*numCols)-1 && entry.y == (5*numRows)-1 {
			fmt.Printf("Part 2: %d\n", entry.val)
			running = false
		} else {
			visited[entry.x][entry.y] = true
			for _, dir := range directions {
				xNext := entry.x + dir.dx
				yNext := entry.y + dir.dy
				if xNext < 0 || xNext >= 5*numCols || yNext < 0 || yNext >= 5*numRows || visited[xNext][yNext] {
					continue
				}
				gridVal := grid[xNext%numCols][yNext%numRows] + xNext/numCols + yNext/numRows
				for gridVal > 9 {
					gridVal -= 9
				}
				heap.Push(h, HeapEntry{xNext, yNext, entry.val + gridVal})
			}
		}
	}
}

type HeapEntry struct {
	x   int
	y   int
	val int
}
type GridHeap []HeapEntry

func (heap GridHeap) Len() int {
	return len(heap)
}

func (heap GridHeap) Less(i, j int) bool {
	return heap[i].val < heap[j].val
}

func (heap GridHeap) Swap(i, j int) {
	heap[i], heap[j] = heap[j], heap[i]
}

func (heap *GridHeap) Push(x interface{}) {
	*heap = append(*heap, x.(HeapEntry))
}

func (heap *GridHeap) Pop() interface{} {
	old := *heap
	n := len(old)
	x := old[n-1]
	*heap = old[0 : n-1]
	return x
}
