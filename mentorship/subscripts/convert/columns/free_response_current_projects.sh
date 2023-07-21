#!/bin/bash

# Convert empty strings in current_projects_str to NULL
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/free_response_current_projects.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.free_response_current_projects created from current_projects_str"
