-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	normalized.students;

-- Create the core of the student table, using email addresses as IDs
-- and performing scrubbing / conversion of the data as we go where feasible
CREATE TABLE
	normalized.students
AS
	(	SELECT
			email_str AS email
		,	name_first_str AS name_first
		,	name_last_str AS name_last
		,	CASE	WHEN	year_uva_str ~ '^[0-9]+$'
					THEN	year_uva_str::INTEGER 
					ELSE	NULL
					END AS graduation_year
		,	CASE	WHEN	year_uva_str ~* '^grad(uate)?$'
					THEN	'grad'
					WHEN	year_uva_str ~ '^[0-9]+$'
					THEN	'undergrad'
					ELSE	'other'
					END AS student_type
		-- major_str requires more sophisticated resolution
		,	CASE	WHEN	gender_str ~* '^f(emale)$'
					THEN	'female'
					WHEN	gender_str ~* '^m(ale)$'
					THEN	'male'
					ELSE	lower(gender_str)
					END AS gender
		-- Note that since school relates to major(s), this is a possible
		-- within-record consistency check
		,	CASE	WHEN	school_str ~* '^school of architecture$'
					THEN	'arch'
					-- regexp_replace() to deal with misspelling
					WHEN	regexp_replace(school_str, 'Scinces', 'Sciences', 'g') ~*
								'college and graduate school of arts (and|\&) sciences'
					THEN	'as'
					WHEN	school_str ~* '^college of arts \& sciences$'
					THEN	'clas'
					WHEN	school_str ~* '^school of engineering and applied science$'
					THEN	'seas'
					ELSE	'other'
					END AS school
		-- Check for (potentially) valid phone numbers - note that no further
		-- formatting is done here
		,	CASE	WHEN	phone_str ~ '^(\d[^0-9]?)?(\d{3}[0-9]?)?(\d{3}[0-9]?)(\d{4}[0-9]?)$'
					THEN	phone_str
					ELSE	NULL::TEXT
					END AS phone
		-- This assumes that there's no further relation between door_user_id
		-- and keycard_id
		,	door_user_id_str AS door_user_id
		,	keycard_id_str AS keycard_id
		-- Assuming that dues are a constant for a student and don't change
		-- based on semester
		,	dues_str::DOUBLE PRECISION AS dues
		-- paid_f2016_str, paid_s2016_str, paid_f2015_str, program_semester_str
		-- are all at the semester-year-student level
		,	CASE	WHEN	member_type_str ~* 'ignite'
					THEN	'ignite'
					WHEN	member_type_str ~* 'member'
					THEN	'member'
					WHEN	member_type_str ~* 'rethink'
					THEN	'rethink'
					WHEN	member_type_str ~* 'wireframe'
					THEN	'wireframe'
					ELSE	'other'
					END AS member_type
		-- team_position_str requires more sophisticated resolution
		,	lower(substring(program_meeting_time_str from '^([a-zA-Z]+) ')) AS program_meeting_day
		-- Assuming PM...
		,	(substring(program_meeting_time_str from ' ([0-9]{1,2})$')::INTEGER + 12)::TEXT || '00' AS program_meeting_hour
		-- This is likely to actually be time-dependent
		,	CASE	WHEN	mentorship_survey_complete_str ~* 'no'
					THEN	FALSE::BOOLEAN
					WHEN	mentorship_survey_complete_str ~* 'yes'
					THEN	TRUE::BOOLEAN
					ELSE NULL::BOOLEAN
					END AS mentorship_survey_complete
		-- other_str has no data at present
		-- alumni_mentor_f2015_str, alumni_s2016_str, alumni_s2016_email_str are
		-- all at the semester-year-student level
		FROM
			load.membership	);

-- Add the column to hold the resolved values
ALTER TABLE
	normalized.students
ADD COLUMN
	majors TEXT[];

-- Populate the array using a lookup table
UPDATE
	normalized.students
SET
	majors = processed.majors
FROM
	(	SELECT
			m.email_str
		,	array_agg(DISTINCT l.major ORDER BY l.major) AS majors
		FROM
			load.membership AS m
				LEFT OUTER JOIN
			load.majors_lookup AS l
				ON	(	m.major_str ~* l.include_regex
					AND	m.major_str !~* l.exclude_regex	)
		GROUP BY
			1	) AS processed
WHERE
	normalized.students.email = processed.email_str;

-- Add the column to hold the resolved values
ALTER TABLE
	normalized.students
ADD COLUMN
	team_positions TEXT[];

-- Populate the array using a lookup table
-- Note that positions could be broken down into (program, position, status) for
-- example
UPDATE
	normalized.students
SET
	team_positions = processed.team_positions
FROM
	(	SELECT
			m.email_str
		,	array_agg(DISTINCT l.team_position ORDER BY l.team_position) AS team_positions
		FROM
			load.membership AS m
				LEFT OUTER JOIN
			load.team_positions_lookup AS l
				ON	(	m.team_position_str ~* l.include_regex
					AND	m.team_position_str !~* l.exclude_regex	)
		GROUP BY
			1	) AS processed
WHERE
	normalized.students.email = processed.email_str;

-- Add in an auto-incrementing column to use as our internal student ID
ALTER TABLE
	normalized.students
ADD COLUMN
	id SERIAL;
