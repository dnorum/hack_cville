-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.events;

-- The csv fields will be pulled in as straight text
CREATE TABLE load.events
	(	begin_str TEXT
	,	end_str TEXT
	,	name_str TEXT	);
