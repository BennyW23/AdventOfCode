.PHONY: clean 2021 2022

clean:
	rm -f ./build/*


2021:
	go build -o build/$@_go ./aoc2021
	./build/$@_go

2022: 
	go build -o build/$@_go ./aoc2022/src/go
	./build/$@_go
