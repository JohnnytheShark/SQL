--- Example Problem: Confirmation Rate
--- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. Write a solution to find the confirmation rate of each user. 
--- Return the result table in any order. 

-- Solution (Using PL/SQL

/*
Table Structures where as followed: 
Signups Table: 
user_id int
time_stamp datetime

Confirmation Table:
user_id int
time_stamp datetime
action ENUM
*/

WITH userActions AS (
SELECT 
signups.user_id, confirmations.action 
from signups 
LEFT OUTER JOIN 
confirmations on signups.user_id = confirmations.user_id
)

SELECT 
counts.user_id,
round(avg(confirmations),2) as confirmation_rate
FROM (
SELECT 
userActions.user_id, 
CASE 
WHEN userActions.action = 'confirmed' then 1
ELSE 0
END AS confirmations
FROM 
userActions
) counts 
GROUP BY counts.user_id
