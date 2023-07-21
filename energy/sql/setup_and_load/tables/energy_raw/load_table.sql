-- Load the CSV file
COPY load.energy_raw FROM '${DIR}/data/${sample_data}' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
