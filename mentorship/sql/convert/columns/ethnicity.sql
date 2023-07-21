-- Add the column to hold the combined values
ALTER TABLE
	load.mentorship
ADD COLUMN
	ethnicity TEXT[];

-- Set the value based on the raw text in the eth_*_str columns
UPDATE
	load.mentorship
SET
	-- Somewhat kludgy...
	-- Okay, hideously kludgy...
	ethnicity = 	string_to_array(
						regexp_replace(	CASE	WHEN	eth_aa_str = 'African American'
												THEN	'aa,'
												ELSE	''
												END
									||	CASE	WHEN	eth_aspi_str = 'Asian / Pacific Islander'
												THEN	'aspi,'
												ELSE	''
												END
									||	CASE	WHEN	eth_hisp_lat_str = 'Latino / Hispanic'
												THEN	'hisp_lat,'
												ELSE	''
												END
									||	CASE	WHEN	eth_nat_am_str = 'Native American'
												THEN	'nat_am,'
												ELSE	''
												END
									||	CASE	WHEN	eth_wh_cau_str = 'White / Caucasian'
												THEN	'wh_cau,'
												ELSE	''
												END, ',$', ''	),	',')
-- If they chose not to answer regarding their ethnicity, then they shouldn't
-- appear with a program. Opportunity for consistency checks, here.
