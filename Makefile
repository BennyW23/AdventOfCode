.PHONY: 2022

2022:
	go build -o build/2022_go ./aoc2022/src/go
	./build/2022_go
