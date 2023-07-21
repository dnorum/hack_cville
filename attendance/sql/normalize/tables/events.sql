-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	normalized.events;

-- Bring along the load.events table, casting columns as needed
CREATE TABLE
	normalized.events
AS
	(	SELECT
			to_timestamp(begin_str, 'FMMM/DD/YYYY HH24:MI:SS') AS start_time
		,	to_timestamp(end_str, 'FMMM/DD/YYYY HH24:MI:SS') AS end_time
		,	name_str AS name
		FROM
			load.events	);

-- Add in an auto-incrementing column to use as our internal event ID
ALTER TABLE
	normalized.events
ADD COLUMN
	id SERIAL;
