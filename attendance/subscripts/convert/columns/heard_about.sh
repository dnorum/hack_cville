#!/bin/bash

# Standardize the field `heard_about2_str`
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/heard_about.sql > /dev/null 2>&1

# Status update
echo "load.attendance.heard_about created from heard_about2_str"
