#!/bin/bash

# Convert the field `phone_str` into a standard format
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/phone.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.phone created from phone_str"
