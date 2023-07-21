-- Load the CSV file
COPY load.membership FROM '${DIR}/data/${sample_data}' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
