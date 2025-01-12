use std::fs;

use lazy_static::lazy_static;
use regex::Regex;

pub fn day03() {
    println!("Day 03");

    let contents =
        fs::read_to_string("input/day03.txt").expect("Something went wrong reading the file");

    println!("Part 1: {:?}", part1(&contents));
    println!("Part 2: {:?}", part2(&contents));
    println!();
}

fn part1(contents: &str) -> i32 {
    lazy_static! {
        static ref re: Regex = Regex::new(r"mul\((\d+),(\d+)\)").unwrap();
    }

    let mut sum = 0;
    for (_, [first, second]) in re.captures_iter(contents).map(|c| c.extract()) {
        sum += first.parse::<i32>().unwrap() * second.parse::<i32>().unwrap();
    }

    return sum;
}

fn part2(contents: &str) -> i32 {
    lazy_static! {
        static ref re: Regex = Regex::new(r"(do)\(\)|(don't)\(\)|(mul)\((\d+),(\d+)\)").unwrap();
    }

    let mut enabled = true;
    let mut sum = 0;
    for captures in re.captures_iter(contents) {
        if captures.get(1) != None {
            enabled = true;
        } else if captures.get(2) != None {
            enabled = false;
        } else if captures.get(3) != None {
            if enabled {
                let first = captures.get(4).unwrap().as_str().parse::<i32>().unwrap();
                let second = captures.get(5).unwrap().as_str().parse::<i32>().unwrap();
                sum += first * second;
            }
        } else {
            println!("regex caught something odd")
        }
    }

    return sum;
}
