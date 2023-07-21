-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.energy;

CREATE TABLE load.energy AS
	(	SELECT
			tagname_value AS tagname
		,	timestamp_value AS "timestamp"
		,	min_value_value AS min_value
		,	min_status_quality_value AS min_status_quality
		,	min_status_source_value AS min_status_source
		,	min_timestamp_value AS min_timestamp
		,	max_value_value AS max_value
		,	max_status_quality_value AS max_status_quality
		,	max_status_source_value AS max_status_source
		,	max_timestamp_value AS max_timestamp
		,	avg_value_value AS avg_value
		,	avg_status_quality_value AS avg_status_quality
		,	avg_status_source_value AS avg_status_source
		,	interpolative_value_value AS interpolative_value
		,	interpolative_status_quality_value AS interpolative_status_quality
		,	interpolative_status_source_value AS interpolative_status_source
		-- timestamp2 is identical to timestamp
		,	total_value_value AS total_value
		,	total_status_quality_value AS total_status_quality
		,	total_status_source_value AS total_status_source
		,	count_value_value AS count_value
		,	count_status_quality_value AS count_status_quality
		,	count_status_source_value AS count_status_source
		FROM
			load.energy_conversion	)
