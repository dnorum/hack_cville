#!/bin/bash

	# Create the database for the project
source ${DIR}/subscripts/setup_and_load/create_database.sh

	# Create the 'load' schema
source ${DIR}/subscripts/setup_and_load/create_load_schema.sh

	# Create the load.membership table to hold the raw data and load it in
source ${DIR}/subscripts/setup_and_load/tables/membership.sh

	# Create and load a lookup table to resolve majors
source ${DIR}/subscripts/setup_and_load/tables/majors_lookup.sh

	# Create and load a lookup table to resolve team positions
source ${DIR}/subscripts/setup_and_load/tables/team_positions_lookup.sh

	# Newline to set off script output.
echo
