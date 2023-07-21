#!/bin/bash

# Convert the field `major_str` into an array
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/majors.sql > /dev/null 2>&1

# Status update
echo "load.attendance.majors created from major_str"
