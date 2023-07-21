-- Add the column to hold the scrubbed values
ALTER TABLE
	load.mentorship
ADD COLUMN
	other_skills TEXT[];

-- Set the value based on the raw text in the skills_other_str column after
-- scrubbing
UPDATE
	load.mentorship
SET
	-- Assumes CSV input...
	other_skills =	CASE	WHEN	skills_other_str ~* '^(none)?$'
							THEN	NULL::TEXT[]
							ELSE	string_to_array(
										lower(
											regexp_replace(	skills_other_str
														,	'[\s]*,[\s]*'
														,	','
														,	'g'	)
											), ',')
							END;
