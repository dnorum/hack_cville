-- Add the column to hold the combined values
ALTER TABLE
	load.mentorship
ADD COLUMN
	programs TEXT[];

-- Set the value based on the raw text in the program_*_str columns
UPDATE
	load.mentorship
SET
	-- Somewhat kludgy...
	-- Okay, hideously kludgy...
	programs = 	string_to_array(
						regexp_replace(	CASE	WHEN	program_hustle_class_str = 'Hustle Class'
												THEN	'hustle_class,'
												ELSE	''
												END
									||	CASE	WHEN	program_pioneer_str = 'The Pioneer'
												THEN	'pioneer,'
												ELSE	''
												END
									||	CASE	WHEN	program_rethink_str = 'Rethink'
												THEN	'rethink,'
												ELSE	''
												END, ',$', ''	),	',')
-- If they haven't graduated from a program yet, they shouldn't appear with a
-- program. Opportunity for consistency checks, here.
