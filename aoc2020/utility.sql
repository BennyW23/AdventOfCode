/* This file will be used to store queries or CTEs that may be useful for multiple problems */

/* Splits an element delimited by double X'0A' characters into separate elelements */
WITH RECURSIVE split (element, remaining) AS (
SELECT '', (SELECT value FROM raw_input LIMIT 1)
UNION ALL
SELECT
	CASE
		WHEN INSTR(remaining, X'0A' || X'0A') > 0 THEN
            REPLACE(SUBSTR(remaining, 0, INSTR(remaining, X'0A' || X'0A')), X'0A', ' ')
		ELSE
			REPLACE(remaining, X'0A', ' ')
	END,

	CASE
		WHEN INSTR(remaining, X'0A' || X'0A') > 0 THEN
			SUBSTR(remaining, INSTR(remaining, X'0A' || X'0A') + 2)
		ELSE
			''
	END
FROM split
WHERE remaining <> ''
)


