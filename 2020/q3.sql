/*
Advent of Code 2020 question 3 solution using sqlite3
To run, execute the following two lines in a terminal with sqlite3

sqlite3
.read 'q3.sql'

*/

CREATE TABLE forest (
    value TEXT
);

BEGIN TRANSACTION;
INSERT INTO forest VALUES ('....#..#.................#..#..');
INSERT INTO forest VALUES ('#..#.#.#..#.###.#..#...#..#....');
INSERT INTO forest VALUES ('.#....#......#.#.#..##...#...#.');
INSERT INTO forest VALUES ('.............#.#..#........#.#.');
INSERT INTO forest VALUES ('............##.#..#...##.###...');
INSERT INTO forest VALUES ('.....#..#......#......##.......');
INSERT INTO forest VALUES ('........##........#...........#');
INSERT INTO forest VALUES ('..................#..#.........');
INSERT INTO forest VALUES ('......#..#...#..#......###..#..');
INSERT INTO forest VALUES ('.#....#...........#.....#.##...');
INSERT INTO forest VALUES ('..#..#.#........###..#....#...#');
INSERT INTO forest VALUES ('..#..##..#..#....#..#......#...');
INSERT INTO forest VALUES ('......#....................#...');
INSERT INTO forest VALUES ('.........#..#..................');
INSERT INTO forest VALUES ('..#.#.....#......#.#....#...#..');
INSERT INTO forest VALUES ('..#..........##.......##.##....');
INSERT INTO forest VALUES ('#.......#.##.....#...#....#....');
INSERT INTO forest VALUES ('####..............###.#....#...');
INSERT INTO forest VALUES ('....#........#.#..###..#...#..#');
INSERT INTO forest VALUES ('#.#......#...#.##....#.....#...');
INSERT INTO forest VALUES ('.......#......#.....#........#.');
INSERT INTO forest VALUES ('.##.........#...#.........#....');
INSERT INTO forest VALUES ('............#....#.#........#..');
INSERT INTO forest VALUES ('#..##..#....#...#.#....#....#..');
INSERT INTO forest VALUES ('.....#....##..#................');
INSERT INTO forest VALUES ('.#...........#....#..#.....#...');
INSERT INTO forest VALUES ('......#.#...#..###.............');
INSERT INTO forest VALUES ('#...#...........#..###.#..#..#.');
INSERT INTO forest VALUES ('...................#..#....#..#');
INSERT INTO forest VALUES ('....#...#...#.#.....#....#.##..');
INSERT INTO forest VALUES ('.......#.......#.#.........#...');
INSERT INTO forest VALUES ('#..#.......#...#..#.#......#...');
INSERT INTO forest VALUES ('..##...........#....#..#.......');
INSERT INTO forest VALUES ('.#...............#...##........');
INSERT INTO forest VALUES ('.....#..........#............#.');
INSERT INTO forest VALUES ('..#.......#.#.#...........#..#.');
INSERT INTO forest VALUES ('........#..#.#.#........#.#.##.');
INSERT INTO forest VALUES ('.###..............#.#..........');
INSERT INTO forest VALUES ('.#....###.....#......#....#....');
INSERT INTO forest VALUES ('............#.#......#..#....#.');
INSERT INTO forest VALUES ('.#.#.............#........##...');
INSERT INTO forest VALUES ('.....#..###....##.....#....#..#');
INSERT INTO forest VALUES ('.##....#...#.#.........#......#');
INSERT INTO forest VALUES ('....##.......#...............##');
INSERT INTO forest VALUES ('..........##.##.......#........');
INSERT INTO forest VALUES ('......#....##.........##.#.#.#.');
INSERT INTO forest VALUES ('..............#....#..#......#.');
INSERT INTO forest VALUES ('......##.........#.........#...');
INSERT INTO forest VALUES ('.#...##...##....##..#..#.....#.');
INSERT INTO forest VALUES ('.#......#.###.#....#...#......#');
INSERT INTO forest VALUES ('.##.......................#..#.');
INSERT INTO forest VALUES ('....#......#.##..........#.###.');
INSERT INTO forest VALUES ('.#.....##..........#.#.........');
INSERT INTO forest VALUES ('....#.#.........#...#..........');
INSERT INTO forest VALUES ('.#..##.#....##.......#.......#.');
INSERT INTO forest VALUES ('.........#.......#............#');
INSERT INTO forest VALUES ('###..........#.....##.#....#...');
INSERT INTO forest VALUES ('.......###.#....#........#...##');
INSERT INTO forest VALUES ('..#..#....#.......#.#..........');
INSERT INTO forest VALUES ('.#..#..........#......#...#....');
INSERT INTO forest VALUES ('.....###.#..#.....#...#..#.....');
INSERT INTO forest VALUES ('........#.#.#..........#.#..#..');
INSERT INTO forest VALUES ('........#...##.................');
INSERT INTO forest VALUES ('...#.............#.#..#......##');
INSERT INTO forest VALUES ('......#......##......#...#.#..#');
INSERT INTO forest VALUES ('.#..#...##..........#...##.....');
INSERT INTO forest VALUES ('..#.#....####..#...#....##....#');
INSERT INTO forest VALUES ('.#..##.........#..##......#....');
INSERT INTO forest VALUES ('#....#.#.........#.............');
INSERT INTO forest VALUES ('....###..............#....#....');
INSERT INTO forest VALUES ('....#..#..#...###..#.#..#.#....');
INSERT INTO forest VALUES ('....#.....#...........###..#...');
INSERT INTO forest VALUES ('....#.#.....#...#.....#.......#');
INSERT INTO forest VALUES ('..#.......#..................#.');
INSERT INTO forest VALUES ('#...................##.........');
INSERT INTO forest VALUES ('....#.#.#.#.#.....#.....#......');
INSERT INTO forest VALUES ('...............##..#..##.#...##');
INSERT INTO forest VALUES ('..#.....#.....##.........#..#..');
INSERT INTO forest VALUES ('...#...#.....#..##..##....#..##');
INSERT INTO forest VALUES ('..#.................#....#...#.');
INSERT INTO forest VALUES ('#....##...............##..#....');
INSERT INTO forest VALUES ('..#.....#.....##.........##...#');
INSERT INTO forest VALUES ('..#.###..............#...#.....');
INSERT INTO forest VALUES ('.......................#.......');
INSERT INTO forest VALUES ('#...#..#.....##...#...#........');
INSERT INTO forest VALUES ('..........#......#.###....#...#');
INSERT INTO forest VALUES ('..#.....#.##.#..#.#.......#....');
INSERT INTO forest VALUES ('#.##...#............#..........');
INSERT INTO forest VALUES ('#........#.#.#..#...#..#.....##');
INSERT INTO forest VALUES ('#............#.#...............');
INSERT INTO forest VALUES ('.#..#.......#.#.....#.#......##');
INSERT INTO forest VALUES ('.#.#....#........#..##.........');
INSERT INTO forest VALUES ('..#....#......#.#...##...#.....');
INSERT INTO forest VALUES ('##.....#......................#');
INSERT INTO forest VALUES ('...#.......#..##.....#........#');
INSERT INTO forest VALUES ('......##..#...............##...');
INSERT INTO forest VALUES ('.....#...#......##....#.#......');
INSERT INTO forest VALUES ('.#...#....#.#.#........#...#.#.');
INSERT INTO forest VALUES ('.......#...#...##...#..........');
INSERT INTO forest VALUES ('.##..#..##........##....###.#..');
INSERT INTO forest VALUES ('..##........#........##........');
INSERT INTO forest VALUES ('............#....#......#......');
INSERT INTO forest VALUES ('.......#...........#.......#...');
INSERT INTO forest VALUES ('#.#......##.#...#....#.#.....#.');
INSERT INTO forest VALUES ('..#.#.#......##........#....#..');
INSERT INTO forest VALUES ('#.#.####.#..#..........#.......');
INSERT INTO forest VALUES ('......................#.#......');
INSERT INTO forest VALUES ('...#.......#.....#......#..#.#.');
INSERT INTO forest VALUES ('...#....#....##..........#..##.');
INSERT INTO forest VALUES ('......#......#....#.........#..');
INSERT INTO forest VALUES ('.........#....#...#.#.........#');
INSERT INTO forest VALUES ('.....#...##.#.#.#......#.....#.');
INSERT INTO forest VALUES ('........#...#......#.#....#....');
INSERT INTO forest VALUES ('.....#.........#.............#.');
INSERT INTO forest VALUES ('.#...........#.#....##.......#.');
INSERT INTO forest VALUES ('.#..#......#....#....#....#....');
INSERT INTO forest VALUES ('#.......#.#.#.#..#.......#.....');
INSERT INTO forest VALUES ('..#...#...#......#.............');
INSERT INTO forest VALUES ('.....#.......#..#.........##..#');
INSERT INTO forest VALUES ('#..##...........#.#.........#..');
INSERT INTO forest VALUES ('#..#..........#....#......#...#');
INSERT INTO forest VALUES ('#...#............#....##..#.##.');
INSERT INTO forest VALUES ('....#.#..#....#.........##..##.');
INSERT INTO forest VALUES ('.........#..........#.......##.');
INSERT INTO forest VALUES ('#...#........................#.');
INSERT INTO forest VALUES ('....#....#..#...........##...#.');
INSERT INTO forest VALUES ('.....###.###.#....#.....#.....#');
INSERT INTO forest VALUES ('.#..###..#...##..........#.....');
INSERT INTO forest VALUES ('#..#.....#...#........#........');
INSERT INTO forest VALUES ('.#..##..#......#.....#......##.');
INSERT INTO forest VALUES ('#.....##........#.#..#....#.#..');
INSERT INTO forest VALUES ('.#....#...#..#...............#.');
INSERT INTO forest VALUES ('..........#.#........#.....#...');
INSERT INTO forest VALUES ('..#.#.....#....#........#.###..');
INSERT INTO forest VALUES ('...#..#...#.##.....#..........#');
INSERT INTO forest VALUES ('..#......##....................');
INSERT INTO forest VALUES ('.....#...#....#..#....#.......#');
INSERT INTO forest VALUES ('......#............#....#...#..');
INSERT INTO forest VALUES ('.#..#....#.....#........##.....');
INSERT INTO forest VALUES ('...#..#.......#...............#');
INSERT INTO forest VALUES ('##.#..#...............#.#..##..');
INSERT INTO forest VALUES ('..#.........#.####.####........');
INSERT INTO forest VALUES ('.........#...#.#........#..###.');
INSERT INTO forest VALUES ('..###.....#.........##........#');
INSERT INTO forest VALUES ('#..##.....##.#..........#....##');
INSERT INTO forest VALUES ('.#..#....###..#.....##..#......');
INSERT INTO forest VALUES ('#...#..#........#.............#');
INSERT INTO forest VALUES ('#.#....#........#.........#.###');
INSERT INTO forest VALUES ('.....#....#.###.......#........');
INSERT INTO forest VALUES ('...........#............#..#...');
INSERT INTO forest VALUES ('..........#.#..##......###....#');
INSERT INTO forest VALUES ('..##....#...........#....#....#');
INSERT INTO forest VALUES ('..#...##.#.......#.##.......#..');
INSERT INTO forest VALUES ('.......#......#..........#....#');
INSERT INTO forest VALUES ('.........#..#..............####');
INSERT INTO forest VALUES ('#.#...#...#......#...#..#...#.#');
INSERT INTO forest VALUES ('.#.#...#.....#.......#.#..##.#.');
INSERT INTO forest VALUES ('......##..##...#...............');
INSERT INTO forest VALUES ('....#....#...##.......#.#......');
INSERT INTO forest VALUES ('.............................#.');
INSERT INTO forest VALUES ('..##...#.......#......#.......#');
INSERT INTO forest VALUES ('.#.##.##....#......##.......#..');
INSERT INTO forest VALUES ('.......##..#....#.##.#.#.......');
INSERT INTO forest VALUES ('....#.............#......#..#..');
INSERT INTO forest VALUES ('...#.........#....#..#.....#.#.');
INSERT INTO forest VALUES ('......#......#......#.........#');
INSERT INTO forest VALUES ('........#..#.#.....#.....#...#.');
INSERT INTO forest VALUES ('.#.......#.........#...#.......');
INSERT INTO forest VALUES ('#.#.##.....#...#...............');
INSERT INTO forest VALUES ('..#.......##.....#............#');
INSERT INTO forest VALUES ('.................##.#..#.....##');
INSERT INTO forest VALUES ('........#.###....#.......##.#..');
INSERT INTO forest VALUES ('....#.#..#..#.......#.#....#..#');
INSERT INTO forest VALUES ('.#..#..#..#...##....#..#.....#.');
INSERT INTO forest VALUES ('...#..#...#..........#........#');
INSERT INTO forest VALUES ('...........##....#...##.#...###');
INSERT INTO forest VALUES ('.##..#.......##.....##....#....');
INSERT INTO forest VALUES ('...#.#..#..#..##..#.....##.....');
INSERT INTO forest VALUES ('.#.....#..........#...#........');
INSERT INTO forest VALUES ('.....#..#.#..#.................');
INSERT INTO forest VALUES ('..#.......#..#.....##.......#..');
INSERT INTO forest VALUES ('............##.##.....#...#....');
INSERT INTO forest VALUES ('#......#......................#');
INSERT INTO forest VALUES ('...#..........#...#...#..#.....');
INSERT INTO forest VALUES ('......##..............##.##....');
INSERT INTO forest VALUES ('................##......#.###..');
INSERT INTO forest VALUES ('.###...#..........#...........#');
INSERT INTO forest VALUES ('#....#...#.........##......#...');
INSERT INTO forest VALUES ('.............#...............#.');
INSERT INTO forest VALUES ('.###.....#......#...#.......#..');
INSERT INTO forest VALUES ('......##..#.#.#.....#........#.');
INSERT INTO forest VALUES ('..#.#..........#.#......##.....');
INSERT INTO forest VALUES ('.#.#...#.#.....#.#..#.....#....');
INSERT INTO forest VALUES ('.......#....#.#....##..........');
INSERT INTO forest VALUES ('#.........#........####.#......');
INSERT INTO forest VALUES ('...#..#.....#..............#.#.');
INSERT INTO forest VALUES ('...#..........................#');
INSERT INTO forest VALUES ('..##....#..#..........#....#...');
INSERT INTO forest VALUES ('..##.##.#.#.#......#..#........');
INSERT INTO forest VALUES ('...#..#.#.#..#........#.......#');
INSERT INTO forest VALUES ('.....#.....#..#...#........##..');
INSERT INTO forest VALUES ('..#..#...........#...##..##..#.');
INSERT INTO forest VALUES ('#.....#.....#..#..##........#..');
INSERT INTO forest VALUES ('...#..............#......#..#..');
INSERT INTO forest VALUES ('...#.#...........###...#.#.....');
INSERT INTO forest VALUES ('..........................#.#..');
INSERT INTO forest VALUES ('....#........#..#..........#.#.');
INSERT INTO forest VALUES ('.#..#..........#.#..........#..');
INSERT INTO forest VALUES ('....#.........#......#.#....#..');
INSERT INTO forest VALUES ('..#........#.................#.');
INSERT INTO forest VALUES ('...#......#............#.......');
INSERT INTO forest VALUES ('...#.#...#..##....#........#...');
INSERT INTO forest VALUES ('......##.#....#.#......#.......');
INSERT INTO forest VALUES ('........#..........#........#..');
INSERT INTO forest VALUES ('###..#.....#...#......#...###..');
INSERT INTO forest VALUES ('..##...#..###............#...#.');
INSERT INTO forest VALUES ('#.......#..#..#............##..');
INSERT INTO forest VALUES ('#........####......#...........');
INSERT INTO forest VALUES ('#..#..#...........#.......####.');
INSERT INTO forest VALUES ('......#..##................#...');
INSERT INTO forest VALUES ('.....#..##......#.#...#..#.....');
INSERT INTO forest VALUES ('......#.....##.....#.###.......');
INSERT INTO forest VALUES ('.#.....#.........#.......#.#..#');
INSERT INTO forest VALUES ('.##...........###...#....#...#.');
INSERT INTO forest VALUES ('.#....#..#....#.##...#.........');
INSERT INTO forest VALUES ('.................##............');
INSERT INTO forest VALUES ('......#......#.............#...');
INSERT INTO forest VALUES ('.........##.#........#....#...#');
INSERT INTO forest VALUES ('..##....#.......#....##.#......');
INSERT INTO forest VALUES ('.......#.#.#.....##..#.#.......');
INSERT INTO forest VALUES ('......#.#.#.#......#...#.......');
INSERT INTO forest VALUES ('....##...#.....#..#......#.....');
INSERT INTO forest VALUES ('..............#......#.##......');
INSERT INTO forest VALUES ('#.##..###........#.##........##');
INSERT INTO forest VALUES ('#..#.........#.#......#.#......');
INSERT INTO forest VALUES ('.#..###.......#................');
INSERT INTO forest VALUES ('..............#...#..##.#.#....');
INSERT INTO forest VALUES ('.....#..#........#...##.#...#..');
INSERT INTO forest VALUES ('.#...##.....#........#..###.#..');
INSERT INTO forest VALUES ('....#.....#...#........#.......');
INSERT INTO forest VALUES ('....#.##.....#....#............');
INSERT INTO forest VALUES ('#.#..#....#....#............#..');
INSERT INTO forest VALUES ('....#....#...#.#...#...######..');
INSERT INTO forest VALUES ('.##.........#..#.....#.....#...');
INSERT INTO forest VALUES ('..##...............#...........');
INSERT INTO forest VALUES ('........##...#........#..#.....');
INSERT INTO forest VALUES ('...#................###.##..##.');
INSERT INTO forest VALUES ('.#..#..#..#...#.............#..');
INSERT INTO forest VALUES ('#.....#..##.#....#.#......#..#.');
INSERT INTO forest VALUES ('...#...#...#.....#...#...#.....');
INSERT INTO forest VALUES ('..##.###..#..#...##...........#');
INSERT INTO forest VALUES ('.#.......##........#.#..#..#...');
INSERT INTO forest VALUES ('..#.......#.###................');
INSERT INTO forest VALUES ('..#...#........##...#..#......#');
INSERT INTO forest VALUES ('...#...#............#.#......#.');
INSERT INTO forest VALUES ('..#...#.....#.#.#.#........#...');
INSERT INTO forest VALUES ('.#........#......##....##...#..');
INSERT INTO forest VALUES ('...#..##....#.........#....#.#.');
INSERT INTO forest VALUES ('....#........##...............#');
INSERT INTO forest VALUES ('.###.....#...#..#.#.....#.....#');
INSERT INTO forest VALUES ('..#...#..................#...##');
INSERT INTO forest VALUES ('#..#....###....................');
INSERT INTO forest VALUES ('...........#...#...........#...');
INSERT INTO forest VALUES ('........#.....#................');
INSERT INTO forest VALUES ('#........#...........#........#');
INSERT INTO forest VALUES ('........#..#....#...#....#..#..');
INSERT INTO forest VALUES ('#.#....#......#.......##.......');
INSERT INTO forest VALUES ('.#.....##..#...#......#.#.#....');
INSERT INTO forest VALUES ('..#..##.#.....#...#.#......#.#.');
INSERT INTO forest VALUES ('.##....#...#....#......##......');
INSERT INTO forest VALUES ('.#..#..#...##.##..#.#..#.......');
INSERT INTO forest VALUES ('.....#.#...........#.#........#');
INSERT INTO forest VALUES ('.#...#....#..................#.');
INSERT INTO forest VALUES ('...........#...#.........#.....');
INSERT INTO forest VALUES ('.#..###........##......#..#...#');
INSERT INTO forest VALUES ('.............###..##.....#.#..#');
INSERT INTO forest VALUES ('.#..#..........#......#........');
INSERT INTO forest VALUES ('..#........#.#...#.......##.#..');
INSERT INTO forest VALUES ('....#...........##......#...#..');
INSERT INTO forest VALUES ('...........#....#.....#...#.#..');
INSERT INTO forest VALUES ('...#...........#.....#.#..#..#.');
INSERT INTO forest VALUES ('......#.......#................');
INSERT INTO forest VALUES ('##.......#.....#............#.#');
INSERT INTO forest VALUES ('.##.....#.#.#..................');
INSERT INTO forest VALUES ('..........#.....##..#.#.#......');
INSERT INTO forest VALUES ('.###.#.....##...#..#.#........#');
INSERT INTO forest VALUES ('#....#........##..#..#.........');
INSERT INTO forest VALUES ('.............#.........##..#...');
INSERT INTO forest VALUES ('......##.#...#.#.#....##.......');
INSERT INTO forest VALUES ('.#.......###.#.###..##........#');
INSERT INTO forest VALUES ('..##.....#..#.............#..#.');
INSERT INTO forest VALUES ('.#...#......#.#.............#..');
INSERT INTO forest VALUES ('..##.#...#.........##....#...#.');
INSERT INTO forest VALUES ('...........#......#.#..........');
INSERT INTO forest VALUES ('.....#..#...##.....#....#..#...');
INSERT INTO forest VALUES ('#...................##...#.....');
INSERT INTO forest VALUES ('..#.................#.....#....');
INSERT INTO forest VALUES ('..............#..#.#...###.....');
INSERT INTO forest VALUES ('.......#........#...#.....#....');
INSERT INTO forest VALUES ('.............#.......#...##..#.');
INSERT INTO forest VALUES ('.#...#..#...#..#.....#......#.#');
INSERT INTO forest VALUES ('....#..#..#...#...........#....');
INSERT INTO forest VALUES ('.....#..#......##.##....#..#...');
INSERT INTO forest VALUES ('...#......#..#.#...#.....#.....');
INSERT INTO forest VALUES ('.......##..#.#.......#..#....##');
INSERT INTO forest VALUES ('#.#..#....##.##.#.#..........#.');
INSERT INTO forest VALUES ('..........#..........#....##.#.');
INSERT INTO forest VALUES ('....#.................#...#..#.');
INSERT INTO forest VALUES ('...#.....#..#...#.#...#..#.....');
INSERT INTO forest VALUES ('....#.#..###....#.............#');
INSERT INTO forest VALUES ('#....#..#.#..........#..#..#...');
INSERT INTO forest VALUES ('...#..#......#...#...#...#...#.');
INSERT INTO forest VALUES ('##....#.......#..........#.....');
INSERT INTO forest VALUES ('#......#.........#...#.........');
INSERT INTO forest VALUES ('##...##.#....#....#..#..#.#....');
INSERT INTO forest VALUES ('....#..#.....#.##.#.......#.#..');
INSERT INTO forest VALUES ('..##....##....#...#..####...#.#');
INSERT INTO forest VALUES ('..##..........#.............#..');
INSERT INTO forest VALUES ('..#......#..............#......');
INSERT INTO forest VALUES ('...#......#..#.#...#.......#...');
INSERT INTO forest VALUES ('.#............#....#...##.##..#');
INSERT INTO forest VALUES ('..##..........#...........#..#.');
INSERT INTO forest VALUES ('..#..##..#....#..#.#..#..#..#..');
COMMIT;

/*
BEGIN TRANSACTION;
INSERT INTO forest VALUES ('..##.......');
INSERT INTO forest VALUES ('#...#...#..');
INSERT INTO forest VALUES ('.#....#..#.');
INSERT INTO forest VALUES ('..#.#...#.#');
INSERT INTO forest VALUES ('.#...##..#.');
INSERT INTO forest VALUES ('..#.##.....');
INSERT INTO forest VALUES ('.#.#.#....#');
INSERT INTO forest VALUES ('.#........#');
INSERT INTO forest VALUES ('#.##...#...');
INSERT INTO forest VALUES ('#...##....#');
INSERT INTO forest VALUES ('.#..#...#.#');
COMMIT;
*/


SELECT COUNT(*)
FROM forest
WHERE SUBSTR(value, ((3 * (rowid -1)) % length(value)) + 1, 1) == '#';


SELECT query1.value * query2.value * query3.value * query4.value * query5.value
FROM (
    SELECT COUNT(*) AS value
    FROM forest
    WHERE SUBSTR(value, ((rowid -1) % length(value)) + 1, 1) == '#'
    ) query1
JOIN (
    SELECT COUNT(*) AS value
    FROM forest
    WHERE SUBSTR(value, ((3 * (rowid -1)) % length(value)) + 1, 1) == '#'
    ) query2
JOIN (
    SELECT COUNT(*) AS value
    FROM forest
    WHERE SUBSTR(value, ((5 * (rowid -1)) % length(value)) + 1, 1) == '#'
    ) query3
JOIN (
    SELECT COUNT(*) AS value
    FROM forest
    WHERE SUBSTR(value, ((7 * (rowid -1)) % length(value)) + 1, 1) == '#'
    ) query4
JOIN (
    SELECT COUNT(*) AS value
    FROM forest
    WHERE SUBSTR(value, (((rowid -1)/2) % length(value)) + 1, 1) == '#'
    AND rowid % 2 = 1
    ) query5;
