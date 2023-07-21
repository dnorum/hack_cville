#!/bin/bash

# Convert the field `time_str` into a timestamp
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/sign_in.sql > /dev/null 2>&1

# Status update
echo "load.attendance.sign_in created from time_str"
