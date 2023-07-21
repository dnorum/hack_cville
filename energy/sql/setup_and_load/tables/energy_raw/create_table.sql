-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.energy_raw;

-- The csv fields will be pulled in as straight text to start with
CREATE TABLE load.energy_raw
	(	tagname TEXT
	,	"timestamp" TEXT
	,	min_value TEXT
	,	min_status_str TEXT
	,	min_timestamp TEXT
	,	max_value TEXT
	,	max_status_str TEXT
	,	max_timestamp TEXT
	,	avg_value TEXT
	,	avg_status_str TEXT
	,	interpolative_value TEXT
	,	interpolative_status_str TEXT
	,	timestamp2 TEXT
	,	total_value TEXT
	,	total_status_str TEXT
	,	count_value TEXT
	,	count_status_str TEXT	);
