-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.baby_names_str;

-- The csv fields will be pulled in as straight text to start with
CREATE TABLE load.baby_names_str
	(	brth_yr_str TEXT
	,	gndr_str TEXT
	,	ethcty_str TEXT
	,	nm_str TEXT
	,	cnt_str TEXT
	,	rnk_str TEXT	);
