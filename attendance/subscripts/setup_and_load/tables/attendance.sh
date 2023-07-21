#!/bin/bash

# Create the table load.attendance to hold the initial raw data
sudo -u postgres psql $database -f ${DIR}/sql/setup_and_load/tables/attendance/create_table.sql > /dev/null 2>&1

# Status update
echo "load.attendance created"

# Load the attendance csv file into the database and record the number of rows
# imported
n_records_loaded=$(sudo -u postgres psql $database -c "$(sed -e "s@\${DIR}@${DIR}@g" -e "s@\${sample_data}@${sample_data}@g" ${DIR}/sql/setup_and_load/tables/attendance/load_table.sql)")

# Scrub the output of the postgres command to just the number of rows loaded
n_records_loaded=${n_records_loaded//[a-zA-Z ]/}

# Status update
echo "${n_records_loaded} records from ${sample_data} loaded into load.attendance"
