#!/bin/bash

# Combine the `class_*_str` fields into a standard format
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/classes.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.classes created from class_*_str"
