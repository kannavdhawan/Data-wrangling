-- Profiling 
SELECT email_address
FROM dsv1069.users
WHERE deleted_at IS NOT NULL

-- ___________________________

SELECT category,COUNT(*)
FROM dsv1069.items
GROUP by category

-- ___________________________

SELECT * 
FROM dsv1069.users INNER JOIN dsv1069.orders
ON dsv1069.users.id= dsv1069.orders.user_id

--____________________________

SELECT
COUNT( DISTINCT event_id) AS events
FROM dsv1069.events
WHERE event_name = 'view_item'

--____________________________

select COUNT(DISTINCT dsv1069.items.id ) 
from dsv1069.items INNER JOIN dsv1069.orders
ON dsv1069.items.id= dsv1069.orders.item_id

--____________________________

SELECT dsv1069.users.id, MIN(dsv1069.orders.paid_at)
FROM dsv1069.users LEFT JOIN dsv1069.orders
ON dsv1069.users.id = dsv1069.orders.user_id
GROUP BY dsv1069.users.id

