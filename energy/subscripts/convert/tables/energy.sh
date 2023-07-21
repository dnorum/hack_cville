#!/bin/bash

# Create the value table
sudo -u postgres psql $database -f ${DIR}/sql/convert/tables/energy.sql > /dev/null 2>&1

# Status update
echo "load.energy.energy created from energy_conversion"
