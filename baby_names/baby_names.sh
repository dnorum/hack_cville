#!/bin/bash

	###################
	### DEFINITIONS ###
	###################

	# Define the directory location of the script.
DIR=$(dirname "$(readlink -f "$0")")

	# Define the name of the database to be used.
database="baby_names"

	# Define the name of the source file of sample data
sample_data="baby_names.csv"

	########################
	### Start of scripts ###
	########################

	# Newline to set off script output.
echo

	# Create the database for the project and populate it with our sample data
	# Drop (if it exists) and (re)create the database specified in the main script
if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw $database; then
	sudo -u postgres dropdb --if-exists $database
	sudo -u postgres createdb $database
	echo "$database dropped and recreated"
else
	sudo -u postgres createdb $database
	echo "$database created"
fi

	# Create the 'load' schema for the initial processing of the data
sudo -u postgres psql $database -f ${DIR}/create_load_schema.sql > /dev/null 2>&1

# Status update
echo "load schema created"

# Create the table load.attendance to hold the initial raw data
sudo -u postgres psql $database -f ${DIR}/create_table.sql > /dev/null 2>&1

# Status update
echo "load.baby_names_str created"

# Load the baby_names csv file into the database and record the number of rows
# imported
n_records_loaded=$(sudo -u postgres psql $database -c "$(sed -e "s@\${DIR}@${DIR}@g" -e "s@\${sample_data}@${sample_data}@g" ${DIR}/load_table.sql)")

# Scrub the output of the postgres command to just the number of rows loaded
n_records_loaded=${n_records_loaded//[a-zA-Z ]/}

# Status update
echo "${n_records_loaded} records from ${sample_data} loaded into load.baby_names_str"

	# Begin by-field processing of the raw data
sudo -u postgres psql $database -f ${DIR}/conversion_table.sql > /dev/null 2>&1

	# Normalize the data for further processing
#source ./subscripts/normalize/normalize.sh

	# Newline to set off script output.
echo
