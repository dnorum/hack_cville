-- Load the CSV file
COPY load.events FROM '${DIR}/data/events.csv' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
