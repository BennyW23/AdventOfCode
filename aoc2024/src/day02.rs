use std::fs;

pub fn day02() {
    println!("Day 02");

    let contents =
        fs::read_to_string("input/day02.txt").expect("Something went wrong reading the file");

    println!("Part 1: {:?}", part1(&contents));
    println!("Part 2: {:?}", part2(&contents));
}

fn part1(contents: &str) {}

fn part2(contents: &str) {}
