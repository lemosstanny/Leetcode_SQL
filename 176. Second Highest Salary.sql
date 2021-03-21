/* Problem: 176. second highest salary
Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 as the second highest salary. If there is no second highest salary, then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

*/
/* Write your T-SQL query statement below */

WITH Top2 AS (
    SELECT TOP 2 Salary
    FROM Employee
    ORDER BY Salary DESC)

SELECT 
    CASE 
        WHEN COUNT(*) = 2 AND MIN(Salary) <> MAX(Salary) THEN MIN(Salary)
        ELSE NULL
    END AS SecondHighestSalary
FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY Salary DESC) AS Row#, Salary
    FROM Top2) AS SLS;