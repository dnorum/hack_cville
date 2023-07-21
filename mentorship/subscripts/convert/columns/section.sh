#!/bin/bash

# Convert the field `section_str` into lowercase
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/section.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.section created from section_str"
