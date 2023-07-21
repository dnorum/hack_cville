#!/bin/bash

	# Create the database for the project
source ${DIR}/subscripts/setup_and_load/create_database.sh

	# Create the 'load' schema
source ${DIR}/subscripts/setup_and_load/create_load_schema.sh

	# Create the load.energy_raw table to hold the raw data inload, then load it
source ${DIR}/subscripts/setup_and_load/tables/energy_raw.sh
