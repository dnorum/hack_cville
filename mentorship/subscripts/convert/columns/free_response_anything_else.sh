#!/bin/bash

# Convert empty strings in anything_else_str to NULL
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/free_response_anything_else.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.free_response_anything_else created from anything_else_str"
