#!/bin/bash

# Scrub the `skills_other_str` field
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/other_skills.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.other_skills created from skills_other_str"
