-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.energy_conversion;

CREATE TABLE load.energy_conversion AS
	(	SELECT

			-- Scrub out the boilerplate / file directory elements
			-- Note that this assumes a standard format as a result of
			-- preliminary investigation
			tagname AS tagname_string
		,	regexp_replace(
				regexp_replace(	tagname
							,	'^UVA/Data/Buildings/[0-9]+/ac_Buildings'
							,	''
							,	'g'	)
			,	 'Energy Demand$'
			,	''
			,	'g'	)	AS tagname_value

			-- Convert the raw time code into a PostgreSQL timestamp with 
			-- timezone.
			-- Note that we're manually setting the timezone to EST. For a
			-- broader data set would want to parameterize this.
		,	"timestamp" AS timestamp_string
		,	to_timestamp("timestamp" || ' EST', 'MM/DD/YY HH:MI AM') AS timestamp_value

			-- Preliminary investigation suggests '-' is used for missing / NULL
			-- values and suggests the format to use for the conversion:
			-- '99,999.99' Parenthetical values are _possibly_ negative, but as
			-- that is purely hypothetical, are currently cast to NULL.
		,	min_value AS min_value_string
		,	CASE	WHEN	min_value ~ '^\s*(\d{1,2},)?\d{1,3}\.\d{2}\s*$'
					THEN	regexp_replace(min_value, ',', '', 'g')
					WHEN	min_value ~ '^\s*\((\d{1,2},)?\d{1,3}\.\d{2}\)\s*$'
					THEN	('-' 
						||	regexp_replace(
								substring(	min_value
									from	'^\s*\(((?:\d{1,2},)?\d{1,3}\.\d{2})\)\s*$')
							,	','
							,	''
							,	'g'	)	)
					ELSE	NULL
					END::DOUBLE PRECISION AS min_value_value

			-- Break apart each status into quality and origin. Note that the
			-- same set of standard source enumerations is used throughout.
		,	min_status_str AS min_status_str_string
		,	CASE	WHEN	min_status_str ~* 'good'
					THEN	'good'
					ELSE	min_status_str
					END AS min_status_quality_value
		,	CASE	WHEN	min_status_str ~* 'raw'
					THEN	'raw'
					WHEN	min_status_str ~* 'calculated'
					THEN	'calculated'
					WHEN	min_status_str ~* 'interpolated'
					THEN	'interpolated'
					ELSE	min_status_str
					END AS min_status_source_value

			-- Convert the raw time code into a PostgreSQL timestamp with 
			-- timezone.
			-- Note that we're manually setting the timezone to EST. For a
			-- broader data set would want to parameterize this.
		,	min_timestamp AS min_timestamp_string
		,	to_timestamp(min_timestamp || ' EST', 'MM/DD/YY HH:MI AM') AS min_timestamp_value

			-- Preliminary investigation suggests '-' is used for missing / NULL
			-- values and suggests the format to use for the conversion:
			-- '99,999.99' Parenthetical values are _possibly_ negative, but as
			-- that is purely hypothetical, are currently cast to NULL.
		,	max_value AS max_value_string
		,	CASE	WHEN	max_value ~ '^\s*(\d{1,2},)?\d{1,3}\.\d{2}\s*$'
					THEN	regexp_replace(max_value, ',', '', 'g')
					WHEN	max_value ~ '^\s*\((\d{1,2},)?\d{1,3}\.\d{2}\)\s*$'
					THEN	('-' 
						||	regexp_replace(
								substring(	max_value
									from	'^\s*\(((?:\d{1,2},)?\d{1,3}\.\d{2})\)\s*$')
							,	','
							,	''
							,	'g'	)	)
					ELSE	NULL
					END::DOUBLE PRECISION AS max_value_value

			-- Break apart each status into quality and origin. Note that the
			-- same set of standard source enumerations is used throughout.
		,	max_status_str AS max_status_str_string
		,	CASE	WHEN	max_status_str ~* 'good'
					THEN	'good'
					ELSE	max_status_str
					END AS max_status_quality_value
		,	CASE	WHEN	max_status_str ~* 'raw'
					THEN	'raw'
					WHEN	max_status_str ~* 'calculated'
					THEN	'calculated'
					WHEN	max_status_str ~* 'interpolated'
					THEN	'interpolated'
					ELSE	max_status_str
					END AS max_status_source_value

			-- Convert the raw time code into a PostgreSQL timestamp with 
			-- timezone.
			-- Note that we're manually setting the timezone to EST. For a
			-- broader data set would want to parameterize this.
		,	max_timestamp AS max_timestamp_string
		,	to_timestamp(max_timestamp || ' EST', 'MM/DD/YY HH:MI AM') AS max_timestamp_value

			-- Preliminary investigation suggests '-' is used for missing / NULL
			-- values and suggests the format to use for the conversion:
			-- '99,999.99' Parenthetical values are _possibly_ negative, but as
			-- that is purely hypothetical, are currently cast to NULL.
		,	avg_value AS avg_value_string
		,	CASE	WHEN	avg_value ~ '^\s*(\d{1,2},)?\d{1,3}\.\d{2}\s*$'
					THEN	regexp_replace(avg_value, ',', '', 'g')
					WHEN	avg_value ~ '^\s*\((\d{1,2},)?\d{1,3}\.\d{2}\)\s*$'
					THEN	('-' 
						||	regexp_replace(
								substring(	avg_value
									from	'^\s*\(((?:\d{1,2},)?\d{1,3}\.\d{2})\)\s*$')
							,	','
							,	''
							,	'g'	)	)
					ELSE	NULL
					END::DOUBLE PRECISION AS avg_value_value

			-- Break apart each status into quality and origin. Note that the
			-- same set of standard source enumerations is used throughout.
		,	avg_status_str AS avg_status_str_string
		,	CASE	WHEN	avg_status_str ~* 'good'
					THEN	'good'
					ELSE	avg_status_str
					END AS avg_status_quality_value
		,	CASE	WHEN	avg_status_str ~* 'raw'
					THEN	'raw'
					WHEN	avg_status_str ~* 'calculated'
					THEN	'calculated'
					WHEN	avg_status_str ~* 'interpolated'
					THEN	'interpolated'
					ELSE	avg_status_str
					END AS avg_status_source_value

			-- Preliminary investigation suggests '-' is used for missing / NULL
			-- values and suggests the format to use for the conversion:
			-- '99,999.99' Parenthetical values are _possibly_ negative, but as
			-- that is purely hypothetical, are currently cast to NULL.
		,	interpolative_value AS interpolative_value_string
		,	CASE	WHEN	interpolative_value ~ '^\s*(\d{1,2},)?\d{1,3}\.\d{2}\s*$'
					THEN	regexp_replace(interpolative_value, ',', '', 'g')
					WHEN	interpolative_value ~ '^\s*\((\d{1,2},)?\d{1,3}\.\d{2}\)\s*$'
					THEN	('-' 
						||	regexp_replace(
								substring(	interpolative_value
									from	'^\s*\(((?:\d{1,2},)?\d{1,3}\.\d{2})\)\s*$')
							,	','
							,	''
							,	'g'	)	)
					ELSE	NULL
					END::DOUBLE PRECISION AS interpolative_value_value

			-- Break apart each status into quality and origin. Note that the
			-- same set of standard source enumerations is used throughout.
		,	interpolative_status_str AS interpolative_status_str_string
		,	CASE	WHEN	interpolative_status_str ~* 'good'
					THEN	'good'
					ELSE	interpolative_status_str
					END AS interpolative_status_quality_value
		,	CASE	WHEN	interpolative_status_str ~* 'raw'
					THEN	'raw'
					WHEN	interpolative_status_str ~* 'calculated'
					THEN	'calculated'
					WHEN	interpolative_status_str ~* 'interpolated'
					THEN	'interpolated'
					ELSE	interpolative_status_str
					END AS interpolative_status_source_value

			-- Convert the raw time code into a PostgreSQL timestamp with 
			-- timezone.
			-- Note that we're manually setting the timezone to EST. For a
			-- broader data set would want to parameterize this.
		,	timestamp2 AS timestamp2_string
		,	to_timestamp(timestamp2 || ' EST', 'MM/DD/YY HH:MI AM') AS timestamp2_value	

			-- Preliminary investigation suggests '-' is used for missing / NULL
			-- values and suggests the format to use for the conversion:
			-- '99,999.99' Parenthetical values are _possibly_ negative, but as
			-- that is purely hypothetical, are currently cast to NULL.
		,	total_value AS total_value_string
		,	CASE	WHEN	total_value ~ '^\s*(\d{1,2},)?\d{1,3}\.\d{2}\s*$'
					THEN	regexp_replace(total_value, ',', '', 'g')
					WHEN	total_value ~ '^\s*\((\d{1,2},)?\d{1,3}\.\d{2}\)\s*$'
					THEN	('-' 
						||	regexp_replace(
								substring(	total_value
									from	'^\s*\(((?:\d{1,2},)?\d{1,3}\.\d{2})\)\s*$')
							,	','
							,	''
							,	'g'	)	)
					ELSE	NULL
					END::DOUBLE PRECISION AS total_value_value

			-- Break apart each status into quality and origin. Note that the
			-- same set of standard source enumerations is used throughout.
		,	total_status_str AS total_status_str_string
		,	CASE	WHEN	total_status_str ~* 'good'
					THEN	'good'
					ELSE	total_status_str
					END AS total_status_quality_value
		,	CASE	WHEN	total_status_str ~* 'raw'
					THEN	'raw'
					WHEN	total_status_str ~* 'calculated'
					THEN	'calculated'
					WHEN	total_status_str ~* 'interpolated'
					THEN	'interpolated'
					ELSE	total_status_str
					END AS total_status_source_value

			-- Format matches that of a regular integer.
		,	count_value AS count_value_string
		,	to_number(count_value, '99')::INTEGER AS count_value_value


			-- Break apart each status into quality and origin. Note that the
			-- same set of standard source enumerations is used throughout.
		,	count_status_str AS count_status_str_string
		,	CASE	WHEN	count_status_str ~* 'good'
					THEN	'good'
					ELSE	count_status_str
					END AS count_status_quality_value
		,	CASE	WHEN	count_status_str ~* 'raw'
					THEN	'raw'
					WHEN	count_status_str ~* 'calculated'
					THEN	'calculated'
					WHEN	count_status_str ~* 'interpolated'
					THEN	'interpolated'
					ELSE	count_status_str
					END AS count_status_source_value

		FROM
			load.energy_raw	)
