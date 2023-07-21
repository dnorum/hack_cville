#!/bin/bash

	# Create the 'normalized' schema
source ${DIR}/subscripts/normalize/create_normalized_schema.sh

	# Create the normalized tables - order matters here due to IDs
source ${DIR}/subscripts/normalize/tables/students.sh
source ${DIR}/subscripts/normalize/tables/semester__student__year.sh
