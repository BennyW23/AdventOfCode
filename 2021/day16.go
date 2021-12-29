package main

import (
	"2021/util"
	"fmt"
	"strings"
)

func Day16() {
	fmt.Printf("\nDay 16: \n")
	stringData := util.ReadInput("./day16_input.txt")[0]

	var builder strings.Builder
	for _, runeVal := range stringData {
		var val int
		switch runeVal {
		case 'A', 'B', 'C', 'D', 'E', 'F':
			val = int(runeVal-'A') + 10
		default:
			val = int(runeVal - '0')
		}

		builder.WriteString(fmt.Sprintf("%04b", val))
	}

	binaryString := builder.String()

	_, version, literal := parseNPackets([]rune(binaryString), 1)
	fmt.Println("Part 1: ", version)
	fmt.Println("Part 2: ", literal[0])
}

func parseNPackets(packet []rune, numPackets int) (int, int, []int) {
	idx := 0
	totalVersion := 0
	values := make([]int, 0)

	for i := 0; i < numPackets; i++ {
		newIdx, version, value := parsePacket(packet, idx)
		idx = newIdx
		totalVersion += version
		values = append(values, value)
	}

	return idx, totalVersion, values
}

func parseEntireStringOfPackets(packets []rune) (int, []int) {
	idx := 0
	versionSum := 0
	values := make([]int, 0)
	for idx < len(packets) {
		newIdx, versions, value := parsePacket(packets, idx)
		idx = newIdx
		versionSum += versions
		values = append(values, value)
	}

	return versionSum, values
}

func parsePacket(values []rune, idx int) (int, int, int) {

	version := int((values[idx]-'0')*4 + (values[idx+1]-'0')*2 + (values[idx+2] - '0'))
	typeId := int((values[idx+3]-'0')*4 + (values[idx+4]-'0')*2 + (values[idx+5] - '0'))

	idx += 6

	if typeId == 4 {
		literal := 0
		for ; values[idx] == '1'; idx += 5 {
			literal = (literal << 4) | readBinaryValue(values, idx+1, 4)
		}
		literal = (literal << 4) | readBinaryValue(values, idx+1, 4)
		idx += 5
		return idx, version, literal
	}

	var packetsLength int
	var packetVersionSum int
	var subValues []int
	if values[idx] == '1' {
		numSubPackets := readBinaryValue(values, idx+1, 11)
		idx += 12
		packetsLength, packetVersionSum, subValues = parseNPackets(values[idx:], numSubPackets)
	} else {
		packetsLength = readBinaryValue(values, idx+1, 15)
		idx += 16
		packetVersionSum, subValues = parseEntireStringOfPackets(values[idx : idx+packetsLength])
	}
	version += packetVersionSum
	idx += packetsLength

	result := doOperation(subValues, typeId)

	return idx, version, result
}

func readBinaryValue(arr []rune, start int, length int) int {
	value := 0
	for i := 0; i < length; i++ {
		value = (value << 1) | int(arr[start+i]-'0')
	}
	return value
}

func doOperation(values []int, opcode int) int {
	result := values[0]
	switch opcode {
	case 0:
		for i := 1; i < len(values); i++ {
			result += values[i]
		}
	case 1:
		for i := 1; i < len(values); i++ {
			result *= values[i]
		}
	case 2:
		for i := 1; i < len(values); i++ {
			if values[i] < result {
				result = values[i]
			}
		}
	case 3:
		for i := 1; i < len(values); i++ {
			if values[i] > result {
				result = values[i]
			}
		}

	case 5:
		if values[0] > values[1] {
			result = 1
		} else {
			result = 0
		}

	case 6:
		if values[0] < values[1] {
			result = 1
		} else {
			result = 0
		}
	case 7:
		if values[0] == values[1] {
			result = 1
		} else {
			result = 0
		}
	}
	return result
}
