#!/bin/bash

# Create the 'load' schema for the initial processing of the data
sudo -u postgres psql $database -f ${DIR}/sql/setup_and_load/create_load_schema.sql > /dev/null 2>&1

# Status update
echo "load schema created"
