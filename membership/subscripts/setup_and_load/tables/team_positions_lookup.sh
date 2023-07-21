#!/bin/bash

# Create the table load.majors_lookup
sudo -u postgres psql $database -f ${DIR}/sql/setup_and_load/tables/team_positions_lookup/create_table.sql > /dev/null 2>&1

# Status update
echo "load.team_positions_lookup created"

# Load the majors_lookup csv file into the database and record the number of
# rows imported
n_records_loaded=$(sudo -u postgres psql $database -c "$(sed -e "s@\${DIR}@${DIR}@g" ${DIR}/sql/setup_and_load/tables/team_positions_lookup/load_table.sql)")

# Scrub the output of the postgres command to just the number of rows loaded
n_records_loaded=${n_records_loaded//[a-zA-Z ]/}

# Status update
echo "${n_records_loaded} records loaded into load.team_positions_lookup"
