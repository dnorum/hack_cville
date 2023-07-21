-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	free_response_current_projects TEXT;

-- Set the value based on the raw text in current_projects_str
UPDATE
	load.mentorship
SET
	free_response_current_projects = CASE	WHEN	current_projects_str = ''
											THEN	NULL::TEXT
											ELSE	current_projects_str
											END;
