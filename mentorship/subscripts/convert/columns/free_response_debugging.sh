#!/bin/bash

# Convert empty strings in debugging_str to NULL
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/free_response_debugging.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.free_response_debugging created from debugging_str"
