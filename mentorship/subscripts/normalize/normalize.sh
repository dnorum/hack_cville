#!/bin/bash

	# Create the 'normalized' schema
source ${DIR}/subscripts/normalize/create_normalized_schema.sh

	# Create the normalized table
source ${DIR}/subscripts/normalize/tables/students.sh

