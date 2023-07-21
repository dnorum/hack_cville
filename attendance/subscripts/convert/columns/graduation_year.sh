#!/bin/bash

# Convert the field `graduation_year_str` into an integer
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/graduation_year.sql > /dev/null 2>&1

# Status update
echo "load.attendance.graduation_year created from graduation_year_str"
