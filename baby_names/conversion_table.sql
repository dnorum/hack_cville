-- Make sure that the table will be created with the desired format
DROP TABLE IF EXISTS
	load.baby_names_conv;

CREATE TABLE
	load.baby_names_conv
AS
	(	SELECT
			brth_yr_str
		,	brth_yr_str::INT AS brth_yr_val
		,	cnt_str
		,	cnt_str::INT AS cnt_val
		,	ethcty_str
		,	CASE	WHEN	ethcty_str IN (	'ASIAN AND PACI'
										,	'ASIAN AND PACIFIC ISLANDER'	)
					THEN	'as_pi'::TEXT
					WHEN	ethcty_str ~* '^black'
					THEN	'aa'::TEXT
					WHEN	ethcty_str ~* '^white'
					THEN	'wh'::TEXT
					ELSE	NULL::TEXT
					END AS race_val
		,	CASE	WHEN	ethcty_str ~* '^hispanic'
					THEN	'hisp'::TEXT
					WHEN	ethcty_str ~* 'non hisp'
					THEN	'non_hisp'::TEXT
					ELSE	NULL::TEXT
					END AS eth_val
		,	gndr_str
		,	lower(gndr_str) AS gndr_val
		,	nm_str
		,	CASE	WHEN	nm_str !~ '[a-z]'
					THEN	initcap(nm_str)
					ELSE	nm_str
					END AS nm_val
		,	rnk_str
		,	rnk_str::INT AS rnk_val
		FROM
			load.baby_names_str	);

