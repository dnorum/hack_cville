-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	normalized.semester__student__year;

-- Create the semester__student__year table, using email addresses as IDs
-- Note that canonically we'd also have to create the semester, year, and some
-- sort of alumni table
-- Also note that this could be done dynamically in a loop over specifically
-- formatted column names
CREATE TABLE
	normalized.semester__student__year
AS
	(	SELECT
			s.id AS student_id
		,	CASE	WHEN	m.paid_f2016_str ~* 'n/?a'
					THEN	'not_applicable'
					WHEN	m.paid_f2016_str ~* 'no?'
					THEN	'no'
					WHEN	m.paid_f2016_str ~* 'y(es)?'
					THEN	'yes'
					WHEN	m.paid_f2016_str = ''
					THEN	NULL
					ELSE	m.paid_f2016_str
					END AS paid
		,	CASE	WHEN	m.program_semester_str ~* 'f2016'
					THEN	lower(substring(m.program_semester_str from '([a-zA-Z]+) [fF]2016'))
					ELSE	NULL::TEXT
					END AS program
		,	NULL::TEXT AS alumni
		,	NULL::TEXT AS alumni_email
		,	'fall'::TEXT AS semester
		,	2016 AS year
		FROM
			load.membership AS m
				JOIN
			normalized.students AS s
				ON	(	m.email_str = s.email	)
		-- Ensure that they have _some_ sort of a record for that time
		WHERE
			m.paid_f2016_str != ''
		OR	m.program_semester_str ~* 'f2016'

		UNION

		SELECT
			s.id AS student_id
		,	CASE	WHEN	m.paid_s2016_str ~* 'n/?a'
					THEN	'not_applicable'
					WHEN	m.paid_s2016_str ~* 'no?'
					THEN	'no'
					WHEN	m.paid_s2016_str ~* 'y(es)?'
					THEN	'yes'
					WHEN	m.paid_s2016_str = ''
					THEN	NULL
					ELSE	m.paid_s2016_str
					END AS paid
		,	CASE	WHEN	m.program_semester_str ~* 's2016'
					THEN	lower(substring(m.program_semester_str from '([a-zA-Z]+) [sS]2016'))
					ELSE	NULL::TEXT
					END AS program
		,	m.alumni_s2016_str AS alumni
		,	m.alumni_s2016_email_str AS alumni_email
		,	'spring'::TEXT AS semester
		,	2016 AS year
		FROM
			load.membership AS m
				JOIN
			normalized.students AS s
				ON	(	m.email_str = s.email	)
		-- Ensure that they have _some_ sort of a record for that time
		WHERE
			m.paid_s2016_str != ''
		OR	m.program_semester_str ~* 's2016'
		OR	m.alumni_s2016_str != ''
		OR	m.alumni_s2016_email_str != ''

		UNION

		SELECT
			s.id AS student_id
		,	CASE	WHEN	m.paid_f2015_str ~* 'n/?a'
					THEN	'not_applicable'
					WHEN	m.paid_f2015_str ~* 'no?'
					THEN	'no'
					WHEN	m.paid_f2015_str ~* 'y(es)?'
					THEN	'yes'
					WHEN	m.paid_f2015_str = ''
					THEN	NULL
					ELSE	m.paid_f2015_str
					END AS paid
		,	CASE	WHEN	m.program_semester_str ~* 'f2015'
					THEN	lower(substring(m.program_semester_str from '([a-zA-Z]+) [fF]2015'))
					ELSE	NULL::TEXT
					END AS program
		,	m.alumni_mentor_f2015_str AS alumni
		,	NULL::TEXT AS alumni_email
		,	'fall'::TEXT AS semester
		,	2015 AS year
		FROM
			load.membership AS m
				JOIN
			normalized.students AS s
				ON	(	m.email_str = s.email	)
		-- Ensure that they have _some_ sort of a record for that time
		WHERE
			m.paid_f2015_str != ''
		OR	m.program_semester_str ~* 'f2015'
		OR	m.alumni_mentor_f2015_str != ''	);

-- Add in an auto-incrementing column to use as our internal ID
ALTER TABLE
	normalized.semester__student__year
ADD COLUMN
	id SERIAL;
