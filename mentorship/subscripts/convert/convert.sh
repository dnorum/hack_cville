#!/bin/bash

	# major_minor_str is complicated enough to border on NLP
	# Will be resolved, if at all, somewhere else

	# These columns are type-converted or simply normalized from the raw data
	#########################################################################
	#
	#	section_str -> section
	#	skills_other_str -> other_skills
	#	class_other -> other_classes
	#	debugging_str -> free_response_debugging
	#	current_projects_str -> free_response_current_projects
	#	anything_else_str -> free_response_anything_else
	#	eth_no_answer_str -> decline_ethnicity
	#	eth_other_str -> other_ethnicity
	#	interest_other_str -> other_interests
	#
	#########################################################################
source ${DIR}/subscripts/convert/columns/section.sh
source ${DIR}/subscripts/convert/columns/other_skills.sh
source ${DIR}/subscripts/convert/columns/other_classes.sh
source ${DIR}/subscripts/convert/columns/free_response_debugging.sh
source ${DIR}/subscripts/convert/columns/free_response_current_projects.sh
source ${DIR}/subscripts/convert/columns/free_response_anything_else.sh
source ${DIR}/subscripts/convert/columns/decline_ethnicity.sh
source ${DIR}/subscripts/convert/columns/other_ethnicity.sh
source ${DIR}/subscripts/convert/columns/other_interests.sh

	# These columns require no conversion at the moment and will just be renamed
	# during normalization
	######################
	#
	#	name_first_str -> name_first
	#	name_last_str -> name_last
	#	email_uva_str -> email
	#	dream_job_str -> free_response_dream_job
	#	ideal_partner_str -> free_response_ideal_partner
	#	problems_solo_or_together_str -> free_response_problems_solo_or_together
	#	free_time_3_things_str -> free_response_free_time_three_things
	#	personality_five_words_str -> free_response_personality_five_words
	#
	######################

	# These columns require a bit more scrubbing
	############################################
	#
	#	year_uva_str -> class_year
	#	phone_str -> phone
	#	gender_str -> gender, cis_trans
	#
	############################################
source ${DIR}/subscripts/convert/columns/class_year.sh
source ${DIR}/subscripts/convert/columns/phone.sh
source ${DIR}/subscripts/convert/columns/gender.sh
source ${DIR}/subscripts/convert/columns/cis_trans.sh

	# These columns will be combined together
	#########################################
	#
	#	skills_javascript_str,
	#	skills_html_str,
	#	skills_css_str,
	#	skills_java_str,
	#	skills_python_str,
	#	skills_cpp_str,
	#	skills_photoshop_str,
	#	skills_illustrator_str -> skills
	#
	#	class_intro_to_programming_str,
	#	class_discrete_mathematics_str,
	#	class_software_development_methods_str,
	#	class_prog_data_rep_str,
	#	class_theory_computation_str,
	#	class_computer_architecture_str,
	#	class_algorithms_str -> classes
	#
	#	interest_social_issues_str,
	#	interest_entrepreneurship_str,
	#	interest_technology_str,
	#	interest_medicine_str,
	#	interest_education_str,
	#	interest_sustainability_str,
	#	interest_energy_str,
	#	interest_journalism_str,
	#	interest_cyber_security_str,
	#	interest_finance_str -> interests
	#
	#	program_hustle_class_str,
	#	program_pioneer_str,
	#	program_rethink_str,
	#	program_not_yet_graduated_str -> programs
	#
	#	eth_aa_str,
	#	eth_aspi_str,
	#	eth_wh_cau_str,
	#	eth_hisp_lat_str,
	#	eth_nat_am_str -> ethnicity
	#
	#########################################
source ${DIR}/subscripts/convert/columns/skills.sh
source ${DIR}/subscripts/convert/columns/classes.sh
source ${DIR}/subscripts/convert/columns/interests.sh
source ${DIR}/subscripts/convert/columns/programs.sh
source ${DIR}/subscripts/convert/columns/ethnicity.sh

	# These columns are empty
	#########################
	#
	#	
	#
	#########################

	# These columns are identical to another column
	###############################################
	#
	#	match_full_name_str
	#
	###############################################
