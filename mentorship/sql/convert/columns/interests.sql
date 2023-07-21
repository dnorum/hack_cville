-- Add the column to hold the combined values
ALTER TABLE
	load.mentorship
ADD COLUMN
	interests TEXT[];

-- Set the value based on the raw text in the interests_*_str columns
UPDATE
	load.mentorship
SET
	-- Somewhat kludgy...
	-- Okay, hideously kludgy...
	interests = 	string_to_array(
						regexp_replace(	CASE	WHEN	interest_cyber_security_str = 'Cyber Security'
												THEN	'cyber_security,'
												ELSE	''
												END
									||	CASE	WHEN	interest_education_str = 'Education'
												THEN	'education,'
												ELSE	''
												END
									||	CASE	WHEN	interest_energy_str = 'Energy'
												THEN	'energy,'
												ELSE	''
												END
									||	CASE	WHEN	interest_entrepreneurship_str = 'Entrepreneurship'
												THEN	'entrepreneurship,'
												ELSE	''
												END
									||	CASE	WHEN	interest_finance_str = 'Finance'
												THEN	'finance,'
												ELSE	''
												END
									||	CASE	WHEN	interest_journalism_str = 'Journalism'
												THEN	'journalism,'
												ELSE	''
												END
									||	CASE	WHEN	interest_medicine_str = 'Medicine'
												THEN	'medicine,'
												ELSE	''
												END
									||	CASE	WHEN	interest_social_issues_str = 'Social Issues'
												THEN	'social_issues,'
												ELSE	''
												END
									||	CASE	WHEN	interest_sustainability_str = 'Sustainability'
												THEN	'sustainability,'
												ELSE	''
												END
									||	CASE	WHEN	interest_technology_str = 'Technology'
												THEN	'technology,'
												ELSE	''
												END, ',$', ''	),	',');
