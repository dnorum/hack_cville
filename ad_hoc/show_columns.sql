SELECT
	table_schema || '.' || table_name || '.' || column_name
FROM
	information_schema.columns
WHERE
	table_schema NOT IN (	'pg_catalog'
						,	'information_schema'	);
