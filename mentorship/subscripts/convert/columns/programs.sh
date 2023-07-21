#!/bin/bash

# Combine the `program_*_str` fields into a standard format
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/programs.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.programs created from program_*_str"
