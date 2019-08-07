--1.
/* There are three issues that include the words "index" and "Oracle". Find the call_date for each of them
+---------------------+----------+
| call_date           | call_ref |
+---------------------+----------+
| 2017-08-12 16:00:00 |     1308 |
| 2017-08-16 14:54:00 |     1697 |
| 2017-08-16 19:12:00 |     1731 |
+---------------------+----------+
*/
SELECT call_date, call_ref FROM Issue
WHERE detail LIKE '%Oracle%' AND detail LIKE '%index%'

--2.
/* Samantha Hall made three calls on 2017-08-14. Show the date and time for each
+---------------------+------------+-----------+
| call_date           | first_name | last_name |
+---------------------+------------+-----------+
| 2017-08-14 10:10:00 | Samantha   | Hall      |
| 2017-08-14 10:49:00 | Samantha   | Hall      |
| 2017-08-14 18:18:00 | Samantha   | Hall      |
+---------------------+------------+-----------+
*/
SELECT call_date, first_name, last_name 
FROM Issue NATURAL JOIN Caller
WHERE First_name = 'Samantha' AND Last_name = 'Hall' AND Date(call_date) = '2017-08-14'

--3.
/* There are 500 calls in the system (roughly). Write a query that shows the number that have each status.
+--------+--------+
| status | Volume |
+--------+--------+
| Closed |    486 |
| Open   |     10 |
+--------+--------+
*/
SELECT status, COUNT(status) AS Volume FROM Issue
WHERE status IN ('Closed', 'Open')
GROUP BY status

--4.
/* Calls are not normally assigned to a manager but it does happen. How many calls have been assigned to staff who are at Manager Level?
+------+
| mlcc |
+------+
|   51 |
+------+
*/
Select COUNT(status) AS mlcc FROM 
Issue JOIN Staff ON Assigned_to=Staff_code
      JOIN Level ON Level.Level_code=Staff.Level_code
WHERE Level.Level_code >= 4

--5.
/* Show the manager for each shift. Your output should include the shift date and type; also the first and last name of the manager.
+------------+------------+------------+-----------+
| Shift_date | Shift_type | first_name | last_name |
+------------+------------+------------+-----------+
| 2017-08-12 | Early      | Logan      | Butler    |
| 2017-08-12 | Late       | Ava        | Ellis     |
| 2017-08-13 | Early      | Ava        | Ellis     |
| 2017-08-13 | Late       | Ava        | Ellis     |
| 2017-08-14 | Early      | Logan      | Butler    |
| 2017-08-14 | Late       | Logan      | Butler    |
| 2017-08-15 | Early      | Logan      | Butler    |
| 2017-08-15 | Late       | Logan      | Butler    |
| 2017-08-16 | Early      | Logan      | Butler    |
| 2017-08-16 | Late       | Logan      | Butler    |
+------------+------------+------------+-----------+
*/
SELECT Shift_date, Shift_type, first_name, last_name FROM
Shift JOIN Staff ON Staff_code = Manager
ORDER BY Shift_date
