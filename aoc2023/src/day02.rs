use regex::Regex;
use std::cmp;
use std::fs;

pub fn day02() {
    println!("Day 02");

    let contents =
        fs::read_to_string("input/day02.txt").expect("Something went wrong reading the file");

    println!("Part 1: {:?}", part1(&contents));
    println!("Part 2: {:?}", part2(&contents));
}

const TOTAL_RED: i32 = 12;
const TOTAL_GREEN: i32 = 13;
const TOTAL_BLUE: i32 = 14;

fn part1(contents: &str) -> i32 {
    let line_re = Regex::new(r"Game (\d+): (.*)").unwrap();

    let mut sum = 0;
    for line in contents.split("\n") {
        let line_parts = line_re.captures(line).unwrap();
        let game_id = line_parts.get(1).unwrap().as_str().parse::<i32>().unwrap();
        let game = line_parts.get(2).unwrap().as_str().trim();

        if is_valid_game(game) {
            sum += game_id;
        }
    }
    sum
}

fn part2(contents: &str) -> i32 {
    let line_re = Regex::new(r"Game (\d+): (.*)").unwrap();

    let mut sum = 0;
    for line in contents.split("\n") {
        let line_parts = line_re.captures(line).unwrap();
        let game = line_parts.get(2).unwrap().as_str().trim();

        sum += power(game);
    }
    sum
}

fn is_valid_game(game: &str) -> bool {
    let action_re = Regex::new(r"\s?(\d+) (green|blue|red)\s?").unwrap();
    for phase in game.split(";") {
        for game_action in phase.trim().split(",") {
            let action_parts = action_re.captures(game_action).unwrap();
            let amount = action_parts
                .get(1)
                .unwrap()
                .as_str()
                .parse::<i32>()
                .unwrap();
            let color = action_parts.get(2).unwrap().as_str();

            let ok = match color {
                "red" => amount <= TOTAL_RED,
                "green" => amount <= TOTAL_GREEN,
                _ => amount <= TOTAL_BLUE,
            };

            if !ok {
                return false;
            }
        }
    }

    true
}

fn power(game: &str) -> i32 {
    let mut red: i32 = 1;
    let mut green: i32 = 1;
    let mut blue: i32 = 1;

    let action_re = Regex::new(r"\s?(\d+) (green|blue|red)\s?").unwrap();
    for phase in game.split(";") {
        for game_action in phase.trim().split(",") {
            let action_parts = action_re.captures(game_action).unwrap();
            let amount = action_parts
                .get(1)
                .unwrap()
                .as_str()
                .parse::<i32>()
                .unwrap();
            let color = action_parts.get(2).unwrap().as_str();

            let ok = match color {
                "red" => red = cmp::max(red, amount),
                "green" => green = cmp::max(green, amount),
                _ => blue = cmp::max(blue, amount),
            };
        }
    }

    return red * green * blue;
}
