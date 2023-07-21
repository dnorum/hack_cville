-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	free_response_anything_else TEXT;

-- Set the value based on the raw text in anything_else_str
UPDATE
	load.mentorship
SET
	free_response_anything_else = CASE	WHEN	anything_else_str = ''
										THEN	NULL::TEXT
										ELSE	anything_else_str
										END;
