SELECT i.Total as "Invoice Total", c.FirstName, c.LastName, c.Country, e.FirstName, e.LastName
FROM Invoice i, Customer c, Employee e