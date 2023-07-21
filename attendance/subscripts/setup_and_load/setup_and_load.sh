#!/bin/bash

	# Create the database for the project
source ${DIR}/subscripts/setup_and_load/create_database.sh

	# Create the 'load' schema
source ${DIR}/subscripts/setup_and_load/create_load_schema.sh

	# Create the load.attendance table to hold the raw data inload, then load it
source ${DIR}/subscripts/setup_and_load/tables/attendance.sh

	# Create and load a lookup table to resolve majors
source ${DIR}/subscripts/setup_and_load/tables/majors_lookup.sh

	# Create and load a table of event times
source ${DIR}/subscripts/setup_and_load/tables/events.sh
