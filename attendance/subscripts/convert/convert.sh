#!/bin/bash

	# These columns are type-converted from the raw data
	####################################################
	#
	#	graduation_year_str -> graduation_year
	#	time_str -> sign_in
	#
	####################################################
source ${DIR}/subscripts/convert/columns/graduation_year.sh
source ${DIR}/subscripts/convert/columns/sign_in.sh

	# These columns require no conversion at the moment and will just be renamed
	# during normalization
	######################
	#
	#	email_str -> email
	#	full_name_str -> name
	#
	######################

	# These columns require a bit more scrubbing
	############################################
	#
	#	major_str -> majors
	#	heard_about2_str -> heard_about
	#
	############################################
source ${DIR}/subscripts/convert/columns/majors.sh
source ${DIR}/subscripts/convert/columns/heard_about.sh

	# These columns are empty
	#########################
	#
	#	alumni_matching_str
	#	hear_about_str
	#	first_time_str
	#
	#########################
