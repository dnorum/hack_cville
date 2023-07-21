SELECT
	count_status_str
,	COUNT(1)
FROM
	load.energy_raw
GROUP BY
	1
ORDER BY
	2 DESC
