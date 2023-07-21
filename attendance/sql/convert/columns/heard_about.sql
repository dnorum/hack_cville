-- Add the column to hold the resolved values
ALTER TABLE
	load.attendance
ADD COLUMN
	heard_about TEXT;

-- Update based on common enumerations found in heard_about2_str
UPDATE
	load.attendance
SET
	heard_about = 	CASE	WHEN	heard_about2_str ~* 'activity fair'
							THEN	'activity_fair'
							WHEN	heard_about2_str ~* 'facebook'
							THEN	'facebook'
							WHEN	heard_about2_str ~* 'friend'
							THEN	'friend'
							WHEN	heard_about2_str ~* 'newsletter'
							THEN	'newsletter'
							WHEN	heard_about2_str ~* 'node'
							THEN	'node'
							WHEN	heard_about2_str ~* 'website'
							THEN	'website'
							ELSE	'other' END;
