-- Link students to events
WITH event_students AS (	SELECT
								si.student_id
							,	e.id AS event_id
							FROM
								normalized.sign_ins AS si
									LEFT OUTER JOIN
								normalized.events AS e
									ON	(	si.sign_in BETWEEN	e.start_time
															AND	e.end_time	)	)

-- Pair events with the first event (within an hour) following
,	subsequent_events AS (	SELECT
								e_1.id AS prior_event_id
							,	first_value(e_2.id)
									OVER	(	PARTITION BY
													e_1.id
												ORDER BY
													e_2.start_time - e_1.end_time	) AS event_id
							FROM
								normalized.events AS e_1
									JOIN
								normalized.events AS e_2
									ON	(	e_2.start_time >= e_1.end_time
										AND	extract(epoch from e_2.start_time - e_1.end_time)/3600 < 1))

-- Now, for each event, find which students attended the one immediately prior
SELECT
	se.event_id
,	se.prior_event_id
,	es.student_id
FROM
	subsequent_events AS se
		JOIN
	event_students AS es
		ON	(	se.event_id = es.event_id	)
		JOIN
	event_students AS es_prior
		ON	(	se.prior_event_id = es_prior.event_id
			AND	es.student_id = es_prior.student_id	)

-- From here, can now join in various other information: break this out by
-- student major, by how they heard about it, topics / programs of the events,
-- etc. Calculate percentage of students continuing on to the next event, or
-- expand the investigation to take into account students who may come in part
-- of the way through from an overlapping event.
