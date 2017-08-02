SELECT il.InvoiceLineId, c.Country
FROM InvoiceLine il, Customer c, Invoice i
WHERE il.InvoiceLineId = i.InvoiceId and i.CustomerId = c.CustomerId
GROUP BY c.Country;