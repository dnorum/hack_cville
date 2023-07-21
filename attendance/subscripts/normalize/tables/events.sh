#!/bin/bash

# Create the table normalized.events to hold the event data
sudo -u postgres psql $database -f ${DIR}/sql/normalize/tables/events.sql > /dev/null 2>&1

# Status update
echo "normalized.events created and populated"
