SELECT
	tagname
,	substring(tagname from '^UVA/Data/Buildings/([0-9]+)/ac_Buildings[0-9]+Energy Demand$') AS first_tag
,	substring(tagname from '^UVA/Data/Buildings/[0-9]+/ac_Buildings([0-9]+)Energy Demand$') AS second_tag
,	COUNT(1)
FROM
	load.energy_raw
GROUP BY
	1, 2, 3
ORDER BY
	4 DESC
