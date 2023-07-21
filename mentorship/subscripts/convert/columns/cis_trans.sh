#!/bin/bash

# Extract cis/trans from the field `gender_str`
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/cis_trans.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.cis_trans created from gender_str"
