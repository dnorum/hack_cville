SELECT
	min_value
,	COUNT(1)
FROM
	load.energy_raw
WHERE
	min_value !~ '^\s*(\d{1,2},)?\d{1,3}\.\d{2}\s*$'
GROUP BY
	1
ORDER BY
	2 DESC
