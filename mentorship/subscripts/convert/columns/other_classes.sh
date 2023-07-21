#!/bin/bash

# Scrub the `class_other2?_str` fields
sudo -u postgres psql $database -f ${DIR}/sql/convert/columns/other_classes.sql > /dev/null 2>&1

# Status update
echo "load.mentorship.other_classes created from class_other_str and class_other2_str"
