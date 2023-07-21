-- Load the CSV file
COPY load.attendance FROM '${DIR}/data/${sample_data}' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
