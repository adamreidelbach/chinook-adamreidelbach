SELECT i.*, il.InvoiceLineId
FROM Invoice i, InvoiceLine il
WHERE i.InvoiceId = il.InvoiceId;