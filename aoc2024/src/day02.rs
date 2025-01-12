use std::fs;

pub fn day02() {
    println!("Day 02");

    let contents =
        fs::read_to_string("input/day02.txt").expect("Something went wrong reading the file");

    println!("Part 1: {:?}", part1(&contents));
    println!("Part 2: {:?}", part2(&contents));
    println!();
}

fn part1(contents: &str) -> i32 {
    return contents
        .split('\n')
        .map(is_record_safe_part1)
        .map(|x| x as i32)
        .sum();
}

fn is_record_safe_part1(line: &str) -> bool {
    let values = line
        .split_whitespace()
        .map(|i| i.parse::<i32>().unwrap())
        .collect::<Vec<i32>>();
    is_record_safe(&values)
}

fn is_record_safe(values: &[i32]) -> bool {
    let mut prev = values[0];
    let mut cur = values[1];

    let is_increasing = cur > prev;

    if !is_level_safe(is_increasing, cur, prev) {
        return false;
    }

    prev = cur;
    let mut index = 2;
    while index < values.len() {
        cur = values[index];
        index += 1;
        if !is_level_safe(is_increasing, cur, prev) {
            return false;
        }
        prev = cur;
    }

    true
}

fn is_level_safe(is_increasing: bool, cur: i32, prev: i32) -> bool {
    let abs_difference = if is_increasing {
        cur - prev
    } else {
        prev - cur
    };
    (1..=3).contains(&abs_difference)
}

fn part2(contents: &str) -> i32 {
    return contents
        .split('\n')
        .map(is_record_safe_part2)
        .map(|x| x as i32)
        .sum();
}

fn is_record_safe_part2(line: &str) -> bool {
    let values = line
        .split_whitespace()
        .map(|i| i.parse::<i32>().unwrap())
        .collect::<Vec<i32>>();
    if is_record_safe(&values) {
        return true;
    }

    let mut i = 0;
    while i < values.len() {
        if is_record_safe(&get_values_without_index(&values, i)) {
            return true;
        }
        i += 1
    }
    false
}

fn get_values_without_index(values: &[i32], index: usize) -> Vec<i32> {
    let mut copy: Vec<i32> = values.to_owned();
    copy.remove(index);
    copy
}
