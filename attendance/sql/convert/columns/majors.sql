-- Add the column to hold the resolved values
ALTER TABLE
	load.attendance
ADD COLUMN
	majors TEXT[];

-- Populate the array using a lookup table
UPDATE
	load.attendance
SET
	majors = processed.majors
FROM
	(	SELECT
			a.major_str
		,	array_agg(DISTINCT l.major ORDER BY l.major) AS majors
		FROM
			load.attendance AS a
				LEFT OUTER JOIN
			load.majors_lookup AS l
				ON	(	a.major_str ~* l.include_regex
					AND	a.major_str !~* l.exclude_regex	)
		GROUP BY
			1	) AS processed
WHERE
	load.attendance.major_str = processed.major_str;
