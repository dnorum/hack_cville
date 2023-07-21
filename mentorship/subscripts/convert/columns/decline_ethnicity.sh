#!/bin/bash

# Convert the field `eth_no_answer_str` into boolean
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/decline_ethnicity.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.decline_ethnicity created from eth_no_answer_str"
