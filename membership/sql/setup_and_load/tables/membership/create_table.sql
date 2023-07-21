-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.membership;

-- The csv fields will be pulled in as straight text to start with
CREATE TABLE load.membership
	(	name_first_str TEXT
	,	name_last_str TEXT
	,	email_str TEXT
	,	year_uva_str TEXT
	,	major_str TEXT
	,	gender_str TEXT
	,	school_str TEXT
	,	phone_str TEXT
	,	door_user_id_str TEXT
	,	keycard_id_str TEXT
	,	dues_str TEXT
	,	paid_f2016_str TEXT
	,	paid_s2016_str TEXT
	,	paid_f2015_str TEXT
	,	program_semester_str TEXT
	,	member_type_str TEXT
	,	team_position_str TEXT
	,	program_meeting_time_str TEXT
	,	mentorship_survey_complete_str TEXT
	,	other_str TEXT
	,	alumni_mentor_f2015_str TEXT
	,	alumni_s2016_str TEXT
	,	alumni_s2016_email_str TEXT	);
