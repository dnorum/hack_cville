#!/bin/bash

# Convert the field `class_year_str` into an integer
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/class_year.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.class_year created from class_year_str"
