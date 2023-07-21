-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	decline_ethnicity BOOLEAN;

-- Set the value based on the raw text in eth_no_answer_str
UPDATE
	load.mentorship
SET
	decline_ethnicity = CASE	WHEN	eth_no_answer_str = 'I prefer not to answer'
								THEN	TRUE::BOOLEAN
								ELSE	FALSE::BOOLEAN
								END
