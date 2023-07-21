-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	phone TEXT;

-- Set the value based on the raw text in phone_str
UPDATE
	load.mentorship
SET
	phone = regexp_replace(phone_str, '[^0-9]', '', 'g');
