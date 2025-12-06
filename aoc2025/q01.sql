/*
Advent of Code 2025 question 01 solution using SQL
To run, execute the following in a terminal with sqlite3

sqlite3 ':memory:' ".read 'q01.sql'"
*/

-- load data from the data file and skip sqlfluff linting
-- noqa:disable=all
.read q01_data.sql
-- noqa:enable=all

-- linting so that my IDE doesn't complain
CREATE TABLE IF NOT EXISTS raw_input (
    value TEXT
);

WITH RECURSIVE split (row_num, element, remaining) AS (
SELECT 0, '', (SELECT value FROM raw_input LIMIT 1)
UNION ALL
SELECT
    row_num + 1,

	CASE
		WHEN INSTR(remaining, CHAR(10)) > 0 THEN
            SUBSTR(remaining, 0, INSTR(remaining, CHAR(10) ))
		ELSE
			remaining
	END,

	CASE
		WHEN INSTR(remaining, CHAR(10)) > 0 THEN
			SUBSTR(remaining, INSTR(remaining, CHAR(10)) + 1)
		ELSE
			''
	END
FROM split
WHERE remaining <> ''
),

vals (row_num, direction, signed) AS (
    SELECT 0, 'L', 0
    UNION ALL
    SELECT
        split.row_num,
        SUBSTR(element, 1, 1),
        CASE
            WHEN SUBSTR(element, 1, 1) == 'R' THEN
                CAST(SUBSTR(element, 2) as int)
        ELSE
            -1 * CAST(SUBSTR(element, 2) as int)
        END
    from split WHERE element <> ''
),

spin_results (row_num, result) AS (
    SELECT s1.row_num, 50 + SUM(s2.signed)
    FROM vals s1
    JOIN vals s2 ON s1.row_num >= s2.row_num
    GROUP BY s1.row_num
),

fifties (row_num, result) AS (
    SELECT row_num, result
    FROM spin_results
    WHERE row_num <> 0 AND mod(result,100) == 0
),

crossings (row_num, direction, before, after, zeros) AS (
    SELECT
        s1.row_num,
        vals.direction,
        s2.result,
        s1.result,
        CASE
            /*  if going left (negative direction) then the zero counting can be off by one at the boundaries.
                For example, 0 -> -50 will change the mod, but we haven't moved a full cycle.
                A similar correction is needed for going left to zero, like 20 -> 0 counts as a click.
            */
            WHEN vals.direction == 'L' AND mod(s2.result, 100) == 0 THEN
                CAST(abs(floor(s1.result / 100.0) - floor(s2.result / 100.0)) as int) - 1
            WHEN vals.direction == 'L' AND mod(s1.result, 100) == 0 THEN
                CAST(abs(floor(s1.result / 100.0) - floor(s2.result / 100.0)) as int) + 1
            ELSE
                CAST(abs(floor(s1.result / 100.0) - floor(s2.result / 100.0)) as int)
            END
        END

    FROM spin_results s1
    JOIN spin_results s2 ON s1.row_num -1 == s2.row_num
    JOIN vals ON vals.row_num == s1.row_num
)
SELECT * from
             (SELECT 'part 1', COUNT(*) from fifties
               UNION ALL
               SELECT 'part 2', SUM(zeros) from crossings)
