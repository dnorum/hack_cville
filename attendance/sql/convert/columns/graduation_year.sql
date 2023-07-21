-- Add the column to hold the resolved values
ALTER TABLE
	load.attendance
ADD COLUMN
	graduation_year INTEGER;

-- Set the value based on the raw text in graduation_year_str
UPDATE
	load.attendance
SET
	graduation_year = graduation_year_str::INTEGER;
