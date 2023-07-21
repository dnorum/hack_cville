#!/bin/bash

# Convert the field `eth_other_str` w.r.t. ''
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/other_ethnicity.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.other_ethnicity created from eth_other_str"
