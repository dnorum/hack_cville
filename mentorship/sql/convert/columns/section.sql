-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	section TEXT;

-- Set the value based on the raw text in section_str
UPDATE
	load.mentorship
SET
	section = lower(section_str);
