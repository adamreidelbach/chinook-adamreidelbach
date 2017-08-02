SELECT t.Name, SUM(i.Total) as "TotalSales"
FROM Track t, Invoice i, InvoiceLine il
WHERE t.TrackId = il.TrackId and i.InvoiceId = il.InvoiceId
GROUP BY t.Name
ORDER BY TotalSales DESC
LIMIT 5;