-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	normalized.students;

-- Create the core of the student table, using email addresses as IDs
CREATE TABLE
	normalized.students
AS
	(	SELECT
			section
		,	other_skills
		,	other_classes
 		,	free_response_debugging
		,	free_response_current_projects
		,	free_response_anything_else
		,	decline_ethnicity
		,	other_ethnicity
		,	other_interests
		,	class_year
		,	phone
		,	gender
		,	cis_trans
		,	skills
		,	classes
		,	interests
		,	programs
		,	ethnicity
		,	name_first_str AS name_first
		,	name_last_str AS name_last
		,	email_uva_str AS email
		,	dream_job_str AS free_response_dream_job
		,	ideal_partner_str AS free_response_ideal_partner
		,	problems_solo_or_together_str AS free_response_problems_solo_or_together
		,	free_time_3_things_str AS free_response_free_time_three_things
		,	personality_five_words_str AS free_response_personality_five_words
		FROM
			load.mentorship	);

-- Add in an auto-incrementing column to use as our internal student ID
ALTER TABLE
	normalized.students
ADD COLUMN
	id SERIAL;
