#!/bin/bash

# Create the 'normalized' schema for the further processing of the data
sudo -u postgres psql $database -f ${DIR}/sql/normalize/create_normalized_schema.sql > /dev/null 2>&1

# Status update
echo "normalized schema created"
