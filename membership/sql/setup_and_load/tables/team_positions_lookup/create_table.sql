-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.team_positions_lookup;

-- The csv fields will be pulled in as straight text
CREATE TABLE load.team_positions_lookup
	(	include_regex TEXT
	,	exclude_regex TEXT
	,	team_position TEXT	);
