-- Add the column to hold the combined values
ALTER TABLE
	load.mentorship
ADD COLUMN
	skills TEXT[];

-- Set the value based on the raw text in the skills_*_str columns
UPDATE
	load.mentorship
SET
	-- Somewhat kludgy...
	skills = 	string_to_array(
					regexp_replace(	CASE	WHEN	skills_cpp_str = 'C++'
											THEN	'cpp,'
											ELSE	''
											END
								||	CASE	WHEN	skills_css_str = 'CSS'
											THEN	'css,'
											ELSE	''
											END
								||	CASE	WHEN	skills_html_str = 'HTML'
											THEN	'html,'
											ELSE	''
											END
								||	CASE	WHEN	skills_illustrator_str = 'Illustrator'
											THEN	'illustrator,'
											ELSE	''
											END
								||	CASE	WHEN	skills_java_str = 'Java'
											THEN	'java,'
											ELSE	''
											END
								||	CASE	WHEN	skills_javascript_str = 'JavaScript'
											THEN	'javascript,'
											ELSE	''
											END
								||	CASE	WHEN	skills_photoshop_str = 'Photoshop'
											THEN	'photoshop,'
											ELSE	''
											END
								||	CASE	WHEN	skills_python_str = 'Python'
											THEN	'python,'
											ELSE	''
											END, ',$', ''	),	',');
