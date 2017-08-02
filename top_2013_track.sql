SELECT TrackSales.Name, MAX(TrackSales.TotalSales)
FROM (SELECT t.Name, SUM(i.Total) as "TotalSales"
FROM Track t, Invoice i, InvoiceLine il
WHERE t.TrackId = il.TrackId and i.InvoiceId = il.InvoiceId and i.InvoiceDate LIKE "2013%" GROUP BY t.Name) as "TrackSales"
