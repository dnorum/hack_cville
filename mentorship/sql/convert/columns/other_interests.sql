-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	other_interests TEXT;

-- Set the value based on the raw text in interest_other_str
UPDATE
	load.mentorship
SET
	other_interests =	CASE	WHEN	interest_other_str = ''
								THEN	NULL::TEXT
								ELSE	interest_other_str
								END;
