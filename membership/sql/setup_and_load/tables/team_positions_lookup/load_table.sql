-- Load the CSV file
COPY load.team_positions_lookup FROM '${DIR}/data/team_positions_lookup.csv' 
	DELIMITER ','
	NULL ''
	CSV
	HEADER
	ENCODING 'latin1';
