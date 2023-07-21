-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	normalized.students;

-- Create the core of the student table, using email addresses as IDs and taking
-- the most recent full_name, graduation_year, and majors
CREATE TABLE
	normalized.students
AS
	(	SELECT
			email_str AS email
		,	first_value(full_name_str)
				OVER	(	PARTITION BY
								email_str
							ORDER BY
								sign_in	) AS full_name
		,	first_value(graduation_year)
				OVER	(	PARTITION BY
								email_str
							ORDER BY
								sign_in	) AS graduation_year
		,	first_value(majors)
				OVER	(	PARTITION BY
								email_str
							ORDER BY
								sign_in	) AS majors
		FROM
			load.attendance	);

-- Add in an auto-incrementing column to use as our internal student ID
ALTER TABLE
	normalized.students
ADD COLUMN
	id SERIAL;
