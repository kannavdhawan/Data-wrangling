-- Flexible Data Formats | Data cleaning 

-- Query to format the view_item event into a table with the appropriate columns

SELECT event_id,
  event_time,
  user_id,
  platform,
  parameter_name,
  parameter_value
FROM dsv1069.events

WHERE event_name = 'view_item'

ORDER BY event_id;


--Query to format the view_item event into a table with the appropriate columns

SELECT event_id,
	event_time,
	user_id,
	platform,
	(
		CASE 
			WHEN parameter_name = 'item_id'
				THEN CAST(parameter_value AS INT)
			ELSE NULL
			END
		) AS item_id,
	(
		CASE 
			WHEN parameter_name = 'referrer'
				THEN parameter_value
			ELSE NULL
			END
		) AS referrer

FROM dsv1069.events

WHERE event_name = 'view_item'

ORDER BY event_id;
-- Above is also having null values
-- so aggregation to remove null values.


SELECT event_id,
	event_time,
	user_id,
	platform,
	MAX(CASE 
			WHEN parameter_name = 'item_id'
				THEN CAST(parameter_value AS INT)
			ELSE NULL
			END) AS item_id,
	MAX(CASE 
			WHEN parameter_name = 'referrer'
				THEN parameter_value
			ELSE NULL
			END) AS referrer

FROM dsv1069.events

WHERE event_name = 'view_item'

GROUP BY event_id,
	event_time,
	user_id,
	platform

ORDER BY event_id;
