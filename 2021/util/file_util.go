package util

import (
	"os"
	"strings"
)

func ReadInput(filename string) []string {
	// read the file
	dat, err := os.ReadFile(filename)
	if err != nil {
		panic(err)
	}
	stringData := strings.Split(strings.TrimSpace(string(dat)), "\n")

	return stringData
}
