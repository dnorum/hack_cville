-- Load the CSV file
COPY load.baby_names_str FROM '${DIR}/data/${sample_data}' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
