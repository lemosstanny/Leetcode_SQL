/* Problem: 626. Exchange Seats

The column id is continuous increment.
Mary wants to change seats for the adjacent students.
Can you write a SQL query to output the result for Mary?

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Abbot   |
|    2    | Doris   |
|    3    | Emerson |
|    4    | Green   |
|    5    | Jeames  |
+---------+---------+
For the sample input, the output is:

+---------+---------+
|    id   | student |
+---------+---------+
|    1    | Doris   |
|    2    | Abbot   |
|    3    | Green   |
|    4    | Emerson |
|    5    | Jeames  |
+---------+---------+
Note:If the number of students is odd, there is no need to change the last one's seat. */

/* Write your T-SQL query statement below */

WITH count_number AS (
    SELECT count(id) as ct
    FROM seat)
    
SELECT 
    CASE
        WHEN id%2 <> 0 AND id = ct THEN id
        WHEN id%2 <> 0 THEN id+1
        ELSE id-1
    END AS id, student
FROM seat, count_number
ORDER BY id;
