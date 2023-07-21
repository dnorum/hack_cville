-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	normalized.sign_ins;

-- Use the newly-created student IDs from the normalized.students table
CREATE TABLE
	normalized.sign_ins
AS
	(	SELECT
			a.sign_in
		,	a.heard_about
		,	s.id AS student_id
		FROM
			load.attendance AS a
				JOIN
			normalized.students AS s
				ON	(	a.email_str = s.email	)	);

-- Add in an auto-incrementing column to use as our internal sign-in ID
ALTER TABLE
	normalized.sign_ins
ADD COLUMN
	id SERIAL;
