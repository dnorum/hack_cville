#!/bin/bash

# Create the table normalized.sign_ins to hold the sign_in data
sudo -u postgres psql $database -f ${DIR}/sql/normalize/tables/sign_ins.sql > /dev/null 2>&1

# Status update
echo "normalized.sign_ins created and populated"
