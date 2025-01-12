use std::fs;

pub fn dayXX() {
    println!("Day XX");

    let contents =
        fs::read_to_string("input/dayXX.txt").expect("Something went wrong reading the file");

    println!("Part 1: {:?}", part1(&contents));
    println!("Part 2: {:?}", part2(&contents));
    println!();
}

fn part1(contents: &str) {}

fn part2(contents: &str) {}
