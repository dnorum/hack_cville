#!/bin/bash

	###################
	### DEFINITIONS ###
	###################

	# Define the directory location of the script.
DIR=$(dirname "$(readlink -f "$0")")

	# Define the name of the database to be used.
database="attendance"

	# Define the name of the source file of sample data
sample_data="Sample_Event_SignIn_Data.csv"

	########################
	### Start of scripts ###
	########################

	# Newline to set off script output.
echo

	# Create the database for the project and populate it with our sample data
source ./subscripts/setup_and_load/setup_and_load.sh

	# Begin by-field processing of the raw data
source ./subscripts/convert/convert.sh

	# Normalize the data for further processing
source ./subscripts/normalize/normalize.sh

	# Newline to set off script output.
echo
