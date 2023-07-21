-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	class_year TEXT;

-- Set the value based on the raw text in section_str
UPDATE
	load.mentorship
SET
	class_year = substring(year_uva_str from '^([0-9])(st|nd|rd|th)?$')::INTEGER;
