-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.mentorship;

-- The csv fields will be pulled in as straight text to start with
CREATE TABLE load.mentorship
	(	name_first_str TEXT
	,	name_last_str TEXT
	,	match_full_name_str TEXT
	,	section_str TEXT
	,	year_uva_str TEXT
	,	gender_str TEXT
	,	eth_aa_str TEXT
	,	eth_aspi_str TEXT
	,	eth_wh_cau_str TEXT
	,	eth_hisp_lat_str TEXT
	,	eth_nat_am_str TEXT
	,	eth_no_answer_str TEXT
	,	eth_other_str TEXT
	,	major_minor_str TEXT
	,	phone_str TEXT
	,	email_uva_str TEXT
	,	program_hustle_class_str TEXT
	,	program_pioneer_str TEXT
	,	program_rethink_str TEXT
	,	program_not_yet_graduated_str TEXT
	,	interest_social_issues_str TEXT
	,	interest_entrepreneurship_str TEXT
	,	interest_technology_str TEXT
	,	interest_medicine_str TEXT
	,	interest_education_str TEXT
	,	interest_sustainability_str TEXT
	,	interest_energy_str TEXT
	,	interest_journalism_str TEXT
	,	interest_cyber_security_str TEXT
	,	interest_finance_str TEXT
	,	interest_other_str TEXT
	,	dream_job_str TEXT
	,	ideal_partner_str TEXT
	,	problems_solo_or_together_str TEXT
	,	class_intro_to_programming_str TEXT
	,	class_discrete_mathematics_str TEXT
	,	class_software_development_methods_str TEXT
	,	class_prog_data_rep_str TEXT
	,	class_theory_computation_str TEXT
	,	class_computer_architecture_str TEXT
	,	class_algorithms_str TEXT
	,	class_other_str TEXT
	,	class_intro_to_programming2_str TEXT
	,	class_discrete_mathematics2_str TEXT
	,	class_software_development_methods2_str TEXT
	,	class_prog_data_rep2_str TEXT
	,	class_theory_computation2_str TEXT
	,	class_computer_architecture2_str TEXT
	,	class_algorithms2_str TEXT
	,	class_other2_str TEXT
	,	skills_javascript_str TEXT
	,	skills_html_str TEXT
	,	skills_css_str TEXT
	,	skills_java_str TEXT
	,	skills_python_str TEXT
	,	skills_cpp_str TEXT
	,	skills_photoshop_str TEXT
	,	skills_illustrator_str TEXT
	,	skills_other_str TEXT
	,	debugging_str TEXT
	,	current_projects_str TEXT
	,	free_time_3_things_str TEXT
	,	personality_five_words_str TEXT
	,	anything_else_str TEXT	);
