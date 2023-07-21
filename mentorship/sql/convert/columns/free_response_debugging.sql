-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	free_response_debugging TEXT;

-- Set the value based on the raw text in debugging_str
UPDATE
	load.mentorship
SET
	free_response_debugging = CASE	WHEN	debugging_str = ''
									THEN	NULL::TEXT
									ELSE	debugging_str
									END;
