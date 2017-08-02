SELECT Totals.FirstName || " " || Totals.LastName "Name", MAX(Totals.TotalSales)
FROM (SELECT e.FirstName, e.LastName, SUM(i.Total) as "TotalSales"
FROM Employee e, Invoice i, Customer c
WHERE i.CustomerId = c.CustomerId AND c.SupportRepId = e.EmployeeId AND i.InvoiceDate LIKE "2009%" GROUP BY e.LastName) as "Totals" 
