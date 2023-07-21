#!/bin/bash

# Convert the field `gender_str` into a standard format
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/gender.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.gender created from gender_str"
