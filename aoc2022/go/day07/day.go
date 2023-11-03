package day07

import (
	"fmt"
	"strconv"
	"strings"

	"goutil"
)

type folder struct {
	parent     *folder
	subfolders map[string]*folder
	files      map[string]int
	size       int
}

func (f *folder) prettyPrint(name string) {
	fmt.Println(name + " (dir)")
	for fileName, size := range f.files {
		fmt.Printf("%s%s (file, size=%d)\n", name, fileName, size)
	}

	for folderName, subfolder := range f.subfolders {
		subfolder.prettyPrint(name + folderName + "/")
	}
}

func (f *folder) generateSizes() int {
	if f.size != -1 {
		return f.size
	}
	s := 0
	for _, fileSize := range f.files {
		s += fileSize
	}

	for _, subfolder := range f.subfolders {
		s += subfolder.generateSizes()
	}
	f.size = s
	return s
}

func (f *folder) findFoldersSizeAtMost(threshold int) []*folder {
	var res []*folder
	if f.size <= threshold {
		res = append(res, f)
	}
	for _, subfolder := range f.subfolders {
		res = append(res, subfolder.findFoldersSizeAtMost(threshold)...)
	}
	return res
}

func (f *folder) findSmallestFolderAtLeast(threshold int) *folder {
	if f.size < threshold {
		return nil
	}

	candidate := f
	for _, subfolder := range f.subfolders {
		challenger := subfolder.findSmallestFolderAtLeast(threshold)
		if challenger != nil && challenger.size < candidate.size {
			candidate = challenger
		}
	}
	return candidate
}

func makeEmptyFolder(parent *folder) *folder {
	return &folder{
		parent:     parent,
		subfolders: map[string]*folder{},
		files:      map[string]int{},
		size:       -1,
	}
}

func Solve() {
	fmt.Printf("\nDay 07: \n")
	stringData := goutil.ReadFile("./aoc2022/input/day07.txt")

	root := parseFolders(stringData)
	root.generateSizes()

	validFolders := root.findFoldersSizeAtMost(100000)

	total := 0
	for _, validFolder := range validFolders {
		total += validFolder.size
	}
	partOneAns := total
	fmt.Printf("Part 1: %v\n", partOneAns)

	spaceNeeded := 30000000 - (70000000 - root.size)
	partTwoAns := root.findSmallestFolderAtLeast(spaceNeeded).size
	fmt.Printf("Part 2: %v\n", partTwoAns)
}

func parseFolders(output []string) *folder {
	root := makeEmptyFolder(nil)
	current := root
	for _, line := range output {
		parts := strings.Split(line, " ")
		switch parts[0] {
		case "$":
			if parts[1] == "cd" {
				switch parts[2] {
				case "/":
					current = root
				case "..":
					current = current.parent
				default:
					current = current.subfolders[parts[2]]
				}
			}
		case "dir":
			subFolder := makeEmptyFolder(current)
			subFolderName := parts[1]
			current.subfolders[subFolderName] = subFolder
		default:
			fileName := parts[1]
			val, err := strconv.Atoi(parts[0])
			if err != nil {
				fmt.Printf("ERROR: %v\n", err)
			}
			current.files[fileName] = val
		}
	}

	return root
}
