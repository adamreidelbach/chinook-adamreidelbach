SELECT a.Name, COUNT(i.Total) as "TotalSales"
FROM Artist a, Invoice i, InvoiceLine il, Track t, Album al
WHERE il.TrackId = t.TrackId 
and t.AlbumId = al.AlbumId 
and al.ArtistId= a.ArtistId 
and i.InvoiceId = il.InvoiceId
GROUP BY a.Name
ORDER BY TotalSales DESC
LIMIT 3;