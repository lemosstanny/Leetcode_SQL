/* Write your T-SQL query statement below */
SELECT Name as Customers
FROM Customers
WHERE ID NOT IN ( SELECT C.ID
                  FROM Customers C
                  RIGHT JOIN Orders O
                  ON C.Id = O.CustomerID);
