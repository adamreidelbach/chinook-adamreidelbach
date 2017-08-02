SELECT Totals.FirstName, Totals.LastName, MAX(Totals.TotalSales)
FROM (SELECT e.FirstName, e.LastName, SUM(i.Total) as "TotalSales"
FROM Employee e, Invoice i, Customer c
WHERE i.CustomerId = c.CustomerId AND c.SupportRepId = e.EmployeeId GROUP BY e.LastName) as "Totals" 