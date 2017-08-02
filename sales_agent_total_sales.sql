SELECT e.FirstName || " " || e.LastName "Name", SUM(i.Total) "Total Sales"
FROM Employee e, Invoice i, Customer c
WHERE i.CustomerId = c.CustomerId AND c.SupportRepId = e.EmployeeId
GROUP BY e.LastName;