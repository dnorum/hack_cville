-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.attendance;

-- The csv fields will be pulled in as straight text to start with
CREATE TABLE load.attendance
	(	time_str TEXT
	,	email_str TEXT
	,	full_name_str TEXT
	,	alumni_matching_str TEXT
	,	graduation_year_str TEXT
	,	major_str TEXT
	,	heard_about_str TEXT
	,	first_time_str TEXT
	,	heard_about2_str TEXT	);
