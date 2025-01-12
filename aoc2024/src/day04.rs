use std::fs;

const VALID_LETTERS_PART_2: [&str; 2] = ["M", "S"];

pub fn day04() {
    println!("Day 04");

    let contents =
        fs::read_to_string("input/day04.txt").expect("Something went wrong reading the file");

    println!("Part 1: {:?}", part1(&contents));
    println!("Part 2: {:?}", part2(&contents));
    println!();
}

fn part1(contents: &str) -> i32 {
    let (mut grid, num_rows, num_cols) = Grid::new(contents);

    let mut num_xmas = 0;
    for x in 0..num_cols {
        for y in 0..num_rows {
            if grid.get(x, y) != "X" {
                continue;
            }
            for dx in -1..2 {
                for dy in -1..2 {
                    if dx == 0 && dy == 0 {
                        continue;
                    }

                    if direction_works(&mut grid, x, y, dx, dy) {
                        num_xmas += 1
                    }
                }
            }
        }
    }
    num_xmas
}

fn direction_works(grid: &mut Grid, x: i32, y: i32, dx: i32, dy: i32) -> bool {
    for (i, char) in ["X", "M", "A", "S"].iter().enumerate() {
        let next_x = x + (i as i32 * dx);
        let next_y = y + (i as i32 * dy);
        if grid.get(next_x, next_y) != *char {
            return false;
        }
    }
    true
}

fn part2(contents: &str) -> i32 {
    let (grid, num_rows, num_cols) = Grid::new(contents);

    let mut num_x_mas = 0;
    for x in 0..num_cols {
        for y in 0..num_rows {
            if grid.get(x, y) != "A" {
                continue;
            }

            if has_x_mas(&grid, x, y) {
                num_x_mas += 1
            }
        }
    }
    num_x_mas
}

fn has_x_mas(grid: &Grid, x: i32, y: i32) -> bool {
    for [dx, dy] in [[-1, -1], [-1, 1], [1, -1], [1, 1]] {
        if !VALID_LETTERS_PART_2.contains(&grid.get(x + dx, y + dy).as_str()) {
            return false;
        }
    }

    if grid.get(x - 1, y - 1) == grid.get(x + 1, y + 1) {
        return false;
    }

    if grid.get(x - 1, y + 1) == grid.get(x + 1, y - 1) {
        return false;
    }
    true
}

struct Grid {
    grid: Vec<char>,
    row_len: i32,
}

impl Grid {
    pub fn new(grid_string: &str) -> (Grid, i32, i32) {
        let mut grid = Grid {
            grid: vec![],
            row_len: 0,
        };

        let mut num_rows = 0;
        for line in grid_string.split('\n') {
            grid.push_row(line.trim());
            num_rows += 1;
        }
        let num_cols = grid.row_len;
        (grid, num_rows, num_cols)
    }

    fn push_row(&mut self, row: &str) {
        for (_, c) in row.chars().enumerate() {
            self.grid.push(c);
        }
        self.row_len = row.len() as i32
    }

    pub fn get(&self, x: i32, y: i32) -> String {
        if x < 0 || x >= self.row_len || y < 0 {
            return "".to_string();
        }
        let index = y * self.row_len + x;
        return self.grid.get(index as usize).unwrap_or(&'0').to_string();
    }
}
