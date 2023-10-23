package goutil

import (
	"os"
	"strings"
)

func ReadFile(filename string) []string {
	// read the file
	rawData, err := os.ReadFile(filename)
	if err != nil {
		panic(err)
	}

	stringData := strings.Split(strings.TrimSpace(string(rawData)), "\n")
	return stringData
}
