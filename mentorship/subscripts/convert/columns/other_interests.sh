#!/bin/bash

# Convert the field `interest_other_str` w.r.t. ''
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/other_interests.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.other_interests created from interest_other_str"
