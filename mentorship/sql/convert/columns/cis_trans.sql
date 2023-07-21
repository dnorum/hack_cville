-- Add the column to hold the resolved values
ALTER TABLE
	load.mentorship
ADD COLUMN
	-- Could be enumerated
	cis_trans TEXT;

-- Set the value based on the raw text in gender_str
UPDATE
	load.mentorship
SET
	cis_trans = CASE	WHEN	gender_str ~* 'cis'
						THEN	'cis'
						WHEN	gender_str ~* 'trans'
						THEN	'trans'
						-- No default value, only explicitly stated identity
						ELSE	NULL::TEXT
						END
