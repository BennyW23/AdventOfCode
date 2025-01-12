use std::collections::HashMap;
use std::fs;

pub fn day01() {
    println!("Day 01");

    let contents =
        fs::read_to_string("input/day01.txt").expect("Something went wrong reading the file");

    println!("Part 1: {}", part1(&contents));
    println!("Part 2: {}", part2(&contents));
    println!();
}

fn part1(contents: &str) -> u32 {
    let mut left_vals: Vec<u32> = Vec::new();
    let mut right_vals: Vec<u32> = Vec::new();
    for line in contents.split('\n') {
        let mut iter = line.split_whitespace();
        left_vals.push(iter.next().unwrap().parse().unwrap());
        right_vals.push(iter.next().unwrap().parse().unwrap());
    }

    left_vals.sort();
    right_vals.sort();

    let mut total_dist = 0;
    for (pos, left) in left_vals.iter().enumerate() {
        let right = &right_vals[pos];
        total_dist += if left > right {
            left - right
        } else {
            right - left
        }
    }
    total_dist
}

fn part2(contents: &str) -> u32 {
    let mut left_vals: Vec<u32> = Vec::new();
    let mut right_frequency: HashMap<u32, u32> = HashMap::new();
    for line in contents.split('\n') {
        let mut iter = line.split_whitespace();
        left_vals.push(iter.next().unwrap().parse().unwrap());

        let right_val = iter.next().unwrap().parse().unwrap();
        right_frequency
            .entry(right_val)
            .and_modify(|freq| *freq += 1)
            .or_insert(1);
    }

    return left_vals
        .iter()
        .map(|val| val * right_frequency.get(val).unwrap_or(&0))
        .sum();
}
