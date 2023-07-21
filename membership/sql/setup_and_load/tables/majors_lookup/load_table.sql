-- Load the CSV file
COPY load.majors_lookup FROM '${DIR}/data/majors_lookup.csv' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
