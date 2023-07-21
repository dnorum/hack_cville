-- Add the column to hold the resolved values
ALTER TABLE
	load.attendance
ADD COLUMN
	sign_in TIMESTAMP;

-- Set the value based on the raw text in time_str
UPDATE
	load.attendance
SET
	sign_in = to_timestamp(time_str, 'FMMM/DD/YYYY HH24:MI:SS');
