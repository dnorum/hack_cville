#!/bin/bash

	# Create the database for the project
source ${DIR}/subscripts/setup_and_load/create_database.sh

	# Create the 'load' schema
source ${DIR}/subscripts/setup_and_load/create_load_schema.sh

	# Create the load.mentorship table to hold the raw data and load it in
source ${DIR}/subscripts/setup_and_load/tables/mentorship.sh
