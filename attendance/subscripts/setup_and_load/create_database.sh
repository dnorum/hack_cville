#!/bin/bash

# Drop (if it exists) and (re)create the database specified in the main script
if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw $database; then
	sudo -u postgres dropdb --if-exists $database
	sudo -u postgres createdb $database
	echo "$database dropped and recreated"
else
	sudo -u postgres createdb $database
	echo "$database created"
fi
