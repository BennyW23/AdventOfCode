use std::fs;

pub fn day01() {
    println!("Day 01");

    let contents =
        fs::read_to_string("input/day01.txt").expect("Something went wrong reading the file");

    println!("Part 1: {}", part1(&contents));
    println!("Part 2: {}", part2(&contents));
}

fn part1(contents: &String) -> u32 {
    let mut vals: Vec<u32> = Vec::new();
    for line in contents.split("\n") {
        let mut first: char = '0';
        for c in line.chars() {
            if c.is_digit(10) {
                first = c;
                break;
            }
        }

        let mut last: char = '0';
        for c in line.chars().rev() {
            if c.is_digit(10) {
                last = c;
                break;
            }
        }
        let res: u32 = format!("{}{}", first, last).parse::<u32>().unwrap();
        vals.push(res);
    }

    vals.iter().sum::<u32>()
}

fn part2(contents: &String) -> usize {
    let mut vals: Vec<usize> = Vec::new();
    for line in contents.split("\n") {
        let first: usize = find_match(line, true);
        let last: usize = find_match(line, false);
        vals.push(first * 10 + last);
    }

    vals.iter().sum::<usize>()
}

const DIGIT_WORDS: [&str; 9] = [
    "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
];

fn find_match(line: &str, forwards: bool) -> usize {
    let size: usize = line.len();

    let mut index: usize = if forwards { 0 } else { (size as isize) - 1 } as usize;
    let diff: isize = if forwards { 1 } else { -1 };

    while index < size {
        let c = line.chars().nth(index).unwrap();
        if c.is_digit(10) {
            return c.to_digit(10).unwrap() as usize;
        }

        for (i, word) in DIGIT_WORDS.iter().enumerate() {
            if line[index..].starts_with(word) {
                return i + 1;
            }
        }

        let neg_index = index as isize + diff;
        if neg_index < 0 {
            break;
        }
        index = neg_index as usize;
    }
    return 0;
}
