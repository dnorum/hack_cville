SELECT
	min_value
,	COUNT(1)
FROM
	load.energy_raw
WHERE
	min_value !~ '(\d{1},)?\d{3}\.\d{2}$'
GROUP BY
	1
ORDER BY
	2 DESC
