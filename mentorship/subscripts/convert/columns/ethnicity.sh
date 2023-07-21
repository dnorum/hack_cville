#!/bin/bash

# Combine the `eth_*_str` fields into a standard format
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/ethnicity.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.ethnicity created from eth_*_str"
