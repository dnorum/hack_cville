-- Add the column to hold the scrubbed values
ALTER TABLE
	load.mentorship
ADD COLUMN
	other_classes TEXT[];

-- Set the value based on the raw text in the class_other2?_str columns after
-- scrubbing, using email_id again for the ID
UPDATE
	load.mentorship
SET
	other_classes = processed.other_classes
FROM
	(	WITH expanded AS (	SELECT
								email_uva_str
							,	unnest(	CASE	WHEN	class_other_str ~* '^(none)?$'
												THEN	NULL::TEXT[]
												ELSE	string_to_array(
															lower(
																regexp_replace(	
																	regexp_replace(	class_other_str
																				,	'[\s]*,[\s]*'
																				,	','
																				,	'g'	)
																,	' '
																,	'_'
																,	'g'	)
																), ',')
														
												END	) AS class
							FROM
								load.mentorship

							UNION

							SELECT
								email_uva_str
							,	unnest(	CASE	WHEN	class_other2_str ~* '^(none)?$'
												THEN	NULL::TEXT[]
												ELSE	string_to_array(
															lower(
																regexp_replace(	
																	regexp_replace(	class_other2_str
																				,	'[\s]*,[\s]*'
																				,	','
																				,	'g'	)
																,	' '
																,	'_'
																,	'g'	)
																), ',')
														
												END	) AS class
							FROM
								load.mentorship	)
		SELECT
			email_uva_str
		,	array_agg(DISTINCT class ORDER BY class) AS other_classes
		FROM
			expanded
		GROUP BY
			email_uva_str	) AS processed
WHERE
	load.mentorship.email_uva_str = processed.email_uva_str
