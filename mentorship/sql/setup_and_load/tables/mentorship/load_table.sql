-- Load the CSV file
COPY load.mentorship FROM '${DIR}/data/${sample_data}' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
