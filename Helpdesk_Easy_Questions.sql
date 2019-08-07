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
