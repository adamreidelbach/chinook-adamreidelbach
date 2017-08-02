SELECT e.EmployeeId, e.FirstName, e.LastName, COUNT(c.CustomerId) "Customer Count"
FROM Employee e, Customer c
WHERE c.SupportRepId = e.EmployeeId
GROUP BY e.LastName;