/* Problem 184. Department Highest Salary
The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
Explanation:

Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department. */ # Write your MySQL query statement below

#ranks salary per department highest
WITH Ranked AS
 (SELECT Id, Name, Salary, DepartmentId,
             DENSE_RANK() OVER (PARTITION BY DepartmentId ORDER BY Salary DESC) AS Salary_rank
             FROM Employee),

# Picks out department highest
     SelectRanked AS
        (SELECT DepartmentID, Name, Salary
         FROM Ranked
         WHERE Salary_rank = 1)


SELECT d.Name AS Department, SelectRanked.Name AS Employee , Salary
FROM SelectRanked 
INNER JOIN Department d ON d.ID = SelectRanked.DepartmentID;