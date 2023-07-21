-- Add the column to hold the combined values
ALTER TABLE
	load.mentorship
ADD COLUMN
	classes TEXT[];

-- Set the value based on the raw text in the class_*_str columns
UPDATE
	load.mentorship
SET
	-- Somewhat kludgy...
	-- Okay, hideously kludgy...
	classes = 	string_to_array(
					regexp_replace(	CASE	WHEN	class_intro_to_programming_str = 'Intro to Programming'
												OR	class_intro_to_programming2_str = 'Intro to Programming'
											THEN	'intro_to_programming,'
											ELSE	''
											END
								||	CASE	WHEN	class_discrete_mathematics_str = 'Discrete Mathematics'
												OR	class_discrete_mathematics2_str = 'Discrete Mathematics'
											THEN	'discrete_mathematics,'
											ELSE	''
											END
								||	CASE	WHEN	class_software_development_methods_str = 'Software Development Methods'
												OR	class_software_development_methods2_str = 'Software Development Methods'
											THEN	'software_development_methods,'
											ELSE	''
											END
								||	CASE	WHEN	class_prog_data_rep_str = 'Program and Data Representation'
												OR	class_prog_data_rep2_str = 'Program and Data Representation'
											THEN	'prog_data_rep,'
											ELSE	''
											END
								||	CASE	WHEN	class_theory_computation_str = 'Theory of Computation'
												OR	class_theory_computation2_str = 'Theory of Computation'
											THEN	'theory_computation,'
											ELSE	''
											END
								||	CASE	WHEN	class_computer_architecture_str = 'Computer Architecture'
												OR	class_computer_architecture2_str = 'Computer Architecture'
											THEN	'computer_architecture,'
											ELSE	''
											END
								||	CASE	WHEN	class_algorithms_str = 'Algorithms'
												OR	class_algorithms2_str = 'Algorithms'
											THEN	'algorithms,'
											ELSE	''
											END, ',$', ''	),	',');
