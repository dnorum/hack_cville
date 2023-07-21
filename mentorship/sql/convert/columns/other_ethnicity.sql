-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	other_ethnicity TEXT;

-- Set the value based on the raw text in eth_other_str
UPDATE
	load.mentorship
SET
	other_ethnicity =	CASE	WHEN	eth_other_str = ''
								THEN	NULL::TEXT
								ELSE	eth_other_str
								END;
