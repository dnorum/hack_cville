#!/bin/bash

# Create the table normalized.students to hold the semester, student, year level
# data
sudo -u postgres psql $database -f ${DIR}/sql/normalize/tables/semester__student__year.sql > /dev/null 2>&1

# Status update
echo "normalized.semester__student__year created and populated"
