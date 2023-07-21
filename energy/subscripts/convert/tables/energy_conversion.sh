#!/bin/bash

# Create the conversion table
sudo -u postgres psql $database -f ${DIR}/sql/convert/tables/energy_conversion.sql > /dev/null 2>&1

# Status update
echo "load.energy.energy_conversion created from energy_raw"
