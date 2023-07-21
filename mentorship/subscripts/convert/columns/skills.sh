#!/bin/bash

# Combine the `skills_*_str` fields into a standard format
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/skills.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.skills created from skills_*_str"
