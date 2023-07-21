-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	-- Could be enumerated
	gender TEXT;

-- Set the value based on the raw text in gender_str
UPDATE
	load.mentorship
SET
	gender = CASE	WHEN	gender_str ~* 'f(emale)?'
					THEN	'f'
					WHEN	gender_str ~* 'm(ale)?'
					THEN	'm'
					ELSE	NULL::TEXT
					END
