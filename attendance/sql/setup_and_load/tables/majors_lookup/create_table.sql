-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.majors_lookup;

-- The csv fields will be pulled in as straight text
CREATE TABLE load.majors_lookup
	(	include_regex TEXT
	,	exclude_regex TEXT
	,	major TEXT	);
