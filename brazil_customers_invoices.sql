SELECT c.FirstName, c.lastName, c.Country, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Customer c, Invoice i
WHERE c.Country="Brazil";