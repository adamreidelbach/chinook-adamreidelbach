SELECT e.FirstName, e.LastName, e.EmployeeId, c.CustomerId, c.SupportRepId, i.InvoiceId, i.CustomerId
FROM Employee e, Customer c, Invoice i
WHERE e.EmployeeId = c.SupportRepId AND i.CustomerId = c.CustomerId;