#!/bin/bash

# Combine the `interest_*_str` fields into a standard format
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/interests.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.interests created from interest_*_str"
