#!/bin/bash

# Create the table normalized.students to hold the student data
sudo -u postgres psql $database -f ${DIR}/sql/normalize/tables/students.sql > /dev/null 2>&1

# Status update
echo "normalized.students created and populated"
